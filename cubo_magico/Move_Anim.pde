// animação do movimento

class Move {
  float angle = 0;
  int x;
  int y;
  int z;
  int dir;
  boolean moving, finish;
  static final float SPEED = 0.22;

  Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
    moving = finish = false;
  }
  void start() {
    moving = true;
  }

  boolean finished() {
    if (finish) {
      finish = false;
      return true;
    } else {
      return false;
    }
  }

  void update() {
    if (!moving)return;
    angle += dir * SPEED;
    if (abs(angle)>HALF_PI) {
      moving = false;
      finish = true;
      angle = 0;
    }
  }
}
