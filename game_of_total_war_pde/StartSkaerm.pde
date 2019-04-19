class StartSkaerm implements Skaerm {
  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(width/2-100, 60, 30, 200, "Spil");
  boolean skiftSkaermKnapTrykket = false;

  SkiftSkaermKnap tilRomerHaer = new SkiftSkaermKnap(width/2-100, 94, 30, 98, "Romerhær");
  boolean skiftSkaermTilRomerTrykket = false;

  SkiftSkaermKnap tilBerberHaer = new SkiftSkaermKnap(width/2+2, 94, 30, 98, "Berberhær");
  boolean skiftSkaermTilBerberTrykket = false;

  SkiftSkaermKnap lukSpillet = new SkiftSkaermKnap(width/2-100, 128, 30, 200, "Luk spillet");
  boolean skiftSkaermLukSpilletTrykket = false;

  boolean setupSkaerm = true;


  void resetSkaerm() {  
    skiftSkaermKnapTrykket = false;
    skiftSkaermTilBerberTrykket = false;
    skiftSkaermTilRomerTrykket = false;
    skiftSkaermLukSpilletTrykket = false;
      setupSkaerm = true;
  }

  void display() {
    background(255);
    
    textSize(32);
    text("Berbere mod Romere", width/2, 40);
    textSize(12);
    
    tilSpil.visKnap();
    tilRomerHaer.visKnap();
    tilBerberHaer.visKnap();
    lukSpillet.visKnap();
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

      for (int i = romerKavaleri.size()-1; i>=0; i--) {
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
    if (skiftSkaermTilBerberTrykket) {
      SA.setBerberHaerSkaerm();
    }
    if (skiftSkaermLukSpilletTrykket){
      exit();
    }
  }

  void museKlik(int x, int y) {
    skiftSkaermKnapTrykket = tilSpil.musKlikkerPaaKnap(x, y);
    skiftSkaermTilRomerTrykket = tilRomerHaer.musKlikkerPaaKnap(x, y);
    skiftSkaermTilBerberTrykket = tilBerberHaer.musKlikkerPaaKnap(x, y);
    skiftSkaermLukSpilletTrykket = lukSpillet.musKlikkerPaaKnap(x,y);
  }
}
