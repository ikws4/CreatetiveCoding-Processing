// vim:filetype=java

class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;

  Ball(float mass) {
    this.mass = mass;
    pos = new PVector(random(0, width), random(0, height));
    vel = new PVector(random(-2, 2), random(-2, 2));
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void edgeEffect() {
    if (pos.x <= 0 || pos.x >= width) vel.x = -vel.x;
    if (pos.y <= 0 || pos.y >= height) vel.y = -vel.y;

    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }

  void render() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, mass, mass);
  }
}
