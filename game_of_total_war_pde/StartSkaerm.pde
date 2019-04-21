//Klassen StartSkaerm implementere Skaerm.
class StartSkaerm implements Skaerm {

  //Knapper og booleans erklæres og initialiseres.
  SkiftSkaermKnap tilSpil = new SkiftSkaermKnap(width/2-100, 60, 30, 200, "Spil");
  boolean skiftSkaermKnapTrykket = false;

  SkiftSkaermKnap tilRomerHaer = new SkiftSkaermKnap(width/2-100, 94, 30, 98, "Romerhær");
  boolean skiftSkaermTilRomerTrykket = false;

  SkiftSkaermKnap tilBerberHaer = new SkiftSkaermKnap(width/2+2, 94, 30, 98, "Berberhær");
  boolean skiftSkaermTilBerberTrykket = false;

  SkiftSkaermKnap lukSpillet = new SkiftSkaermKnap(width/2-100, 128, 30, 200, "Luk spillet");
  boolean skiftSkaermLukSpilletTrykket = false;

  boolean setupSkaerm = true;

  //Dette køres inden setupSkaerm for at "resette" skærmen.
  void resetSkaerm() {  
    skiftSkaermKnapTrykket = false;
    skiftSkaermTilBerberTrykket = false;
    skiftSkaermTilRomerTrykket = false;
    skiftSkaermLukSpilletTrykket = false;
    setupSkaerm = true;
  }


  void display() {
    background(255);

    //Titlen skrives.
    textSize(32);
    text("Berbere mod Romere", width/2, 40);
    textSize(12);


    //Knapperne vises.
    tilSpil.visKnap();
    tilRomerHaer.visKnap();
    tilBerberHaer.visKnap();
    lukSpillet.visKnap();
  }

  //Køres, hvis setupSkaerm er sand. Virker ligesom 'void setup()'.
  void setupSkaerm() {
    if (setupSkaerm) {
      clear();
      background(255);

      //Fjerne alle enheder, hvis man starter spillet og går til menuen.
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

  //If-statements i dette, hvis deres respektive booleans er sande, vil sætte skærmen til noget andet.
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
    if (skiftSkaermLukSpilletTrykket) {
      exit();
    }
  }

  //Sætter boolean-værdierne til sande, hvis knapperne bliver trykket på.
  void museKlik(int x, int y) {
    skiftSkaermKnapTrykket = tilSpil.musKlikkerPaaKnap(x, y);
    skiftSkaermTilRomerTrykket = tilRomerHaer.musKlikkerPaaKnap(x, y);
    skiftSkaermTilBerberTrykket = tilBerberHaer.musKlikkerPaaKnap(x, y);
    skiftSkaermLukSpilletTrykket = lukSpillet.musKlikkerPaaKnap(x, y);
  }
}
