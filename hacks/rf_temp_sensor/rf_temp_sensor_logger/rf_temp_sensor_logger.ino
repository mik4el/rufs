/*
 * Builds from rf_temp_link.ino.
 * 
 * Receives and logs RH_ASK formatted messages on RF on 433 MHz using a FS1000A receiver module.
 * 
 * Note: Cheap arduino nano copy builds as an Arduino Nano!
 */

// RF related includes
#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile

#define LED_PIN_RX 2 // The number of the LED pin on the receiver board
RH_ASK driver;
String messageString = "";

void setup() {
  // initialize the LED pin as an output:
  pinMode(LED_PIN_RX, OUTPUT);
  
  Serial.begin(9600);  // Debugging only

  // initialize RF
  if (!driver.init()) {
    Serial.println("RH init failed");
  }
    
  Serial.println("Setup complete!");
}

void loop() {
  uint8_t buf[RH_ASK_MAX_MESSAGE_LEN];
  uint8_t buflen = sizeof(buf);
  if (driver.recv(buf, &buflen)) {    
    // Clean message, a valid message is e.g. "I:1 T:22.50\n"
    messageString = "";
    for(int i = 0; (char)buf[i] != '\n'; ++i) {
      messageString = messageString + (char)buf[i];
    }
    Serial.println(messageString);
    
    /* Debug
    Serial.print("Buffer: \"");
    Serial.print((char*)buf);
    Serial.print("\"\r\n");
    Serial.println("Message: \"" + messageString + "\"");
    */
    
    digitalWrite(LED_PIN_RX, HIGH); 
    delay(200);
    digitalWrite(LED_PIN_RX, LOW);        
  }
}
