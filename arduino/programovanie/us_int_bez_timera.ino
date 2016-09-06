// tento program meria vzdialenost z ultrazvukoveho senzora HC-SR04
// pomocou preruseni (interrupt): signal na pin TRIG sa generuje priamo
// z programu, ale program nemusi cakat na odozvu na pine ECHO, pretoze
// zmena na tomto pine generuje prerusenie a vzdialenost sa zmeria 
// v pozadi behu hlavneho programu

#define TRIG 2
#define ECHO 3

void setup()
{
    Serial.begin(115200);
    pinMode(TRIG, OUTPUT);
    pinMode(ECHO, INPUT);
    attachInterrupt(digitalPinToInterrupt(ECHO), zmena, CHANGE);
}

long zaciatocny_cas, koncovy_cas;
int vzdialenost, zaciatok_pulzu;

void zmena()
{
   if (zaciatok_pulzu)
   {
      zaciatocny_cas = micros();
      zaciatok_pulzu = 0;
   }
   else
   {
     koncovy_cas = micros();
     vzdialenost = (koncovy_cas - zaciatocny_cas) / 58;
    }
}

void posli_pulz()
{
    digitalWrite(TRIG, 1);
    delayMicroseconds(10);
    digitalWrite(TRIG, 0);
    zaciatok_pulzu = 1;
}

void loop()
{
    Serial.println("Ultrazvuk");
    while (1)
    {
        posli_pulz();
        delay(20);
        Serial.println(vzdialenost);
        delay(200);
    }
}

