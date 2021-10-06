// vim:filetype=java

class DotHand extends Hand {
  
  public DotHand(float radius) {
    this(radius, 1);
  }

  public DotHand(float radius, float weight) {
    this(radius, weight, 0);
  }

  public DotHand(float radius, float weight, float angle) {
    this(radius, weight, angle, 0xFFFFFFFF);
  }

  public DotHand(float radius, float weight, float angle, int mcolor) {
    super(radius, weight, angle, mcolor);
  }

  @Override
  public void render() {
    float x = radius * cos(angle);
    float y = radius * sin(angle);
    stroke(mcolor);
    strokeWeight(weight);
    point(x, y);
  }
}
