// vim:filetype=java

class Mark {
  protected float radius;
  protected color bgColor;

  public Mark(float radius, color bgColor) {
    this.radius = radius;
    this.bgColor = bgColor;
  }

  public void render() {
    stroke(255);
    beginShape();
    for (int i = -24; i < 24; i++) {
      float angle = radians(i * 15);
      float r = (i & 1) == 0 ? radius : radius * 0.94;
      curveVertex(r * cos(angle), r * sin(angle));
    }
    endShape(CLOSE);
  }
}
