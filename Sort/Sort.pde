import java.util.*;

// keyCode 
final int SPACE = 32;
final int NUMBER_ZERO = 48;
final int NUMBER_ONE = 49;
final int NUMBER_TWO = 50;
final int NUMBER_THREE = 51;
final int NUMBER_FOUR = 52;
final int NUMBER_FIVE = 53;
final int NUMBER_SIX = 54;
final int NUMBER_SEVEN = 55;
final int NUMBER_EIGHT = 56;
final int NUMBER_NINE = 57;

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

boolean isRunning = false;
AbsSort sort;

void setup() {
    size(500, 500);
    //fullScreen();
    sort = new MergeSort();
}

void redraw() {
    background(NORD0);
    isRunning = false;
}

void draw() {
    background(NORD0);
    
    if (isRunning) {
        sort.next();
    }
    sort.draw();
}

void keyPressed() {
    if (keyCode == NUMBER_ONE) {
        redraw();
        sort = new BubbleSort();
    }else if (keyCode == NUMBER_TWO) {
        redraw();
        sort = new SelectionSort();
    } else if (keyCode == NUMBER_THREE) {
        redraw();
        sort = new QuickSort();
    } else if (keyCode == NUMBER_FOUR) {
        redraw();
        sort = new MergeSort();
    } else if (keyCode == SPACE) {
        isRunning = !isRunning;
    } else if (keyCode == RIGHT) {
        isRunning = false;
        sort.next();
        sort.draw();
    }    
}
