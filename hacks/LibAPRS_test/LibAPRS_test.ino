// Includes
#include <LibAPRS.h>
#include "TinyGPS++.h"
#include "String.h"
#include <OneWire.h>
#include <DallasTemperature.h>
#include <EEPROM.h>

//LibAPRS
#define ADC_REFERENCE REF_5V
#define OPEN_SQUELCH true

//Other
#define ONE_WIRE_BUS 8 // Data wire is plugged into pin d8 on the Arduino
#define BATT_V_PIN 2 // Batt pin wire is plugged into a2 on the Arduino

//Debug mode
#define DEBUG false

TinyGPSPlus gps;
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices
DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
DeviceAddress firstThermometer = { 0x28, 0xFF, 0xD5, 0xC1, 0x64, 0x15, 0x02, 0xE6 }; // Assign the addresses of your 1-Wire temp sensors.
String commentString = "";
float temp1C = -127.00; //-127.00 is the error temp
long internalV = 0;
float battV = 0;
long messageId = 0;

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

void setup() {
  delay(200);
  // Set up serial port
  Serial.begin(9600);
  
  // Initialise LibAPRS
  APRS_init(ADC_REFERENCE, OPEN_SQUELCH);
  APRS_setCallsign("SA0MIK", 5);
  APRS_setPath1("WIDE1", 1);
  APRS_setPath2("WIDE2", 2);
  APRS_setPreamble(350);
  APRS_setTail(100);
  APRS_useAlternateSymbolTable(false);
  APRS_setSymbol('n');
  APRS_printSettings();
  Serial.print(F("Free RAM:     ")); Serial.println(freeMemory());

  // Initialise sensors
  pinMode(BATT_V_PIN, INPUT);
  // initialize temp probe
  sensors.begin();
  // set the resolution to 10 bit (good enough?)
  sensors.setResolution(firstThermometer, 10);
  
  Serial.println(F("Setup complete!"));
  
}

void messageExample() {
  // We first need to set the message recipient
  APRS_setMessageDestination("SA0MIK", 7);
  
  // And define a string to send
  char *message = "Hi Mikael!";
  APRS_sendMsg(message, strlen(message));
  
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
  APRS_setLat(latChar);
  
#if DEBUG
  Serial.print("'");
  Serial.print(latChar);
  Serial.print("'");
  Serial.println();
#endif

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
  APRS_setLon(lonChar);
  
#if DEBUG
  Serial.print("'");
  Serial.print(lonChar);
  Serial.print("'");
  Serial.println();
#endif
}

void updateComment() {
  sensors.requestTemperatures();
  temp1C = sensors.getTempC(firstThermometer);
  internalV = read_internal_v();
  battV = read_batt_v();
  long messageIdAddress=0;
  messageId = EEPROMReadlong(messageIdAddress) + 1;
  // Make message, e.g. "I:1 T:22.50 Vi:4.3 Vb:4.2"
  commentString = F("I:");
  commentString += String(messageId, DEC);
  commentString += F(" T1:");
  if (temp1C == -127.00) {
    Serial.println(F("Error getting temperature"));
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
}

void sendLocationUpdate() {
  int str_len = commentString.length()+1;
  char commentStringChar[str_len];
  commentString.toCharArray(commentStringChar, str_len);
  APRS_sendLoc(commentStringChar, strlen(commentStringChar));
  Serial.println();
  Serial.print(F("Location update sent with comment '"));
  Serial.print(commentStringChar);
  Serial.print(F("'"));
  Serial.println();
#if DEBUG
  print_status();
#endif
}

void print_status() {
  APRS_printSettings();
  Serial.print(F("Free RAM:     ")); Serial.println(freeMemory());
}

// This custom version of delay() ensures that the gps object
// is being "fed".
static void smartDelay(unsigned long ms)
{
  unsigned long start = millis();
  do 
  {
    while (Serial.available())
      gps.encode(Serial.read());
  } while (millis() - start < ms);
}

int counter = 0;
void loop() {
  
  while (Serial.available())
      gps.encode(Serial.read());
  
  if (millis() > 5000 && gps.charsProcessed() < 10) {
    Serial.println(F("No GPS detected: check wiring."));
    while(true);
  } else {
    Serial.println(gps.passedChecksum());
  }
  
  if (gps.location.isValid()) {
    Serial.print(gps.location.lat(), 2);
    Serial.print(F(","));
    Serial.print(gps.location.lng(), 2);
    Serial.println();
    if (counter==55 || counter==0) {
      if (counter==0) {
        smartDelay(500); //make sure that an update not happens to fast after startup after observed bug 
      }
      updatePosition();
      updateComment();
      sendLocationUpdate();    
      counter = 0;
      smartDelay(5000);
    }
    counter += 1;
  } else {
    Serial.println(F("."));
  }
  
  smartDelay(1000);
  
}
