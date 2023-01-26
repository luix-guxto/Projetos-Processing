Gota[] gotas;
int QTD_GOTAS = 1000;
void setup(){
  size(700,500);
  gotas = new Gota[QTD_GOTAS];
  for(int i = 0; i< QTD_GOTAS; i++){
    gotas[i] = new Gota();
  }
  
}

void draw(){
  background(0);
  for(Gota gota: gotas){
    gota.show();
  }
}
