void keyPressed() {
  if (key == '1') {
    selectionB = 1;
    println("selection: " + selectionB);
  } else if (key == '2') {
    selectionB = 2;
    println("selection: " + selectionB);
  } else if (key == '3') {
    selectionB = 3;
    println("selection: " + selectionB);
  }

  if (key == CODED) {
    if (keyCode == UP) {
      switch(selectionB) {
      case 1:
        break;
      case 2:
        for (int i = berberKavaleri.size()-1; i >= 0; i--) {
          BerberK BK = berberKavaleri.get(i);
          BK.addImpulse(0,-BK.hastighed*0.05);
        }
        break;
      case 3:
        break;
      }
    }
    if (keyCode == LEFT) {
      switch(selectionB) {
      case 1:
        break;
      case 2:
        for (int i = berberKavaleri.size()-1; i >= 0; i--) {
          BerberK BK = berberKavaleri.get(i);
          BK.addImpulse(-BK.hastighed*0.05,0);
        }
        break;
      case 3:
        break;
      }
    }
    if (keyCode == RIGHT) {
      switch(selectionB) {
      case 1:
        break;
      case 2:
        for (int i = berberKavaleri.size()-1; i >= 0; i--) {
          BerberK BK = berberKavaleri.get(i);
          BK.addImpulse(BK.hastighed*0.05,0);
        }
        break;
      case 3:
        break;
      }
    }
    if (keyCode == DOWN) {
      switch(selectionB) {
      case 1:
        break;
      case 2:
        for (int i = berberKavaleri.size()-1; i >= 0; i--) {
          BerberK BK = berberKavaleri.get(i);
          BK.addImpulse(0,BK.hastighed*0.05);
        }
        break;
      case 3:
        break;
      }
    }
  }
}
