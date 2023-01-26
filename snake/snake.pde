int tamanho;
int tabuleiro;
Cobra player;
Maca maca;
void setup(){
  size(600,600);
  tabuleiro = width/30;
  tamanho = width/tabuleiro;
  player = new Cobra();
  maca = new Maca();
}

void draw(){
  background(255);
  tabuleiro();
  maca.show();
  player.show();
}
