// vim:filetype=java
Ball[] balls;
Attracter attracter;

void setup() {
  size(1080, 720);
  background(255);

  balls = new Ball[10];
  attracter = new Attracter();

  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(10, 30));
  }
}

void draw() {
  background(255);
 
  attracter.update();
  attracter.render();

  for (Ball ball : balls) {
    PVector f = attracter.attract(ball); 
    ball.applyForce(f);
    ball.update();
    ball.render();
  }
}
