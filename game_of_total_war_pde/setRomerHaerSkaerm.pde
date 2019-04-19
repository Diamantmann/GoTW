class SetRomerHaerSkaerm implements Skaerm {

  // REFERENCER - TIL UDVIKLING AF PROGRAM
  // int[] romerVaerdier = new int[4];
  // int nuvaerendeRomerVaerdi;
  // int maksRomerVaerdi = 20;


  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(15, 15, 30, 50, "Tilbage");
  boolean tilbageTilStartSkaerm = false;

  KnapTilHaer hastighedOp = new KnapTilHaer(width/2-15, 80, "+");
  KnapTilHaer hastighedNed = new KnapTilHaer(width/2+15, 80, "-");
  boolean hastighedOpTrykket = false;
  boolean hastighedNedTrykket = false;

  KnapTilHaer styrkeOp = new KnapTilHaer(width/2-15, 110, "+");
  KnapTilHaer styrkeNed = new KnapTilHaer(width/2+15, 110, "-");
  boolean styrkeOpTrykket = false;
  boolean styrkeNedTrykket = false;

  KnapTilHaer storrelseOp = new KnapTilHaer(width/2-15, 140, "+");
  KnapTilHaer storrelseNed = new KnapTilHaer(width/2+15, 140, "-");
  boolean storrelseOpTrykket = false;
  boolean storrelseNedTrykket = false;

  KnapTilHaer HPOp = new KnapTilHaer(width/2-15, 170, "+");
  KnapTilHaer HPNed = new KnapTilHaer(width/2+15, 170, "-");
  boolean HPOpTrykket = false;
  boolean HPNedTrykket = false;

  boolean setupSkaerm = true;

  void resetSkaerm() {
    setupSkaerm = true;

    hastighedOpTrykket = false;
    hastighedNedTrykket = false;

    styrkeOpTrykket = false;
    styrkeNedTrykket = false;

    storrelseOpTrykket = false;
    storrelseNedTrykket = false;

    HPOpTrykket = false;
    HPNedTrykket = false;

    tilbageTilStartSkaerm = false;
  }

  void setupSkaerm() {
    if (setupSkaerm) {
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

  void display() {
    clear();
    background(255);

    nuvaerendeRomerVaerdi = romerVaerdier[0] + romerVaerdier[1] + romerVaerdier[2] + romerVaerdier[3];

    textSize(32);
    text("Vælg en romerhær!", width/2, 40);
    textSize(20);
    text("Kavaleriets egenskaber", width/2, 70);
    textSize(12);

    textAlign(LEFT);
    text("Point tilbage:", width/2 - 112, 200);
    text("Hastighed:", width/2 - 112, 90);
    text("Styrke:", width/2 - 112, 120);
    text("Størrelse:", width/2 - 112, 150);
    text("HP:", width/2 - 112, 180);
    text(romerVaerdier[0], width/2 + 70, 90);
    text(romerVaerdier[1], width/2 + 70, 120);
    text(romerVaerdier[2], width/2 + 70, 150);
    text(romerVaerdier[3], width/2 + 70, 180);
    text(20 - nuvaerendeRomerVaerdi, width/2 + 70, 200);
    textAlign(CENTER);

    hastighedOp.visKnap();
    hastighedNed.visKnap();

    styrkeOp.visKnap();
    styrkeNed.visKnap();

    storrelseOp.visKnap();
    storrelseNed.visKnap();

    HPOp.visKnap();
    HPNed.visKnap();
  }

  void opdater(Spilapplikation SA) {
    if(hastighedOpTrykket){
      if(nuvaerendeRomerVaerdi < 20){
        romerVaerdier[0]++;
        hastighedOpTrykket = false;
      } else {}
    }
    
    if(hastighedNedTrykket){
      if(nuvaerendeRomerVaerdi > 0 && romerVaerdier[0] != 1){
        romerVaerdier[0]--;
        hastighedNedTrykket = false;
      } else {}
    }
    
    if(styrkeOpTrykket){
      if(nuvaerendeRomerVaerdi < 20){
        romerVaerdier[1]++;
        styrkeOpTrykket = false;
      } else {}
    }
    
    if(styrkeNedTrykket){
      if(nuvaerendeRomerVaerdi > 0 && romerVaerdier[1] != 1){
        romerVaerdier[1]--;
        styrkeNedTrykket = false;
      } else {}
    }
    
    if(storrelseOpTrykket){
      if(nuvaerendeRomerVaerdi < 20){
        romerVaerdier[2]++;
        storrelseOpTrykket = false;
      } else {}
    }
    
    if(storrelseNedTrykket){
      if(nuvaerendeRomerVaerdi > 0 && romerVaerdier[2] != 1){
        romerVaerdier[2]--;
        storrelseNedTrykket = false;
      } else {}
    }
    
    if(HPOpTrykket){
      if(nuvaerendeRomerVaerdi < 20 ){
        romerVaerdier[3]++;
        HPOpTrykket = false;
      } else {}
    }
    
    if(HPNedTrykket){
      if(nuvaerendeRomerVaerdi > 0 && romerVaerdier[3] != 1){
        romerVaerdier[3]--;
        HPNedTrykket = false;
      } else {}
    }
  }

  void museKlik(int x, int y) {
    hastighedOpTrykket = hastighedOp.musKlikkerPaaKnap(x,y);
    hastighedNedTrykket = hastighedNed.musKlikkerPaaKnap(x,y);

    styrkeOpTrykket = styrkeOp.musKlikkerPaaKnap(x,y);
    styrkeNedTrykket = styrkeNed.musKlikkerPaaKnap(x,y);

    storrelseOpTrykket = storrelseOp.musKlikkerPaaKnap(x,y);
    storrelseNedTrykket = storrelseNed.musKlikkerPaaKnap(x,y);

    HPOpTrykket = HPOp.musKlikkerPaaKnap(x,y);
    HPNedTrykket = HPNed.musKlikkerPaaKnap(x,y);
  }
}
