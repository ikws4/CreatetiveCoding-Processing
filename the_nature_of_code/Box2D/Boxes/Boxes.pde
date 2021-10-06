// vim:filetype=java
import java.util.*;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

List<Box> boxes;
List<Boundary> boundaries;

Box2DProcessing box2d;

void setup() {
  size(720, 420, P2D);
  pixelDensity(displayDensity());
  frameRate(60);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  boundaries.add(new Boundary(200, height - 100, 200, 15));
  boundaries.add(new Boundary(width - 200, height - 200, 200, 15));
  boundaries.add(new Boundary(400, height - 50, 100, 15));
}

void draw() {
  background(255);

  box2d.step();

  // if (mousePressed) {
  //   boxes.add(new Box(mouseX, mouseY));    
  // }

  if (frameCount % 3 == 0) {
    boxes.add(new Box(width / 2, 50, random(10, 20), random(10, 20)));
  }

  for (int i = boxes.size() - 1; i >= 0; i--) {
    Box box = boxes.get(i);
    box.render();

    if (box.done()) {
      boxes.remove(i);
    }
  }

  for (Boundary boundary : boundaries) {
    boundary.render();
  }

}
