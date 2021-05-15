class Snake {
    private LinkedList<Point> body = new LinkedList<Point>();
    private int dx = 0;
    private int dy = 1;
    private boolean isDead = false;
    
    public Snake() {
        int origin = N / 2; 
        body.addLast(new Point(origin, origin + 1));
        body.addLast(new Point(origin, origin));
        body.addLast(new Point(origin, origin - 1));
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
    
    private void drawBody(Point p) {
        rect(p.getX() * blockWidth, p.getY() * blockHeight, blockWidth, blockHeight);
    }
    
    private void update() {
        Point head = body.getFirst();
        Point next = new Point(head.x + dx, head.y + dy);
        
        
        if (next.getX() < 0 || next.getX() >= N ||
            next.getY() < 0 || next.getY() >= N ||
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
    
    private boolean isAteBody(Point next) {
        for (int i = 1; i < body.size(); i++) {
            if (next.equals(body.get(i))) return true;
        }
        return false;
    }
    
    private Point head() {
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
        return head().getX() == p.getX() &&
               head().getY() == p.getY();
    }
    
    public boolean contains(Point p) {
        return body.contains(p);
    }
}
