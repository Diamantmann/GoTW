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
    if (setupSkaerm) {
      clear();
      background(255);
      
      text("Vælg en berberhær!", width/2 , 20);

      for (int i = berberKavaleri.size()-1; i>=0; i--) {
        BerberK BK = berberKavaleri.get(i);
        verden.removeBody(BK);
        berberKavaleri.remove(i);
      }
      
      for (int i = romerKavaleri.size()-1; i>=0;i--){
        RomerK RK = romerKavaleri.get(i);
        verden.removeBody(RK);
        romerKavaleri.remove(i);
      }

      setupSkaerm = false;
    }
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
