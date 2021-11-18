//KTPCP (Koken Tekken Plarail Control(Common) Platform)

//TODO: ホールセンサの値が変わった時に割り込み処理をし、値を取得する関数を作成する

#include <Arduino.h>
#include <WiFi.h>
//#include <esp_wifi.h>
#include <WebServer.h>
#include <ArduinoJson.h>
#include <FreeRTOS.h>
#include <sys/time.h>

//Wi-Fi 設定の読み込み
#include "KTPCP_config.h"

//サーボモータ
#include <ESP32Servo.h>

//現在時刻取得
#include <time.h>
#define JST 3600*9

//Webサーバー
WebServer server(80);
 
//JSON
StaticJsonDocument<4096> receivedJson;
StaticJsonDocument<4096> sendJson;
char buffer[4096];

//GPIO
#define GPIO_MAX 36
int GPIO_TYPE[GPIO_MAX];
#define GPIO_NO_USE 0
#define GPIO_HALL   1
#define GPIO_MOTOR  2
int GPIO_STATE[GPIO_MAX] = {0};
//サーボモータ用
int GPIO_MOTOR_ANGLE[GPIO_MAX];
Servo GPIO_SERVO[GPIO_MAX];

time_t GPIO_LAST_UPDATE[GPIO_MAX];

void connectToWiFi() {
  Serial.print("Connecting to ");
  Serial.println(SSID);
  
  //esp_wifi_set_ps(WIFI_PS_NONE);
  WiFi.begin(SSID, PWD);
  
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
 
  Serial.print("Connected. IP: ");
  Serial.println(WiFi.localIP());
}

void setup_routing() {
  server.on("/", HTTP_POST, handlePost);
  
  //サーバー開始
  server.begin();
}
 
void control_hardware(void * Parameters) {
  time_t t;
  for (;;) {
    delay(1);
  }
}

void handlePost() {
  if (server.hasArg("plain") == false) {
    //TODO: エラー処理を書く
  }
  
  sendJson.clear();
  
  String body = server.arg("plain");
  deserializeJson(receivedJson, body);
  
  int opPin;
  opPin = receivedJson["pin"];
  String state;
  state = receivedJson["state"].as<String>();
  
  Serial.print(opPin);
  Serial.print("\t");
  Serial.print(state);
  Serial.print("\n");
  
  //手動時刻設定
  if (opPin == -1) {
    time_t t, t_;
    struct timeval tv;
    tv.tv_sec = receivedJson["state"].as<time_t>();
    tv.tv_usec = 0;
    settimeofday(&tv, NULL);
    Serial.println(tv.tv_sec);
    t = time(NULL);
    t_ = mktime(localtime(&t));
    Serial.print("Set new date and time:");
    Serial.println(t_);
    sendJson["status"] = "OK";
    sendJson["last_update"] = t_;
    serializeJson(sendJson, buffer);
    server.send(200, "application/json", buffer);
    return;
  }
  
  if ((opPin < 0) || (opPin >= GPIO_MAX) || (GPIO_TYPE[opPin] == GPIO_NO_USE)) {
    sendJson["error"] = "invalid GPIO pin";
    serializeJson(sendJson, buffer);
    server.send(400, "application/json", buffer);
    return;
  }
  
  if ((GPIO_TYPE[opPin] == GPIO_HALL) && (state == "GET")) {
    sendJson["status"] = GPIO_STATE[opPin];
    sendJson["last_update"] =GPIO_LAST_UPDATE[opPin];
    serializeJson(sendJson, buffer);
    server.send(200, "application/json", buffer);
    return;
  } else if (GPIO_TYPE[opPin] == GPIO_MOTOR) {
    if (state == "ON") {
      GPIO_STATE[opPin] = 1;
      GPIO_SERVO[opPin].write(GPIO_MOTOR_ANGLE[opPin]);
    } else if (state == "OFF") {
      GPIO_STATE[opPin] = 0;
      GPIO_SERVO[opPin].write(0);
    } else {
      sendJson["error"] = "invalid operation";
      serializeJson(sendJson, buffer);
      server.send(400, "application/json", buffer);
      return;
    }
    time_t t, t_;
    t = time(NULL);
    t_ = mktime(localtime(&t));
    
    sendJson["status"] = "OK";
    sendJson["last_update"] = t_;
    serializeJson(sendJson, buffer);
    server.send(200, "application/json", buffer);
    return;
  }
  
  sendJson["error"] = "invalid operation";
  serializeJson(sendJson, buffer);
  // Respond to the client
  server.send(404, "application/json", buffer);
}

void setup_task() {
  xTaskCreate(
    control_hardware,
    "Control hardware",
    1000,
    NULL,
    1,
    NULL
  );
}

void setup() {
  //仮設定
  for (int i = 0; i < 12; i++) {
    GPIO_TYPE[i] = GPIO_HALL;
  }
  for (int i = 12; i < GPIO_MAX; i++) {
    GPIO_TYPE[i] = GPIO_MOTOR;
    GPIO_SERVO[i].setPeriodHertz(50);
    GPIO_SERVO[i].attach(i, 500, 2400);
  }
  //仮設定終わり
  
  for (int i = 0; i < GPIO_MAX; i++) {
    GPIO_MOTOR_ANGLE[i] = 80;
  }
  
  Serial.begin(115200);
  
  connectToWiFi();
  
  configTime( JST, 0, "ntp.nict.jp", "ntp.jst.mfeed.ad.jp");
  //現在時刻が2000年1月1日より後であれば、正しい時刻とする
  time_t t, t_;
  t = time(NULL);
  t_ = mktime(localtime(&t));
  if (t_ > 946652400) {
    Serial.print("Set new date and time:");
    Serial.println(t_);
  } else {
    Serial.println("Warning: Could not connect NTP server.");
  }
  
  setup_task();
  setup_routing();
}

void loop() {
  server.handleClient();
  delay(1);
}
