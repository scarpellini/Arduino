/*
Simple photocell library
-----------------------------------------------
Eduardo S. Scarpellini, <scarpellini@gmail.com>
                                    Oct 8, 2011
*/

#include <WProgram.h>
#include "photocell.h"


int _phtcellPin = DEFAULT_PHTCELL_PIN;


PHOTOCELL::PHOTOCELL(int phtcellPin) {
  if (phtcellPin) {
    _phtcellPin = phtcellPin;
  }
  
  pinMode(_phtcellPin, INPUT);
}

int PHOTOCELL::readLuminosity() {
  return analogRead(_phtcellPin);
}

boolean PHOTOCELL::is_clear() {
  return readLuminosity() >= LIGHT_THRESHOLD;
}

boolean PHOTOCELL::is_dark() {
  return readLuminosity() < LIGHT_THRESHOLD; 
}
