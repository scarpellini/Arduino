/*
Simple photocell library
-----------------------------------------------
Eduardo S. Scarpellini, <scarpellini@gmail.com>
                                    Oct 8, 2011
*/

#ifndef PHOTOCELL_H
#define PHOTOCELL_H

#define DEFAULT_PHTCELL_PIN 0
#define LIGHT_THRESHOLD 400

class PHOTOCELL {
  public:
    PHOTOCELL(int phtcellPin);
    int readLuminosity();
    boolean is_clear();
    boolean is_dark();
  private:
    int _phtcellPin;
};

#endif
