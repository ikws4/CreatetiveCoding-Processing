// vim:filetype=java

class Vehicel {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed;
  float maxForce;
  float radius;

  Vehicel(PVector pos) {
    this.pos = pos;
    this.vel = new PVector(random(-1, 1), random(-1, 1));
    this.acc = new PVector(0, 0);
    this.maxSpeed = 1;
    this.maxForce = 0.1;
    this.radius = 100;
  }

  void seek(PVector target) {
    PVector desire = PVector.sub(target, pos);
    float dist = desire.mag();
    if (dist < radius) {
      desire.setMag(dist / radius * maxSpeed);
    } else {
      desire.setMag(maxSpeed);
    }

    PVector steer = PVector.sub(desire, vel);
    steer.limit(maxForce);

    applyForce(steer);
  }

  void applyForce(PVector force) {
    acc.add(force); 
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void draw() {
    fill(150);
    stroke(100);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading() + HALF_PI);
    triangle(0, -10,
             5, 10,
             -5, 10);
    popMatrix();
  }
}
