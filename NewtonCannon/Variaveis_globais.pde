
//-- PLANETA --\\
Corpo planeta;
double MASSA_PLANETA = 1000;
double RAIO_PLANETA = 150.0;
PVector COR_FILL_PLANETA = new PVector(0, 0, 255);
PVector COR_STROKE_PLANETA = new PVector(0, 255, 0);

//-- PROJETEIS --\\
Corpo[] projeteis;
int QTD_MAX_PROJ = 5000;
int quantiaDeProjeteis = 0;
double MASSA_PROJETIL = 1;
double RAIO_PROJETIL = 15;
PVector COR_FILL_PROJ = new PVector(100, 100, 100);
PVector COR_STROKE_PROJ = new PVector(0, 255, 255);

//-- UTIL --\\
int X = 0;
int Y = 1;
float VELOCIDADE_X = 0;
float VELOCIDADE_Y = 0;
int POSICAO_INICIAL = -132;
PVector NULL = new PVector(0, 0);
boolean full = false;

//-- RASTRO --\\
float[][] rastros;
int QTD_MAX_RASTRO = 120;
int qtdRastro = 0;
