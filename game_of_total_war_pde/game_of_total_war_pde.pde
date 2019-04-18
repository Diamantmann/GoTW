import fisica.*;

PImage BKI;

Spilapplikation SA = new Spilapplikation();
SelectionBehandling SB = new SelectionBehandling();
FWorld verden;
FDistanceJoint FDJ;
OpretHaer OH;

int selectionB, selectionR, pOIx, pOIy;

int antalBerberKavaleri, antalBerberBueskytter, antalBerberInfanteri;
int antalRomerKavaleri, antalRomerBueskytter, antalRomerInfanteri;

ArrayList<BerberK> berberKavaleri;
ArrayList<RomerK> romerKavaleri;

void setup() {
  SA.setSkaermStart();
  background(255, 255, 255);
  BKI = loadImage("BKI.png");

  berberKavaleri = new ArrayList<BerberK>();
  romerKavaleri = new ArrayList<RomerK>();
  Fisica.init(this);

  verden = new FWorld();

  verden.setEdges();
  verden.setGravity(0, 0);
  size(500, 500);
  //fullScreen();
}

void draw() {
  SA.display();
  SA.opdater();

  SB.SelectionBerber();

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

//void contactEnded (FContact c) {
//  if (!c.getBody1().isStatic()) {
//    BerberK i = (BerberK)c.getBody1();
//    i.setFill(random(255), random(255), random(255));
//  }

//  if (!c.getBody2().isStatic()) {
//    BerberK f = (BerberK)c.getBody2();
//    f.setFill(random(255), random(255), random(255));
//  }
//}

/*if (mousePressed) {
 for(int i = berberKavaleri.size()-1;i>=0;i--){
 BerberK BK = berberKavaleri.get(i);
 verden.removeBody(BK);
 berberKavaleri.remove(i);
 }
 }*/
