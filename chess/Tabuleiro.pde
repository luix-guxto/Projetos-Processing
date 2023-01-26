void tabuleiro(){
noStroke();
  int mudaCor = -1;
  for (int y = 0; y < 8; y++) {
    mudaCor++;
    for (int x = 0; x < 8; x++) {
      fill(255);
      if (mudaCor % 2 != 0) {
        fill(cor);
      }
      mudaCor++;
      square(x * tamanho, y * tamanho, tamanho);
    }
  }
}
