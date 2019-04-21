class BerberK extends FCircle {

  //Datatyper til denne klasse.
  float hastighed, styrke, storrelse, hp;
  int positionX=width/2, positionY=height/2;

  //BerberK constructor.
  BerberK(
    int hastighed, 
    int styrke, 
    int storrelse, 
    float hp, 
    int x, 
    int y
    ) {

    //Den arver fra FCircle klassen, og skal af den grund have en størrelse.
    super(storrelse);
    this.storrelse = storrelse;
    this.hastighed = hastighed;
    this.styrke = styrke;
    this.hp = hp;

    //Størrelsen og positionen sættes med disse kommandoer.
    setSize(storrelse);
    setPosition(x, y);
  }

  //Funktion der rykker berberne afhængigt af hvilen knap der trykkes på.
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
