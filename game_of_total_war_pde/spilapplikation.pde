class Spilapplikation {

  Skaerm skaerm;
  SpilSkaerm spilSkaerm = new SpilSkaerm();
  StartSkaerm startSkaerm = new StartSkaerm();
  SetBerberHaerSkaerm berberSkaerm = new SetBerberHaerSkaerm();
  SetRomerHaerSkaerm romerSkaerm = new SetRomerHaerSkaerm();
  
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
  
  void setRomerHaerSkaerm(){
    romerSkaerm.resetSkaerm();
    skaerm = romerSkaerm;
  }
  
  void setBerberHaerSkaerm(){
    berberSkaerm.resetSkaerm();
    skaerm = berberSkaerm;
  }
  
  void museKlik(int x,int y){
    skaerm.museKlik(x,y);
  }
  
}
