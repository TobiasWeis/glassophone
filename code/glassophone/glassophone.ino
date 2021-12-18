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

// Milliseconds!
#define DE 500  // 1/8
#define DQ 1000  // 1/4
#define DH 2000  // 1/2
#define DF 4000 // 1/1

int stepduration = 1500;
int current_step_position = 0;

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

void setup() {
  // put your setup code here, to run once:
  pinMode(2, OUTPUT); // direction
  pinMode(3, OUTPUT); // step
  pinMode(4, OUTPUT); // hammer
  digitalWrite(4, LOW);
}

void play_note(int note, long duration){
  // calculate the absolute step-position for the note
  int go_to_step = note*50; // 50 steps == 45°, glasses are 45°
  
  if(go_to_step > current_step_position){
    digitalWrite(2,HIGH);
  }else{
    digitalWrite(2,LOW);
  }

  // move the required number of steps
  for(int i=0; i < abs(current_step_position-go_to_step);i++){
    digitalWrite(3,HIGH);
    delayMicroseconds(stepduration);
    digitalWrite(3,LOW);
    delayMicroseconds(stepduration);
  }

  current_step_position = go_to_step;

  // release the hammer to ping the glass
  digitalWrite(4, HIGH);
  delay(50);
  digitalWrite(4,LOW);

  // wait the required time before playing next note
  // TODO: calculate how many steps it will take and subtract that duration
  delay(duration);
  
}

void loop() {
  // play the melody
  for(int i=0;i<sizeof(melody)/(sizeof(long)*2);i++){
    long note = melody[i][0];
    long duration = melody[i][1];
    play_note(note, duration);
  }
  
  delay(5000);
}
