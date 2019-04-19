class SpilSkaerm implements Skaerm {

  SkiftSkaermKnap tilStart = new SkiftSkaermKnap(15, 15, 30, 50, "Stop");
  boolean knapTrykket = false;
  boolean setupSkaerm = true;

  void display() {
    background(255);
    tilStart.visKnap();
    SB.SelectionBerber();
  }

  void setupSkaerm() {
    if (setupSkaerm) {

      for (int i = 0; i < OH.antalBerberKavaleri(); i++) {
        berberKavaleri.add(new BerberK(
          berberVaerdier[0], 
          10, 
          10, 
          100, 
          round(random((width/2-10), (width/2+10))), 
          10
          ));

        BerberK BK = berberKavaleri.get(i);
        BK.setRestitution(0.25);
        verden.add(BK);

        romerKavaleri.add(new RomerK(
          romerVaerdier[0], 
          20, 
          20, 
          100, 
          width/2, 
          height-25
          ));

        RomerK RK = romerKavaleri.get(i);
        BK.setRestitution(0.25);
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
            FDJ.setFill(255, 255, 255, 255);
            FDJ.setNoStroke();
            FDJ.setStroke(0);
            FDJ.setDrawable(false);
            FDJ.setDamping(100);
            verden.add(FDJ);
          }
        }
      }

      for (int i = romerKavaleri.size()-1; i >=0; i--) {
        RomerK RK1 = romerKavaleri.get(i);
        for (int j = romerKavaleri.size()-1; j>=0; j--) {
          RomerK RK2 = romerKavaleri.get(j);
          if (RK1 != RK2) {
            FDJ = new FDistanceJoint(RK1, RK2);
            FDJ.setLength(15);
            FDJ.setFill(255, 255, 255, 255);
            FDJ.setNoStroke();
            FDJ.setStroke(0);
            FDJ.setDrawable(false);
            FDJ.setDamping(100);
            verden.add(FDJ);
          }
        }
      }
      setupSkaerm = false;
    }
  }

  void resetSkaerm() {
    knapTrykket = false;
    setupSkaerm = true;
  }

  void opdater(Spilapplikation SA) {
    if (knapTrykket) {
      SA.setSkaermStart();
    }
  }

  void museKlik(int x, int y) {
    knapTrykket = tilStart.musKlikkerPaaKnap(x, y);
  }
}
