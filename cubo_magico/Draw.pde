// Desenhar na tela

void draw() {
  background(255, 200, 200);
  scale(50);

  if (solved && movement.finish()) {
    background(200, 255, 200);
  }

  solved = solved();
  move.update();
  movement.update();


  for (int in = 0; in < rubik.length; in++) {
    push();

    if (move.z == rubik[in].z && abs(rubik[in].z)>0) {

      if (move.finished()) {
        movendo = false;
        movement.next();
        turnZ(move.z, move.dir);

        if (solved && !movendo && !primeiroMove) {
          lastKeyPressionada = new PilhaBool();
          lastSolved = new PilhaBool();
          lastMove = new PilhaString();
          primeiroMove = false;
        } else {
          primeiroMove = true;
        }
      } else {
        rotateZ(move.angle);
      }
    } else if (move.y == rubik[in].y && abs(rubik[in].y)>0) {
      if (move.finished()) {
        movendo = false;
        movement.next();
        turnY(move.y, -move.dir);
        if (solved && !movendo && !primeiroMove) {
          lastKeyPressionada = new PilhaBool();
          lastSolved = new PilhaBool();
          lastMove = new PilhaString();
          primeiroMove = false;
        } else {
          primeiroMove = true;
        }
      } else {
        rotateY(move.angle);
      }
    } else if (move.x == rubik[in].x && abs(rubik[in].x)>0) {
      if (move.finished()) {
        movendo = false;
        movement.next();

        turnX(move.x, move.dir);
        if (solved && !movendo && !primeiroMove) {
          lastKeyPressionada = new PilhaBool();
          lastSolved = new PilhaBool();
          lastMove = new PilhaString();
          primeiroMove = false;
        } else {
          primeiroMove = true;
        }
      } else {
        rotateX(move.angle);
      }
    }

    rubik[in].show();

    pop();
  }
}
