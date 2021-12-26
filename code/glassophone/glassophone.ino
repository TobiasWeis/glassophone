#include <AccelStepper.h>

// timings: one revolution is 400 steps
// 1s = 1.000.000 microseconds
// 1 step takes 1000 microseconds
//
// 8 glasses on 360 deg -> each note is +45°
//
// 1 step is 1.8°, 45° == 25 steps
// assume the servo is positioned on C

// note-lengths are 1/1, 1/2, 1/4, 1/8 - that determines the time until we make the next note

// we have notes from c,d,e,f,g,a,h,c2

#define C 0
#define D 1
#define E 2
#define F 3
#define G 4
#define A 5
#define H 6
#define C2 7

#define PIN_C 2
#define PIN_D 3
#define PIN_E 4
#define PIN_F 5
#define PIN_G 6
#define PIN_A 7
#define PIN_H 8
#define PIN_C2 9

#define PIN_ENABLE 13
#define PIN_DIRECTION 10
#define PIN_STEP 11
#define PIN_RELAIS 12

// Milliseconds!
#define DE 500  // 1/8
#define DQ 1000  // 1/4
#define DH 2000  // 1/2
#define DF 4000 // 1/1

int stepduration = 250;
int current_step_position = 0;
int stepfac = 4; // quarter-step

/*
// Am Weihnachtsbaum die Lichter
int melody[][2] = {
  {C,DE},
  {C,DE},
  {E,DE},
  {G,DQ},
  {E,DE},
  {G,DE},
  {C2,DE},
  {A,DE},
  {G,DQ},
  {E,DE}
};*/

// Test
long melody[][2] = {
  {C,DQ},
  {D,DQ},
  {E,DQ},
  {F,DQ},
  {G,DQ},
  {F,DQ},
  {E,DQ},
  {D,DQ},
  {C,DQ}
};

AccelStepper stepper(1,PIN_DIRECTION,PIN_STEP);

void setup() {
  // keyboard
  pinMode(PIN_C, INPUT_PULLUP);
  pinMode(PIN_D, INPUT_PULLUP);
  pinMode(PIN_E, INPUT_PULLUP);
  pinMode(PIN_F, INPUT_PULLUP);
  pinMode(PIN_G, INPUT_PULLUP);
  pinMode(PIN_A, INPUT_PULLUP);
  pinMode(PIN_H, INPUT_PULLUP);
  pinMode(PIN_C2, INPUT_PULLUP);
  
  pinMode(PIN_RELAIS, OUTPUT); // hammer
  pinMode(PIN_ENABLE, OUTPUT); // enable

  stepper.setMaxSpeed(50000);
  stepper.setAcceleration(20000);

  digitalWrite(PIN_ENABLE, HIGH); // disable stepper
  digitalWrite(PIN_RELAIS, LOW);
  digitalWrite(PIN_ENABLE, LOW); // enable stepper - TODO: make switchable depending on melody vs. keyboard
}

void play_note(int note, long duration){
  // calculate the absolute step-position for the note
  int go_to_step = note*50*stepfac; // 50 steps == 45°, glasses are 45°

  stepper.moveTo(go_to_step);
  stepper.runToPosition();

  // release the hammer to ping the glass
  digitalWrite(PIN_RELAIS, HIGH);
  delay(50);
  digitalWrite(PIN_RELAIS,LOW);

  // wait the required time before playing next note
  // TODO: calculate how many steps it will take and subtract that duration
  delay(duration);
  
}

void play_melody(){
  digitalWrite(PIN_ENABLE, LOW); // enable stepper
  
  // play the melody
  for(int i=0;i<sizeof(melody)/(sizeof(long)*2);i++){
    long note = melody[i][0];
    long duration = melody[i][1];
    play_note(note, duration);
  }

  digitalWrite(PIN_ENABLE,HIGH); // disable stepper
  delay(5000);  
}

void loop() {
  //play_melody();
  if(digitalRead(PIN_C) == 0){
    play_note(C, DE);
  }else if(digitalRead(PIN_D) == 0){
    play_note(D, DE);
  }else if(digitalRead(PIN_E) == 0){
    play_note(E, DE);
  }else if(digitalRead(PIN_F) == 0){
    play_note(F, DE);
  }else if(digitalRead(PIN_G) == 0){
    play_note(G, DE);
  }else if(digitalRead(PIN_A) == 0){
    play_note(A, DE);
  }else if(digitalRead(PIN_H) == 0){
    play_note(H, DE);
  }else if(digitalRead(PIN_C2) == 0){
    play_note(C2, DE);
  }
}
