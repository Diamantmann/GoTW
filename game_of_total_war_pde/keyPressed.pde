void keyPressed() {
  //Berberselektion
  if (key == '1') {
    selectionB = 1;
    println("Bselection: " + selectionB);
  } else if (key == '2') {
    selectionB = 2;
    println("Bselection: " + selectionB);
  } else if (key == '3') {
    selectionB = 3;
    println("Bselection: " + selectionB);
  }

  //Berber
  switch(key) {
  case 'q':
    selectionR = 1;
    break;
  case 'e':
    selectionR = 2;
    break;
  case 'r':
    selectionR = 3;
    break;
  }
}
