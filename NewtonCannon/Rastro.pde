void updateRastro() {
  if (quantiaDeProjeteis == 0)return;
  int indiceProjetil = quantiaDeProjeteis-1;
  if (qtdRastro == 0) {
    rastros[qtdRastro][X] = projeteis[indiceProjetil].pos.x;
    rastros[qtdRastro][Y] = projeteis[indiceProjetil].pos.y;
    qtdRastro+=1;
    return;
  }
  for ( int i = 0; i< qtdRastro; i++) {
    if (rastros[i+1][Y] == 0 && rastros[i+1][Y] == 0) {
      i=qtdRastro;
      break;
    }
    rastros[i][X] = rastros[i+1][X];
    rastros[i][Y] = rastros[i+1][Y];
  }
  rastros[qtdRastro][X] = projeteis[indiceProjetil].pos.x;
  rastros[qtdRastro][Y] = projeteis[indiceProjetil].pos.y;
  if (qtdRastro < QTD_MAX_RASTRO-1)
  {
    qtdRastro = qtdRastro + 1;
  }
}

void drawRastro() {
  updateRastro();
  for (int i = 0; i<qtdRastro-1; i++) {
    float raio = map(i, 0, qtdRastro, 0, (float)RAIO_PROJETIL);

    strokeWeight(raio);
    float atualX = rastros[i][X];
    float atualY = rastros[i][Y];

    float proxX = rastros[i+1][X];
    float proxY  = rastros[i+1][Y];
    
    double distancia = distanciaEntreDoisPontos(new PVector(atualX, atualY), new PVector(proxX, proxY));
      float g = map((float)distancia, 5, 20, 0,150);
      float mapa = map((float)distancia, 0, 20, 100,255);
    fill(mapa, g, 0);
    stroke(mapa, g, 0);
    line(atualX, atualY, proxX, proxY);
    
  }
  
}
