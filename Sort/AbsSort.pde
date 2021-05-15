abstract class AbsSort {
    protected int[] arr;
    protected int n;
    protected int w = 10;
    protected int fontSize = 16;
    
    public AbsSort() {
        n = (int) (width / w);
        arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = (int) random(height * 0.05, height * 0.8);
        }
    }
    
    abstract void next();
    
    protected void fillColor(int index) {}
    
    protected void swap(int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    
    public void draw() {
        fill(255);
        textSize(fontSize);
        text(sort.toString(), fontSize, fontSize + fontSize);
    
        stroke(NORD2);
        strokeWeight(0.25);
        
        for (int i = 0; i < arr.length; i++) {
            fillColor(i);
            rect(i * w, height - arr[i], w, arr[i]);
        }
    }
}
