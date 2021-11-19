//KTPCP (Koken Tekken Plarail Control(Common) Platform)

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

//使用可能GPIOピン設定
int GPIO_AVAILABLE[16] = {};

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
  server.on("/health", HTTP_POST, handlePing);
  
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
    server.send(404, "application/json", buffer);
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
    } else if (state == "ANGLE") {
      GPIO_SERVO[opPin].write(receivedJson["angle"]);
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

void handlePing() {
  sendJson.clear();
  sendJson["status"] = "OK";
  serializeJson(sendJson, buffer);
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
  //使用可能GPIOピン列挙
  GPIO_AVAILABLE[0] = 4;
  GPIO_AVAILABLE[1] = 13;
  GPIO_AVAILABLE[2] = 14;
  GPIO_AVAILABLE[3] = 16;
  GPIO_AVAILABLE[4] = 17;
  GPIO_AVAILABLE[5] = 18;
  GPIO_AVAILABLE[6] = 19;
  GPIO_AVAILABLE[7] = 21;
  GPIO_AVAILABLE[8] = 22;
  GPIO_AVAILABLE[9] = 23;
  GPIO_AVAILABLE[10] = 25;
  GPIO_AVAILABLE[11] = 26;
  GPIO_AVAILABLE[12] = 27;
  GPIO_AVAILABLE[13] = 32;
  GPIO_AVAILABLE[14] = 33;
  GPIO_AVAILABLE[15] = 15;
  
  Serial.begin(115200);
  
  for (int i = 0; i < 16; i++) {
    int gpio_it = GPIO_AVAILABLE[i];
    Serial.println(gpio_it);
    GPIO_TYPE[gpio_it] = GPIO_MOTOR;
    GPIO_SERVO[gpio_it].setPeriodHertz(50);
    GPIO_SERVO[gpio_it].attach(gpio_it, 500, 2400);
  }
  
  for (int i = 0; i < 16; i++) {
    int gpio_it = GPIO_AVAILABLE[i];
    GPIO_MOTOR_ANGLE[gpio_it] = 80;
  }
  
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
