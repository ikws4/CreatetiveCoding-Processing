class NormalVisualizer extends Visualizer {
    
    @Override
    public void next() {
        int sd = 2;
        int mean = arr.length / 2;
        int index = constrain((int) (randomGaussian() * sd + mean), 0, arr.length - 1); 
        arr[index]++;
    }
}
