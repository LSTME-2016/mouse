#include <Servo.h> 

Servo motorA;
Servo motorB;

int count;

void setup() 
{
  pinMode(13, OUTPUT);
  motorA.attach(9);
  motorB.attach(10);
  motorA.write(90);
  motorB.write(90);
  count = 0;
}

void loop() 
{  
  motorA.write(70);
  motorB.write(70);
  for (int i = 0; i < count; i++)
  {
    digitalWrite(13, 1 - digitalRead(13));
    delay(250);
  }
  count++;
  
  //delay(3000);
  motorA.write(90);
  motorB.write(90);
  delay(300);
  motorA.write(110);
  motorB.write(110);
  delay(3000);
  motorA.write(90);
  motorB.write(90);
  delay(300);
}

