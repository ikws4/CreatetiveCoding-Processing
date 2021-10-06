void setup() {
    size(400, 400);
    pixelDensity(displayDensity());
    frameRate(10);
}

void draw() {
    background(255);
    
    PVector a = new PVector(0, 0);
    PVector b = new PVector(width, 0);
    PVector c = new PVector(width, height);
    PVector d = new PVector(0, height);
    
    
    f(6, a, b, c, d);
    
    line(a.x, a.y, c.x, c.y);
    line(b.x, b.y, d.x, d.y);
    
    line(0, height / 2, width, height / 2); 
    line(width / 2, 0, width / 2, height); 
}

void f(int n, PVector a, PVector b, PVector c, PVector d) {
    if (n <= 0) return;
    
    beginShape();
    vertex(a.x, a.y);
    vertex(b.x, b.y);
    vertex(c.x, c.y);
    vertex(d.x, d.y);
    endShape(CLOSE);
    
    PVector a_ = new PVector(a.x + (d.x - a.x) / 2, a.y + (d.y - a.y) / 2);
    PVector b_ = new PVector(b.x - (b.x - a.x) / 2, b.y - (b.y - a.y) / 2);
    PVector c_ = new PVector(c.x - (c.x - b.x) / 2, c.y - (c.y - b.y) / 2);
    PVector d_ = new PVector(d.x + (c.x - d.x) / 2, d.y + (c.y - d.y) / 2);
    
    f(n - 1, a_, b_, c_, d_);
}
