class RomerK extends FCircle {

  int hastighed, styrke, storrelse, hp;
  int positionX=width/2, positionY=height/2;

  RomerK(int hastighed, 
         int styrke, 
         int storrelse, 
         int x, 
         int y, 
         int hp){
           
    super(10);
    this.storrelse = storrelse;
    this.hastighed = hastighed;
    this.styrke = styrke;
    this.hp = hp;
    //storrelse = Storrelse;

    setSize(storrelse);
    setPosition(x, y);
  }

  void marchRomerKavaleri() {
    if (keyPressed == true) {
      switch(key) {
      case 'w':
        setVelocity(0, -100);
        break;

      case 's':
        setVelocity(0, 100);
        break;

      case 'a':
        setVelocity(-100, 0);
        break;

      case 'd':
        setVelocity(100, 0);
        break;
      }
    }
  }
}
