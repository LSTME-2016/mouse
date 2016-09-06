// tento program meria vzdialenost pomocou ultazvukoveho senzora na meranie
// vzdialenosti HC-SR04 vyuzitim HW casovaca c.2 a prerusenia na pine ECHO
// hlavny program sa nemusi starat vobec o nic, cele meranie sa deje v pozadi
// a vzdy aktualne namerana hodnota je v premennej vzdialenost
// pouziva casovac c.2, ktory sa nebije so servami, takze toto je vhodny
// program pre mys.

#include <MsTimer2.h>

#define TRIG 2
#define ECHO 3

void setup()
{
    pinMode(TRIG, OUTPUT);
    pinMode(ECHO, INPUT);
    attachInterrupt(digitalPinToInterrupt(ECHO), zmena, CHANGE);
    MsTimer2::set(20, vysli_pulz);
    MsTimer2::start();
    Serial.begin(115200);
}

int cakame_na_zaciatok;
volatile int vzdialenost;
long zaciatocny_cas, konecny_cas;

void zmena()
{
    if (cakame_na_zaciatok == 1) 
    {
         zaciatocny_cas = micros();
         cakame_na_zaciatok = 0;
    }
    else 
    {
        konecny_cas = micros();
        long dlzka_pulzu = konecny_cas - zaciatocny_cas;
        vzdialenost = dlzka_pulzu / 58;
    }
}

void vysli_pulz()
{
    digitalWrite(TRIG, 1);
    delayMicroseconds(10);
    digitalWrite(TRIG, 0);
    cakame_na_zaciatok = 1;
}

void loop()
{
    Serial.println("Meriam vzdialenost");
    while (1)
    {
        Serial.println(vzdialenost);
        delay(200);
    }
}


