int cols, rows;
int scl = 20;
int w = 3000;
int h = 3000;
float[][] terrain;
boolean up, left, rigth, down;

float fly = 0;
float flx = 0;
float spd = 0;
void setup() {
  size(600, 600, P3D);
  //fullScreen(P3D);
  cols = w / scl;
  rows = h / scl;

  terrain = new float[cols][rows];
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    spd-=0.01;
  }
  if (keyCode == ENTER) {
    spd+=0.01;
  }
  if (keyCode == LEFT) {
    if(left){left = false; return;}
    left = true;
    rigth = false;
  }
  if (keyCode == RIGHT) {
    if(rigth){rigth = false; return;}
    rigth = true;
    left = false;
  }
  if (keyCode == UP) {
    if(up){up = false; return;}
    up = true;
    down = false;
  }
  if (keyCode == DOWN) {
    if(down){down = false; return;}
    down = true;
    up = false;
  }
}

void draw() {



  if (spd<0)spd=0;
  if (spd>1)spd=1;
  
  
  if (left) {
    flx+=spd;
  }
  if (rigth) {
    flx-=spd;
  }
  if (down) {
    fly-=spd;
  }
  if (up) {
    fly+=spd;
  }
  float altt = map(mouseX, 0, width, -200, 200);
  float yoff = fly;
  for (int y = 0; y<rows; y++) {
    float xoff = flx;
    for (int x = 0; x<cols; x++) {
      float altura = map(noise(xoff, yoff), 0, 1, -altt, altt);
      terrain[x][y] = altura;
      xoff+= 0.1;
    }
    yoff+= 0.1;
  }

  background(0);
  textAlign(CENTER);
  textSize(20);
  text("Speed: "+spd, width/2, 50);
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y<rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x<cols; x++) {
      float z1 = terrain[x][y];
      float cor = map(z1,-200,200, 0, 255);
      stroke(0,cor,map(cor,0,255,255,0));
      vertex(x*scl, y*scl, terrain[x][y]);
      z1 = terrain[x][y+1];
      cor = map(z1,-200,200, 0, 255);
      stroke(0,cor,map(cor,0,255,255,0));
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      
    }
    endShape();
  }
}
