import fisica.*;

FWorld verden;
FDistanceJoint FDJ;

int selection, pOIx, pOIy;

ArrayList<BerberK> berberKavalri;

void setup() {

  background(255, 255, 255);

  berberKavalri = new ArrayList<BerberK>();
  Fisica.init(this);

  verden = new FWorld();
  for (int i = 0; i < 10; i++) {
    berberKavalri.add(new BerberK(100, 10, 10, width/2, height/2));
    BerberK BK = berberKavalri.get(i);
    BK.setPosition(width/2, height/2);
    BK.setRestitution(0);

    verden.add(BK);
  }



  for (int i = berberKavalri.size()-1; i >= 0; i--) {
    BerberK BK1 = berberKavalri.get(i);
    for (int j = berberKavalri.size()-1; j>= 0; j--) {
      BerberK BK2 = berberKavalri.get(j);
      if (BK1 != BK2) {
        fill(255,255,255);
        FDJ = new FDistanceJoint(BK1, BK2);
        FDJ.setLength(15);
        FDJ.setFill(255,255,255,255);
        FDJ.setNoStroke();
        FDJ.setStroke(0);
        FDJ.setDrawable(false);
        FDJ.setDamping(10);
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

  switch(selection) {
  case 1:
    fill(0);
    text("Nuværende enhed: Infanteri", 10, 25);
    fill(255);
    break;
  case 2:
    fill(0);
    text("Nuværende enhed: Kavalri", 10, 25);
    fill(255);
    break;
  case 3:
    fill(0);
    text("Nuværende enhed: Artilleri", 10, 25);
    fill(255);
    break;
  }

  for (int i = berberKavalri.size()-1; i >= 0; i--) {
    BerberK BK = berberKavalri.get(i);
    BK.marchBerberkavalri();
  }

  verden.draw();
  verden.step();

  if (mousePressed) {
  }
}

//void contactEnded (FContact c) {
//  if (!c.getBody1().isStatic()) {
//    BerberK i = (BerberK)c.getBody1();
//    i.setFill(random(255), random(255), random(255));
//    println("berber");
//  }

//  if (!c.getBody2().isStatic()) {
//    BerberK f = (BerberK)c.getBody2();
//    f.setFill(random(255), random(255), random(255));
//  }
//}
