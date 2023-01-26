void setup() {
  
  int wid = 1400;
  int hig = 700;
  println(wid+" "+hig);
  //fullScreen();
  size(1500,700);
  quantiaDeProjeteis = 0;
  projeteis = new Corpo[QTD_MAX_PROJ];
  rastros = new float[QTD_MAX_RASTRO][2];
  planeta = new Corpo(NULL,
    NULL,
    NULL,
    MASSA_PLANETA,
    RAIO_PLANETA,
    COR_FILL_PLANETA,
    COR_STROKE_PLANETA);
    
}

void draw() {
  background(0);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Velocidade X: "+VELOCIDADE_X/10 +", Y:"+VELOCIDADE_Y/10, width/2, 50);
  text("Massa da terra : "+MASSA_PLANETA, width/2, 100);
  translate(width/2, height/2);
  planeta.massa = MASSA_PLANETA;
  planeta.show();
  for (int i = 0; i<quantiaDeProjeteis; i++) {
    projeteis[i].update(planeta);
    planeta.pos.x = 0;
    planeta.pos.y = 0;
    projeteis[i].show();
  }
  stroke(0,150,0);
  fill(0,150,0);
  drawRastro();
  stroke(255);
   fill(255);
   if(quantiaDeProjeteis-1<0)return;
   double dist = distanciaEntreDoisPontos(projeteis[quantiaDeProjeteis-1].pos, planeta.pos);
   if(dist<0)dist*=-1;
   //println(dist);
   float mapa = map((float)dist, 0, 1000, 0, 10);
   strokeWeight(mapa/6);
   line(0,0,projeteis[quantiaDeProjeteis-1].pos.x,projeteis[quantiaDeProjeteis-1].pos.y);
}
