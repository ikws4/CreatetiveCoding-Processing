void setup() {
    size(800, 800);
    pixelDensity(displayDensity());
}

void draw() {
    background(255);
    PVector pos = new PVector(width / 2, 50);
    float circleRadius = 12;
    
    f(0, 50, circleRadius * 16, circleRadius, PI / 8, pos, pos);
}
   
void f(int l, int r, float radius, float circleRadius, float angle, PVector prev, PVector pos) {
    if (l > r) return;

    strokeWeight(2);
    fill(0);
    ellipse(pos.x, pos.y, circleRadius * 2, circleRadius * 2);
    line(prev.x, prev.y, pos.x, pos.y);
    
    int m = l + (r - l) / 2;
    PVector l_pos = new PVector(pos.x + radius * cos(PI - angle), pos.y + radius * sin(PI - angle));
    PVector r_pos = new PVector(pos.x + radius * cos(angle), pos.y + radius * sin(angle));
    
    f(l, m - 1, radius * 0.68, circleRadius, angle + PI / 10, pos, l_pos);
    f(m + 1, r, radius * 0.68, circleRadius, angle + PI / 10, pos, r_pos);
}
