/*
Simple LED library
-----------------------------------------------
Eduardo S. Scarpellini, <scarpellini@gmail.com>
                                    Oct 8, 2011
*/

#ifndef LED_H
#define LED_H

#define DEFAULT_LED_PIN 13
#define LED_FADE_STEP 7.5
#define LED_FADE_DELAY 10
#define DEFAULT_LED_BLINK 5
#define DEFAULT_LED_BLINK_DELAY 50

class LED {
  public:
    LED(int ledpin);
    int getState();
    void turnON();
    void turnOFF();
    void fadeOut();
    void fadeIn();
    void blink(int times);
    void fadeBlink(int times);
  private:
    int _ledState;
    int _ledPin;
    void _setState(int ledstate);
};

#endif
