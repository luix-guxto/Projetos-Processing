// Variaveis e imports

import peasy.*;
PeasyCam cam;
Move move;
PilhaString lastMove;
PilhaBool lastSolved;
PilhaBool lastKeyPressionada;
boolean keyPressionada = false;
boolean solved = true;
String[] allMoves = {"f", "t", "e", "d", "c", "b"};
Movement movement;
Bloco[] rubik, cuboInicial;
final int dim = 3;
int espera = 0;
boolean movendo = false;
boolean primeiroMove = true;
