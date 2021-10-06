// vim:filetype=java
import java.util.*;

List<Particle> particles;

void setup() {
  size(720, 360);
  pixelDensity(displayDensity());
  frameRate(60);

  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  particles.add(new StarParticle());

  PVector gravity = new PVector(0, 0.05);
  applyForce(gravity);

  if (mousePressed) {
    PVector wind = new PVector(map(mouseX, 0, width, 0.05, -0.05) , 0);
    applyForce(wind);
  }

  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle particle = particles.get(i);
    particle.update();
    particle.render();

    if (particle.isDead()) {
      particles.remove(i);
    }
  }
}

void applyForce(PVector force) {
  for (Particle particle : particles) {
    particle.applyForce(force);
  }
}
