Visualizer visualizer;

void setup() {
    size(525, 525);
    background(255);
    //visualizer = new UniformVisualizer();
    visualizer = new NormalVisualizer();
}

void draw() {
    visualizer.render();
}
