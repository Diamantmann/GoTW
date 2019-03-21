void keyPressed() {
  if (key == 'q' || key == 'Q') {
    selection = 1;
    println("selection: " + selection);
  } else if (key == 'w' || key == 'W') {
    selection = 2;
    println("selection: " + selection);
  } else if (key == 'e' || key == 'E') {
    selection = 3;
    println("selection: " + selection);
  }
}
