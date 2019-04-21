//Klassen SetBerberHaerSkaerm implementere Skaerm.
class SetBerberHaerSkaerm implements Skaerm {

  // REFERENCER - TIL UDVIKLING AF PROGRAM 
  // int maksBerberVaerdi = 20;
  // int nuvaerendeBerberVaerdi;
  // int[] berberVaerdier = new int[4];

  //Her opsættes knapperne og booleanværdier erklæres og initialiseres.
  SkiftSkaermKnap tilMenuen = new SkiftSkaermKnap(width/2-90, 220, 30, 180, "Gem og tilbage");
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


  //Dette køres inden setupSkaerm for at "resette" skærmen.
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

  //Køres, hvis setupSkaerm er sand. Virker ligesom 'void setup()'. Der er dog intet, der skal sættes op kun én gang.
  void setupSkaerm() {
  }

  void display() {
    clear();
    background(255);

    //Udregner hvor mange point man har tilbage at tildele.
    nuvaerendeBerberVaerdi = berberVaerdier[0] + berberVaerdier[1] + berberVaerdier[2] + berberVaerdier[3];

    //Al tekst og alle knapper vises på skærmen.
    textSize(32);
    text("Vælg en berberhær!", width/2, 40);
    textSize(20);
    text("Kavaleriets egenskaber", width/2, 70);
    textSize(12);

    textAlign(LEFT);
    text("Point tilbage:", width/2 - 112, 200);
    text("Hastighed:", width/2 - 112, 90);
    text("Styrke:", width/2 - 112, 120);
    text("Størrelse:", width/2 - 112, 150);
    text("HP:", width/2 - 112, 180);
    text(berberVaerdier[0], width/2 + 70, 90);
    text(berberVaerdier[1], width/2 + 70, 120);
    text(berberVaerdier[2], width/2 + 70, 150);
    text(berberVaerdier[3]*10, width/2 + 70, 180);
    text(maksBerberVaerdi - nuvaerendeBerberVaerdi, width/2 + 70, 200);
    textAlign(CENTER);

    hastighedOp.visKnap();
    hastighedNed.visKnap();

    styrkeOp.visKnap();
    styrkeNed.visKnap();

    storrelseOp.visKnap();
    storrelseNed.visKnap();

    HPOp.visKnap();
    HPNed.visKnap();

    tilMenuen.visKnap();
  }

  //Mange if-statements der tjekker, hvorvidt en knap er blevet trykket på. Hvis knappen er en navigationsknap, sendes man til en anden skærm. Hvis det ikke er, tildeler eller fratager man point fra enhederne.
  //Der kan ikke tilegnes flere point end man har til rådighed og der kan ikke tages point fra, hvis værdien er på 1.
  void opdater(Spilapplikation SA) {
    if (tilbageTilStartSkaerm) {
      SA.setSkaermStart();
    }

    if (hastighedOpTrykket) {
      if (nuvaerendeBerberVaerdi < maksBerberVaerdi) {
        berberVaerdier[0]++;
        hastighedOpTrykket = false;
      } else {
      }
    }

    if (hastighedNedTrykket) {
      if (nuvaerendeBerberVaerdi > 0 && berberVaerdier[0] != 1) {
        berberVaerdier[0]--;
        hastighedNedTrykket = false;
      } else {
      }
    }

    if (styrkeOpTrykket) {
      if (nuvaerendeBerberVaerdi < maksBerberVaerdi) {
        berberVaerdier[1]++;
        styrkeOpTrykket = false;
      } else {
      }
    }

    if (styrkeNedTrykket) {
      if (nuvaerendeBerberVaerdi > 0 && berberVaerdier[1] != 1) {
        berberVaerdier[1]--;
        styrkeNedTrykket = false;
      } else {
      }
    }

    if (storrelseOpTrykket) {
      if (nuvaerendeBerberVaerdi < maksBerberVaerdi) {
        berberVaerdier[2]++;
        storrelseOpTrykket = false;
      } else {
      }
    }

    if (storrelseNedTrykket) {
      if (nuvaerendeBerberVaerdi > 0 && berberVaerdier[2] != 1) {
        berberVaerdier[2]--;
        storrelseNedTrykket = false;
      } else {
      }
    }

    if (HPOpTrykket) {
      if (nuvaerendeBerberVaerdi < maksBerberVaerdi ) {
        berberVaerdier[3]++;
        HPOpTrykket = false;
      } else {
      }
    }

    if (HPNedTrykket) {
      if (nuvaerendeBerberVaerdi > 0 && berberVaerdier[3] != 1) {
        berberVaerdier[3]--;
        HPNedTrykket = false;
      } else {
      }
    }
  }

  //Sætter boolean-værdierne til sande, hvis knapperne bliver trykket på.
  void museKlik(int x, int y) {
    hastighedOpTrykket = hastighedOp.musKlikkerPaaKnap(x, y);
    hastighedNedTrykket = hastighedNed.musKlikkerPaaKnap(x, y);

    styrkeOpTrykket = styrkeOp.musKlikkerPaaKnap(x, y);
    styrkeNedTrykket = styrkeNed.musKlikkerPaaKnap(x, y);

    storrelseOpTrykket = storrelseOp.musKlikkerPaaKnap(x, y);
    storrelseNedTrykket = storrelseNed.musKlikkerPaaKnap(x, y);

    HPOpTrykket = HPOp.musKlikkerPaaKnap(x, y);
    HPNedTrykket = HPNed.musKlikkerPaaKnap(x, y);

    tilbageTilStartSkaerm = tilMenuen.musKlikkerPaaKnap(x, y);
  }
}
