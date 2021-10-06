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


final int N = 21;

// 0 -> empty
// 1 -> wall
// 2 -> target
// 3 -> start
// 4 -> visited
int[][] graph;

int EMPTY = 0;
int WALL = 1;
int TARGET = 2;
int START = 3;
int VISITED = 4;
int VISITING = 5;

int blockWidth;
int blockHeight;

int fillValue = 3;

BFS bfs;

void setup() {
    size(525, 525);    
    //frameRate(10);
    graph = new int[N][N];
    blockWidth = width / N;
    blockHeight = height / N;
}

void draw() {
    background(NORD0);
    if (bfs != null) {
        while (!bfs.isUpdate()) {
            bfs.advance();
        }
        bfs.setUpdate(false);
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (graph[i][j] == EMPTY) {
                fill(NORD6);
            } else if (graph[i][j] == WALL) {
                fill(NORD12);
            } else if (graph[i][j] == TARGET) {
                fill(NORD11);   
            } else if (graph[i][j] == START) {
                fill(NORD15);
            } else if (graph[i][j] == VISITED) {
                fill(NORD0);   
            } else if (graph[i][j] == VISITING) {
                fill(NORD3);   
            }
            rectAt(j, i);
        }
    }
}

void mouseClicked() {
    graph[mouseY / blockHeight][mouseX / blockWidth] = fillValue;
}

void mouseDragged() {
    graph[mouseY / blockHeight][mouseX / blockWidth] = fillValue;
}

void keyPressed() {
    if (key == '1') {
        fillValue = WALL;
    } else if (key == '2') {
        fillValue = TARGET;
    } else if (key == '3') {
        fillValue = START;
    } else if (key == 'r') {
        setup();
    } else if (key == 'b') {
        for (int y = 0; y < N; y++) {
            for (int x = 0; x < N; x++) {
                if (graph[y][x] == START) {
                    bfs = new BFS(x, y);
                    break;
                }
            }
        }
        
    }
}

void rectAt(int x, int y) {
    rect(x * blockWidth, y * blockHeight, blockWidth, blockHeight);
}
