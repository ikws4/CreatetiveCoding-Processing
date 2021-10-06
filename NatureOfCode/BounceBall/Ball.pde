class Ball {
    private PVector position;
    private PVector velocity;
    private int size;

    public Ball() {
        position = new PVector(width / 2, height / 2);
        velocity = new PVector(5.5, -3);
        size = 50;
    }

    public void move() {
        position.add(velocity);
    }

    public void bounce() {
        if (position.x >= width - size / 2 || position.x < size / 2) {
            velocity.x = -velocity.x;
        } 
        
        if (position.y >= height - size / 2 || position.y < size / 2) {
            velocity.y = -velocity.y;
        }
    }

    public void render() {
        noStroke();
        fill(100);
        ellipse(position.x, position.y, size, size);
    }
}
