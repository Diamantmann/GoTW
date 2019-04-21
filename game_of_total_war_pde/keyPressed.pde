void keyPressed() {
  //Berberselektion; sætter SB til 1, 2 eller 3 afhængigt af knappen.
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

  //Romerselection; sætter SR til 1, 2 eller 3 afhængigt af knappen.
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
