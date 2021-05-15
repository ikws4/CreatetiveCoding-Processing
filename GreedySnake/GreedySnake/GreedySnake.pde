import java.util.*;

// https://www.nordtheme.com/docs/colors-and-palettes
final int NORD0 = 0xFF2E3440;
final int NORD1 = 0xFF3B4252;
final int NORD2 = 0xFF434C5E;
final int NORD3 = 0xFF4C566A;

final int NORD4 = 0xFFD8DEE9;
final int NORD5 = 0xFFE5E9F0;
final int NORD6 = 0xFFECEFF4;

final int NORD7 = 0xFF8FBCBB;
final int NORD8 = 0xFF88C0D0;
final int NORD9 = 0xFF81A1C1;
final int NORD10 = 0xFF81A1C1;

final int NORD11 = 0xFFBF616A;
final int NORD12 = 0xFFD08770;
final int NORD13 = 0xFFEBCB8B;
final int NORD14 = 0xFFA3BE8C;
final int NORD15 = 0xFFB48EAD;

int N = 21;
int blockWidth;
int blockHeight;

Map map;
Snake snake;
Food food;

void setup() {
    size(525, 525);
    frameRate(7);
    
    blockWidth = width / N;
    blockHeight = height / N;
    
    map = new Map();
    snake = new Snake();
    generateFood();
}

void draw() {
    background(NORD5);
    
    if (snake.isDead()) {
        textSize(32);
        textAlign(CENTER, CENTER);
        text("Game Over\nPress r key to restart", width / 2, height / 2);
        return;
    }
    
    if (snake.canEat(food)) {
        snake.eat(food);
        generateFood();
    }
    
    map.draw();
    food.draw();
    snake.draw();
}

void keyPressed() {
    if (key == 'r') {
        setup();
    } else if (key == 'w' || key == 'k' || keyCode == UP) {
        snake.setDir(0, - 1);
    } else if (key == 'a' || key == 'h' || keyCode == LEFT) {
        snake.setDir(-1, 0);
    } else if (key == 's' || key == 'j' || keyCode == DOWN) {
        snake.setDir(0, 1);
    } else if (key == 'd' || key == 'l' || keyCode == RIGHT) {
        snake.setDir(1, 0);
    }
}

void generateFood() {
    do {
        food = new Food();    
    } while (snake.contains(food));
}
