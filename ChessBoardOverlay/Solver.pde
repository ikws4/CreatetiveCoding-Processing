// vim:filetype=java

class Solver {
  private int[][] board;
  private int topRow;
  private int topCol;
  private int dRow;
  private int dCol;
  private int size;
  private int tileNumber;

  public Solver(int size, int dRow, int dCol) {
    this.board = new int[size][size];
    this.topRow = 0;
    this.topCol = 0;
    this.dRow = dRow;
    this.dCol = dCol;
    this.size = size;

    board[dRow][dCol] = 1;
    tileNumber = 2;
  }

  public void update() {
    solve(topRow, topCol, dRow, dCol, size);
  }

  private void solve(int topRow, int topCol, int dRow, int dCol, int size) {
    if (size <= 1) return;

    int tile = tileNumber++;
    int centerRow = topRow + size / 2;
    int centerCol = topCol + size / 2;

    // top left
    if (dRow < centerRow && dCol < centerCol) {
      solve(topRow, topCol, dRow, dCol, size / 2);
    } else {
      board[centerRow - 1][centerCol - 1] = tile;
      solve(topRow, topCol, centerRow - 1, centerCol - 1, size / 2);
    }

    // top right
    if (dRow < centerRow && dCol >= centerCol) {
      solve(topRow, centerCol, dRow, dCol, size / 2);
    } else {
      board[centerRow - 1][centerCol] = tile;
      solve(topRow, centerCol, centerRow - 1, centerCol, size / 2);
    }

    // bottom left
    if (dRow >= centerRow && dCol < centerCol) {
      solve(centerRow, topCol, dRow, dCol, size / 2);
    } else {
      board[centerRow][centerCol - 1] = tile;
      solve(centerRow, topCol, centerRow, centerCol - 1, size / 2);
    }

    // bottom right
    if (dRow >= centerRow && dCol >= centerCol) {
      solve(centerRow, centerCol, dRow, dCol, size / 2);
    } else {
      board[centerRow][centerCol] = tile;
      solve(centerRow, centerCol, centerRow, centerCol, size / 2);
    }
  }

  public void draw() {
    drawGrid();
  }

  private void drawGrid() {
    int size = width / board.length;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        float x = j * size;
        float y = i * size;

        int grey = (int) (board[i][j] * 1.0 / (tileNumber - 1) * 255);
        fill(0, grey);
        rect(x, y, size, size);

        fill(brightness(grey, grey, grey) > 130 ? 200 : 55);
        textSize(16);
        textAlign(CENTER, CENTER);
        text(board[i][j], x + size / 2, y + size / 2);
      }
    }
  }

  private double brightness(int r, int g, int b) {
    return Math.sqrt(0.241 * r * r + 0.691 * g * g + 0.068 * b * b);
  }
}
