// next      curr
//  0    <-   1     (01)
//  1    <-   1     (11)
//  1    <-   0     (10)
//
//  0 means dead
//  1 means live
class Game {
  private static final int LIVE_TO_DEAD = 1;
  private static final int LIVE_TO_LIVE = 3;
  private static final int DEAD_TO_LIVE = 2;

  private int[][] board;
  private int offset;
  private int size;
  private int n;

  public Game(int size, int n) {
    this.board = new int[n * 2][n * 2];
    this.offset = n / 2;
    this.size = size;
    this.n = n * 2;
  }

  public void update() {
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        int count = neighborCounts(i, j);
        boolean alive = board[i][j] == 1;
        if (alive && (count < 2 || count > 3)) {
          board[i][j] = LIVE_TO_DEAD;
        } else if (alive && (count >= 2 || count <= 3)) {
          board[i][j] = LIVE_TO_LIVE;
        } else if (!alive && count == 3) {
          board[i][j] = DEAD_TO_LIVE;
        }
      }
    }

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        board[i][j] = (board[i][j] >> 1) & 1;
      }
    }
  }
  
  public void draw() {
    stroke(p_overlay);
    for (int i = offset; i < n - offset; i++) {
      for (int j = offset; j < n - offset; j++) {
        if (board[i][j] == 1) {
          fill(p_gold);
        } else {
          noFill();
        }
        rect((i - offset) * size, (j - offset) * size, size, size);
      }
    }
  }

  public void add(int x, int y) {
    board[x / cellSize + offset][y / cellSize + offset] = 1;
  }

  private int neighborCounts(int i, int j) {
    int topRow = Math.max(0, i - 1);
    int topCol = Math.max(0, j - 1);
    int bottomRow = Math.min(i + 1, n - 1);
    int bottomCol = Math.min(j + 1, n - 1);

    int count = 0;

    for (int r = topRow; r <= bottomRow; r++) {
      for (int c = topCol; c <= bottomCol; c++) {
        count += board[r][c] & 1; 
      }
    }

    return count - (board[i][j] & 1);
  }
}
