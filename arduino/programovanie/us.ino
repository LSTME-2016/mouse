// tento program meria vzdialenost pomocou ultrazvukoveho senzora HC-SR04
// najjednoduchsim sposobom - priamo z programu

// VCC pripojit na 5V
// GND pripojit na GND
// ECHO pripojit na D6
// TRIG pripojit na D5

void setup()
{
    pinMode(6, INPUT);
    pinMode(5, OUTPUT);
    Serial.begin(115200);
}

int vzdialenost()
{
    // vysli 10 mikrosekundovy pulz na pin TRIG
    digitalWrite(5, 1);
    delayMicroseconds(10);
    digitalWrite(5, 0);
    
    // cakaj, kym senzor neodpovie pulzom na pine ECHO a zisti ako dlho to trvalo
    // v premennej d budeme pripocitavat 1 za kazdych 5 mikrosekund
    int d = 0;
    
    while (digitalRead(6) == 0);
    while (digitalRead(6) == 1)
    {
       delayMicroseconds(5);
       d++;   // to iste ako d = d + 1;
    }
    
    // sem sa dostanem ked senzor odpovedal pulzom
    // celkovy cas v mikrosekundach je d * 5
    int cas = 5 * d;
    // vzdialenost v centimetroch podla datasheetu je cas / 58, tuto hodnotu nasa funkcia vrati
    return cas /58;
}


void loop()
{
  delay(100);   
  Serial.println(vzdialenost());
}

