// toto je priklad na meranie casu pomocou funkcie micros()

void setup()
{
    Serial.begin(115200);
}

void loop()
{
    long cas = micros();
    
   while (1)
   {
       if (micros() - cas > 1000000)
       {
          Serial.println(".");
          cas = micros();
       }
   }
}



