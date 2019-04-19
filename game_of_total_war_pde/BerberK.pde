class BerberK extends FCircle {
  int hastighed, styrke, storrelse, hp;
  int positionX=width/2, positionY=height/2;

  BerberK(
    int hastighed, 
    int styrke, 
    int storrelse, 
    int hp, 
    int x, 
    int y
    ) {

    super(storrelse);
    this.storrelse = storrelse;
    this.hastighed = hastighed;
    this.styrke = styrke;
    this.hp = hp;

    setSize(storrelse);
    setPosition(x, y);
  }

  void marchBerberkavalri() {
    if (keyPressed == true) {
      if (key == CODED) {
        switch(keyCode) {
        case UP:
          setVelocity(0, -10 * hastighed);
          break;

        case DOWN:
          setVelocity(0, 10 * hastighed);
          break;

        case LEFT:
          setVelocity(-10 * hastighed, 0);
          break;

        case RIGHT:
          setVelocity(10 * hastighed, 0);
          break;
        }
      }
    }
  }
}
