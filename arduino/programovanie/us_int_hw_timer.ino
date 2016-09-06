// tento program meria vzdialenost pomocou ultazvukoveho senzora na meranie
// vzdialenosti HC-SR04 vyuzitim HW casovaca c.1 a prerusenia na pine ECHO
// hlavny program sa nemusi starat vobec o nic, cele meranie sa deje v pozadi
// a vzdy aktualne namerana hodnota je v premennej vzdialenost
// pouziva casovac c.1, ktory sa bije so servami, takze ak chcete zaroven
// hybat s motormi, tak treba pouzit namiesto toho casovac 2.

#include <TimerOne.h>

#define TRIG 2
#define ECHO 3

void setup()
{
    Serial.begin(115200);
    pinMode(TRIG, OUTPUT);
    pinMode(ECHO, INPUT);
    attachInterrupt(digitalPinToInterrupt(ECHO), zmena, CHANGE);
    Timer1.initialize(20);
	Timer1.attachInterrupt( vysli_pulz );
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
    cakame_na_zaciatok = 1;
    digitalWrite(TRIG, 1);
	delayMicroseconds(10);
    digitalWrite(TRIG, 0);
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


