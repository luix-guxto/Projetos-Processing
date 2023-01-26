import peasy.*;

final String density = "Ñ@#W$9876543210?!abc;:+=-,._⠀";



PImage  img;
PeasyCam cam;
void setup() {
  size(600, 600,P3D);
  cam = new PeasyCam(this, 0);
  img = loadImage("original.png");
}
boolean prin = true;
void draw() {
  background(0);
  int w = width / img.width;
  int h = height / img.height;
  img.loadPixels();
  String linha = "";
  for (int j = 0; j < img.height; j++) {
  for (int i = 0; i < img.width; i++) {
      int pixelIndex = i+j*img.width;
      color c = img.pixels[pixelIndex];
      int r = floor(red(c));
      int g = floor(green(c));
      int b = floor(green(c));
      
      int avg = floor(map((r+g+b), 0, 255*3, 0, 255));
      int len = density.length();
      int den = floor(map(avg, 0, 255, len, 0));
      if(den>=len){
        den = len-1;
      }else if(den<0){
      den = 0;
      }
      fill(c);
      box(w);
      textSize(w);
      textAlign(CENTER, CENTER);
      //text(density.charAt(den), (i+0.5)*w, (j+0.5+1)*h);
      linha+=density.charAt(den);
    }
    linha+="\n";
  }
  if(prin){
    prin = false;
    print(linha);
  }
}
