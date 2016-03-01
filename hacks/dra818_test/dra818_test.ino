#include <SoftwareSerial.h>

SoftwareSerial radioSerial(10, 11); // RX, TX
#define TONE_PIN 8
char line[80];
int count = 0;

void setup() {
  pinMode(TONE_PIN, OUTPUT);

  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // set the data rate for the SoftwareSerial port
  radioSerial.begin(9600);

  delay(1000);

  // check that radio works
  radioSerial.print("AT+DMOCONNECT\r\n");
  delay(1000);
  radioSerial.print("AT+DMOSETGROUP=0,144.8000,144.8000,0000,8,0000\r\n");
  
  Serial.println("Setup complete");

}

void loop() { // run over and over
  while (radioSerial.available()) {
    Serial.write(radioSerial.read());
  }
  while (Serial.available()) {
    line[count] = (char)Serial.read(); // store the char
    if (line[count++] == '\n'){        // if its a CR,
       line[count-1] = '\0';             //  zero-terminate it
       radioSerial.print(line);        //  and print it.
       radioSerial.print("\r\n"); // special format for DRA818
       Serial.print("Command sent: ");
       Serial.print("'");
       Serial.print(line);
       Serial.print("'");
       Serial.println("");
       count = 0;                      //  and reset the index.
    }
  }

  //play tone
  tone(TONE_PIN, 131, 1000); // Play C3 for 1s
  delay(1300);
  // stop the tone playing:
  noTone(TONE_PIN);
  tone(TONE_PIN, 1397, 1000); // Play F6 for 1s
  delay(1300);
  // stop the tone playing:
  noTone(TONE_PIN);
}
