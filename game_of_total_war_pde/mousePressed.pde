void mousePressed() {
  pOIx = mouseX;
  pOIy = mouseY;
  switch(selection) {
  case 1: 
 
    break;
  case 2:
    for (int i = berberKavalri.size()-1; i >= 0; i--) {
      BerberK BK = berberKavalri.get(i);
      BK.positionX=pOIx;
      BK.positionY=pOIy;
    }
    break;
  case 3:
    println("lol3");
    break;
  }
}
