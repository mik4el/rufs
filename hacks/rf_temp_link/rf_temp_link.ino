/*
 * Builds from rf_blink_link.ino.
 * 
 * Send and receive RF on 433 MHz using a FS1000A TX/RX receiver module for two arduino nanos.
 * The transmitting arduino (IS_TX == true) has a button and DS18B20 temp probe, the receiving arduino has a led.
 * When you push the transmitting arduinos button it sends current temperature and 
 * the receiving arduinos led lights up and the temperature is sent on the serial line.
 * 
 * Followed guide from: http://www.hacktronics.com/Tutorials/arduino-1-wire-tutorial.html
 * 
 * Find DS18B20 temp probe adress using: http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html
 * 
 * E.g. 0x28, 0xFF, 0xAD, 0x82, 0x61, 0x15, 0x02, 0xE8
 * 
 * Note: Cheap arduino nano copy builds as an Arduino Nano!
 */

// RF related includes
#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile

// Temp probe related includes
#include <OneWire.h>
#include <DallasTemperature.h>

#define IS_TX true // if the board is rx or tx
#define BUTTON_PIN 5    // the number of the pushbutton pin
#define LED_PIN_RX 2    // the number of the LED pin on the receiver board
#define LED_PIN_TX 13   // the number of the LED pin on the transmitter board
#define ONE_WIRE_BUS 3 // Data wire is plugged into pin 3 on the Arduino

int buttonState = 0;         // variable for reading the pushbutton status
RH_ASK driver;
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices
DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
DeviceAddress firstThermometer = { 0x28, 0xFF, 0xAD, 0x82, 0x61, 0x15, 0x02, 0xE8 }; // Assign the addresses of your 1-Wire temp sensors.
String messageString = "";
int messageId = 0;
float tempC = -127.00; //-127.00 is the error temp

void setup() {
  // initialize the LED pin as an output:
  pinMode(LED_PIN_RX, OUTPUT);
  pinMode(LED_PIN_TX, OUTPUT);
  
  // initialize the pushbutton pin as an input:
  pinMode(BUTTON_PIN, INPUT);
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
  if (IS_TX) {
    // read the state of the pushbutton value:
    buttonState = digitalRead(BUTTON_PIN);
    if (buttonState == HIGH) {
      // Get and print temperature
      Serial.println("Getting temperatures...");
      sensors.requestTemperatures();
      tempC = sensors.getTempC(firstThermometer);
      if (tempC == -127.00) {
        Serial.println("Error getting temperature");
      }
      
      // Make and send message
      messageString = "Id: ";
      messageString = messageString + String(messageId, DEC);
      messageString = messageString + " Temp: ";
      messageString = messageString + String(tempC, 2);
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
  } else {
    uint8_t buf[12];
    uint8_t buflen = sizeof(buf);
    if (driver.recv(buf, &buflen)) {
      int i;
      // Message with a good checksum received, dump it.
      Serial.print("Message: ");
      Serial.println((char*)buf);
      digitalWrite(LED_PIN_RX, HIGH); 
      delay(1000);
      digitalWrite(LED_PIN_RX, LOW);        
    }
  }
}
