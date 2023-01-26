int cols;
int rows;

float[][] current;
float[][] previous;
float dampening = 1;
void setup() {
  size(700, 700);
  cols = width;
  rows = height;

  previous = new float[cols][rows];
  current = new float[cols][rows];
}

void mousePressed() {
  int i = mouseX;
  int j = mouseY;
  if(i<=0||i>width-2||j<=0||j>height-2)return;
  previous[i][j] = 255;
  
  current[i][j] =
        (previous[i - 1][j] +
        previous[i + 1][j] +
        previous[i][j - 1] +
        previous[i][j + 1]) /
        2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
}
void keyPressed(){
  int i = width/2 -1;
  int j = height/2 -1;
  if(i<=0||i>width-2||j<=0||j>height-2)return;
  previous[i][j] = 255;
  
  current[i][j] =
        (previous[i - 1][j] +
        previous[i + 1][j] +
        previous[i][j - 1] +
        previous[i][j + 1]) /
        2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
}


void draw() {
  background(0);
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] =
        (previous[i - 1][j] +
        previous[i + 1][j] +
        previous[i][j - 1] +
        previous[i][j + 1]) /
        2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i+j*cols;
      pixels[index] = color(0, map(previous[i][j], 0, 1, 0, 100), map(current[i][j], 0, 1, 0, 255));
    }
  }
  updatePixels();

  float[][] temp = previous;
  previous = current;
  current=temp;
}
