void tabuleiro() {
  fill(0);
  stroke(0);
  for (int y = 0; y < tabuleiro; y++) {
    line(0, y*tamanho, width, y* tamanho);
    
  }
  for (int x = 0; x < tabuleiro; x++) {
      line(x * tamanho, 0, x * tamanho, height);
    }
}
