/*
  Software serial multple serial test

 Receives from the hardware serial, sends to software serial.
 Receives from software serial, sends to hardware serial.

 The circuit:
 * RX is digital pin 12 (connect to TX of other device)
 * TX is digital pin 13 (connect to RX of other device)

*/

#include <SoftwareSerial.h>

#define IS_RX false

int messageId = 0;
SoftwareSerial mySerial(12, 13); // RX, TX

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // set the data rate for the SoftwareSerial port
  mySerial.begin(9600);
  if (IS_RX) {
    Serial.println("Setup complete!");
    Serial.println("Ready to recieve!");
  } else {
    Serial.println("Setup complete!");
    mySerial.println("Ready to send!");  
  }
}

void loop() {
  if (IS_RX) {
    if (mySerial.available()) {
      Serial.write(mySerial.read());
    }
  } else {
    mySerial.print("Test ");
    mySerial.print(messageId, DEC);
    mySerial.println();
    messageId += 1;
    delay(500);
  }
}
