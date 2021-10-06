// vim:filetype=java
class Boundary {
  Body body;

  float x, y;
  float w, h;

  Boundary(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    makeBody(new Vec2(x, y), w, h);
  }

  public void render() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    
    stroke(0);
    fill(127);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0, 0, w, h);

    popMatrix();
  }

  private void makeBody(Vec2 center, float w, float h) {
    // Shape
    PolygonShape sd = new PolygonShape();
    sd.setAsBox(box2d.scalarPixelsToWorld(w / 2), box2d.scalarPixelsToWorld(h / 2));

    // Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    // Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(center.x, center.y));
    
    body = box2d.createBody(bd); 
    body.createFixture(fd);
  }
   
}
