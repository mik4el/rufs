/*
 * Builds from rf_temp_link.ino.
 * 
 * Measure temperature and send RF messages on 433 MHz using a FS1000A transmitter module.
 * The transmitting arduino has a DS18B20 temp probe.
 * 
 * Note: Cheap arduino nano copy builds as an Arduino Nano!
 */

// RF related includes
#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile

// Temp probe related includes
#include <OneWire.h>
#include <DallasTemperature.h>

// Sleep mode includes
#include <avr/sleep.h>
#include <avr/wdt.h>

#define LED_PIN_TX 13   // the number of the LED pin on the transmitter board
#define ONE_WIRE_BUS 3 // Data wire is plugged into pin 3 on the Arduino

RH_ASK driver;
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices
DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
DeviceAddress firstThermometer = { 0x28, 0xFF, 0xAD, 0x82, 0x61, 0x15, 0x02, 0xE8 }; // Assign the addresses of your 1-Wire temp sensors.
DeviceAddress secondThermometer = { 0x28, 0xFF, 0x6A, 0xB3, 0x64, 0x15, 0x01, 0x8B }; // Assign the addresses of your 1-Wire temp sensors.
String messageString = "";
int messageId = 0;
float temp1C = -127.00; //-127.00 is the error temp
float temp2C = -127.00; //-127.00 is the error temp
float vIn = 0.00;

// watchdog interrupt
ISR(WDT_vect) {
  wdt_disable();  // disable watchdog
}

void myWatchdogEnable(const byte interval) {  
  MCUSR = 0;                          // reset various flags
  WDTCSR |= 0b00011000;               // see docs, set WDCE, WDE
  WDTCSR =  0b01000000 | interval;    // set WDIE, and appropriate delay

  wdt_reset();
  set_sleep_mode (SLEEP_MODE_PWR_DOWN);  
  sleep_mode();            // now goes to Sleep and waits for the interrupt
}

void setup() {
  // initialize the LED pin as an output:
  pinMode(LED_PIN_TX, OUTPUT);
  
  Serial.begin(9600);  // Debugging only

  // initialize RF
  if (!driver.init()) {
    Serial.println("RH init failed");
  }
  
  // initialize temp probe
  sensors.begin();
  // set the resolution to 10 bit (good enough?)
  sensors.setResolution(firstThermometer, 10);
  
  Serial.println("Setup complete!");
}

void loop() {
  // Get and print temperature
  Serial.println("Getting temperatures...");
  sensors.requestTemperatures();
  temp1C = sensors.getTempC(firstThermometer);
  temp2C = sensors.getTempC(secondThermometer);

  // Get and print battery voltage
  Serial.println("Getting voltage...");
  // 9v = 3.85, 6v = 2.55, 11.9v = 5.00 => k = 2.35, 
  vIn = 2.35 * (analogRead(1) * (5.0/1023.0));
  
  // Make message, e.g. "I:1 T:22.50 \n"
  messageString = "I:";
  messageString = messageString + String(messageId, DEC);
  messageString = messageString + " T1:";
  if (temp1C == -127.00) {
    Serial.println("Error getting temperature");
    messageString = messageString + "E";
  } else {
    messageString = messageString + String(temp1C, 2);
  }
  messageString = messageString + " T2:";
  if (temp2C == -127.00) {
    Serial.println("Error getting temperature");
    messageString = messageString + "E";
  } else {
    messageString = messageString + String(temp2C, 2);
  }
  messageString = messageString + " V:";
  messageString = messageString + String(vIn, 2);
  messageString = messageString + "\n";

  // Prepare and send message
  int str_len = messageString.length()+1;
  char messageStringChar[str_len];
  messageString.toCharArray(messageStringChar, str_len);
  Serial.print("Message: \"");
  for(int i = 0; messageStringChar[i] != '\n'; ++i) {
    Serial.print((char)messageStringChar[i]);
  }
  Serial.print("\"\n");
  driver.send((uint8_t *)messageStringChar, strlen(messageStringChar));
  driver.waitPacketSent();
  messageString = ""; 
  messageId = messageId + 1;
  
  // Provide feedback that message sent
  Serial.println("Message sent!");
  digitalWrite(LED_PIN_TX, HIGH); 
  delay(1000);
  digitalWrite(LED_PIN_TX, LOW);

  // sleep for a total of 20 seconds
  /*
  myWatchdogEnable (0b100001);  // 8 seconds
  myWatchdogEnable (0b100001);  // 8 seconds
  myWatchdogEnable (0b100000);  // 4 seconds
  */
  // sleep bit patterns:
  //  1 second:  0b000110
  //  2 seconds: 0b000111
  //  4 seconds: 0b100000
  //  8 seconds: 0b100001

}
