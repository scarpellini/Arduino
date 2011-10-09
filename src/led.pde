/*
Simple LED library
-----------------------------------------------
Eduardo S. Scarpellini, <scarpellini@gmail.com>
                                    Oct 8, 2011
*/

#include <WProgram.h>
#include "led.h"


int _ledPin = DEFAULT_LED_PIN;
int _ledState = 0;


LED::LED(int ledPin) {
  if (ledPin) {
    _ledPin = ledPin;
  }
  
  pinMode(_ledPin, OUTPUT);
}

int LED::getState() {
 return _ledState;
}

void LED::_setState(int ledState) {
  _ledState = ledState;
}

void LED::turnON() {
 if (getState()) {
   // already on
   return;
 }
 
 // turn led on
 digitalWrite(_ledPin, HIGH);
 _setState(1);
}

void LED::turnOFF() {
 if (!getState()) {
   // already off
   return; 
 }
 
 // turn led off
 digitalWrite(_ledPin, LOW);
 _setState(0);
}

void LED::fadeIn() {
  // already on
  if (getState()) {
   return; 
  }
  
  // led fade in
  for (int i = 0; i <= 255; i += LED_FADE_STEP) {
    analogWrite(_ledPin, i);
    delay(LED_FADE_DELAY);
  }
  _setState(1);
}

void LED::fadeOut() {
  if (!getState()) {
    //already off
    return;
  }
  
  // led fade out
  for (int i = 255; i >= 0; i -= LED_FADE_STEP) {
   analogWrite(_ledPin, i);
   delay(LED_FADE_DELAY);
  }
  _setState(0);
}

void LED::blink(int times) {
  if (!times) {
    times = DEFAULT_LED_BLINK;
  }
  
  // blink led
  for (int i = 0; i <= times; i++) {
    if (getState()) {
     // on; turn off
     turnOFF();
    } else {
     // off; turn on
     turnON();
    }
    
    delay(DEFAULT_LED_BLINK_DELAY);
  } 
}

void LED::fadeBlink(int times) {
  if (!times) {
    times = DEFAULT_LED_BLINK;
  }
  
  // blink led
  for (int i = 0; i <= times; i++) {
    if (getState()) {
     // on; turn off
     fadeOut();
    } else {
     // off; turn on
     fadeIn();
    }
    
    delay(DEFAULT_LED_BLINK_DELAY);
  } 
}
