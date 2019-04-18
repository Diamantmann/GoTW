class BerberK extends FCircle {
  int hastighed, styrke, storrelse;
  int positionX=width/2, positionY=height/2;

  BerberK(int hastighed, int Styrke, int Storrelse, int x, int y) {
    super(Storrelse);
    storrelse = Storrelse;
    this.hastighed = hastighed;
    styrke = Styrke;
    //storrelse = Storrelse;

    setSize(storrelse);
    setPosition(x, y);
  }

  void marchBerberkavalri() {
    if (keyPressed == true) {
      if (key == CODED) {
        switch(keyCode) {
        case UP:
          setVelocity(0, -100);
          break;

        case DOWN:
          setVelocity(0, 100);
          break;

        case LEFT:
          setVelocity(-100, 0);
          break;

        case RIGHT:
          setVelocity(100, 0);
          break;
        }
      }
    }
  }
}
