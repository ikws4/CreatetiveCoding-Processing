// vim:filetype=java
class Box {
  Body body;

  float x, y;
  float w, h;

  public Box(float x, float y) {
    this(x, y, 16, 16);
  }

  public Box(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    makeBody(new Vec2(x, y), w, h);
  }

  public boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    if (pos.y > height + w * h) {
      box2d.destroyBody(body); 
      return true;
    }

    return false;
  }

  public void render() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);

    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0, 0, w, h);

    popMatrix();
  }

  private void makeBody(Vec2 center, float w, float h) {
    // Define shape
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    sd.setAsBox(box2dW, box2dH);

    // Define fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center.x, center.y));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    // initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5))); 
    body.setAngularVelocity(random(-5, 5)); 
  }
}
