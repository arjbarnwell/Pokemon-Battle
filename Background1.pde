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
//Screen Booleans(signals to change screen)
Boolean SelectScreen = false;
Boolean BattleScreen = false;
Boolean EndScreen;
//Pokemon Choice
String UserChoice = "";
String EnemyChoice;
//
void setup(){
  size(400, 600);
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
 
}
//hold here and just delete battle function because it does not work at all with new changes
//remake whole battlescreen arrangement because back sprites look weird
void newScreen(){
  background(100);
  
  background(255);
  
  background(100);
  
}


void BattleScreenLoad(){
  //replace this with a PImage of the party screen later on but make solid color for now
  background(50);
  //each sprite is 96x96p but this doesnt matter at all for some reason???? how do i
  //decide what counts as clicking on the image then?? weird
  image(Venusaur, 50, 50);
  image(Charizard, 156, 50);
  image(Blastoise, 254, 50);
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
  
