class RomerK extends FCircle {

  //Datatyper til denne klasse.
  float hastighed, styrke, storrelse, hp;
  int positionX=width/2, positionY=height/2;

  //RomerK constructor
  RomerK(
    int hastighed, 
    int styrke, 
    int storrelse, 
    float hp, 
    int x, 
    int y
    ) {

    //RomerK arver fra klassen FCircle, og skal derfor have et input som FCircle.
    super(10);
    this.storrelse = storrelse;
    this.hastighed = hastighed;
    this.styrke = styrke;
    this.hp = hp;

    //Størrelsen og positionen sættes.
    setSize(storrelse);
    setPosition(x, y);
  }

  //Funktion der rykker romerne afhængigt af hvilen knap der trykkes på.
  void marchRomerKavaleri() {
    if (keyPressed == true) {
      switch(key) {
      case 'w':
        setVelocity(0, -10 * hastighed);
        break;

      case 's':
        setVelocity(0, 10 * hastighed);
        break;

      case 'a':
        setVelocity(-10 * hastighed, 0);
        break;

      case 'd':
        setVelocity(10 * hastighed, 0);
        break;
      }
    }
  }
}
