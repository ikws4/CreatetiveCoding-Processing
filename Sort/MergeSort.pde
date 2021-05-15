class MergeSort extends AbsSort {
    private static final int STATE_MERGE = -1;
    private static final int STATE_SPLIT = -2;

    private Deque<Integer> stack = new ArrayDeque<Integer>();
    private int l = 0, r = n - 1, m = l + (r - l) / 2;
    private int state = STATE_SPLIT;
    
    private int i = 0, j = r;
    private int[] temp = new int[n];

    public MergeSort() {
        push(l, r, state);
    }

    @Override
    public void next() {
        if (state == STATE_MERGE) {
            if (i <= r) {
                arr[i++] = temp[j++];
            } else {
                state = STATE_SPLIT;
            }
            return;
        }
        
        if (stack.isEmpty()) return;

        pop();
        
        m = l + (r - l) / 2;
        
        if (state == STATE_SPLIT) {
            if (l < r) {
                push(l, r, STATE_MERGE);
                push(m + 1, r, STATE_SPLIT);
                push(l, m, STATE_SPLIT);
            }
        } else {
            merge();
        }
    }
    
    private void merge() {
        i = l;
        j = m + 1;
        
        int k = 0;
        while (i <= m && j <= r) {
            if (arr[i] < arr[j]) {
                temp[k++] = arr[i++];
            } else {
                temp[k++] = arr[j++];
            }
        }

        while (i <= m) {
            temp[k++] = arr[i++];
        }

        while (j <= r) {
            temp[k++] = arr[j++];
        }
        
        i = l;
        j = 0;
    }
    
    private void pop() {
        l = stack.pop();
        r = stack.pop();
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
            fill(NORD11);
        } else if (index == i) {
            fill(NORD13);
        } else {
            fill(NORD8);
        }
    }

    @Override
    public String toString() {
        return "4. Merge Sort O(nlogn)";
    }
}
