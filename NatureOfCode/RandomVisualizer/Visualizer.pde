abstract class Visualizer {
    protected int[] arr = new int[21];
    abstract void next();
    
    public void render() {
        next();
        int w = width / arr.length;
        
        for (int i = 0; i < arr.length; i++) {
            fill(100);
            rect(i * w, height - arr[i], w, arr[i]); 
        }
    }
}
