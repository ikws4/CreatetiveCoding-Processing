import java.util.*;

List<Snowflake> snowflakes;

void setup() {
    size(500, 500);
    snowflakes = new ArrayList<Snowflake>();
    int amount = (int) random(100, 250);
    for (int i = 0; i < amount; i++) {
        snowflakes.add(new Snowflake());
    }
}

void draw() {
    background(0xFF4C566A);
    for (Snowflake snowflake : snowflakes) {
        snowflake.fall();
        snowflake.render();
    }
}
