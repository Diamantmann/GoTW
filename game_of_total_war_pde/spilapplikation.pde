class Spilapplikation {

  Skaerm skaerm;
  SpilSkaerm spilSkaerm = new SpilSkaerm();
  StartSkaerm startSkaerm = new StartSkaerm();
  
  void display(){
    skaerm.setupSkaerm();
    skaerm.display();
  }
  
  void opdater(){
    skaerm.opdater(SA);
  }
  
  void setSkaermStart(){
      startSkaerm.resetSkaerm();
      skaerm = startSkaerm;
  }
  
  void setSkaermSpil(){
    spilSkaerm.resetSkaerm();
    skaerm = spilSkaerm;
  }
  
  void museKlik(int x,int y){
    skaerm.museKlik(x,y);
  }
  
}
