import fisica.*;

PImage BKI;

SelectionBehandling SB = new SelectionBehandling();
FWorld verden;
FDistanceJoint FDJ;

int selectionB, selectionR, pOIx, pOIy;

int antalBerberKavaleri, antalBerberBueskytter, antalBerberInfanteri;
int antalRomerKavaleri, antalRomerBueskytter, antalRomerInfanteri;

ArrayList<BerberK> berberKavaleri;
ArrayList<RomerK> romerKavaleri;

void setup() {
  frameRate(60);
  background(255, 255, 255);

  BKI = loadImage("BKI.png");

  berberKavaleri = new ArrayList<BerberK>();
  romerKavaleri = new ArrayList<RomerK>();
  Fisica.init(this);

  verden = new FWorld();
  for (int i = 0; i < 10; i++) {
    berberKavaleri.add(new BerberK(50, 10, 10, round(random((width/2-10),(width/2+10))),10));
    BerberK BK = berberKavaleri.get(i);
    //BK.setPosition(random((width/2-10),(width/2+10)), random((height/2-10),random(width/2+10)));
    BK.setRestitution(0);
    BK.attachImage(BKI);
    verden.add(BK);
    
    romerKavaleri.add(new RomerK(40,20,20, width/2,height-10,100));
    RomerK RK = romerKavaleri.get(i);
    BK.setRestitution(0);
    verden.add(RK);
  }



  for (int i = berberKavaleri.size()-1; i >= 0; i--) {
    BerberK BK1 = berberKavaleri.get(i);
    for (int j = berberKavaleri.size()-1; j>= 0; j--) {
      BerberK BK2 = berberKavaleri.get(j);
      if (BK1 != BK2) {
        //fill(255,255,255);
        FDJ = new FDistanceJoint(BK1, BK2);
        FDJ.setLength(15);
        FDJ.setFill(255,255,255,255);
        FDJ.setNoStroke();
        FDJ.setStroke(0);
        FDJ.setDrawable(false);
        FDJ.setDamping(100);
        verden.add(FDJ);
      }
    }
  }
  
  for(int i = romerKavaleri.size()-1; i >=0; i--){
    RomerK RK1 = romerKavaleri.get(i);
    for(int j = romerKavaleri.size()-1; j>=0; j--){
      RomerK RK2 = romerKavaleri.get(j);
      if(RK1 != RK2){
        FDJ = new FDistanceJoint(RK1, RK2);
        FDJ.setLength(15);
        FDJ.setFill(255,255,255,255);
        FDJ.setNoStroke();
        FDJ.setStroke(0);
        FDJ.setDrawable(false);
        FDJ.setDamping(100);
        verden.add(FDJ);
      }
    }
  }

  verden.setEdges();
  verden.setGravity(0, 0);
  size(500, 500);
  //fullScreen();
}

void draw() {
  background(255);

  SB.SelectionBerber();
  /*switch(selectionB) {
  case 1:
    fill(0);
    text("Nuværende enhed: Infanteri", 10, 25);
    fill(255);
    break;
  case 2:
    fill(0);
    text("Nuværende enhed: Kavaleri", 10, 25);
    fill(255);
    break;
  case 3:
    fill(0);
    text("Nuværende enhed: Bueskytte", 10, 25);
    fill(255);
    break;
  }*/

  for (int i = berberKavaleri.size()-1; i >= 0; i--) {
    BerberK BK = berberKavaleri.get(i);
    if(selectionB == 2){BK.marchBerberkavalri();}
    BK.setRotation(0);
  }

  verden.draw();
  verden.step();

  /*if (mousePressed) {
    for(int i = berberKavaleri.size()-1;i>=0;i--){
      BerberK BK = berberKavaleri.get(i);
      verden.removeBody(BK);
      berberKavaleri.remove(i);
    }
  }*/
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
