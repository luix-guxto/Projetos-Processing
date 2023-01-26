class Maca {
  int x;
  int y;

  Maca() {
    x = floor(random(0, tabuleiro));
    y = floor(random(0, tabuleiro));
  }

  void atualizar() {
    if (player.x == x && player.y == y) {
      player.crescer();
      x = floor(random(0, tabuleiro));
      y = floor(random(0, tabuleiro));
    }
  }
  
  void show(){
    atualizar();
    fill(255,0,0);
    square(x*tamanho, y*tamanho, tamanho);
  }
}
