class Food extends Point {
    public Food() {
        super((int) random(0, N - 1), (int) random(0, N - 1));
    }
    
    public void draw() {
        fill(NORD11);
        rect(getX() * blockWidth, getY() * blockHeight, blockWidth, blockHeight);
    }
}
