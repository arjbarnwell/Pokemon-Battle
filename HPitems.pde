class HPbar{
  int maxHP;
  double percentage;
  boolean Player;
  String name;
  public HPbar(int maxHP, int currentHP, boolean playerowns, String name){
    this.maxHP = maxHP;
    this.percentage = ((double)currentHP) / maxHP;
    this.Player = playerowns;
    this.name = name;
  }
  
  String getNamed(){
    return this.name;
  }
  void update(int newHP){
    this.percentage = ((double)newHP / maxHP);
    if(this.percentage < 0){
      this.percentage = 0;
  }
  }
  
  void display(){
    if(Player){
      fill(200);
      rect(200, 300, 150, 50);
      textSize(12);
      fill(0);
      text(name, 215, 320);
      fill(255, 0, 0);
      rect(210, 325, 120, 20);
      fill(0, 255, 0);
      rect(210, 325, ((float)this.percentage * 120), 20);
      fill(255);
    }
    else{
      fill(200);
      rect(25, 100, 150, 50);
      textSize(12);
      fill(0);
      text(name, 40, 120);
      fill(255, 0, 0);
      rect(35, 125, 120, 20);
      fill(0, 255, 0);
      rect(35, 125, ((float)this.percentage * 120), 20);
      fill(255);
  }
  
}
double getPercentage(){
  return this.percentage;
}
}
  
