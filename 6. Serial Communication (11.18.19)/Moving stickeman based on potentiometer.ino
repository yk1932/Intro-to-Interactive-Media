int pot = A2;

void setup() {
//initialize serial communications at a 9600 baud rate (rate at which we're sending data to the computer)
Serial.begin(9600);

pinMode(pot,INPUT);
}

void loop() {

  int val = analogRead(pot);    // read the value from the sensor

  //Serial.println(val);

  if (val <= 100) {
   Serial.println("A");
  }

  else if (val <= 200) {
    Serial.println("B");
  }

  else if (val <= 300) {
    Serial.println("C");
  }

  else if (val <= 400) {
    Serial.println("D");
  }

  else if (val <= 500) {
    Serial.println("E");
  }

  else if (val <= 600) {
    Serial.println("F");
  }

  else if (val <= 700) {
    Serial.println("G");
  }

  else if (val <= 800) {
    Serial.println("H");
  }

  else if (val <= 900) {
    Serial.println("I");
  }

  else if (val <= 1000) {
    Serial.println("J");
  }

  else if (val <= 1100) {
    Serial.println("K");
  }
 

delay(100);

}
