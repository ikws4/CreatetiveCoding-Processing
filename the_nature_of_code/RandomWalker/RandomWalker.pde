Walker walker;

float xoff = 0;

void setup() {
    walker = new Walker();

    size(640, 360);

    background(255);
}


void draw() {
    walker.step();
    walker.draw();
}
