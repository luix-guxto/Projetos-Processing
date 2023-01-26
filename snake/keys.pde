void keyPressed() {
  switch(keyCode) {
  case UP:
  player.virar('u');
    break;
  case DOWN:
  player.virar('d');
    break;
  case LEFT:
  player.virar('l');
    break;
  case RIGHT:
  player.virar('r');
    break;
    case ENTER:
      if(player.death){
        player = new Cobra();
        maca = new Maca();
      }
    break;
  }
}
