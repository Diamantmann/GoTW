class SkiftSkaermKnap {
  int x, y, h, b;
  String str;
  SkiftSkaermKnap(int x, int y, int h, int b, String str) {
    this.x   = x;
    this.y   = y;
    this.h   = h;
    this.b   = b;
    this.str = str;
  }

  void visKnap() {
    fill(125);
    rect(x, y, b, h);
    fill(0);
    text(str, h-y, b-x);
    fill(0);
  }

  boolean musKlikkerPaaKnap(int museKlikX, int museKlikY) {
    return (museKlikX < x+b) && (museKlikX > x) && (museKlikY < y+h) && (museKlikY > y);
  }
}
