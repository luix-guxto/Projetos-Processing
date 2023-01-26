// utilidades

String toStingInverted(char[] c) {
  String inv = "";
  for (int i = c.length-1; i>=0; i--) {
    inv += invertCase(c[i]);
  }
  return inv;
}

String invertCase(char c) {
  String inv = ""+c;
  if (inv.equals(inv.toUpperCase())) {
    return inv.toLowerCase();
  } else {
    return inv.toUpperCase();
  }
}
String invertString(String[] s) {
  String value = "";

  for (int i = (s.length-1); i >= 0; i--) {
    value+=s[i];
  }

  return value;
}

boolean solved() {
  for (int i = 0; i < rubik.length; i++) {
    for ( int j = 0; j<rubik[i].faces.length; j++ ) {
      if (rubik[i].faces[j].normal.x != cuboInicial[i].faces[j].normal.x
        ||rubik[i].faces[j].normal.y != cuboInicial[i].faces[j].normal.y
        ||rubik[i].faces[j].normal.z != cuboInicial[i].faces[j].normal.z) {
          println("i: "+i+", j: "+j);
        println("X:"+rubik[i].faces[j].normal.x+", "+cuboInicial[i].faces[j].normal.x);
        println("Y:"+rubik[i].faces[j].normal.y+", "+cuboInicial[i].faces[j].normal.y);
        println("Z:"+rubik[i].faces[j].normal.z+", "+cuboInicial[i].faces[j].normal.z);
        return false;
      }
    }
  }
  return true;
}
