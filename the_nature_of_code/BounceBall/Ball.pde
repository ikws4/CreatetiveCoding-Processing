class Ball {
    PVector pos;
    PVector vel;
    PVector acc;

    float mass;
    float radius;

    Ball() {
        pos = new PVector(random(width), random(height));
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        mass = random(1, 4);
        radius = mass * 15 / 2.0;
    }

    void applyForce(PVector force) {
        PVector f = PVector.div(force, mass);
        acc.add(f);
    }

    void update() {
        vel.add(acc);
        pos.add(vel);
        acc.mult(0);
    }
    
    void edgeEffect() {
        if (pos.x <= radius || pos.x >= width - radius) {
            vel.x = -vel.x * 0.8;
        }
        if (pos.y <= radius || pos.y >= height - radius) {
            vel.y = -vel.y * 0.8;
        }
        
        pos.x = constrain(pos.x, radius, width - radius);
        pos.y = constrain(pos.y, radius, height - radius);
    }
    
    

    void render() {
        fill(0);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
    }
}
