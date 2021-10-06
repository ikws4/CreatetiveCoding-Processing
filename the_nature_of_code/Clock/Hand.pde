// vim:filetype=java

class Hand {
  protected final float radius;
  protected final float weight;
  protected final color mcolor;
  protected float angle;

  public Hand(float radius) {
    this(radius, 1);
  }

  public Hand(float radius, float weight) {
    this(radius, weight, 0);
  }

  public Hand(float radius, float weight, float angle) {
    this(radius, weight, angle, 0xFFFFFFFF);
  }

  public Hand(float radius, float weight, float angle, int mcolor) {
    this.radius = radius;
    this.weight = weight;
    this.angle = angle;
    this.mcolor = mcolor;
  }

  public void update(float angle) {
    this.angle = angle;
  }

  public void render() {
    float x = radius * cos(angle);
    float y = radius * sin(angle);
    stroke(mcolor);
    strokeWeight(weight);
    line(0, 0, x, y);
  }
}
