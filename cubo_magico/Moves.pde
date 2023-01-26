// funcoes de movimentação

void retornar() {
  if (lastMove.tamanho() == 0) return;
  movendo = true;
  move(lastMove.pop().charAt(0), false, true);
  solved = lastSolved.pop();
  keyPressionada = lastKeyPressionada.pop();
}

void randomize() {

  if (!movement.finish())return;

  String sequencia = "";

  for (int i = 0; i<20; i++) {
    int r = int(random(allMoves.length));
    if (random(1)>0.5) {
      sequencia += allMoves[r];
    } else {
      sequencia += allMoves[r].toUpperCase();
    }
  }
  movement = new Movement(sequencia, false);
  solved = false;
}
void solve() {
  if (!movement.finish())return;
  if (solved) return;
  String moves = "";
  int tamanho = lastMove.tamanho();
  for (int i = 0; i<tamanho; i++) {
    moves += lastMove.pop();
    keyPressionada = lastKeyPressionada.pop();
    solved = lastSolved.pop();
  }
  movement = new Movement(moves, true);
}
void move(char code, boolean randomize, boolean returned) {
  if (!movement.finish() && !randomize)return;
  switch(code) {

    // z move
    // front
  case 'f':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);
      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, 0, 1, 1);
    move.start();
    break;
  case 'F':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);
      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, 0, 1, -1);
    move.start();
    break;
    //back
  case 't':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);
      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, 0, -1, -1);
    move.start();
    break;
  case 'T':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);
      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, 0, -1, 1);
    move.start();
    break;

    // x move
    // left
  case 'e':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(-1, 0, 0, -1);
    move.start();
    break;
  case 'E':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(-1, 0, 0, 1);
    move.start();
    break;
    //right
  case 'd':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(1, 0, 0, 1);
    move.start();
    break;
  case 'D':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(1, 0, 0, -1);
    move.start();
    break;

    // y move
    // up
  case 'c':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, -1, 0, -1);
    move.start();
    break;
  case 'C':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, -1, 0, 1);
    move.start();
    break;
    //down
  case 'b':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, 1, 0, 1);
    move.start();
    break;
  case 'B':
    if (!returned) {
      lastMove.add(invertCase(code));
      lastSolved.add(solved);
      lastKeyPressionada.add(keyPressionada);

      solved = false;
      keyPressionada = true;
    }
    movendo = true;
    move = new Move(0, 1, 0, -1);
    move.start();
    break;
  }
}
