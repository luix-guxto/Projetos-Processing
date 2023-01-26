// funcoes de rotação dos cubos

void turnZ(int index, int dir) {
  for (int in = 0; in < rubik.length; in++) {
    Bloco bl = rubik[in];
    if (bl.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI*dir);
      matrix.translate(bl.x, bl.y);
      bl.update(round(matrix.m02), round(matrix.m12), round(bl.z));
      bl.turnFacesZ(HALF_PI * dir);
    }
  }
}

void turnX(int index, int dir) {
  for (int in = 0; in < rubik.length; in++) {
    Bloco bl = rubik[in];
    if (bl.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI*dir);
      matrix.translate(bl.y, bl.z);
      bl.update(round(bl.x), round(matrix.m02), round(matrix.m12));
      bl.turnFacesX(HALF_PI*dir);
    }
  }
}

void turnY(int index, int dir) {
  for (int in = 0; in < rubik.length; in++) {
    Bloco bl = rubik[in];
    if (bl.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI*dir);
      matrix.translate(bl.x, bl.z);
      bl.update( round(matrix.m02), round(bl.y), round(matrix.m12));
      bl.turnFacesY(HALF_PI*dir);
    }
  }
}
