class QuickSort extends AbsSort {
    private static final int STATE_SPLIT = -1;
    private static final int STATE_PARTITION_LEFT = -2; 
    private static final int STATE_PARTITION_RIGHT = -3;
    
    private Deque<Integer> stack = new ArrayDeque<Integer>();
    private int l, r, i, j, pivot, state;
    
    public QuickSort() {
        i = l = 0;
        j = r = n - 1;
        pivot = arr[i];
        state = STATE_PARTITION_RIGHT;
    }

    @Override
    public void next() {
        if (state != STATE_SPLIT) {
            if (i < j) {
                partition();
            } else {
                state = STATE_SPLIT;
                if (l < r) {
                    arr[i] = pivot;
                    push(i + 1, r, STATE_PARTITION_RIGHT);
                    push(l, i - 1, STATE_PARTITION_RIGHT);
                }
            }
        } else if (!stack.isEmpty()) {
            pop();
            while (l >= r && !stack.isEmpty()) pop();
            
            if (l < r) {
                pivot = arr[i];
            }
        }
    }
    
    private void partition() {
        if (state == STATE_PARTITION_RIGHT) {
            if (arr[j] >= pivot) {
                j--;
            } else {
                arr[i] = arr[j];
                state = STATE_PARTITION_LEFT;
            }
        } else {
            if (arr[i] <= pivot) {
                i++;
            } else {
                arr[j] = arr[i]; 
                state = STATE_PARTITION_RIGHT;
            }
        }
    }
    
    private void pop() {
        i = l = stack.pop();
        j = r = stack.pop();
        state = stack.pop();
    }
    
    private void push(int l, int r, int state) {
        stack.push(state);
        stack.push(r);
        stack.push(l);
    }
    
    @Override
    public void draw() {
        super.draw();
        if (l < r) {
            int lx = l * w;
            int ly = height - arr[l];
            fill(NORD14);
            text("P", lx, ly - 2.5 * fontSize);
            
            fill(NORD13);
            text("L", lx, ly - fontSize);
            
            int rx = r * w;
            int ry = height - arr[r];
            text("R", rx, ry - fontSize);
        }
    }

    @Override
    protected void fillColor(int index) {
        if (index == l || index == r) {
            fill(NORD13);
        } else if (index == i || index == j) {
            fill(NORD11);
        } else {
            fill(NORD8);
        }
    }

    @Override 
    public String toString() {
        return "3. Quick Sort O(nlogn)";
    }
}
