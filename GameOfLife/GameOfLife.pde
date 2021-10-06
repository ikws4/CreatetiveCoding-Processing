// imports {{{
import java.util.*;
// }}}

// rose-pine colorscheme {{{
final color p_base               = #232136;
final color p_surface            = #2a273f;
final color p_overlay            = #393552;
final color p_inactive           = #59546d;
final color p_subtle             = #817c9c;
final color p_text               = #e0def4;
final color p_love               = #eb6f92;
final color p_gold               = #f6c177;
final color p_rose               = #ea9a97;
final color p_pine               = #3e8fb0;
final color p_foam               = #9ccfd8;
final color p_iris               = #c4a7e7;
final color p_highlight          = #312f44;
final color p_highlight_inactive = #2a283d;
final color p_highlight_overlay  = #3f3c53;
// }}}

int topX = 0, topY = 0;

int n = 30;
int cellSize = 25;
boolean start = false;

Game game;

void settings() {
  size(n * cellSize, n * cellSize);
  pixelDensity(displayDensity());
  game = new Game(cellSize, n);

}

void setup() {
  frameRate(30);
}

void draw() {
  pushMatrix();
    translate(topX, topY);  

    if (start) {
      background(p_base);
      game.update();
    } else {
      background(p_surface);
      if (mousePressed) {
        game.add(mouseX, mouseY);
      }
    }
    game.draw();

  popMatrix();
}

void mouseDragged() {
  // topX += mouseX - pmouseX;
  // topY += mouseY - pmouseY;
}

void keyPressed() {
  if (key == ' ') {
    start = !start;
    if (start) {
      frameRate(10);
    } else {
      frameRate(30);
    }
  }
}
