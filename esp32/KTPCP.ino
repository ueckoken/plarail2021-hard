//KTPCP (Koken Tekken Plarail Control(Common) Platform)

//TODO: ホールセンサの値が変わった時に割り込み処理をし、値を取得する関数を作成する

#include <Arduino.h>
#include <WiFi.h>
#include <WebServer.h>
#include <ArduinoJson.h>
#include <FreeRTOS.h>
 
//Wi-Fi 設定の読み込み
#include "KTPCP_config.h"

//サーボモータ
#include <ESP32Servo.h>

#define NUM_OF_LEDS 8 
#define PIN 4

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
#define GPIO_MAX 28
int GPIO_TYPE[GPIO_MAX];
#define GPIO_NO_USE 0
#define GPIO_HALL   1
#define GPIO_MOTOR  2
//サーボモータは動作に時間がかかるため別スレッド処理
int GPIO_STATE[GPIO_MAX];
int GPIO_STATE_WEB[GPIO_MAX];

time_t GPIO_LAST_UPDATE[GPIO_MAX];

void connectToWiFi() {
  Serial.print("Connecting to ");
  Serial.println(SSID);
  
  WiFi.begin(SSID, PWD);
  
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
 
  Serial.print("Connected. IP: ");
  Serial.println(WiFi.localIP());
}

void setup_routing() {
  server.on("/gpio", HTTP_POST, handlePost);
  
  //サーバー開始
  server.begin();
}
 
void control_hardware(void * Parameters) {
  time_t t;
  for (;;) {
    for (int i = 0; i < GPIO_MAX; i++) {
      if (GPIO_TYPE[i] == GPIO_MOTOR) {
        if (GPIO_STATE[i] != GPIO_STATE_WEB[i]) {
          //TODO: ここにサーボモータを動かすプログラムを書く
          t = time(NULL);
          GPIO_LAST_UPDATE[i] = mktime(localtime(&t));
          GPIO_STATE[i] = GPIO_STATE_WEB[i];
        }
      }
    }
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
      GPIO_STATE_WEB[opPin] = 1;
    } else if (state == "OFF") {
      GPIO_STATE_WEB[opPin] = 0;
    } else {
      sendJson["error"] = "invalid operation";
      serializeJson(sendJson, buffer);
      server.send(400, "application/json", buffer);
      return;
    }
    sendJson["status"] = "OK";
    sendJson["last_update"] =GPIO_LAST_UPDATE[opPin];
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
  time_t t, t_;
  //仮設定
  for (int i = 0; i < 12; i++) {
    GPIO_TYPE[i] = GPIO_HALL;
  }
  for (int i = 12; i < GPIO_MAX; i++) {
    GPIO_TYPE[i] = GPIO_MOTOR;
  }
  //仮設定終わり
  
  Serial.begin(9600);
  
  connectToWiFi();
  configTime( JST, 0, "ntp.nict.jp", "ntp.jst.mfeed.ad.jp");
  for (;;) {
    //現在時刻が2000年1月1日より後になるまで待つ
    t = time(NULL);
    t_ = mktime(localtime(&t));
    if (t_ > 946652400) {
      Serial.print("Set new date and time:");
      Serial.println(t_);
      break;
    }
    delay(500);
  }
  setup_task();
  setup_routing();
}

void loop() {
  server.handleClient();
}
