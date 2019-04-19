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

ArrayList<BerberK> berberKavaleri;
ArrayList<RomerK> romerKavaleri;

int maksBerberVaerdi = 20;
int maksRomerVaerdi = 20;
int nuvaerendeBerberVaerdi;
int nuvaerendeRomerVaerdi;

int[] romerVaerdier = new int[4];
int[] berberVaerdier = new int[4];

void setup() {
  textAlign(CENTER);
  background(255, 255, 255);
  BKI = loadImage("BKI.png");

  berberKavaleri = new ArrayList<BerberK>();
  romerKavaleri = new ArrayList<RomerK>();
  Fisica.init(this);

  verden = new FWorld();

  for (int i = 0; i < 4; i++) {
    romerVaerdier[i] = 5;
    berberVaerdier[i] = 5;
  }


  verden.setEdges();
  verden.setGravity(0, 0);
  size(1200, 800);
  //fullScreen();
  SA = new Spilapplikation();
  SB = new SelectionBehandling();
  SA.setSkaermStart();
}

void draw() {
  SA.display();
  SA.opdater();

  for (int i = berberKavaleri.size()-1; i >= 0; i--) {
    BerberK BK = berberKavaleri.get(i);
    if (selectionB == 2) {
      BK.marchBerberkavalri();
    }
    BK.setRotation(0);
  }
  for (int i = romerKavaleri.size()-1; i >= 0; i--) {
    RomerK RK = romerKavaleri.get(i);
    if (selectionR == 2) {
      RK.marchRomerKavaleri();
    }
  }
  verden.draw();
  verden.step();
}

void contactStarted (FContact c) {
  if (!c.getBody1().isStatic()) {
    BerberK i = (BerberK)c.getBody1();
    i.setFill(random(255), random(255), random(255));
  }

  if (!c.getBody2().isStatic()) {
    BerberK f = (BerberK)c.getBody2();
    f.setFill(random(255), random(255), random(255));
  }
}
