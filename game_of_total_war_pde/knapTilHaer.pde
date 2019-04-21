class KnapTilHaer {

  //Datatyper til klassen erklæres
  int x, y;
  String str;

  //Constructoren opsættes.
  KnapTilHaer(int x, int y, String str) {
    this.x   = x;
    this.y   = y;
    this.str = str;
  }

  //Funktion til at vise knappen.
  void visKnap() {
    fill(255);
    rect(x, y, 15, 15);
    fill(0);
    text(str, x+7.5, y+7.5);
    fill(0);
  }

  //Funktion der returnere hvorvidt musen, når den klikkes på, er inden for knappens rammer.
  boolean musKlikkerPaaKnap(int museKlikX, int museKlikY) {
    return (museKlikX < x+15) && (museKlikX > x) && (museKlikY < y+15) && (museKlikY > y);
  }
}
