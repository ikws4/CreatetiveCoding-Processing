// vim:filetype=java

import java.util.*;

Solver solver;
int k = 2;

void settings() {
  size((1 << k) * 50, (1 << k) * 50);
  pixelDensity(displayDensity());
}

void setup() {
  background(255);

  int size = 1 << k;
  solver = new Solver(size, (int) random(size), (int) random(size));

}

void draw() {
  background(255);

  solver.update();
  solver.draw(); 

  noLoop();
}
