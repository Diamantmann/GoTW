//Klassen spilapplikation.
class Spilapplikation {

  //Der skabes et interface skaerm, hvoraf de andre skærme kan arve fra.
  Skaerm skaerm;
  SpilSkaerm spilSkaerm = new SpilSkaerm();
  StartSkaerm startSkaerm = new StartSkaerm();
  SetBerberHaerSkaerm berberSkaerm = new SetBerberHaerSkaerm();
  SetRomerHaerSkaerm romerSkaerm = new SetRomerHaerSkaerm();

  //Spilapplikationenes funktioner.
  void display() {
    skaerm.setupSkaerm();
    skaerm.display();
  }

  void opdater() {
    skaerm.opdater(SA);
  }

  void setSkaermStart() {
    startSkaerm.resetSkaerm();
    skaerm = startSkaerm;
  }

  void setSkaermSpil() {
    spilSkaerm.resetSkaerm();
    skaerm = spilSkaerm;
  }

  void setRomerHaerSkaerm() {
    romerSkaerm.resetSkaerm();
    skaerm = romerSkaerm;
  }

  void setBerberHaerSkaerm() {
    berberSkaerm.resetSkaerm();
    skaerm = berberSkaerm;
  }

  void museKlik(int x, int y) {
    skaerm.museKlik(x, y);
  }
}
