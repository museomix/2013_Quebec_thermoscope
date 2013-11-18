#include <Servo.h>

#define PIN_FOR_RASP   13
#define INFRAROUGE_ID  A1

Servo servo;

float angle_middle    =  97.0;
float angle_left      = 140.0;
float angle_increment =   0.05;
float angle           = angle_middle;

void setup() {
	//pinMode(13,            OUTPUT);
	pinMode(PIN_FOR_RASP,  OUTPUT);
	pinMode(INFRAROUGE_ID, INPUT);
	servo.attach(9);
	servo.write(angle_middle);
}

void loop() {
	delay(10);

	int val = analogRead(INFRAROUGE_ID);
	servo.write((int)angle);
	if (200 <= val && val <= 1024) {
          digitalWrite(PIN_FOR_RASP, HIGH);
	  if (angle < angle_left)
			angle += angle_increment;
	} else {
          digitalWrite(PIN_FOR_RASP, LOW);
	  if (angle > angle_middle)
			angle -= angle_increment;
	}
}
