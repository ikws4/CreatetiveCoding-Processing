Ball[] balls;

void setup() {
    balls = new Ball[10];
    pixelDensity(displayDensity());

    size(640, 360);
    for (int i = 0; i < balls.length; i++) {
        balls[i] = new Ball();
    }
}

void draw() {
    background(255);
    for (Ball ball : balls) {
        PVector gravity = new PVector(0, 0.3);
        gravity.mult(ball.mass);
        ball.applyForce(gravity);

        if (mousePressed) {
            PVector wind = new PVector(0.2, 0);
            ball.applyForce(wind);
        }

        PVector friction = ball.vel.copy();
        friction.normalize();
        friction.mult(-1);
        friction.mult(0.01);
        ball.applyForce(friction);

        ball.update();
        ball.edgeEffect();
        ball.render();
    }
}
