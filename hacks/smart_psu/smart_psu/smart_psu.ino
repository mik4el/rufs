#include <avr/sleep.h>
#include <avr/wdt.h> // Needed to enable/disable watch dog timer

#define GREEN_PIN 3
#define RED_PIN 4
#define POWER_SWITCH_PIN 0
#define MAX1555_CHG_PIN 2
#define SECONDS_TO_SLEEP 400 // Multiple of 8
#define SECONDS_ON 5L*60L // For rf_temp_sensor, seconds on is 3, tracker version, seconds on is 5*60 to make sure GPS lock happens

//NB: Remember to compile for 1 mhz internal clock.

long internal_v = 0;
long watchdog_counter = 0;

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

void setup()
{
  pinMode(GREEN_PIN, OUTPUT);
  pinMode(RED_PIN, OUTPUT);
  pinMode(POWER_SWITCH_PIN, OUTPUT);
  pinMode(MAX1555_CHG_PIN, INPUT);
  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
}

void enterSleep(void)
{
  pinMode(GREEN_PIN, INPUT);  // saves som extra uA
  pinMode(RED_PIN, INPUT); // saves som extra uA
  pinMode(POWER_SWITCH_PIN, INPUT); // saves som extra uA
  ADCSRA &= ~(1<<ADEN); //Disable ADC, saves ~230uA
  setup_watchdog(9); //Setup watchdog to go off after 8sec
  sleep_mode(); //Go to sleep!
  ADCSRA |= (1<<ADEN); //Enable ADC
  pinMode(GREEN_PIN, OUTPUT);  // saves som extra uA
  pinMode(RED_PIN, OUTPUT); // saves som extra uA
  pinMode(POWER_SWITCH_PIN, OUTPUT); // saves som extra uA
}

//This runs each time the watch dog wakes us up from sleep
ISR(WDT_vect) {
  watchdog_counter++;
}

void loop()
{
  if (watchdog_counter*8 > SECONDS_TO_SLEEP || watchdog_counter == 0) {
    if (watchdog_counter > 0) {
      watchdog_counter = 0;
    }
    internal_v = read_internal_v();
    if (internal_v >= 3900) { 
      // Measured at vcc=3.7V, plenty of voltage
      digitalWrite(POWER_SWITCH_PIN, HIGH);
      digitalWrite(GREEN_PIN, HIGH);
      digitalWrite(RED_PIN, LOW);
      delay(1000); // delay so we are not checking vcc all the time
      digitalWrite(GREEN_PIN, LOW);
    } else if (internal_v <= 3400) {
      // Measured at vcc<=3.3V, voltage is gone, flash fast red pin 1s
      // Don't turn on POWER_SWITCH_PIN, no voltage left
      digitalWrite(GREEN_PIN, LOW);
      for (int i=0; i<5; i++) {
        digitalWrite(RED_PIN, HIGH);
        delay(100);
        digitalWrite(RED_PIN, LOW);
        delay(100);      
      }
    } else {
      // Not much voltage left, flash green pin 1s.
      digitalWrite(POWER_SWITCH_PIN, HIGH);
      digitalWrite(RED_PIN, LOW);
      for (int i=0; i<5; i++) {
        digitalWrite(GREEN_PIN, HIGH);
        delay(100);
        digitalWrite(GREEN_PIN, LOW);
        delay(100);      
      }  
    }

    delay(1000);

    // Show state of CHG pin
    int read_val = 0;
    read_val = digitalRead(MAX1555_CHG_PIN);
    if (read_val==LOW) {
      // MAX1555 is charging and charge current > 50mA
      digitalWrite(GREEN_PIN, HIGH);
      delay(500);  
    } else {
      // MAX1555 is not charging or charge current < 50mA
      digitalWrite(RED_PIN, HIGH);
      delay(500);
    }
    digitalWrite(GREEN_PIN, LOW);
    digitalWrite(RED_PIN, LOW);

    delay(1000L*SECONDS_ON-1000L); // Use long numbers to handle long seconds on periods 
    
    for (int i=0; i<5; i++) {
        digitalWrite(RED_PIN, HIGH);
        delay(100);
        digitalWrite(RED_PIN, LOW);
        delay(100);      
    }
    
    digitalWrite(POWER_SWITCH_PIN, LOW);
  }

  enterSleep();
}

//Sets the watchdog timer to wake us up, but not reset
//0=16ms, 1=32ms, 2=64ms, 3=128ms, 4=250ms, 5=500ms
//6=1sec, 7=2sec, 8=4sec, 9=8sec
//From: http://interface.khm.de/index.php/lab/experiments/sleep_watchdog_battery/
void setup_watchdog(int timerPrescaler) {

  if (timerPrescaler > 9 ) timerPrescaler = 9; //Limit incoming amount to legal settings

  byte bb = timerPrescaler & 7; 
  if (timerPrescaler > 7) bb |= (1<<5); //Set the special 5th bit if necessary

  //This order of commands is important and cannot be combined
  MCUSR &= ~(1<<WDRF); //Clear the watch dog reset
  WDTCR |= (1<<WDCE) | (1<<WDE); //Set WD_change enable, set WD enable
  WDTCR = bb; //Set new watchdog timeout value
  WDTCR |= _BV(WDIE); //Set the interrupt enable, this will keep unit from resetting after each int
}
