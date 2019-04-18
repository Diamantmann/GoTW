class SetBerberHaerSkaerm implements Skaerm {
  
  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(15, 15, 30, 50, "Tilbage");
  boolean tilbageTilStartSkaerm = false;
  
  boolean setupSkaerm = true;
    
  KnapTilHaer BKop = new KnapTilHaer(100,100,"+");
  boolean knapBKop = false;
  
  KnapTilHaer BKned = new KnapTilHaer(130, 100,"-");
  boolean knapBKned = false;
  
  void resetSkaerm(){
    setupSkaerm = true;
    tilbageTilStartSkaerm = false;
    knapBKop = false;
    knapBKned = false;
  }
  
  void setupSkaerm(){
  if (setupSkaerm) {
      clear();
      background(255);
      

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
    BKop.visKnap();
    BKned.visKnap();
  }
  
  void opdater(Spilapplikation SA){
    if (knapBKop) {
      println("BKop sand");
      knapBKop = false;
    }
    if (knapBKned) {
      println("BKned sand");
      knapBKned = false;
    }
  }
  
  void museKlik(int x, int y){
    knapBKop = BKop.musKlikkerPaaKnap(x,y);
    knapBKned = BKned.musKlikkerPaaKnap(x,y);
  }
}
