class Corpo {
  double massa;
  double raio;
  PVector pos;
  PVector ace;
  PVector vel;
  PVector fil;
  PVector strok;

  Corpo(PVector pos,
    PVector ace,
    PVector vel,
    double massa,
    double raio,
    PVector fil,
    PVector strok) {
    this.massa = massa;
    this.raio = raio;
    this.pos = pos;
    this.ace = ace;
    this.vel = vel;
    this.fil = fil;
    this.strok = strok;
  }

  void show() {
    int cir = (int) (raio * 2);
    strokeWeight(cir/100);
    fill(fil.x, fil.y, fil.z);
    stroke(strok.x, strok.y, strok.z);
    ellipse(pos.x, pos.y, (float) raio, (float) raio);
  }

  void update(Corpo p) {
    PVectorD forca = new PVectorD(0, 0);
    double CONSTANTE_GRAVITACIONAL = 0.005;
    double CONSTANTE_RESTITUICAO = 0.9;

    double xProjetil = pos.x;
    double yProjetil = pos.y;
    double massaProjetil = massa;
    double raioProjetil = raio;

    double xPlaneta = p.pos.x;
    double yPlaneta = p.pos.y;
    double massaPlaneta = p.massa;
    double raioPlaneta = p.raio;

    double distancia = distanciaEntreDoisPontos(this.pos, p.pos);

    if (distancia < 1) {
      distancia = 1;
    }

    double produtoMassas = massaProjetil * massaPlaneta;
    double produtoDistancia = (distancia * distancia);

    double forcaGravitacional = CONSTANTE_GRAVITACIONAL*produtoMassas/produtoDistancia;

    double cos = (xPlaneta-xProjetil)/distancia;
    double sen = (yPlaneta-yProjetil)/distancia;

    forca.x = forcaGravitacional*cos;
    forca.y = forcaGravitacional*sen;

    ace.x =(float) (forca.x/massaProjetil);
    ace.y =(float) (forca.y/massaProjetil);

    vel.x += ace.x;
    vel.y += ace.y;

    pos.x += vel.x;
    pos.y += vel.y;

    if (distanciaEntreDoisPontos(p.pos, pos) < raioProjetil/2 + raioPlaneta/2) {
      pos.x =(float) xProjetil;
      pos.y =(float) yProjetil;

      vel.x *= CONSTANTE_RESTITUICAO;
      vel.y *= CONSTANTE_RESTITUICAO;

      aplicarColisao(p, this);
    }
  }
}
