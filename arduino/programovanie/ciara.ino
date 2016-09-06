// tento priklad ukazuje pouzitie senzora na ciaru - len zobrazuje precitane
// hodnoty z troch senzorov a ak stredny vidi ciaru, tak vypisuje "ciara"

void setup() 
{
  Serial.begin(115200);
}

void loop() 
{
  Serial.print(analogRead(1));
  Serial.print(" ");
  Serial.print(analogRead(2));
  Serial.print(" ");
  Serial.print(analogRead(3));
  Serial.println();
  delay(500);
  if (analogRead(2) > 600)
    Serial.println("ciara");
}
