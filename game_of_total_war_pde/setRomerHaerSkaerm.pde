class SetRomerHaerSkaerm implements Skaerm {
  
  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(15, 15, 30, 50, "Tilbage");
  boolean tilbageTilStartSkaerm = false;
  
  boolean setupSkaerm = true;
  
  KnapTilHaer RKop = new KnapTilHaer(100, 100,"+");
  boolean knapRKop = false;
  
  KnapTilHaer RKned = new KnapTilHaer(130,100,"-");
  boolean knapRKned = false;
  
  void resetSkaerm(){
    setupSkaerm = true;
    tilbageTilStartSkaerm = false;
    knapRKop = false;
    knapRKned = false;
  }
  
  void setupSkaerm(){
  
  }
  
  void display(){
    RKop.visKnap();
    RKned.visKnap();
  }
  
  void opdater(Spilapplikation SA){
  if (knapRKop) {
      println("RKop sand");
      knapRKop = false;
    }
    if (knapRKned) {
      println("RKned sand");
      knapRKned = false;
    }
  }
  
  void museKlik(int x, int y){
    knapRKop = RKop.musKlikkerPaaKnap(x,y);
    knapRKned = RKned.musKlikkerPaaKnap(x,y);
  }
}
