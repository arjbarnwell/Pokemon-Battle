import java.util.*;
//Pokemon Sprites
PImage Venusaur;
PImage Charizard;
PImage Blastoise;
PImage Sceptile;
PImage Blaziken;
PImage Swampert;
PImage VenusaurBack;
PImage CharizardBack;
PImage BlastoiseBack;
PImage SceptileBack;
PImage BlazikenBack;
PImage SwampertBack;
//Pokemon StatCard
PImage VenusaurStatCard;
PImage CharizardStatCard;
PImage BlastoiseStatCard;
PImage SceptileStatCard;
PImage BlazikenStatCard;
PImage SwampertStatCard;
//Extra Background Images
PImage selectBack;
PImage battleBack;
//Screen Booleans(signals to change screen)
Boolean SelectScreen = false;
Boolean BattleScreen = false;
Boolean VictoryScreen = false;
Boolean LossScreen = false;
//Pokemon Choice
String UserChoice = "";
String EnemyChoice;
Pokemon myPokemon = null;
Pokemon enemyPokemon = null;
String myMove = null;
String enemyMove = null;
HPbar myHPbar = null;
HPbar enemyHPbar = null;
int myHP;
int enemyHP;
//HashMap Setup
Map<String, String[]> newMap = new HashMap<String, String[]>();
//pos0 = Accuracy, pos1 = Damage, pos2 = Type




void setup(){
  size(400, 600);
  selectBack = loadImage("selectBack.png");
  battleBack = loadImage("BattleBack.png");
  Venusaur = loadImage("003.png");
  Charizard = loadImage("006.png");
  Blastoise = loadImage("009.png");
  Sceptile = loadImage("254.png");
  Blaziken = loadImage("257.png");
  Swampert = loadImage("260.png");
  VenusaurBack = loadImage("VenusaurBack.png");
  CharizardBack = loadImage("CharizardBack.png");
  BlastoiseBack = loadImage("BlastoiseBack.png");
  SceptileBack = loadImage("SceptileBack.png");
  BlazikenBack = loadImage("BlazikenBack.png");
  SwampertBack = loadImage("SwampertBack.png");
  VenusaurStatCard = loadImage("VenusaurStatCard.png");
  CharizardStatCard = loadImage("CharizardStatCard.png");
  BlastoiseStatCard = loadImage("BlastoiseStatCard.png");
  SceptileStatCard = loadImage("SceptileStatCard.png");
  BlazikenStatCard = loadImage("BlazikenStatCard.png");
  SwampertStatCard = loadImage("SwampertStatCard.png");
  
newMap.put("SleepPowder", new String[] {"75", "0", "GRA","SPA" });
newMap.put("LeafStorm", new String[] {"90", "130", "GRA", "SPA"});
newMap.put("Synthesis", new String[] {"100", "0", "GRA", "SPA"});
newMap.put("SludgeBomb", new String[] {"100", "80", "POI", "SPA"});
newMap.put("Overheat", new String[] {"90", "130", "FIR","SPA"});
newMap.put("DragonDance", new String[] {"100", "0", "DRA", "SPA"});
newMap.put("FlareBlitz", new String[] {"100", "120", "FIR", "PHY"});
newMap.put("Hurricane", new String[] {"70", "110", "FLY", "SPA"});
newMap.put("HydroPump", new String[] {"80", "110", "WAT", "SPA"});
newMap.put("ShellSmash", new String[] {"100", "0", "WAT", "SPA"});
newMap.put("IceBeam", new String[] {"100", "90", "ICE", "SPA"});
newMap.put("IcyWind", new String[] {"100", "55", "ICE", "SPA"});
newMap.put("FocusBlast", new String[] {"70", "120", "FIG", "SPA"});
newMap.put("Acrobatics", new String[] {"100", "110", "FLY", "PHY"});
newMap.put("XScissor", new String[] {"100", "80", "BUG", "PHY"});
newMap.put("CloseCombat", new String[] {"100", "120", "FIG", "PHY"});
newMap.put("Protect", new String[] {"100", "0", "NOR", "SPA"});
newMap.put("SwordsDance", new String[] {"100", "0", "GRA", "PHY"});
newMap.put("Liquidation", new String[] {"100", "80", "WAT", "PHY"});
newMap.put("Earthquake", new String[] {"100", "100", "GRO", "PHY"});
newMap.put("PoisonJab", new String[] {"100", "80", "POI", "PHY"});

}
//call background(bgColor) to erase the screen when changing what I want to show
void draw(){
  if(UserChoice==""){
  SelectScreenLoad();
}
  if(BattleScreen){
  BattleScreenLoad();
  }
  if(VictoryScreen){
  VictoryScreenLoad();
  }
  if(LossScreen){
    LossScreenLoad();
  }
 
 
 
}
void mouseClicked(){
  if(BattleScreen){
  if(mouseX <200 && mouseY >=400 && mouseY <500){
      myMove = myPokemon.getMoveArray()[0];
     rect(0, 0, 20, 20);
Battle();
     
   }
    if(mouseX >=200 && mouseY >= 400 && mouseY < 500){
     myMove = myPokemon.getMoveArray()[1];
       rect(0, 0, 20, 20);
 Battle();

   }
    if(mouseX <200 && mouseY > 500){
       rect(0, 0, 20, 20);
     myMove = myPokemon.getMoveArray()[2];
Battle();

   }
    if(mouseX >=200 && mouseY > 500){
       rect(0, 0, 20, 20);
     myMove = myPokemon.getMoveArray()[3];
 Battle();
     
   }
   
}
}
//hold here and just delete battle function because it does not work at all with new changes
//remake whole battlescreen arrangement because back sprites look weird
void BattleScreenLoad(){
  SelectScreen = false;
  text("" + enemyHPbar.getPercentage(), 0,50);
  image(battleBack, 0, 0);
 myHPbar.display();
 enemyHPbar.display();
  fill(20);
  textSize(24);
   if(UserChoice.equals("V")){
     VenusaurBack.resize(150, 150);
     image(VenusaurBack, 0, 265);
      fill(37, 204, 53);//grass
      rect(0, 400, 200, 100);
  rect(200, 400, 200, 100);
  rect(0, 500, 200, 100);
     fill(195, 85, 200);//poison
       rect(200, 500, 200, 100);
       fill(20);
       text("Sleep Powder", 30, 450); 
       text("Leaf Storm", 230, 450);
       text("Synthesis", 30, 550);
       text("Sludge Bomb", 230, 550);
   }
   if(UserChoice.equals("C")){
     CharizardBack.resize(150, 150);
     image(CharizardBack, 0, 260);
        fill(199, 65, 65);//fire
     rect(0, 400, 200, 100);
        fill(130, 40, 255);//dragon
          rect(200, 400, 200, 100);
             fill(199, 65, 65);//fire
               rect(0, 500, 200, 100);
                  fill(144, 250, 255);//flying
               rect(200, 500, 200, 100);
               fill(20);
               text("Overheat", 30, 450);
               text("Dragon Dance", 230, 450);
               text("FlareBlitz", 30, 550);
               text("Hurricane", 230, 550);
               
           
   }
   if(UserChoice.equals("BL")){
     BlastoiseBack.resize(150,150);
     image(BlastoiseBack, 0, 265);
        fill(61, 166, 227);//water
        rect(0, 400, 200, 100);
        fill(255);
          rect(200, 400, 200, 100);
             fill(0, 255, 255);//ice
               rect(0, 500, 200, 100);
  rect(200, 500, 200, 100);
  fill(20);
  text("Hydro Pump", 30, 450);
  text("Shell Smash", 230, 450);
  text("Ice Beam", 30, 550);
  text("Icy Wind", 230, 550);
   }
   if(UserChoice.equals("SC")){
     SceptileBack.resize(150, 150);
     image(SceptileBack, 0, 250);
        fill(37, 204, 53);//grass
        rect(0, 400, 200, 100);
           fill(210, 115, 30);//fighting
             rect(200, 400, 200, 100);
                fill(144, 250, 255);//flying
                  rect(0, 500, 200, 100);
                     fill(170, 200, 83);//bug
                       rect(200, 500, 200, 100);
                       fill(20);
                       text("Leaf Storm", 30, 450);
                       text("Focus Blast", 230, 450);
                       text("Acrobatics", 30, 550);
                       text("XScissor", 230, 550);
   }
   if(UserChoice.equals("BZ")){
     BlazikenBack.resize(150, 150);
     image(BlazikenBack, 0, 250);
        fill(199, 65, 65);//fire
        rect(0, 400, 200, 100);
           fill(210, 115, 30);//fighting
             rect(200, 400, 200, 100);
                fill(255);//normal
                  rect(0, 500, 200, 100);
                    rect(200, 500, 200, 100);
                    fill(20);
                    text("Flare Blitz", 30, 450);
                    text("Close Combat", 230, 450);
                    text("Swords Dance", 30, 550);
                    text("Protect", 230, 550);
                    
   }
   if(UserChoice.equals("SW")){
     SwampertBack.resize(150, 150);
     image(SwampertBack, 0, 260);
       fill(61, 166, 227);//water
       rect(0, 400, 200, 100);
          fill(200, 150, 0); //ground
            rect(200, 400, 200, 100);
               fill(195, 85, 200);//poison
                rect(0, 500, 200, 100);
                fill(255);//normal
                  rect(200, 500, 200, 100);
                  fill(20);
                  text("Liquidation", 30, 450);
                  text("Earthquake", 230, 450);
                  text("Poison Jab", 30, 550);
                  text("Protect", 230, 550);
   }
   if(EnemyChoice.equals("V")){
     image(Venusaur, 260, 100);
   }
   if(EnemyChoice.equals("C")){
     image(Charizard, 260, 100);
   }
   if(EnemyChoice.equals("BL")){
     image(Blastoise, 260, 100);
   }
   if(EnemyChoice.equals("SC")){
     image(Sceptile, 260, 100);
   }
   if(EnemyChoice.equals("BZ")){
     image(Blaziken, 260, 100);
   }
   if(EnemyChoice.equals("SW")){
     image(Swampert, 260, 100);
   }
  
  //LOAD IN NEW BACKGROUND here
}

void testBattle(){
  delay(150);
 int b =  myPokemon.currentHP - 10;
 int c =  enemyPokemon.currentHP - 10;
 myPokemon.setHP(b);
 enemyPokemon.setHP(c);
  myHPbar.update(b);
  enemyHPbar.update(c);
}




void VictoryScreenLoad(){
  delay(2000);
  background(255);
  fill(0);
  text("YOU WIN! with - " + myHPbar.getNamed(), 150, 200);
}
void LossScreenLoad(){
  delay(2000);
  background(0);
  fill(255);
  text("YOU LOSE! ", 150, 200);
}

void SelectScreenLoad(){
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
     myPokemon = new Pokemon(UserChoice);
   enemyPokemon = new Pokemon(EnemyChoice);
 
   myHPbar = new HPbar(myPokemon.getMaxHP(), myPokemon.getMaxHP(), true, "Venusaur");
   enemyHPbar = new HPbar(enemyPokemon.getMaxHP(), enemyPokemon.getMaxHP(), false, "Enemy Pokemon");
  
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
      myPokemon = new Pokemon(UserChoice);
   enemyPokemon = new Pokemon(EnemyChoice);
  
   myHPbar = new HPbar(myPokemon.getMaxHP(), myPokemon.getMaxHP(), true, "Charizard");
   enemyHPbar = new HPbar(enemyPokemon.getMaxHP(), enemyPokemon.getMaxHP(), false, "Enemy Pokemon");
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
     myPokemon = new Pokemon(UserChoice);
   enemyPokemon = new Pokemon(EnemyChoice);
   myHPbar = new HPbar(myPokemon.getMaxHP(), myPokemon.getMaxHP(), true, "Blastoise");
   enemyHPbar = new HPbar(enemyPokemon.getMaxHP(), enemyPokemon.getMaxHP(), false, "Enemy Pokemon");
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
     myPokemon = new Pokemon(UserChoice);
   enemyPokemon = new Pokemon(EnemyChoice);
   myHPbar = new HPbar(myPokemon.getMaxHP(), myPokemon.getMaxHP(), true, "Sceptile");
   enemyHPbar = new HPbar(enemyPokemon.getMaxHP(), enemyPokemon.getMaxHP(), false, "Enemy Pokemon");
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
     myPokemon = new Pokemon(UserChoice);
   enemyPokemon = new Pokemon(EnemyChoice);
   myHPbar = new HPbar(myPokemon.getMaxHP(), myPokemon.getMaxHP(), true, "Blaziken");
   enemyHPbar = new HPbar(enemyPokemon.getMaxHP(), enemyPokemon.getMaxHP(), false, "Enemy Pokemon");
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
     myPokemon = new Pokemon(UserChoice);
   enemyPokemon = new Pokemon(EnemyChoice);
   myHPbar = new HPbar(myPokemon.getMaxHP(), myPokemon.getMaxHP(), true, "Swampert");
   enemyHPbar = new HPbar(enemyPokemon.getMaxHP(), enemyPokemon.getMaxHP(), false, "Enemy Pokemon");
   }
 }
}

public void Battle(){


String[] enemyMoveArray = enemyPokemon.getMoveArray();
String enemyMove = enemyMoveArray[(int)Math.random()*4];
fill(255);
if (myPokemon.getSpeed() > enemyPokemon.getSpeed()){
  if (Integer.parseInt(newMap.get(myMove)[0]) > Math.random()*100){
   
    damageCalc(myMove, true, myPokemon);
       if(myMove.equals("SleepPowder")){
         statChange("ATK", -100, enemyPokemon);
         statChange("SPATK", -100, enemyPokemon);
    }
    if(myMove.equals("Protect")){
      myPokemon.setHP(50);
    }
    if(myMove.equals("LeafStorm")){
      statChange("SPATK", -2, myPokemon);
    }
     if(myMove.equals("Synthesis")){
    myPokemon.setHP(myPokemon.getHP() + myPokemon.getMaxHP() / 2);
    if(myPokemon.getHP() > myPokemon.getMaxHP()){
      myPokemon.setHP(myPokemon.getMaxHP());
    }
     }
      if(myMove.equals("Overheat")){
    statChange("SPATK", -2, myPokemon);
      }
       if(myMove.equals("DragonDance")){
    statChange("ATK", 1, myPokemon);
    statChange("speed", 1, myPokemon);
       }
        if(myMove.equals("FlareBlitz")){
    myPokemon.setHP((int)( 2/3 * myPokemon.getHP()));
        }
         if(myMove.equals("ShellSmash")){
    statChange("DEF", -1, myPokemon);
    statChange("SPDEF", -1, myPokemon);
    statChange("ATK", 2, myPokemon);
     statChange("SPATK", 2, myPokemon);
      statChange("speed", 2, myPokemon);
         }
    if(myMove.equals("IcyWind")){     
      statChange("speed", -1, enemyPokemon);
    }
    if(myMove.equals("CloseCombat")){
      statChange("DEF", -1, myPokemon);
         statChange("SPDEF", -1, myPokemon);
    }
        if(myMove.equals("SwordsDance")){
          statChange("ATK", 2, myPokemon);
        }
        delay(100);
        enemyHPbar.display();
        if(enemyHPbar.getPercentage() == 0){
          VictoryScreen = true;
        }
        //ENEMY LINES
    damageCalc(enemyMove, false, enemyPokemon);
       if(enemyMove.equals("SleepPowder")){
         statChange("ATK", -100, myPokemon);
         statChange("SPATK", -100, myPokemon);
    }
    if(enemyMove.equals("Protect")){
      enemyPokemon.setHP(50);
    }
    if(enemyMove.equals("LeafStorm")){
      statChange("SPATK", -2, enemyPokemon);
    }
     if(enemyMove.equals("Synthesis")){
    enemyPokemon.setHP(enemyPokemon.getHP() + enemyPokemon.getMaxHP() / 2);
    if(enemyPokemon.getHP() > enemyPokemon.getMaxHP()){
      enemyPokemon.setHP(enemyPokemon.getMaxHP());
    }
     }
      if(enemyMove.equals("Overheat")){
    statChange("SPATK", -2, enemyPokemon);
      }
       if(enemyMove.equals("DragonDance")){
    statChange("ATK", 1, enemyPokemon);
    statChange("speed", 1, enemyPokemon);
       }
        if(enemyMove.equals("FlareBlitz")){
    enemyPokemon.setHP((int)( 2/3 * enemyPokemon.getHP()));
        }
         if(enemyMove.equals("ShellSmash")){
    statChange("DEF", -1, enemyPokemon);
    statChange("SPDEF", -1, enemyPokemon);
    statChange("ATK", 2, enemyPokemon);
     statChange("SPATK", 2, enemyPokemon);
      statChange("speed", 2, enemyPokemon);
         }
    if(enemyMove.equals("IcyWind")){     
      statChange("speed", -1, myPokemon);
    }
    if(enemyMove.equals("CloseCombat")){
      statChange("DEF", -1, enemyPokemon);
         statChange("SPDEF", -1, enemyPokemon);
    }
        if(enemyMove.equals("SwordsDance")){
          statChange("ATK", 2, enemyPokemon);
        }
  }
 }
  else{
    if(Integer.parseInt(newMap.get(enemyMove)[0]) > Math.random()*100){
   
    damageCalc(enemyMove, false, enemyPokemon);
     if(enemyMove.equals("SleepPowder")){
         statChange("ATK", -100, myPokemon);
         statChange("SPATK", -100, myPokemon);
    }
    if(enemyMove.equals("Protect")){
      enemyPokemon.setHP(50);
    }
    if(enemyMove.equals("LeafStorm")){
      statChange("SPATK", -2, enemyPokemon);
    }
     if(enemyMove.equals("Synthesis")){
    enemyPokemon.setHP(enemyPokemon.getHP() + enemyPokemon.getMaxHP() / 2);
    if(enemyPokemon.getHP() > enemyPokemon.getMaxHP()){
      enemyPokemon.setHP(enemyPokemon.getMaxHP());
    }
     }
      if(enemyMove.equals("Overheat")){
    statChange("SPATK", -2, enemyPokemon);
      }
       if(enemyMove.equals("DragonDance")){
    statChange("ATK", 1, enemyPokemon);
    statChange("speed", 1, enemyPokemon);
       }
        if(enemyMove.equals("FlareBlitz")){
    enemyPokemon.setHP((int)( 2/3 * enemyPokemon.getHP()));
        }
         if(enemyMove.equals("ShellSmash")){
    statChange("DEF", -1, enemyPokemon);
    statChange("SPDEF", -1, enemyPokemon);
    statChange("ATK", 2, enemyPokemon);
     statChange("SPATK", 2, enemyPokemon);
      statChange("speed", 2, enemyPokemon);
         }
    if(enemyMove.equals("IcyWind")){     
      statChange("speed", -1, myPokemon);
    }
    if(enemyMove.equals("CloseCombat")){
      statChange("DEF", -1, enemyPokemon);
         statChange("SPDEF", -1, enemyPokemon);
    }
        if(enemyMove.equals("SwordsDance")){
          statChange("ATK", 2, enemyPokemon);
        }
    if(myHPbar.percentage == 0){
      LossScreen = true;
    }
      damageCalc(myMove, true, myPokemon);
    if(myMove.equals("SleepPowder")){
         statChange("ATK", -100, enemyPokemon);
         statChange("SPATK", -100, enemyPokemon);
    }
    if(myMove.equals("Protect")){
      myPokemon.setHP(50);
    }
    if(myMove.equals("LeafStorm")){
      statChange("SPATK", -2, myPokemon);
    }
     if(myMove.equals("Synthesis")){
    myPokemon.setHP(myPokemon.getHP() + myPokemon.getMaxHP() / 2);
    if(myPokemon.getHP() > myPokemon.getMaxHP()){
      myPokemon.setHP(myPokemon.getMaxHP());
    }
     }
      if(myMove.equals("Overheat")){
    statChange("SPATK", -2, myPokemon);
      }
       if(myMove.equals("DragonDance")){
    statChange("ATK", 1, myPokemon);
    statChange("speed", 1, myPokemon);
       }
        if(myMove.equals("FlareBlitz")){
    myPokemon.setHP((int)( 2/3 * myPokemon.getHP()));
        }
         if(myMove.equals("ShellSmash")){
    statChange("DEF", -1, myPokemon);
    statChange("SPDEF", -1, myPokemon);
    statChange("ATK", 2, myPokemon);
     statChange("SPATK", 2, myPokemon);
      statChange("speed", 2, myPokemon);
         }
    if(myMove.equals("IcyWind")){     
      statChange("speed", -1, enemyPokemon);
    }
    if(myMove.equals("CloseCombat")){
      statChange("DEF", -1, myPokemon);
         statChange("SPDEF", -1, myPokemon);
    }
        if(myMove.equals("SwordsDance")){
          statChange("ATK", 2, myPokemon);
        }
  }
  }  

  myHPbar.display();
  enemyHPbar.display();
  
  if(myHPbar.getPercentage() <= 0 ||enemyHPbar.getPercentage() <= 0 ){

    BattleScreen =false;
  } 
  
   if(enemyHPbar.getPercentage() <= 0 && LossScreen != true){
    VictoryScreen = true;
    BattleScreen = false;
  } 
  if(myHPbar.getPercentage() <= 0 && VictoryScreen != true){
    LossScreen = true;
    BattleScreen = false;
  } 
   

  
}

void statChange(String stat, int stage, Pokemon userPokemon){
if(stat.equals("ATK")){
if(stage > 0){
    userPokemon.setATK((int)(stage * .5 * userPokemon.getATK() + userPokemon.getATK()));
  }
  else{
    userPokemon.setATK((int)(1.0/stage * userPokemon.getATK()));
  }
}
if(stat.equals("DEF")){ 
if(stage > 0){
    userPokemon.setDEF((int)(stage * .5 * userPokemon.getDEF() + userPokemon.getDEF()));
  }
  else{
    userPokemon.setDEF((int)(1.0/stage * userPokemon.getDEF()));
  }
}
if(stat.equals("SPATK")){
  if(stage > 0){
    userPokemon.setSPATK((int)(stage * .5 * userPokemon.getSPATK() + userPokemon.getSPATK()));
  }
  else{
    userPokemon.setSPATK((int)(1.0/stage * userPokemon.getSPATK()));
  }
}
if(stat.equals("SPDEF")){
if(stage > 0){
    userPokemon.setSPDEF((int)(stage * .5 * userPokemon.getSPDEF() + userPokemon.getSPDEF()));
  }
  else{
    userPokemon.setSPDEF((int)(1.0/stage * userPokemon.getSPDEF()));
  }
}
if(stat.equals("speed")){
  if(stage > 0){
    userPokemon.setSpeed((int)(stage * .5 * userPokemon.getSpeed() + userPokemon.getSpeed()));
  }
  else{
    userPokemon.setSpeed((int)(1.0/stage * userPokemon.getSpeed()));
  }
}
}


public void damageCalc(String move, boolean TargetEnemy, Pokemon userPokemon){

String type1 = enemyPokemon.getType1();
String type2 = enemyPokemon.getType2();
  
  if(userPokemon == myPokemon){
  type1 = enemyPokemon.getType1();
  type2 = enemyPokemon.getType2();
  }
  
  
double STABbonus = 1;
if ((TargetEnemy && (myPokemon.getType1().equals(newMap.get(move)[2]) 
|| myPokemon.getType2().equals(newMap.get(move)[2]))) 
||  (!TargetEnemy && (enemyPokemon.getType1().equals(newMap.get(move)[2]) 
|| enemyPokemon.getType2().equals(newMap.get(move)[2])))) {
STABbonus = 1.5;
}
double typeAdvantage = typeChart(newMap.get(move)[2], type1) * typeChart(newMap.get(move)[2], type2);
double abilityboost = 1;
if(userPokemon.getAbility().equals("Blaze") && userPokemon.getType1().equals("FIR") && userPokemon.getHP() / ((double) userPokemon.getMaxHP()) < .34){
  abilityboost = 1.5;
}
if(userPokemon.getAbility().equals("Overgrow") && userPokemon.getType1().equals("GRA")&& userPokemon.getHP() / ((double) userPokemon.getMaxHP()) < .34){
  abilityboost = 1.5;
}
if(userPokemon.getAbility().equals("Torrent") && userPokemon.getType1().equals("WAT")&& userPokemon.getHP() / ((double) userPokemon.getMaxHP()) < .34){
  abilityboost = 1.5;
}


if(TargetEnemy){
 
  double point4 =((double)2)/5;
  double movedamage = Integer.parseInt(newMap.get(move)[1]);
  double atk = myPokemon.getATK();
  double def = enemyPokemon.getDEF();
  double spatk = myPokemon.getSPATK();
  double spdef = enemyPokemon.getSPDEF();
  double special= spatk/spdef;
  double atkdef = (atk/def);
  
  if(movedamage == 0.0){
  }
  else{
  int d = (int)(enemyPokemon.getHP() - 
 // --> .4 * 130 * 2 * 1.5 * 1 * 
(point4 * movedamage * typeAdvantage * STABbonus * atkdef * abilityboost));
if(newMap.get(move)[3].equals("SPA")){
  d = (int)(enemyPokemon.getHP() - point4 * movedamage * typeAdvantage * STABbonus * special * abilityboost);
}

int w = (int)(enemyPokemon.getHP() - 10);

System.out.println("Your pokemon used " + move + "!");
System.out.println("The enemy pokemon has " + d + " health remaining!");
enemyPokemon.setHP(d);
enemyHPbar.update(d);

  }
}
else{
   double point4 =((double)2)/5;
  double movedamage = Integer.parseInt(newMap.get(move)[1]);
  double atk = enemyPokemon.getATK();
  double def = myPokemon.getDEF();
  double spatk = enemyPokemon.getSPATK();
  double spdef = myPokemon.getSPDEF();
  double special= spatk/spdef;
  double atkdef = (atk/def);
  
  if(movedamage == 0.0){
  }
  else{
  int d = (int)(myPokemon.getHP() - 
 // --> .4 * 130 * 2 * 1.5 * 1 * 
(point4 * movedamage * typeAdvantage * STABbonus * atkdef * abilityboost));
if(newMap.get(move)[3].equals("SPA")){
  d = (int)(myPokemon.getHP() - point4 * movedamage * typeAdvantage * STABbonus * special * abilityboost);
}

int w = (int)(myPokemon.getHP() - 10);
System.out.println("Enemy pokemon used " + move + "!");
System.out.println("Your pokemon has " + d + " health remaining!");
myPokemon.setHP(d);
myHPbar.update(d);

  }
}
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
 if(moveType.equals("FIG") && (targetType.equals("POI") || targetType.equals("FLY") || targetType.equals("PSY") || targetType.equals("BUG") || targetType.equals("FAI"))){
   return .5;
 }
 if(moveType.equals("FIG") && !(targetType.equals("POI") || targetType.equals("FLY") || targetType.equals("PSY") || targetType.equals("BUG") || targetType.equals("FAI"))){
   return 1;
 }
 if(moveType.equals("POI") && (targetType.equals("GRA"))){
   return 2;
 }
   if(moveType.equals("POI") && (targetType.equals("POI") || targetType.equals("GRO"))){
   return .5;
 }
 if(moveType.equals("POI") && !(targetType.equals("GRA") || targetType.equals("POI") || targetType.equals("GRO"))){
   return 1;
 }
 if(moveType.equals("GRO") && (targetType.equals("FIR") || targetType.equals("POI"))){
   return 1;
 }
 if(moveType.equals("GRO") && (targetType.equals("GRA"))){
   return .5;
 }
 if(moveType.equals("GRO") && targetType.equals("FLY")){
   return 0;
 }
 if(moveType.equals("GRO") && !(targetType.equals("GRA") || targetType.equals("FLY"))){
   return 1;
 }
 if(moveType.equals("FLY") && (targetType.equals("GRA") || targetType.equals("FIG"))){
   return 2;
 }
 if(moveType.equals("FLY") && !(targetType.equals("GRA") || targetType.equals("FIG"))){
   return 1;
 }
 if(moveType.equals("BUG") && (targetType.equals("FIR") || targetType.equals("FIG") || targetType.equals("FLY") || targetType.equals("POI"))){
   return .5;
 }
 if(moveType.equals("BUG") && (targetType.equals("GRA"))){
   return 2;
 }
 
 return 1;
}
 



  
 
 


  
