int LED1 = 9;
int LED2 = 10;
int LED3 = 11;
int LED4 = 12;
int LED5 = 13;

int DELAY = 150;

void setup() {                
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
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

void turnAll(int status) {
  digitalWrite(LED1, status);
  digitalWrite(LED2, status);
  digitalWrite(LED3, status);
  digitalWrite(LED4, status);
  digitalWrite(LED5, status);
}

void turnOn(int led) {
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, LOW);
  digitalWrite(LED4, LOW);
  digitalWrite(LED5, LOW);
  digitalWrite(led, HIGH);
}

void turn(int status1, int status2, int status3, int status4, int status5) {
  digitalWrite(LED1, status1);
  digitalWrite(LED2, status2);
  digitalWrite(LED3, status3);
  digitalWrite(LED4, status4);
  digitalWrite(LED5, status5);
}
