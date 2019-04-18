class OpretHaer{
  int BB, BK, BI;
  int RB, RK, RI;
  
  OpretHaer(int BB, int BK, int BI, int RB, int RK, int RI){
    this.BB = BB;
    this.BK = BK;
    this.BI = BI;
    this.RB = RB;
    this.RK = RK;
    this.RI = RI;
  }
  
  int antalBerberBueskytter(){
    return BB;
  }
  
  int antalBerberKavaleri(){
    return BK;
  }
  
  int antalBerberInfanteri(){
    return BI;
  }
  
  int antalRomerBueskytter(){
    return RB;
  }
  
  int antalRomerKavaleri(){
    return RK;
  }
  
  int antalRomerInfanteri(){
    return RI;
  }
  
}
