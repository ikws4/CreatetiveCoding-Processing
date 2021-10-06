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

boolean debug = true;

Path path;
List<Vehicle> vehicles;

void setup() {
  size(400, 400);
  pixelDensity(displayDensity());
  frameRate(60);

  vehicles = new ArrayList<>();
  newPath();
}

void draw() {
  background(p_base);

  path.draw();

  // PVector mouse = new PVector(mouseX, mouseY);

  for (Vehicle v : vehicles) {
    v.follow(path); 
    // v.seek(mouse);
    v.borders(path);
    v.update();
    v.draw();
  }

  // Instruction
  fill(p_text);

  stroke(p_foam);
  line(10, height - 94, 60, height - 94);
  text("(Prediction)", 65, height - 90);

  stroke(p_love);
  line(10, height - 74, 60, height - 74);
  text("(Prejection)", 65, height - 70);

  stroke(p_iris);
  line(10, height - 54, 60, height - 54);
  text("(Target)", 65, height - 50);

  text("Hit space bar to toggle debugging line.", 10, height - 30);

  text("Hit enter to generate new path.", 10, height - 10);
}

void mousePressed() {
  PVector mouse = new PVector(mouseX, mouseY);
  vehicles.add(new Vehicle(mouse));
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  } else if (keyCode == ENTER) {
    newPath();
  }
}

void newPath() {
  PVector[] points = new PVector[5];
  points[0] = new PVector(0, 0);
  for (int i = 1; i < points.length - 1; i++) {
    float x = constrain(i * 1.0 / points.length * width + random(-80, 80), 0, width);
    float y = constrain(i * 1.0 / points.length * height + random(-80, 80), 0, height);
    points[i] = new PVector(x, y);
  }
  points[points.length - 1] = new PVector(width, height);

  path = new Path(points, 10);
}
