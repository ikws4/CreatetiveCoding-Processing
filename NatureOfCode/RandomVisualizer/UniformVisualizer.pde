class UniformVisualizer extends Visualizer {
    
    @Override
    public void next() {
        arr[(int) random(arr.length)]++;
    }
}
