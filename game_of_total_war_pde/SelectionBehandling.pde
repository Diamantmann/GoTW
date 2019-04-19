class SelectionBehandling {
  void SelectionBerber() {
    textAlign(RIGHT);
    switch(selectionB) {
    case 1:
      fill(0);
      text("Berber: Infanteri", width-10, 25);
      fill(255);
      break;
    case 2:
      fill(0);
      text("Berber: Kavaleri", width-10, 25);
      fill(255);
      break;
    case 3:
      fill(0);
      text("Berber: Bueskytte", width-10, 25);
      fill(255);
      break;
    }
    textAlign(CENTER);
  }
  void selectionRomer(){
    textAlign(RIGHT);
    switch(selectionR){
    case 1:
      fill(0);
      text("Romer: Infanteri", width-10, height-25);
      fill(255);
      break;
    case 2:
      fill(0);
      text("Romer: Kavaleri", width-10, height-25);
      fill(255);
      break;
    case 3:
      fill(0);
      text("Romer: Bueskytte", width-10, height-25);
      fill(255);
      break;
    }
    textAlign(CENTER);
  }
}
