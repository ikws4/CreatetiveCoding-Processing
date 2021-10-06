// imports {{{
import java.util.*;
// }}}

// rose-pine colorscheme {{{
final color p_base               = #232136;
final color p_surface            = #2a273f;
final color p_overlay            = #393552;
final color p_inactive           = #59546d;
final color p_subtle             = #817c9c;
final color p_text               = #e0def4;
final color p_love               = #eb6f92;
final color p_gold               = #f6c177;
final color p_rose               = #ea9a97;
final color p_pine               = #3e8fb0;
final color p_foam               = #9ccfd8;
final color p_iris               = #c4a7e7;
final color p_highlight          = #312f44;
final color p_highlight_inactive = #2a283d;
final color p_highlight_overlay  = #3f3c53;
// }}}

float x = 0;
float r = 50;
float angle = 0;

void setup() {
  size(400, 400);
  pixelDensity(displayDensity());
  frameRate(60);
}

void draw() {
  background(p_base);


  pushMatrix();
  translate(width / 2, height / 2);
  
  drawCoord();
  drawSinWave();
  drawPoint();

  drawCircle();

  popMatrix();

  if (x >= TWO_PI) {
    x = -TWO_PI;
  }
  x = x + 0.1;
}

void drawCoord() {
  stroke(p_overlay);
  strokeWeight(1);
  line(0, 0, width / 2, 0);
  line(0, 0, 0, -height / 2);
  line(0, 0, -width / 2, 0);
  line(0, 0, 0, height / 2);
}

void drawSinWave() {
  stroke(p_subtle);
  strokeWeight(2);
  noFill();
  beginShape();
  for (float x = -TWO_PI; x <= TWO_PI + 0.1; x += 0.1) {
    curveVertex(x * 20, sin(x) * 20);
  }
  endShape();
  
  // beginShape();
  // for (float x = -TWO_PI; x <= TWO_PI + 0.1; x += 0.1) {
  //   curveVertex(x * 20, cos(x) * 20);
  // }
  // endShape();
}

void drawPoint() {
  stroke(p_love);
  strokeWeight(10);
  point(x * 20, sin(x) * 20);
}

void drawCircle() {
  stroke(p_overlay);
  noFill();

  pushMatrix();
  strokeWeight(2);
  translate(-width / 4, -height / 2 + 80); 

  strokeWeight(1);
  ellipse(0, 0, r * 2, r * 2);

  line(0, 0, cos(-x) * r, sin(-x) * r);
  line(0, 0, r, 0);

  // stroke(p_highlight);
  // fill(p_highlight);
  // beginShape();
  // for (float i = 0; i <= x % TWO_PI; i += 0.1) {
  //   curveVertex(0, 0);
  //   curveVertex(cos(-i) * r / 5, sin(-i) * r / 5); 
  // }
  // endShape();

  strokeWeight(5);
  stroke(p_subtle);
  point(0, 0);

  popMatrix();
}
