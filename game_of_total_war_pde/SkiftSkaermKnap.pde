class SkiftSkaermKnap {

  //Klassens datatyper
  int x, y, h, b;
  String str;

  //SkiftSkaermKnap constructor
  SkiftSkaermKnap(int x, int y, int h, int b, String str) {
    this.x   = x;
    this.y   = y;
    this.h   = h;
    this.b   = b;
    this.str = str;
  }

  //Funktion til at vise skærmen.
  void visKnap() {
    fill(125);
    rect(x, y, b, h);
    fill(0);
    text(str, x+(b/2), y+(h/2));
    fill(0);
  }

  //Funktion der returnere hvorvidt musen, når den klikkes på, er inden for knappens rammer.
  boolean musKlikkerPaaKnap(int museKlikX, int museKlikY) {
    return (museKlikX < x+b) && (museKlikX > x) && (museKlikY < y+h) && (museKlikY > y);
  }
}
