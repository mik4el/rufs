// Includes
#include <LibAPRS.h>
#include "TinyGPS++.h"
#include "String.h"
#include <OneWire.h>
#include <DallasTemperature.h>
#include <EEPROM.h>

// LibAPRS
#define ADC_REFERENCE REF_5V
#define OPEN_SQUELCH false

// Other
#define ONE_WIRE_BUS 8 // Temperature data wire is plugged into pin D8
#define BATT_V_PIN 2 // Batt pin wire is plugged into A2
#define RADIO_ON_PIN A1 // Radio on pin is plugged into A1
#define STATUS_LED_PIN A3 // STATUS_LED_PIN is plugged into A3
#define BEACON_PERIOD_SECONDS 60
#define BEACON_REPEATS 5

// Debug mode
#define DEBUG false
#define SHOULD_PRINT_SERIAL false
#define SHOULD_PROGRAM_RADIO false

#if SHOULD_PRINT_SERIAL
#define Sprintln(a) (Serial.println(a))
#else
#define Sprintln(a) 
#endif

TinyGPSPlus gps;
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices
DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
DeviceAddress firstThermometer = { 0x28, 0xFF, 0x7E, 0xDC, 0x64, 0x15, 0x02, 0x00 }; // Assign the addresses of your 1-Wire temp sensors.
String commentString = "";
float temp1C = -127.00; //-127.00 is the error temp
long internalV = 0;
float battV = 0;
long messageId = 0;
int seconds_since_beacon = 0;
int beacons_sent = 0;

void setup() {
  delay(200);
  // Set up serial port
  Serial.begin(9600);
  
  // Initialise LibAPRS
  APRS_init(ADC_REFERENCE, OPEN_SQUELCH);
  APRS_setCallsign("SA0MIK", 5);
  APRS_setPath1("WIDE1", 1);
  APRS_setPath2("WIDE2", 2);
  APRS_setPreamble(1000); //empiric, slow ptt on and mic on dra818?
  APRS_setTail(100);
  APRS_useAlternateSymbolTable(false);
  APRS_setSymbol('n');

  // Set radio to sleep mode
  pinMode(RADIO_ON_PIN, OUTPUT);
  digitalWrite(RADIO_ON_PIN, HIGH); // radio off
  
  // Initialise sensors
  pinMode(BATT_V_PIN, INPUT);
  // initialize temp probe
  sensors.begin();
  // set the resolution to 10 bit (good enough?)
  sensors.setResolution(firstThermometer, 10);
  pinMode(STATUS_LED_PIN, OUTPUT);
  digitalWrite(STATUS_LED_PIN, HIGH);

#if SHOULD_PROGRAM_RADIO
  digitalWrite(RADIO_ON_PIN, LOW); // radio on
  delay(2000);
  Serial.print("AT+DMOCONNECT\r\n");
  delay(2000);
  Serial.print("AT+DMOSETGROUP=0,144.8000,144.8000,0000,8,0000\r\n");
  delay(5000);
  digitalWrite(RADIO_ON_PIN, HIGH); // radio off
#endif

  Sprintln(F("Setup complete!"));
  
}

void aprs_msg_callback(struct AX25Msg *msg) {
}

long read_internal_v() {
  // Read 1.1V reference against AVcc
  // set the reference to Vcc and the measurement to the internal 1.1V reference
  #if defined(__AVR_ATmega32U4__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
    ADMUX = _BV(REFS0) | _BV(MUX4) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
  #elif defined (__AVR_ATtiny24__) || defined(__AVR_ATtiny44__) || defined(__AVR_ATtiny84__)
    ADMUX = _BV(MUX5) | _BV(MUX0);
  #elif defined (__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny85__)
    ADMUX = _BV(MUX3) | _BV(MUX2);
  #else
    ADMUX = _BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
  #endif  

  delay(2); // Wait for Vref to settle
  ADCSRA |= _BV(ADSC); // Start conversion
  while (bit_is_set(ADCSRA,ADSC)); // measuring

  uint8_t low  = ADCL; // must read ADCL first - it then locks ADCH  
  uint8_t high = ADCH; // unlocks both

  long result = (high<<8) | low;

  result = 1125300L / result; // Calculate Vcc (in mV); 1125300 = 1.1*1023*1000
  return result; // Vcc in millivolts
}

float read_batt_v(void) {
  return analogRead(BATT_V_PIN) * (5.0/1023.0);  
}

//This function will write a 4 byte (32bit) long to the eeprom at
//the specified address to address + 3.
void EEPROMWritelong(int address, long value) {
  //Decomposition from a long to 4 bytes by using bitshift.
  //One = Most significant -> Four = Least significant byte
  byte four = (value & 0xFF);
  byte three = ((value >> 8) & 0xFF);
  byte two = ((value >> 16) & 0xFF);
  byte one = ((value >> 24) & 0xFF);
  
  //Write the 4 bytes into the eeprom memory.
  EEPROM.write(address, four);
  EEPROM.write(address + 1, three);
  EEPROM.write(address + 2, two);
  EEPROM.write(address + 3, one);
}

//This function will return a 4 byte (32bit) long from the eeprom
//at the specified address to address + 3.
long EEPROMReadlong(long address) {
  //Read the 4 bytes from the eeprom memory.
  long four = EEPROM.read(address);
  long three = EEPROM.read(address + 1);
  long two = EEPROM.read(address + 2);
  long one = EEPROM.read(address + 3);
  
  //Return the recomposed long by using bitshift.
  return ((four << 0) & 0xFF) + ((three << 8) & 0xFFFF) + ((two << 16) & 0xFFFFFF) +((one << 24) & 0xFFFFFFFF);
}

// Here's a function to process incoming packets
// Remember to call this function often, so you
// won't miss any packets due to one already
// waiting to be processed
void processPacket() {
}

void updatePosition() {
  // Convert and set latitude NMEA string Degree Minute Hundreths of minutes ddmm.hh[S,N].  
  String latStr = "";
  int temp = 0;
  double d_lat = gps.location.lat();
  double dm_lat = 0.0;
  
  if (d_lat < 0.0){
    temp=-(int)d_lat;
    dm_lat=temp*100.0 - (d_lat+temp)*60.0;
  } else {
    temp=(int)d_lat;
    dm_lat=temp*100 + (d_lat-temp)*60.0;
  }
  if (dm_lat < 1000) {
    latStr += "0";   
  }
  latStr += String(dm_lat,2);   
  if (d_lat >= 0.0) {
    latStr +="N";
  } else {
    latStr +="S";     
  }
    
  int latStr_len = latStr.length()+1;
  char latChar[latStr_len];
  latStr.toCharArray(latChar, latStr_len);
  
  // Convert and set longitude NMEA string Degree Minute Hundreths of minutes ddmm.hh[E,W].  
  String lonStr = "";
  double d_lon = gps.location.lng();
  double dm_lon = 0.0;
  
  if (d_lon < 0.0){
    temp=-(int)d_lon;
    dm_lon=temp*100.0 - (d_lon+temp)*60.0;
  } else {
    temp=(int)d_lon;
    dm_lon=temp*100 + (d_lon-temp)*60.0;
  }
  if (dm_lon < 10000) {
    lonStr += "0";   
  }
  if (dm_lon < 1000) {
    lonStr += "0";   
  }
  lonStr += String(dm_lon,2);   
  if (d_lon >= 0.0) {
    lonStr +="E";
  } else {
    lonStr +="W";     
  }
  int lonStr_len = lonStr.length()+1;
  char lonChar[lonStr_len];
  lonStr.toCharArray(lonChar, lonStr_len);
  
#if DEBUG
  Sprintln(latChar);
  Sprintln(lonChar);
  APRS_setLat("5530.80N");
  APRS_setLon("01143.89E");
#else
  APRS_setLat(latChar);       
  APRS_setLon(lonChar);
#endif
}

void updateComment() {
  sensors.requestTemperatures();
  temp1C = sensors.getTempC(firstThermometer);
  internalV = read_internal_v();
  battV = read_batt_v();
#if DEBUG
  commentString = "I:1 T:22.50 Vi:4.3 Vb:4.2";
  Sprintln(temp1C);
  Sprintln(internalV);
  Sprintln(battV);
#else
  long messageIdAddress=0;
  messageId = EEPROMReadlong(messageIdAddress) + 1;
  // Make message, e.g. "I:1 T:22.50 Vi:4.3 Vb:4.2"
  commentString = F("I:");
  commentString += String(messageId, DEC);
  commentString += F(" T1:");
  if (temp1C == -127.00) {
    Sprintln(F("Error getting temperature"));
    commentString += "E";
  } else {
    commentString += String(temp1C, 2);
  }
  commentString += F(" Vi:");
  commentString += String(internalV/1000.0, 2);
  commentString += F(" Vb:");
  commentString += String(battV, 2);
  EEPROMWritelong(messageIdAddress, messageId);
//  EEPROMWritelong(messageIdAddress, 0); //uncomment to reset eeprom
#endif
}

void sendLocationUpdate() {
  int str_len = commentString.length()+1;
  char commentStringChar[str_len];
  commentString.toCharArray(commentStringChar, str_len);
  APRS_sendLoc(commentStringChar, strlen(commentStringChar));
  Sprintln(F("Location update sent with comment "));
  Sprintln(commentStringChar);
}

// This custom version of delay() ensures that the gps object
// is being "fed" and that blinks to status leds can happen.
static void smartDelay(unsigned long ms)
{
  unsigned long start = millis();
  do 
  {    
    // read gps serial
    while (Serial.available()) {
      gps.encode(Serial.read());
    }
  } while (millis() - start < ms);
}

void send_beacon() {
  digitalWrite(RADIO_ON_PIN, LOW); // turn on radio
  smartDelay(3000); // wait for radio to start
  updatePosition();
  updateComment();
  sendLocationUpdate();    
  smartDelay(500); // wait for radio to stop        
  digitalWrite(RADIO_ON_PIN, HIGH); // turn off radio
}

void flash_status_led(int times_to_flash) {
  for (int i=0; i<times_to_flash; i++) {
    digitalWrite(STATUS_LED_PIN, HIGH);
    smartDelay(100);
    digitalWrite(STATUS_LED_PIN, LOW);
    smartDelay(100);
  }
}

void loop() {
  
  while (Serial.available())
      gps.encode(Serial.read());

#if !DEBUG
  if (millis() > 5000 && gps.charsProcessed() < 10) {
    Sprintln(F("No GPS detected: check wiring."));
    while(true) {
      flash_status_led(5);
    };
  } else {
    Sprintln(gps.passedChecksum());
  }
#endif

  if (gps.location.isValid()) {
    Sprintln(gps.location.lat());
    Sprintln(gps.location.lng());
    if (seconds_since_beacon>BEACON_PERIOD_SECONDS || seconds_since_beacon==0) {
      if (seconds_since_beacon==0) {
        smartDelay(1000); //make sure that an update not happens to fast after startup after observed bug 
      }
      bool should_send_beacon = false;
      if (beacons_sent <= BEACON_REPEATS) {
        should_send_beacon = true;
      } else {
        //if 5 updates have been sent, only send new if new position
        if (gps.location.isUpdated()) {
          beacons_sent = 0;
          should_send_beacon = true;
        }
      }
      if (should_send_beacon) {
        send_beacon();  
        seconds_since_beacon = 0;
        beacons_sent += 1;
      } 
    }
  } else {
    Sprintln(F("."));
  }
  
  seconds_since_beacon += 1;
  smartDelay(1000);
     
#if DEBUG
  send_beacon();
  smartDelay(7000); // extra delay to not send all the time
#endif

  //flash status led
  if (gps.location.isValid()) {
    flash_status_led(3);
  } else {
    flash_status_led(1);
  }
   
}
