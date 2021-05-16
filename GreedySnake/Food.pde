class Food extends PVector {
    
    public Food() {
        super((int) random(0, N - 1), (int) random(0, N - 1));
    }
    
    public void draw() {
        fill(NORD11);
        rect(x * blockWidth, y * blockHeight, blockWidth, blockHeight);
    }
}
