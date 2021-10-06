float r = 10;
float rVel = 0.1;
float rAcc = 0.01;

float a = 0.0;
float aVel = 0.01;
float aAcc = 0.001;

void setup() {
    //size(400, 400);
    fullScreen();
    pixelDensity(displayDensity());
    
    background(0);
    
    frameRate(20);
}

void draw() {
    a += aVel;
    aVel += aAcc;
    
    r += rVel;
    rVel += rAcc;
    
    
    translate(width / 2, height / 2);
    
    float x = r * cos(a);
    float y = r * sin(a);
    stroke(255);
    //line(0, 0, x, y); 
    
    
    
    point(x, y);
}
