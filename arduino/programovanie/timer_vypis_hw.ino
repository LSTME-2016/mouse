// tu je jednoduchy priklad na vyuzitie casovaca c.1
// potrebujete mat nainstalovanu kniznicu TimerOne

#include <TimerOne.h>


void setup()
{
    Timer1.initialize(100000);
    Serial.begin(115200);
    Timer1.attachInterrupt( vypisuj );
    pinMode(13, OUTPUT);
}

void vypisuj()
{
    Serial.print("*");
}

void loop()
{
    digitalWrite(13, 1);
    delay(200);
    digitalWrite(13, 0);
    delay(200);
}


