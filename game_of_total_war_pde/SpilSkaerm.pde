class SpilSkaerm implements Skaerm {

  SkiftSkaermKnap tilStart = new SkiftSkaermKnap(15, 15, 30, 50, "Stop");
  boolean knapTrykket = false;
  boolean setupSkaerm = true;

  void display() {
    background(255);
    tilStart.visKnap();
    SB.SelectionBerber();
    SB.selectionRomer();
    
    for (int i = berberKavaleri.size()-1; i >= 0; i--) {
      BerberK BK = berberKavaleri.get(i);
      if(BK.hp <= 0){
        verden.removeBody(BK);
        berberKavaleri.remove(i);
      }
    }
    
    for (int i = romerKavaleri.size()-1; i >= 0; i--){
      RomerK RK = romerKavaleri.get(i);
      if(RK.hp <= 0){
        verden.removeBody(RK);
        romerKavaleri.remove(i);
      }
    }
    
  }

  void setupSkaerm() {
    if (setupSkaerm) {

      for (int i = 0; i < OH.antalBerberKavaleri(); i++) {
        berberKavaleri.add(new BerberK(
          berberVaerdier[0], 
          berberVaerdier[1], 
          berberVaerdier[2], 
          berberVaerdier[3], 
          round(random((width/2-10), (width/2+10))), 
          10
          ));

        BerberK BK = berberKavaleri.get(i);
        BK.setRestitution(1/BK.styrke);
        verden.add(BK);

        romerKavaleri.add(new RomerK(
          romerVaerdier[0], 
          romerVaerdier[1], 
          romerVaerdier[2], 
          romerVaerdier[3], 
          width/2, 
          height-25
          ));

        RomerK RK = romerKavaleri.get(i);
        BK.setRestitution(1/RK.styrke);
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
