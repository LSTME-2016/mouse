// priklad na pouzitie casovaca 2, ktory sa nebije s pouzitim servo motorov
// je vhodne ho pouzit na meranie ultrazvuku

#include <MsTimer2.h>

void setup() 
{
  MsTimer2::set(20, udalost);
  MsTimer2::start();
  Serial.begin(115200);
}

void udalost()
{
  Serial.print("*");
}

void loop() 
{
  digitalWrite(13, 1);
  delay(500);
  digitalWrite(13, 0);
  delay(500);
}

