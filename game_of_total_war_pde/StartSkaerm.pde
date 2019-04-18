class StartSkaerm implements Skaerm {

  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(300, 150, 30, 200, "Spil");
  boolean skiftSkaermKnapTrykket = false;
  
  SkiftSkaermKnap tilRomerHaer = new SkiftSkaermKnap(300,182,30,98,"Romerhær");
  boolean skiftSkaermTilRomerTrykket = false;
  
  SkiftSkaermKnap tilBerberHaer = new SkiftSkaermKnap(402,182,30,98,"Berberhær");
  boolean skiftSkaermTilBerberTrykket = false;
  
  boolean setupSkaerm = true;
  

  void resetSkaerm() {  
    skiftSkaermKnapTrykket = false;
    skiftSkaermTilBerberTrykket = false;
    skiftSkaermTilRomerTrykket = false;
    setupSkaerm = true;
  }

  void display() {
    background(255);
    tilSpil.visKnap();
    tilRomerHaer.visKnap();
    tilBerberHaer.visKnap();
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
    if (skiftSkaermKnapTrykket) {
      SA.setSkaermSpil();
    }
    if (skiftSkaermTilRomerTrykket) {
      SA.setRomerHaerSkaerm();
    }
    if (skiftSkaermTilBerberTrykket){
      SA.setBerberHaerSkaerm();
    }
  }

  void museKlik(int x, int y) {
    skiftSkaermKnapTrykket = tilSpil.musKlikkerPaaKnap(x, y);
    skiftSkaermTilRomerTrykket = tilRomerHaer.musKlikkerPaaKnap(x,y);
    skiftSkaermTilBerberTrykket = tilBerberHaer.musKlikkerPaaKnap(x,y);
  }
}
