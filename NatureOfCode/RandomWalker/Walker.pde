class Walker {
    private final int[][] dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    private int x;
    private int y;

    public Walker() {
        x = width / 2;
        y = height / 2;
    }

    public void step() {
        int[] dir = dirs[(int) random(0, dirs.length)];
        x += dir[0];
        y += dir[1];
        x = constrain(x, 0, width);
        y = constrain(y, 0, height);
    }

    public void render() {
        point(x, y);
    }
}
