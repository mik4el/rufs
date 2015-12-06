/*
 * Send and receive RF on 433 MHz using a FS1000A TX/RX receiver module for two arduino nanos.
 * The transmitting arduino (IS_TX == true) has a button, the receiving arduino has a led.
 * When you push the transmitting arduinos button it sends a message  and 
 * the receiving arduinos led lights up and the message is sent on the serial line.
 * 
 * For RF followed tutorial from e.g. http://randomnerdtutorials.com/rf-433mhz-transmitter-receiver-module-with-arduino/
 * 
 * Note: Cheap arduino nano copy builds as an Arduino Nano!
 */

#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile

#define IS_TX false // if the board is rx or tx
#define BUTTON_PIN 5    // the number of the pushbutton pin
#define LED_PIN_RX 2    // the number of the LED pin on the receiver board
#define LED_PIN_TX 13   // the number of the LED pin on the transmitter board

int buttonState = 0;         // variable for reading the pushbutton status

RH_ASK driver;

void setup() {
  // initialize the LED pin as an output:
  pinMode(LED_PIN_RX, OUTPUT);
  pinMode(LED_PIN_TX, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(BUTTON_PIN, INPUT);
  Serial.begin(9600);  // Debugging only
  if (!driver.init()) {
    Serial.println("RH init failed");
  }
  Serial.println("Setup complete!");
}

void loop() {
  if (IS_TX) {
    // read the state of the pushbutton value:
    buttonState = digitalRead(BUTTON_PIN);
    if (buttonState == HIGH) {
      const char *on_msg = "Turn LED on!";
      driver.send((uint8_t *)on_msg, strlen(on_msg));
      driver.waitPacketSent();
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
