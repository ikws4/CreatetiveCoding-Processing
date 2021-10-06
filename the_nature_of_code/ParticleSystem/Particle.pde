// vim:filetype=java

class Particle {
  protected PVector pos;
  protected PVector vel;
  protected PVector acc;
  protected int lifeSpan;

  public Particle() {
    pos = new PVector(width / 2, 50); 
    vel = new PVector(random(-1, 1), random(-2, 0)); 
    acc = new PVector(0, 0); 
    lifeSpan = 255;
  }

  public boolean isDead() {
    return lifeSpan <= 0;
  }

  public void applyForce(PVector force) {
    acc.add(force);
  }

  public void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    lifeSpan -= 2;
  }

  public void render() {
    fill(100, lifeSpan);
    strokeWeight(2);
    stroke(50, lifeSpan);
    ellipse(pos.x, pos.y, 20, 20);
  }
}
