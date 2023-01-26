// setup

void setup() {
  size(700, 700, P3D);
  cam = new PeasyCam(this, 300);

  rubik = new Bloco[dim*dim*dim];
  cuboInicial = new Bloco[dim*dim*dim];
  int index = 0;
  for (int x = -((dim-1)/2); x <= ((dim-1)/2); x++) {
    for (int y = -((dim-1)/2); y <= ((dim-1)/2); y++) {
      for (int z = -((dim-1)/2); z <= ((dim-1)/2); z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        rubik[index] = new Bloco(matrix, x, y, z);
        cuboInicial[index] = new Bloco(matrix, x, y, z);
        index++;
      }
    }
  }
  move = new Move(0, 1, 0, 1);
  movement = new Movement("1", false);
  lastKeyPressionada = new PilhaBool();
  lastSolved = new PilhaBool();
  lastMove = new PilhaString();
}
