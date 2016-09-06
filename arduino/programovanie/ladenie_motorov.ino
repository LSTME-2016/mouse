// toto je priklad na riadenie servo motorov
// je mozne ho pouzit na vyladenie stredu pomocou
// trimra na opacnej strane serva, aby mali stred
// v hodnote 90.

#include <Servo.h>

Servo ma, mb;

int r;

void setup() 
{
  ma.attach(9);
  mb.attach(10); 
  Serial.begin(115200); 
  r = 90;
}

void loop() 
{
  ma.write(r);
  mb.write(r);
  Serial.println(r);
  if (Serial.available())
  {
    char c = Serial.read();
    if (c == '+') r++;
    if (c == '-') r--;
  }
  delay(100);
}
