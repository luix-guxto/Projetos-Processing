class Cobra {

  final int MAX_BODY;
  int size;
  int x;
  int y;
  PVector[] corpo;
  boolean canMove;
  boolean death;
  boolean visivel[];
  char dir;

  int delay;
  int speed;
  int spdUp;
  final int MIN_SPD;

  Cobra() {

    MAX_BODY = tabuleiro * tabuleiro;
    canMove = true;
    death = false;
    dir = 'u';
    delay = 0;
    speed = 11;
    MIN_SPD = 6;
    x = y = tabuleiro/2;
    size = 1;

    corpo = new PVector[MAX_BODY];
    visivel = new boolean[MAX_BODY];

    for (int i = 0; i< MAX_BODY; i++) {
      visivel[i] = false;
      corpo[i] = new PVector((tabuleiro / 2), (tabuleiro / 2) - 1);
    }

    for (int i = 0; i < size; i++) {
      visivel[i] = true;
    }
  }

  void virar(char mov) {
    if (!canMove) return;
    switch(dir) {
    case 'u':
      if (mov == 'd') return;
      break;
    case 'd':
      if (mov == 'u') return;
      break;
    case 'l':
      if (mov == 'r') return;
      break;
    case 'r':
      if (mov == 'l') return;
      break;
    }
    canMove = false;
    dir = mov;
  }

  void crescer() {
    spdUp++;
    size++;
    if (spdUp >= 10) {
      spdUp = 0;
      speed--;
      if (speed<MIN_SPD)speed = MIN_SPD;
    }
  }

  void morre() {
    death = true;
  }

  void atualizar() {
    delay++;
    if (delay >= speed && !death) {
      delay = 0;

      PVector[] antigo = new PVector[MAX_BODY];
      for (int i = 0; i< MAX_BODY; i++) {
        antigo[i] = new PVector(corpo[i].x, corpo[i].y);
      }
      corpo[0] = new PVector(x, y);
      canMove = true;
      switch(dir) {
      case 'u':

        y--;
        if (y < 0) {
          morre();
        }
        break;
      case 'd':

        y++;
        if (y > tabuleiro) {
          morre();
        }
        break;
      case 'l':
        x--;
        if (x < 0) {
          morre();
        }
        break;
      case 'r':

        x++;
        if (x > tabuleiro) {
          morre();
        }
        break;
      }


      for (int i = 1; i < MAX_BODY; i++) {
        if (corpo[i] != corpo[i-1]) {
          corpo[i] = new PVector(antigo[i-1].x, antigo[i-1].y);
        }
      }
      for (int i = 1; i < size; i++) {
        if (x == corpo[i].x && y == corpo[i].y) {
          morre();
        }
      }
    }
  }


  void show() {
    atualizar();
    for (int i = size - 1; i >= 0; i--) {
      fill(0, map(i, 0, size, 50, 255), map(i, 0, size, 255, 0));
      square(corpo[i].x * tamanho, corpo[i].y * tamanho, tamanho);
    }
    fill(0, 0, 255);
    square(x*tamanho, y*tamanho, tamanho);
    if (death) {
      background(0);
      fill(150, 0, 0);
      textSize(70);
      textAlign(CENTER);
      if (size<MAX_BODY) {
        text("You Death", width/2, 100);
      } else {
        fill(0, 150, 50);
        text("You Won!!!", width/2, 100);
      }
      textAlign(RIGHT);
      textSize(40);
      text("Size:"+size, width/2-40, 150);
      textAlign(CENTER);
      fill(150);
      text("PRESS ENTER TO TRY AGAIN", width/2, 400);
    }
  }
}
