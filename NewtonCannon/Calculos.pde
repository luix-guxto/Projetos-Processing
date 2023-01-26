void aplicarColisao(Corpo p1, Corpo p2) {

    /////////////////////////////////////////////////

    double m1 = p1.massa;
    double m2 = p2.massa;

    double u1x = p1.vel.x;
    double u1y = p1.vel.y;
    double u2x = p2.vel.x;
    double u2y = p2.vel.y;

    double x1 = p1.pos.x;
    double y1 = p1.pos.y;
    double x2 = p2.pos.x;
    double y2 = p2.pos.y;

    double u1 = sqrt((float)(u1x*u1x + u1y*u1y));
    double u2 = sqrt((float)(u2x*u2x + u2y*u2y));

    ///////////////////////////////////////////////////

    double a1 = atan2((float)(y2-y1), (float)(x2-x1));
    double b1 = atan2((float)u1y, (float)u1x);
    double c1 = b1-a1;

    double a2 = atan2((float)(y1-y2), (float) (x1-x2));
    double b2 = atan2((float)u2y, (float)u2x);
    double c2 = b2-a2;

    double u12 = u1*cos((float)c1);
    double u11 = u1*sin((float)c1);

    double u21 = u2*cos((float)c2);
    double u22 = u2*sin((float)c2);

    double v12 = (((m1-m2)*u12) - (2*m2*u21))/(m1+m2);
    double v21 = (((m1-m2)*u21) + (2*m1*u12))/(m1+m2);

    double v1x = u11*(-sin((float)a1)) + v12*(cos((float)a1));
    double v1y = u11*(cos((float)a1)) + v12*(sin((float)a1));

    double v2x = u22*(-sin((float)a2)) - v21*(cos((float)a2));
    double v2y = u22*(cos((float)a2)) - v21*(sin((float)a2));

    //////////////////////////////////////////////////////////
    p1.vel.x = (float) v1x;
    p1.vel.y = (float) v1y;

    p2.vel.x = (float) v2x;
    p2.vel.y = (float) v2y;
  }

  double distanciaEntreDoisPontos(PVector a, PVector b) {

    return sqrt(pow(b.x-a.x, 2)+pow(b.y-a.y, 2));
  }
