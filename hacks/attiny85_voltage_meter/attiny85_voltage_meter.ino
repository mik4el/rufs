#define GREEN_PIN 3
#define RED_PIN 4

long vcc = 0;

long readVcc() {
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

void setup()
{
  pinMode(GREEN_PIN, OUTPUT);
  pinMode(RED_PIN, OUTPUT);
}

void loop()
{
  vcc = readVcc();
  if (vcc >= 3900) { 
    // Measured at vcc=3.7V, plenty of voltage
    digitalWrite(GREEN_PIN, HIGH);
    digitalWrite(RED_PIN, LOW);
    delay(1000); // delay so we are not checking vcc all the time
  } else if (vcc <= 3400) {
    // Measured at vcc<=3.3V, voltage is gone, flash fast red pin 1s
    digitalWrite(GREEN_PIN, LOW);
    for (int i=0; i<5; i++) {
      digitalWrite(RED_PIN, HIGH);
      delay(100);
      digitalWrite(RED_PIN, LOW);
      delay(100);      
    }
  } else {
    // Not much voltage left, flash green pin 1s.
    digitalWrite(RED_PIN, LOW);
    for (int i=0; i<5; i++) {
      digitalWrite(GREEN_PIN, HIGH);
      delay(100);
      digitalWrite(GREEN_PIN, LOW);
      delay(100);      
    }  
  }
}
