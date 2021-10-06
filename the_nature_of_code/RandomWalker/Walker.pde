class Walker {
  PVector pos;
  float pointSize;
  float t;

  Walker() {
    pos = new PVector(width / 2, height / 2);
    pointSize = 5;
    t = 0;
  }

  void step() {
    float dx = map(noise(t), 0, 1, -pointSize, pointSize);
    float dy = map(noise(t + 1000), 0, 1, -pointSize, pointSize);
    t += 0.05;
    
    pos.add(new PVector(dx, dy));
    
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
    
  }

  void draw() {
    strokeWeight(pointSize);
    point(pos.x, pos.y);
  }
}
