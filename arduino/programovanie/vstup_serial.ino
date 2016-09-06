// toto je jednoduchy priklad na zadavanie hodnot cez seriovy port
// ked chcete pouzit len jeden znak, lepsie je pouzit funkcie
// Serial.available() - na zistenie, ci nejaky znak prisiel
// a Serial.read() - na precitanie toho znaku, ktory prisiel
// potom mozete pouzit aj iny terminalovy program, nielen Serial Monitor,
// ktory je zabudovany do Arduino IDE. Napriklad PUTTY.

void setup()
s{
    Serial.begin(115200);
    Serial.setTimeout(25000);
}

void loop()
{
    int a = 0, b = 0;
    Serial.print("Zadaj a, medzeru, b medzeru a stlac SEND:");
    while (a * b == 0)
    {
      a = Serial.parseInt();
      b = Serial.parseInt();
    }

    Serial.println();
    Serial.print("a=");
    Serial.println(a);
    Serial.print("b=");
    Serial.println(b);
    
    Serial.print("a + b = ");
    Serial.println(a + b);
    
    if (a + b > 100) 
    {
        Serial.println("To bolo vela!");
    }
    else
    {
        Serial.println("Same male cisla");
   }
}


