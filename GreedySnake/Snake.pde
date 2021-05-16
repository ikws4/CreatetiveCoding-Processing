class Snake {
    private LinkedList<PVector> body = new LinkedList<PVector>();
    private int dx = 0;
    private int dy = 1;
    private boolean isDead = false;
    
    public Snake() {
        int origin = N / 2; 
        body.addLast(new PVector(origin, origin + 1));
        body.addLast(new PVector(origin, origin));
        body.addLast(new PVector(origin, origin - 1));
    }
    
    public void draw() {
        update();
        
        // head
        fill(NORD0);
        drawBody(body.get(0));
        
        // body
        fill(NORD3);
        for (int i = 1; i < body.size(); i++) {
            drawBody(body.get(i));
        }
    }
    
    private void drawBody(PVector p) {
        rect(p.x * blockWidth, p.y * blockHeight, blockWidth, blockHeight);
    }
    
    private void update() {
        PVector head = body.getFirst();
        PVector next = new PVector(head.x + dx, head.y + dy);
        
        
        if (next.x < 0 || next.x >= N ||
            next.y < 0 || next.y >= N ||
            isAteBody(next)) {
            isDead = true;
        } else {
            body.addFirst(next);
            body.removeLast();
        }
    }
    
    private boolean isDead() {
        return isDead;
    }
    
    private boolean isAteBody(PVector next) {
        for (int i = 1; i < body.size(); i++) {
            if (next.equals(body.get(i))) return true;
        }
        return false;
    }
    
    private PVector head() {
        return body.getFirst();
    }
    
    public void setDir(int dx, int dy) {
        this.dx = dx;
        this.dy = dy;
    }
    
    public void eat(Food p) {
        body.addLast(p);
    }
    
    public boolean canEat(Food p) {
        return head().x == p.x &&
               head().y == p.y;
    }
    
    public boolean contains(PVector p) {
        return body.contains(p);
    }
}
