// vim:filetype=java

class Attracter {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float G;

  Attracter() {
    pos = new PVector(width / 2, height / 2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    G = 1;
    mass = 200;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  PVector attract(Ball ball) {
    PVector force = PVector.sub(pos, ball.pos);
    float d = force.mag();

    d = constrain(d, 10, 100);

    force.normalize();

    float strength = (mass * ball.mass) / (d * d);

    return force.mult(strength);
  } 

  void render() {
    noStroke();
    fill(120);
    ellipse(pos.x, pos.y, mass, mass);
  }
}
