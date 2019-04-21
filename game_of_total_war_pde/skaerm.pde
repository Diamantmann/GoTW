//Interface skaerm. Et interface er en kollektion af metoder/funktioner som klasser kan arve.
interface Skaerm {
  
  //Funktionerne sættes op her.
  void resetSkaerm();

  void setupSkaerm();

  void display();

  void opdater(Spilapplikation SA);

  void museKlik(int x, int y);
}
