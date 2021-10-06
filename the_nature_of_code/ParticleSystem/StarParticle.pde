// vim:filetype=java

class StarParticle extends Particle {
  protected float a;
  protected float aVel;
  protected float aAcc;

  public StarParticle() {
    a = 0.0;
    aVel = 0.1;
    aAcc = 0.0008;
  }

  @Override
  public void update() {
    super.update();

    aVel -= aAcc;
    a += aVel;

    aVel = Math.max(0, aVel);
  }
  
  @Override
  public void render() {
    fill(100, lifeSpan);
    strokeWeight(2);
    stroke(50, lifeSpan);

    beginShape();
    for (int i = 0; i < 10; i++) {
      float angle = radians(i * 36);
      float radius = (i & 1) == 0 ? 10 : 5;
      vertex(pos.x + radius * cos(angle + a), pos.y + radius * sin(angle + a));
    }
    endShape(CLOSE);
  }
}
