class BFS {
    private final int[][] moves = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
    
    private Queue<Integer> queue = new LinkedList<Integer>();
    private int x, y;
    private int move = 0;
    private int size = 0;
    private boolean isUpdate = false;
    
    public BFS(int x, int y) {
        this.x = x;
        this.y = y;
        offer(x, y);
    }
    
    public boolean isUpdate() {
        return isUpdate;
    }
    
    public void setUpdate(boolean b) {
        isUpdate = b;
    }
    
    public void advance() {
        if (graph[y][x] == TARGET) return;
        
        while (move < moves.length) {
            move();
            //return;
        }
        
        if (size > 0) {
            neighbor();
            //return;
        }
            
        if (!queue.isEmpty()) {
            size = queue.size() / 2;
        }
    }
    
    private void move() {
        int nextx = x + moves[move][0];
        int nexty = y + moves[move][1];
        if (nextx < 0 || nextx >= N ||
            nexty < 0 || nexty >= N ||
            graph[nexty][nextx] == WALL ||
            graph[nexty][nextx] == VISITED) { move++; return; }
            
        offer(nextx, nexty);
        move++;
    }
    
    private void neighbor() {
        poll();
        size--;
        move = 0;
        if (graph[y][x] == TARGET) return;
        
        graph[y][x] = VISITED;
        isUpdate = true;
    }
    
    private void poll() {
        x = queue.poll();
        y = queue.poll();
    }
    
    private void offer(int x, int y) {
        graph[y][x] = VISITING;
        isUpdate = true;
        queue.offer(x);
        queue.offer(y);
    }
}
