// toto je jednoduchy priklad na citanie z IR prijimaca pomocou kniznice,
// ktora je pritomna uz v nainstalovanom arduino IDE v.1.6

#include <IRremote.h>

// G - GND
// R - 5V  alebo VIN
// Y - D11

int RP = 11;

IRrecv irr(RP);

decode_results res;

void setup()
{
  Serial.begin(115200);
  irr.enableIRIn(); // Start the receiver
}

void loop() 
{
  if (irr.decode(&res)) {
    Serial.println(res.value, HEX);
    irr.resume(); // Receive the next value
  }
  delay(100);
}

