#include "pitches.h"

int LED1 = 9;
int LED2 = 10;
int LED3 = 11;
int LED4 = 12;
int LED5 = 13;

int DELAY = 150;

// notes in the melody:
int melody[] = {NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3,0, NOTE_B3, NOTE_C4};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {4, 8, 8, 4, 4, 4, 4, 4};

void setup() {                
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  play();
}

void loop() {
  for (int i=0; i<10; i++)
    vaiVem();
  for (int i=0; i<10; i++)
    blinkAll();
}

void blinkAll() {
  turn(LOW, LOW, LOW, LOW, LOW);
  delay(DELAY);
  turn(HIGH, HIGH, HIGH, HIGH, HIGH);
  delay(DELAY);
}

void vaiVem() {
  turnClockWise(DELAY);
  turnCounterClockWise(DELAY);
}

void turnClockWise(int speed) {
  turn(HIGH, LOW, LOW, LOW, LOW);
  delay(speed);
  turn(LOW, HIGH, LOW, LOW, LOW);
  delay(speed);
  turn(LOW, LOW, HIGH, LOW, LOW);
  delay(speed);
  turn(LOW, LOW, LOW, HIGH, LOW);
  delay(speed);
  turn(LOW, LOW, LOW, LOW, HIGH);
  delay(speed);
}

void turnCounterClockWise(int speed) {
  turn(LOW, LOW, LOW, LOW, HIGH);
  delay(speed);
  turn(LOW, LOW, LOW, HIGH, LOW);
  delay(speed);
  turn(LOW, LOW, HIGH, LOW, LOW);
  delay(speed);
  turn(LOW, HIGH, LOW, LOW, LOW);
  delay(speed);
  turn(HIGH, LOW, LOW, LOW, LOW);
  delay(speed);
}

void turn(int status1, int status2, int status3, int status4, int status5) {
  digitalWrite(LED1, status1);
  digitalWrite(LED2, status2);
  digitalWrite(LED3, status3);
  digitalWrite(LED4, status4);
  digitalWrite(LED5, status5);
}

void play() {
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(8);
  }
}
