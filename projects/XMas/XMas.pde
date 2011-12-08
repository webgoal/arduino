#include "pitches.h"

int LED1 = 9;
int LED2 = 10;
int LED3 = 11;
int LED4 = 12;
int LED5 = 13;

int DELAY = 150;

// notes in the melody:
int melody[] = {NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_D5, NOTE_G4, NOTE_A4, NOTE_B4, 0,
  NOTE_C5, NOTE_C5, NOTE_C5, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_A4, NOTE_B4, NOTE_A4, NOTE_B4, NOTE_A4, NOTE_D5};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {4,4,2,4,4,2,4,4,4,4,2,4,4,4,2,4,4,2,4,4,4,4,2,2};

void setup() {                
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  play();
}

void loop() {
  play();
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
  for (int thisNote = 0; thisNote < 24; thisNote++) {

    // to calculate the note duration, take one second
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);
    // Acende as luzes junto com a nota
    if (melody[thisNote] == NOTE_D5 && noteDurations[thisNote] == 2) {
      turn(HIGH, HIGH, HIGH, HIGH, HIGH);
    } else {
      turn(
        melody[thisNote] == NOTE_A4 ? HIGH : LOW,
        melody[thisNote] == NOTE_B4 ? HIGH : LOW, 
        melody[thisNote] == NOTE_D5 ? HIGH : LOW,
        melody[thisNote] == NOTE_G4 ? HIGH : LOW, 
        melody[thisNote] == NOTE_C5 ? HIGH : LOW
      );
    }
    delay(noteDuration);
    // Apaga as luzes
    turn(LOW, LOW, LOW, LOW, LOW);
    
    // Mantm as luzes desligadas por 30% do tempo da nota
    int pauseBetweenNotes = noteDuration * 0.30;
    delay(pauseBetweenNotes);
    
    noTone(8);
  }
}
