Ball ball;

void setup() {
    size(600, 400);
    ball = new Ball();
}

void draw() {
    background(255);
    ball.move();
    ball.bounce();
    ball.render();
}
