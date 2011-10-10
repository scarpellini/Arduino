#include "main.h"
#include "led.h"
#include "photocell.h"


int serialRecvd = 0;


LED LED(LED_PIN);
PHOTOCELL PHOTOCELL(0);


void setup() {
 Serial.begin(9600);
 pinMode(BUZZ_PIN, OUTPUT);
}

void loop() {
//  if (Serial.available() > 0) {
//    serialRecvd = Serial.read();
//    
//    Serial.print("Received: ");
//    Serial.println(serialRecvd); 
//  }
  
  if (PHOTOCELL.is_dark()) {
   tone(BUZZ_PIN, BUZZ_FREQUENCY);
   LED.turnON();
   LED.fadeBlink(1);
  } else {
   LED.turnOFF();
   noTone(BUZZ_PIN);
  }
  
  delay(200);
}
