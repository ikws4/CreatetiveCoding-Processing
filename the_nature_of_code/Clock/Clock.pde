// vim:filetype=java

Mark mark;
Hand secondHand;
Hand minuteHand;
Hand hourHand;

void setup() {
  //size(400, 400);
  fullScreen();
  pixelDensity(displayDensity());
  
  
  mark = new Mark(90, 0xFFF6EDFE);
  secondHand = new DotHand(82, 12, secondAngle(), 0xFF9D6674);
  minuteHand = new Hand(70, 13, minuteAngle(), 0xFF7D68BD);
  hourHand = new Hand(40, 13, hourAngle(), 0xFF51495E);
}

void draw() {
  background(0xFFE1CDF0);

  translate(width / 2, height / 2);

  mark.render();

  hourHand.update(hourAngle());
  hourHand.render();

  minuteHand.update(minuteAngle());
  minuteHand.render();

  secondHand.update(secondAngle());
  secondHand.render();
}

float secondAngle() {
  return map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
}

float minuteAngle() {
  return map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
}

float hourAngle() {
  return map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
}
