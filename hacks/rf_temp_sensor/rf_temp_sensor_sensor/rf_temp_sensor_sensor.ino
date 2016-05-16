/*
 * Builds from rf_temp_link.ino.
 * 
 * Measure temperature and send RF messages on 433 MHz using a FS1000A transmitter module.
 * The transmitting arduino has a DS18B20 temp probe.
 * 
 * RH_ASK from http://www.airspayce.com/mikem/arduino/RadioHead/
 * OneWire from http://playground.arduino.cc/Learning/OneWire
 * DallasTemperature from https://github.com/milesburton/Arduino-Temperature-Control-Library 
 * 
 * Note: Cheap arduino nano copy builds as an Arduino Nano 
 * but needs this driver on osx 10.9+:
 * http://kig.re/2014/12/31/how-to-use-arduino-nano-mini-pro-with-CH340G-on-mac-osx-yosemite.html
 */

// RF related includes
#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile

// Temp probe related includes
#include <OneWire.h>
#include <DallasTemperature.h>

// Write to EEPROM memory include
#include <EEPROM.h>

#define LED_PIN_TX 13   // the number of the LED pin on the transmitter board
#define ONE_WIRE_BUS 3 // Data wire is plugged into pin 3 on the Arduino
#define BATT_V_PIN 1 // Batt pin wire is plugged into pin 1 on the Arduino

RH_ASK driver;
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices
DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
DeviceAddress firstThermometer = { 0x28, 0xFF, 0xAD, 0x82, 0x61, 0x15, 0x02, 0xE8 }; // Assign the addresses of your 1-Wire temp sensors.
DeviceAddress secondThermometer = { 0x28, 0xFF, 0x6A, 0xB3, 0x64, 0x15, 0x01, 0x8B }; // Assign the addresses of your 1-Wire temp sensors.
String messageString = "";
float temp1C = -127.00; //-127.00 is the error temp
float temp2C = -127.00; //-127.00 is the error temp
long messageId = 0;
float battV = 0;

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

float read_batt_v(void) {
  return analogRead(BATT_V_PIN) * (5.0/1023.0);  
}

void setup() {
  // initialize the LED pin as an output:
  pinMode(LED_PIN_TX, OUTPUT);
  pinMode(BATT_V_PIN, INPUT);
  
  Serial.begin(9600);  // Debugging only

  // initialize RF
  if (!driver.init()) {
    Serial.println("RH init failed");
  }
  
  // initialize temp probe
  sensors.begin();
  // set the resolution to 10 bit (good enough?)
  sensors.setResolution(firstThermometer, 10);
  sensors.setResolution(secondThermometer, 10);
  
  Serial.println("Setup complete!");
}

void loop() {
  // Get and print temperature
  Serial.println("Getting temperatures...");
  sensors.requestTemperatures();
  temp1C = sensors.getTempC(firstThermometer);
  temp2C = sensors.getTempC(secondThermometer);
  battV = read_batt_v();
  long messageIdAddress=0;
  messageId = EEPROMReadlong(messageIdAddress) + 1;
  // Make message, e.g. "I:1 T:22.50 \n"
  messageString = "";
  messageString = messageString + String(messageId, DEC);
  messageString = messageString + ",";
  if (temp1C == -127.00) {
    Serial.println("Error getting temperature");
    messageString = messageString + "E";
  } else {
    messageString = messageString + String(temp1C, 2);
  }
  messageString = messageString + ",";
  if (temp2C == -127.00) {
    Serial.println("Error getting temperature");
    messageString = messageString + "E";
  } else {
    messageString = messageString + String(temp2C, 2);
  }
  messageString = messageString + ",";
  messageString = messageString + String(battV, 2);
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
  EEPROMWritelong(messageIdAddress, messageId);
        
  // Provide feedback that message sent
  Serial.println("Message sent!");
  digitalWrite(LED_PIN_TX, HIGH); 
  delay(1000);
  digitalWrite(LED_PIN_TX, LOW);
  
}
