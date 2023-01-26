// Classe do bloco (unidade)

class Bloco {
  PMatrix3D matrix;
  float x, y, z;
  Face[] faces = new Face[6];

  Bloco(PMatrix3D m, float x, float y, float z) {
    
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;

    faces[0] = new Face(new PVector(0, 0, -1), colors[BCK]);
    faces[1] = new Face(new PVector(0, 0, 1), colors[FRT]);

    faces[2] = new Face(new PVector(0, -1, 0), colors[DWN]);
    faces[3] = new Face(new PVector(0, 1, 0), colors[UPP]);

    faces[4] = new Face(new PVector(-1, 0, 0), colors[RGT]);
    faces[5] = new Face(new PVector(1, 0, 0), colors[LFT]);
  }
  void show() {
    noFill();
    stroke(15);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix);
    box(1);
    for (Face face : faces) {
      face.show();
    }
    popMatrix();
  }

  void update(int x, int y, int z) {
    matrix.reset();
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void turnFacesZ(float a) {
    for (Face f : faces) {
      f.turnZ(a);
    }
  }
  void turnFacesX(float a) {
    for (Face f : faces) {
      f.turnX(a);
    }
  }
  void turnFacesY(float a) {
    for (Face f : faces) {
      f.turnY(a);
    }
  }
}
