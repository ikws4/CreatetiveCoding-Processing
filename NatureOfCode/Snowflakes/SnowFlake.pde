class Snowflake {
    private float radius;
    private PVector position;
    private PVector velocity;
    private PVector acceleration;

    public Snowflake() {
        radius = random(3, 8);
        position = new PVector(random(width), random(height));
        velocity = new PVector(0, 0.15);
        acceleration = new PVector(0, 0);
    }

    public void fall() {
        acceleration = new PVector(random(-0.1, 0.1), random(0.01, 0.15));
        velocity.add(acceleration);
        position.add(velocity);
        velocity.limit(5);

        if (position.x < 0 || position.x >= width ||
            position.y < 0 || position.y >= height) {
            position = new PVector(random(width), -radius);
        }
    }

    public void render() {
        fill(0xFFD8DEE9);
        ellipse(position.x, position.y, radius * 2, radius * 2);
    }
}
