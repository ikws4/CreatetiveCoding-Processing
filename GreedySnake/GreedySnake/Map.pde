class Map {
    public void draw() {
        stroke(NORD3);
        fill(NORD5);
        for (int x = 0; x < N; x++) {
            for (int y = 0; y < N; y++) {
                rect(x * blockWidth, y * blockHeight, blockWidth, blockHeight);   
            }
        }
    }
}
