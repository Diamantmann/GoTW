class StartSkaerm implements Skaerm {

  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(width-60, height-40, 30, 50, "Spil");
  boolean knapTrykket = false;
  boolean setupSkaerm = true;

  void resetSkaerm() {  
    knapTrykket = false;
    setupSkaerm = true;
  }

  void display() {
    background(255);
    tilSpil.visKnap();
  }

  void setupSkaerm() {
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

  void opdater(Spilapplikation SA) {
    if (knapTrykket) {
      SA.setSkaermSpil();
    }
  }

  void museKlik(int x, int y) {
    knapTrykket = tilSpil.musKlikkerPaaKnap(x, y);
  }
}
