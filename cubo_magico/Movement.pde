// classe que realiza movimentos atraves de uma string

class Movement {
  char[] move;
  int count = 0;
  boolean next = false;
  int time = 0;
  boolean canReturn;
  Movement(String move, boolean canReturn) {
    this.move = move.toCharArray();
    this.next();
    this.canReturn = canReturn;
  }

boolean hasNext(){
  return !(count<move.length);
}
  void update() {

    if (next) {
      time++;
      if (time>5) {
        time = 0;
        next = false;
        if (count<move.length) {
          move(move[count], true, canReturn);
          count++;
        }
      }
    }
  }

  boolean finish() {
    return count>=move.length || move[0]=='1';
  }

  void next() {
    next = true;
  }
}
