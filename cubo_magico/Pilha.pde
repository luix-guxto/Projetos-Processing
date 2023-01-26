// estrutura de dados pilha

// pilha de string
class PilhaString {
  String[] pilha;
  int tamanhoPilha;
  int index;

  PilhaString() {
    tamanhoPilha = index = 0;
    pilha = new String[1];
  }

  PilhaString(String[] a) {
    tamanhoPilha = a.length;
    index = tamanhoPilha-1;
    pilha = a;
  }

  int tamanho() {
    return tamanhoPilha;
  }

  void add(String value) {
    tamanhoPilha++;
    index = tamanhoPilha-1;
    String[] antigo = pilha;
    pilha = new String[tamanhoPilha];
    for (int i = 0; i<antigo.length; i++) {
      pilha[i] = antigo[i];
    }
    pilha[index] = value;
  }
  String pop() {
    if (tamanhoPilha<1) {
      return"";
    }
    String value;
    value = pilha[index];

    tamanhoPilha--;
    index = tamanhoPilha-1;
    String[] antigo = pilha;
    pilha = new String[tamanhoPilha];
    for (int i = 0; i<antigo.length-1; i++) {
      pilha[i] = antigo[i];
    }
    return value;
  }
}

// pilha de boolean
class PilhaBool {

  boolean[] pilha;
  int tamanhoPilha;
  int index;

  PilhaBool() {
    tamanhoPilha = index = 0;
    pilha = new boolean[1];
  }

  PilhaBool(boolean[] a) {
    tamanhoPilha = a.length;
    index = tamanhoPilha-1;
    pilha = a;
  }

  int tamanho() {
    return tamanhoPilha;
  }

  void add(boolean value) {
    tamanhoPilha++;
    index = tamanhoPilha-1;
    boolean[] antigo = pilha;
    pilha = new boolean[tamanhoPilha];
    for (int i = 0; i<antigo.length; i++) {
      pilha[i] = antigo[i];
    }
    pilha[index] = value;
  }
  boolean pop() {
    if (tamanhoPilha<1) {
      return false;
    }
    boolean value;
    value = pilha[index];

    tamanhoPilha--;
    index = tamanhoPilha-1;
    boolean[] antigo = pilha;
    pilha = new boolean[tamanhoPilha];
    for (int i = 0; i<antigo.length-1; i++) {
      pilha[i] = antigo[i];
    }
    return value;
  }
}
