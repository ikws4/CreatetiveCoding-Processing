class Path {
  PVector[] points;
  float radius;

  Path(PVector[] points, float radius) {
    this.points = points;
    this.radius = radius;
  }

  PVector getStart() {
    return points[0];
  }

  PVector getEnd() {
    return points[points.length - 1];
  }

  void draw() {
    stroke(p_surface);
    strokeCap(SQUARE);
    strokeWeight(radius * 2);
    noFill();
    beginShape();
    for (PVector point : points) {
      vertex(point.x, point.y);
    }
    endShape();

    stroke(p_highlight_overlay);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector point : points) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}
