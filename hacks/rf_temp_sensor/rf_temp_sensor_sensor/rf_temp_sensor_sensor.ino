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

#define LED_PIN_TX 13   // the number of the LED pin on the transmitter board
#define ONE_WIRE_BUS 3 // Data wire is plugged into pin 3 on the Arduino

RH_ASK driver;
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices
DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
DeviceAddress firstThermometer = { 0x28, 0xFF, 0xAD, 0x82, 0x61, 0x15, 0x02, 0xE8 }; // Assign the addresses of your 1-Wire temp sensors.
String messageString = "";
int messageId = 0;
float tempC = -127.00; //-127.00 is the error temp

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
  tempC = sensors.getTempC(firstThermometer);
  
  // Make temperature message, e.g. "I:1 T:22.50"
  messageString = "I:";
  messageString = messageString + String(messageId, DEC);
  messageString = messageString + " T:";
  if (tempC == -127.00) {
    Serial.println("Error getting temperature");
    messageString = messageString + "E";
  } else {
    messageString = messageString + String(tempC, 2);
  }
  
  // Prepare and send message
  int str_len = messageString.length()+1;
  char messageStringChar[str_len];
  messageString.toCharArray(messageStringChar, str_len);
  Serial.println(messageStringChar);
  driver.send((uint8_t *)messageStringChar, strlen(messageStringChar));
  driver.waitPacketSent();
  messageString = ""; 
  messageId = messageId + 1;
  
  // Provide feedback that message sent
  Serial.println("Message sent!");
  digitalWrite(LED_PIN_TX, HIGH); 
  delay(1000);
  digitalWrite(LED_PIN_TX, LOW);
}
