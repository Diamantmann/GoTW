class BerberK extends FCircle{
  int hastighed, styrke, storrelse;
  int positionX=width/2,positionY=height/2;

  BerberK(int hastighed, int Styrke, int Storrelse, int x, int y){
    super(Storrelse);
    storrelse = Storrelse;
    this.hastighed = hastighed;
    styrke = Styrke;
    //storrelse = Storrelse;
    
    setSize(storrelse);
    setPosition(x, y);
  }
  
  void marchBerberkavalri(){
    setVelocity((positionX-getX())*(hastighed/100),(positionY-getY())*(hastighed/100));
    //setVelocity(random(-100,100),random(-100,100));
  }
  
}
