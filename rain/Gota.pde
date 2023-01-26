class Gota{
  float x, y, ySpeed, len;
  
  Gota(){
    x = random(5,width-10);
    y = random(-500,-10);
    ySpeed = random(4,10);
    len = random(5,25);
  }
  
  void fall(){
    y+=ySpeed;
    if(y>height){
      y = random(-200,-100);
    }
  }
  
  void show(){
    fall();
    strokeWeight(len/5);
    stroke(0,80,255);
    line(x,y,x,y+len);
  }
  
}
