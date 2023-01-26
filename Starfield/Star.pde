class Star{
  float x;
  float y;
  float z;
  
  float px;
  float py;
  
  Star(){
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    px = x;
     py = y;
  }
  
  void update(){
    z-=speed;
    if(z<=0){
      z = random(width);
    }
  }
  
  void show(){
    fill(0,0,255);
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, r, r);
    
    stroke(255,255,0);
    line(px, py, sx, sy);
    
  }
}
