void keyPressed() {
  
  if (keyCode == UP) {
    VELOCIDADE_Y+=1;
  }
  if (keyCode == DOWN) {
    VELOCIDADE_Y-=1;
  }
  if (keyCode == RIGHT) {
    VELOCIDADE_X+=1;
  }
  if (keyCode == LEFT) {
    VELOCIDADE_X-=1;
  }
  if (keyCode == ENTER) {
    adicionarProjetil(new PVector(0, POSICAO_INICIAL), NULL, new PVector(VELOCIDADE_X/10, VELOCIDADE_Y/10));
  }
  if (keyCode == BACKSPACE) {
    projeteis[quantiaDeProjeteis] = null;
    quantiaDeProjeteis--;
    if (quantiaDeProjeteis<0) {
      quantiaDeProjeteis = 0;
    }
    qtdRastro = 0;
    rastros = new float[QTD_MAX_RASTRO][2];
  }
  if(keyCode == 33){
    MASSA_PLANETA*=10;
  }
  if(keyCode == 155){
    MASSA_PLANETA*=2;
  }
  if(keyCode == 36){
    MASSA_PLANETA*=5;
  }
  if(keyCode == 127){
    MASSA_PLANETA/=2;
    if(MASSA_PLANETA<1) MASSA_PLANETA = 1;
  }
  if(keyCode == 35){
    MASSA_PLANETA/=5;
    if(MASSA_PLANETA<1) MASSA_PLANETA = 1;
  }
  if(keyCode == 34){
    MASSA_PLANETA/=10;
    if(MASSA_PLANETA<1) MASSA_PLANETA = 1;
  }
  
  if(keyCode == 46){
    MASSA_PLANETA+=100;
  }
  if(keyCode == 44){
    MASSA_PLANETA-=100;
    if(MASSA_PLANETA<1) MASSA_PLANETA = 1;
  }
}
void mouseClicked() {
  PVector posi = new PVector(mouseX - width/2, mouseY-height/2);
  adicionarProjetil(posi, NULL, new PVector(VELOCIDADE_X/10, VELOCIDADE_Y/10));
}

void adicionarProjetil(PVector pos, PVector ace, PVector vel) {
  int i = quantiaDeProjeteis;
  if (i>QTD_MAX_PROJ) return;
  projeteis[i] = new Corpo(pos, ace, vel, MASSA_PROJETIL, RAIO_PROJETIL, COR_FILL_PROJ, COR_STROKE_PROJ);
  quantiaDeProjeteis += 1;
  qtdRastro = 0;
  rastros = new float[QTD_MAX_RASTRO][2];
}
