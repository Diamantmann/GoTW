class OpretHaer {

  //Integerne for klassen erklæres.
  int BK;
  int RK;

  //Constructoren opsættes.
  OpretHaer(int BK, int RK) {
    this.BK = BK;
    this.RK = RK;
  }

  //Funktion til at returnere, hvor meget berberkavaleri der er.
  int antalBerberKavaleri() {
    return BK;
  }

  //Funktion til at returnere, hvor meget romerkavaleri der er.
  int antalRomerKavaleri() {
    return RK;
  }
}
