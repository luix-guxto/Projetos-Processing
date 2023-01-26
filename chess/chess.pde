final int tela = 600;
final int tamanho = tela/8;
final color cor = color(160, 160, 255);
PImage wp, bp;
Peao peao = new Peao(0,0,true);
void setup() {
  size(600, 600);
  wp = loadImage("/pecas/wp.png");
  bp = loadImage("/pecas/bp.png");
}
void mousePressed(){
  if(mouseX/tamanho == peao.x && mouseY/tamanho == peao.y){
    peao.canMove();
  }
}
void mouseReleased(){
  if(!peao.m) return;
  peao.move(mouseX/tamanho, mouseY/tamanho);
}

void draw() {
  background(0);
  tabuleiro();
  peao.show();
}
