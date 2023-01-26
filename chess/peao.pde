class Peao implements Peca {
  int x, y;
  boolean white, m;
  Peao(int x, int y, boolean white) {
    this.x = x;
    this.y = y;
    this.white = white;
    
  }
  void canMove() {
    m = true;
  }
  void move(int x, int y) {
    m = false;
    this.x = x;
    this.y = y;
  }
  void morrer() {
  }
  void show() {
    if (white) {
      image(wp, x * tamanho, y * tamanho, tamanho, tamanho);
    } else {
      image(bp, x * tamanho, y * tamanho, tamanho, tamanho);
    }
    
  }
}
