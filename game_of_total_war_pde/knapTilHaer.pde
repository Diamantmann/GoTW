class KnapTilHaer {
  int x, y;
  String str;
  KnapTilHaer(int x, int y, String str) {
    this.x   = x;
    this.y   = y;
    this.str = str;
  }

  void visKnap() {
    fill(255);
    rect(x, y, 15, 15);
    fill(0);
    text(str, x+7.5, y+7.5);
    fill(0);
  }

  boolean musKlikkerPaaKnap(int museKlikX, int museKlikY) {
    return (museKlikX < x+15) && (museKlikX > x) && (museKlikY < y+15) && (museKlikY > y);
  }
}
