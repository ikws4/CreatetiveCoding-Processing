// vim:filetype=java
ArrayList<Vehicel> vehicels;

void setup() {
  size(620, 400);
  pixelDensity(displayDensity());

  vehicels = new ArrayList<Vehicel>();

  for (int i = 0; i < 5; i++) {
    vehicels.add(new Vehicel(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(255);

  noFill();
  stroke(200);
  ellipse(mouseX, mouseY, 200, 200);

  for (Vehicel v : vehicels) {
    v.seek(new PVector(mouseX, mouseY));
    v.update();
    v.draw();
  }
}
