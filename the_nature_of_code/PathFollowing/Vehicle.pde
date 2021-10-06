class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float maxSpeed;
  float maxSteerForce;

  Vehicle() {
    this(new PVector(random(width), random(height)));
  }

  Vehicle(PVector pos) {
    this(pos, new PVector(random(-2, 2), random(-2, 2)));
  }

  Vehicle(PVector pos, PVector vel) {
    this(pos, vel, new PVector(0, 0));
  }

  Vehicle(PVector pos, PVector vel, PVector acc) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.r = 5;
    this.maxSpeed = 2;
    this.maxSteerForce = 0.1;
  }

  void follow(Path path) {
    PVector predict = vel.copy();
    predict.setMag(50); // 50 frame ahead
    predict = PVector.add(pos, predict);

    PVector normalPoint = null;
    PVector dir = null;
    float minDistance = width * height;
    for (int i = 0; i < path.points.length - 1; i++) {
      PVector a = path.points[i];  
      PVector b = path.points[i + 1];  
      PVector currNormalPoint = getNormalPoint(predict, a, b);

      if (currNormalPoint.x < a.x || currNormalPoint.x > b.x) {
        currNormalPoint = b.copy();
      }

      float dist = PVector.dist(predict, currNormalPoint);
      if (dist < minDistance) {
        normalPoint = currNormalPoint;
        minDistance = dist;
        dir = PVector.sub(b, a);
      }
    }
    
    dir.setMag(10);
    PVector target = PVector.add(normalPoint, dir);

    if (minDistance > path.radius) {
      seek(target);
    }

    if (debug) {
      stroke(p_foam);
      line(pos.x, pos.y, predict.x, predict.y);
      stroke(p_love);
      line(predict.x, predict.y, normalPoint.x, normalPoint.y);
      stroke(p_iris);
      line(normalPoint.x, normalPoint.y, target.x, target.y);
    }
  }

  PVector getNormalPoint(PVector predict, PVector a, PVector b) {
    PVector u = PVector.sub(predict, a);
    PVector v = PVector.sub(b, a);

    v.normalize();
    v.mult(v.dot(u));

    return PVector.add(a, v);
  }

  void seek(PVector target) {
    PVector desire = PVector.sub(target, pos);
    desire.setMag(maxSpeed);

    PVector steer = PVector.sub(desire, vel);
    steer.limit(maxSteerForce);

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

  void borders(Path path) {
    if (pos.x > path.getEnd().x + r) {
      pos.x = path.getStart().x - r;
      pos.y = path.getStart().y + (pos.y - path.getEnd().y);
    }
  }

  void draw() {
    noStroke();
    fill(p_gold);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading() + HALF_PI);
    triangle(-r, r,
             0, -r * 2,
             r, r);
    popMatrix();
  }
}
