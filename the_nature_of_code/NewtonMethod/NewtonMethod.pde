// x = sqrt(n)
//
// f(x)  = x^2 - n
// f'(x) = 2x 
//
// x_ = x - f(x) / f'(x)

float n = 4.0;
float factor = 20.0;
float x = random(-width / (factor / 2), width / (factor / 2));
float x_ = x;

float left, right, top, bottom;

void setup() {
    size(800, 800);
    pixelDensity(displayDensity());

    left = -width / 2;
    right = width / 2;
    top = height / 2;
    bottom = -height / 2;

    noLoop();
}

void draw() {
    background(255);

    translate(width / 2, height / 2);
    scale(factor);


    strokeWeight(1 / factor);
    stroke(100);

    drawCoord();

    // x^2 - n
    drawFunction();

    // line from x to f(x)
    stroke(0, 150, 0);
    line(x, 0, x, -f(x));

    x_ = x - f(x) / df(x);


    // line from f(x) to x_
    stroke(0, 0, 150);
    line(x, -f(x), x_, 0);

    x = x_;
    
    noLoop();
}

void keyPressed() {
    if (keyCode == ENTER) {
        x = random(-width / factor, width / factor);
        x_ = x;
        redraw();
    } else if (key == ' ') {
        loop();
    }
}

void drawCoord() {
    // x-cord
    line(left, 0, right, 0);

    // y-cord
    line(0, top, 0, bottom);
}

void drawFunction() {
    stroke(150, 0, 0);
    noFill();
    beginShape();
    for (float x = left; x <= right; x += 1) {
        curveVertex(x, -f(x));
    }
    endShape();
}

float f(float x) {
    return x * x - n;
}

float df(float x) {
    return 2 * x;
}
