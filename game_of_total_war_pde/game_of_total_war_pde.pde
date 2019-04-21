//Game of Total War, version 0.1
//Lavet af Christian B. og Oliver H.

//Her importeres Fisica, en wrapper over box2d til processing. Dette ligger grundlaget for spillet.
import fisica.*;

//Grafik til fremtidigt brug.
PImage BKI;

//Klasserne Spilappklikation og SelectionBehandling erklæres.
Spilapplikation SA;
SelectionBehandling SB;

//Fisica-klasserne erklæres også her. FWorld er nødvendigt for overhovedet at kunne manipulere med fisica-fysik og objekter. FDistanceJoint er til gruppeformationer til selve spillet.
FWorld verden;
FDistanceJoint FDJ;

//Klassen OpretHaer er for at holde på nogle værdier. Erklæres her. Når der er flere typer af enheder, kan man vælge hvor mange af hver enhed man vil have.
OpretHaer OH = new OpretHaer(5, 5);

//Integerne herunder erklæres. B = Berber, R = Romer
int selectionB, selectionR;

//Integer herunder erklæres.
int antalBerberKavaleri, antalBerberBueskytter, antalBerberInfanteri;
int antalRomerKavaleri, antalRomerBueskytter, antalRomerInfanteri;

//Arraylist med BerberK klassen og klassen RomerK erklæres.
ArrayList<BerberK> berberKavaleri;
ArrayList<RomerK> romerKavaleri;

//Integer erklæres; disse integerværdier definerer hvor mange point der kan tildeles.
int maksBerberVaerdi = 32;
int maksRomerVaerdi = 32;
int nuvaerendeBerberVaerdi;
int nuvaerendeRomerVaerdi;

//Integerarray med romer- og berberværdier.
int[] romerVaerdier = new int[4];
int[] berberVaerdier = new int[4];

// I setup initialiseres nogle arraylister og FisicaVerdenen.
void setup() {
  textAlign(CENTER);
  background(255, 255, 255);
  BKI = loadImage("BKI.png");

  berberKavaleri = new ArrayList<BerberK>();
  romerKavaleri = new ArrayList<RomerK>();
  Fisica.init(this);

  verden = new FWorld();

  //Arrayets 4 værdi bliver sat til en fjerdedel af maksværdierne
  for (int i = 0; i < 4; i++) {
    romerVaerdier[i] = maksRomerVaerdi/4;
    berberVaerdier[i] = maksBerberVaerdi/4;
  }

  //Fisica-verdenen får kanter og tyngdekraften sættes til 0.
  verden.setEdges();
  verden.setGravity(0, 0);

  //Her kan man sætte størrelsen af vinduet.
  size(1200, 800);
  //fullScreen();

  //Objekter initialiseres.
  SA = new Spilapplikation();
  SB = new SelectionBehandling();
  SA.setSkaermStart();
}

void draw() {
  //Skærmapplikationens display og opdater kommandoer køres.
  SA.display();
  SA.opdater();

  //Berberhæren rykkes hvis man har valgt kavalriet.
  for (int i = berberKavaleri.size()-1; i >= 0; i--) {
    BerberK BK = berberKavaleri.get(i);
    if (selectionB == 2) {
      BK.marchBerberkavalri();
    }
    BK.setRotation(0);
  }

  //Romerhæren rykkes hvis man har valgt kavalriet.
  for (int i = romerKavaleri.size()-1; i >= 0; i--) {
    RomerK RK = romerKavaleri.get(i);
    if (selectionR == 2) {
      RK.marchRomerKavaleri();
    }
  }

  //To nedenstående kommandoer er meget vigtige, da den ene køre al fysikken igennem, og den anden viser dette i processing.
  verden.draw();
  verden.step();
}

//Til når de to kavalerienheder tørner sammen, vil den udregne skaden de hvert især gør.
void contactStarted (FContact c) {
  for (int i = berberKavaleri.size()-1; i >= 0; i--) {
    BerberK BK = berberKavaleri.get(i);
    for (int j = romerKavaleri.size()-1; j >= 0; j--) {
      RomerK RK = romerKavaleri.get(i);
      if (c.getBody1() == BK && c.getBody2() == RK || c.getBody1() == RK && c.getBody2() == BK) 
      {
        float skadePaaRomer = (sqrt(pow(BK.getVelocityX(), 2)+pow(BK.getVelocityY(), 2))*BK.styrke)/10;
        float skadePaaBerber = (sqrt(pow(RK.getVelocityX(), 2)+pow(RK.getVelocityY(), 2))*RK.styrke)/10;

        RK.hp = RK.hp - skadePaaRomer;
        BK.hp = BK.hp - skadePaaBerber;
      }
    }
  }
}

//if (!c.getBody1().isStatic()) {
//    println("hej");
//    BerberK i = (BerberK)c.getBody1();
//    i.removeFromWorld();
//  }

//  if (!c.getBody2().isStatic()) {
//    println("hej");
//    RomerK f = (RomerK)c.getBody2();
//    f.removeFromWorld();
