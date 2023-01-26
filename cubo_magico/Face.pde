// faces de cada bloco

class Face {

  PVector normal;
  color c;


  Face(PVector normal, color c) {
    this.normal = normal;
    this.c = c;
  }

  void turnZ(float a) {
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(a) - normal.y * sin(a));
    v2.y = round(normal.x * sin(a) + normal.y * cos(a));
    v2.z = round(normal.z);
    normal = v2;
  }

  void turnY(float a) {
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(a) - normal.z * sin(a));
    v2.z = round(normal.x * sin(a) + normal.z * cos(a));
    v2.y = round(normal.y);
    normal = v2;
  }

  void turnX(float a) {
    PVector v2 = new PVector();
    v2.y = round(normal.y * cos(a) - normal.z * sin(a));
    v2.z = round(normal.y * sin(a) + normal.z * cos(a));
    v2.x = round(normal.x);
    normal = v2;
  }

  void show() {
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    translate(0.5*normal.x, 0.5*normal.y, 0.5*normal.z);
    if (abs(normal.x)>0) {
      rotateY(HALF_PI);
    } else if (abs(normal.y)>0) {
      rotateX(HALF_PI);
    }
    square(0, 0, 1);
    popMatrix();
  }
}
