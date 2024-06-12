//Pokemon Sprites
PImage Venusaur;
PImage Charizard;
PImage Blastoise;
PImage Sceptile;
PImage Blaziken;
PImage Swampert;
//Pokemon StatCard
PImage VenusaurStatCard;
PImage CharizardStatCard;
PImage BlastoiseStatCard;
PImage SceptileStatCard;
PImage BlazikenStatCard;
PImage SwampertStatCard;
//Extra Background Images
PImage selectBack;
//Screen Booleans(signals to change screen)
Boolean SelectScreen = false;
Boolean BattleScreen = false;
Boolean VictoryScreen = false;
Boolean LossScreen = false;
//Pokemon Choice
String UserChoice = "";
String EnemyChoice;
//HashMap Setup
Hashmap<String, String[]> newMAP = new Hashmap<String, String[]>();
//pos0 = Accuracy, pos1 = Damage, pos2 = Type, pos3 = statChange(if exists)

void setup(){
  size(400, 600);
  selectBack = loadImage("selectBack.png");
  Venusaur = loadImage("003.png");
  Charizard = loadImage("006.png");
  Blastoise = loadImage("009.png");
  Sceptile = loadImage("254.png");
  Blaziken = loadImage("257.png");
  Swampert = loadImage("260.png");
  VenusaurStatCard = loadImage("VenusaurStatCard.png");
  CharizardStatCard = loadImage("CharizardStatCard.png");
  BlastoiseStatCard = loadImage("BlastoiseStatCard.png");
  SceptileStatCard = loadImage("SceptileStatCard.png");
  BlazikenStatCard = loadImage("BlazikenStatCard.png");
  SwampertStatCard = loadImage("SwampertStatCard.png");

}
//call background(bgColor) to erase the screen when changing what I want to show
void draw(){
  if(UserChoice==""){
  BattleScreenLoad();
}
  if(BattleScreen){
  newScreen();
  }
  if(VictoryScreen){
  VictoryScreenLoad();
  }
  if(LossScreen){
    LossScreenLoad();
  }
 
}
//hold here and just delete battle function because it does not work at all with new changes
//remake whole battlescreen arrangement because back sprites look weird
void newScreen(){
  background(100);
  Pokemon myPokemon = new Pokemon(UserChoice);
  Pokemon enemyPokemon = new Pokemon(EnemyChoice);
  //LOAD IN NEW BACKGROUND here
}


void BattleScreenLoad(){
  //replace this with a PImage of the party screen later on but make solid color for now
  background(selectBack);
  //each sprite is 96x96p but this doesnt matter at all for some reason???? how do i
  //decide what counts as clicking on the image then?? weird
  image(Venusaur, 50, 65);
  image(Charizard, 156, 59);
  image(Blastoise, 254, 65);
  image(Sceptile, 50, 166);
  image(Blaziken, 156, 166);
  image(Swampert, 254, 166);
  fill(200);
  rect(50, 300, 300, 250);
  if(UserChoice == ""){
    openSelection();
  }
}

void openSelection(){
  //hovering Venusaur
 if (mouseX >=50 && mouseX < 156 && mouseY >= 50 && mouseY < 126 ){
   image(VenusaurStatCard, 50, 300);
   if(mousePressed){
      rect(150, 420, 100, 100);
      delay(1000);
      UserChoice = "V";  
     String[] list = {"C", "BL", "SC", "BZ", "SW"};
     EnemyChoice = list[(int)random(0, 5)];
     BattleScreen = true;
  
   }
 }
 //hovering Charizard
 else if(mouseX >= 156 && mouseX < 254 && mouseY >= 50 && mouseY < 126){
   image(CharizardStatCard, 50, 300);
   if(mousePressed){
     rect(180, 420, 100, 100);
     delay(1000);
     UserChoice = "C";
     String[] list = {"V", "BL", "SC", "BZ", "SW"};
     EnemyChoice = list[(int)random(0, 5)];
     BattleScreen = true;
   }
 }
 //hovering Blastoise
 else if(mouseX >= 254 && mouseX < 350 && mouseY >= 50 && mouseY < 126){
   image(BlastoiseStatCard, 50, 300);
   if(mousePressed){
     rect(210, 420, 100, 100);
     delay(1000);
     UserChoice = "BL";
     String[] list = {"C", "V", "SC", "BZ", "SW"};
     EnemyChoice = list[(int)random(0, 5)];
     BattleScreen = true;
   }
 }
 //hovering Sceptile
 else if(mouseX >= 50 && mouseX < 156 && mouseY >=166 && mouseY < 242){
   image(SceptileStatCard, 50, 300);
   if(mousePressed){
     rect(150, 440, 100, 100);
     delay(1000);
     UserChoice = "SC";
     String[] list = {"C", "BL", "V", "BZ", "SW"};
     EnemyChoice = list[(int)random(0, 5)];
     BattleScreen = true;
   }
 }
 //hovering Blaziken
 else if(mouseX >= 156 && mouseX < 254 && mouseY>= 166 && mouseY < 242){
   image(BlazikenStatCard, 50, 300);
   if(mousePressed){
     rect(180, 440, 100, 100);
     delay(1000);
     UserChoice = "BZ";
     String[] list = {"C", "BL", "SC", "V", "SW"};
     EnemyChoice = list[(int)random(0, 5)];
     BattleScreen = true;
   }
 }
 //hovering Swampert
 else if(mouseX >= 254 && mouseX < 350 && mouseY >+ 166 && mouseY < 242){
   image(SwampertStatCard, 50, 300);
   if(mousePressed){
     rect(210, 440, 100, 100);
     delay(1000);
     UserChoice = "SW";
     String[] list = {"C", "BL", "SC", "BZ", "V"};
     EnemyChoice = list[(int)random(0, 5)];
     BattleScreen = true;
   }
 }
}

public void Battle(){
myHPBar.display();
enemyHPBar.display();
String myMove = myPokemon.selectMove();
String[] enemyMoveArray = enemyPokemon.moveArray();
String enemyMove = enemyMoveArray[(int)Math.random(4)];
if (myPokemon.getSpeed() > enemyPokemon.getSpeed()){
  if (Accuracy[myMove] > Math.random(100)){
    damageCalc(myMove, true);
    statChange(Stage[myMove].substring(0,1), Stage[myMove].substring(1));
    myHPBar.display();
    enemyHPBar.display();
  }
 }
  else{
    if(Accuracy[enemyMove] > Math.random(100)){
    damageCalc(enemyMove, false);
    statChange(Stage[enemyMove].substring(0,1), Stage[enemyMove].substring(1));
    myHPBar.display();
    enemyHPBar.display();
  }
  }  
  if(myPokemon.getHP() <= 0){
    lossScreen = true;
  } 
   else if(enemyPokemon.getHP() <= 0){
    victoryScreen = true;
  } 
    else if (myPokemon.getHP> 0 && enemyPokemon.getHP > 0){
Battle();
}
}

statChange(String stat, int stage){
if(stat.equals(“ATK”)){
myPokemon.setATK(stage * .5 * myPokemon.getATK() + myPokemon.getATK());
}
if(stat.equals(“DEF”)){ 
myPokemon.setDEF(stage * .5 * myPokemon.getDEF() + myPokemon.getDEF());
}
if(stat.equals(“SPATK”)){
myPokemon.setSPATK(stage * .5 * myPokemon.getSPATK() + myPokemon.getSPATK());
}
if(stat.equals(“SPDEF”)){
myPokemon.setSPDEF(stage * .5 * myPokemon.getSPDEF() + myPokemon.getSPDEF());
}
if(stat.equals(“speed”)){
myPokemon.setSPD(stage * .5 * myPokemon.getspeed() + myPokemon.getspeed());
}
}


public void damageCalc(String move, boolean TargetEnemy){
if (TargetEnemy){
String type1 = enemyPokemon.getType1();
String type2 = enemyPokemon.getType2();
}
else{
String type1 = myPokemon.getType1();
String type2 = myPokemon.getType2();
}
double STABbonus = 1;
if ((TargetEnemy && (myPokemon.getType1.equals(Type[move])  
|| myPokemon.getType2.equals(Type[move]))) 
||  (!TargetEnemy && (enemyPokemon.getType1.equals(Type[move]) 
|| enemyPokemon.getType2.equals(Type[move])))) {
STABbonus = 1.5;
}
double typeAdvantage = typeChart(Type[move], type1) * typeChart(Type[move], type2);
/*if(TargetEnemy){
enemyPokemon.setHP(enemyPokemon.currentHP - 
(Damage[move] * typeAdvantage * STABbonus * (myPokemon.getATK() / ((double) enemyPokemon.getDEF()) * 

//NEED TO REPLACE A LOT OF THIS WITH THE EQUATION ON WIKI PAGE 
//(2*level)/5 * power /50 + 2 * stab * a ton of other modifiers just leave it as is for now because i need to dedicate a lot of time in consecutive hours for this
}*/
}

public double typeChart(String moveType, String targetType){
 if(moveType.equals("NOR") && targetType.equals("GHO")){
   return 0;
 }
 if(moveType.equals("NOR") && (targetType.equals("ROC") || targetType.equals("STE"))){
   return .5;
 }
 if(moveType.equals("NOR") && !(targetType.equals("GHO") || targetType.equals("ROC") || targetType.equals("STE"))){
   return 1;
 }
 if(moveType.equals("FIR") && (targetType.equals("FIR") || targetType.equals("WAT") || targetType.equals("ROC") || targetType.equals("DRA"))){
   return .5;
 }
 if(moveType.equals("FIR") && (targetType.equals("GRA") || targetType.equals("ICE") || targetType.equals("BUG") || targetType.equals("STE"))){
   return 2;
 }
 if(moveType.equals("FIR") && !(targetType.equals("FIR") || targetType.equals("WAT") || targetType.equals("ROC") || targetType.equals("DRA") || targetType.equals("GRA") || targetType.equals("ICE") || targetType.equals("BUG") || targetType.equals("STE"))){
   return 1;
 }
 if(moveType.equals("WAT") && (targetType.equals("WAT") || targetType.equals("GRA") || targetType.equals("DRA"))){
   return .5;
 }
 if(moveType.equals("WAT") && (targetType.equals("FIR") || targetType.equals("GRO") || targetType.equals("ROC"))){
   return 2;
 }
 if(moveType.equals("WAT") && !(targetType.equals("WAT") || targetType.equals("GRA") || targetType.equals("DRA") || targetType.equals("FIR") || targetType.equals("GRO") || targetType.equals("ROC"))){
   return 1;
 }
 if(moveType.equals("GRA") && (targetType.equals("FIR") || targetType.equals("GRA") || targetType.equals("POI") || targetType.equals("FLY") || targetType.equals("BUG") || targetType.equals("DRA") || targetType.equals("STE"))){
   return .5;
 }
 if(moveType.equals("GRA") && (targetType.equals("WAT") || targetType.equals("GRO") || targetType.equals("ROC"))){
   return 2;
 }
 if(moveType.equals("GRA") && !(targetType.equals("FIR") || targetType.equals("GRA") || targetType.equals("POI") || targetType.equals("FLY") || targetType.equals("BUG") || targetType.equals("DRA") || targetType.equals("STE") || targetType.equals("WAT") || targetType.equals("GRO") || targetType.equals("ROC"))){
   return 1;
 }
 if(moveType.equals("ELE") && targetType.equals("GRO")){
   return 0;
 }
 if(moveType.equals("ELE") && (targetType.equals("ELE") || targetType.equals("GRA") || targetType.equals("DRA"))){
   return .5;
 }
 if(moveType.equals("ELE") && (targetType.equals("WAT") || targetType.equals("FLY"))){
   return 2;
 }
 if(moveType.equals("ELE") && !(targetType.equals("GRO") || targetType.equals("ELE") || targetType.equals("GRA") || targetType.equals("DRA") || targetType.equals("WAT") || targetType.equals("FLY"))){
   return 1;
 }
 if(moveType.equals("ICE") && (targetType.equals("FIR") || targetType.equals("WAT") || targetType.equals("ICE") || targetType.equals("STE"))){
   return .5;
 }
 if(moveType.equals("ICE") && (targetType.equals("GRA") || targetType.equals("GRO") || targetType.equals("FLY") || targetType.equals("DRA"))){
   return 2;
 }
 if(moveType.equals("ICE") && !(targetType.equals("FIR") || targetType.equals("WAT") || targetType.equals("ICE") || targetType.equals("STE") || targetType.equals("GRA") || targetType.equals("GRO") || targetType.equals("FLY") || targetType.equals("DRA"))){
   return 1;
 }
 if(moveType.equals("FIG") && (targetType.equals("POI")
 
 


  
