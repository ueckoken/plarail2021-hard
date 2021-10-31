#define HALL_SENSOR 12
#define BITS 2          //車種データのビット数

void setup() {
  pinMode(HALL_SENSOR, INPUT);
  Serial.begin(115200);
}
 
void loop() {
  unsigned long T_1, T_2;
  boolean vehicletype[BITS];
  int i;

  //HIGHを待機
  while(digitalRead(HALL_SENSOR) == LOW){}

  //LOWを待機
  while(digitalRead(HALL_SENSOR) == HIGH){}
  T_1 = millis();

  //HIGHを待機
  while(digitalRead(HALL_SENSOR) == LOW){}
  T_2 = millis();

  //ここまで開始信号

  unsigned long T = T_2 - T_1;

  delay(3*T/2); //信号待ち

  
  for(i = 0; i < BITS; i++)
  {
    vehicletype[i] = ( digitalRead(HALL_SENSOR) == HIGH );
    delay(T);
  }


  //結果出力
  Serial.print("Now = ");
  Serial.print(T_2);
  Serial.print( ";    T = " );
  Serial.println(T);

  Serial.print("vehicletype = { ");
  for(i = 0; i < BITS; i++)
  {
    Serial.print(vehicletype[i]);
    Serial.print(", ");
  }
  Serial.println("}");
  
}
