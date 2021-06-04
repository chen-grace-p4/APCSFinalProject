public class Game {
  //ArrayList<Things> things;
  String screen;
  double moneyEarned;
  int customerCounter;
  
  boolean customerThere;
  
  int level;
  boolean lvlEnd;
  boolean lvlTwoUnlocked;
  boolean lvlThreeUnlocked;
  
  boolean masterClicked;
  String mode;

  Game() {
    //things = new ArrayList<Things>();
    //screen = "cashier"; //CHANGE TO MAIN MENU LATER ON
    //screen = "selectLevels";
    screen = "mainMenu";
    mode = "normal";
    moneyEarned = 0;
    customerCounter = 0;
    //level = 1; //TEMPORARY
    //
    level = 0; //starts out as this in actual game
    lvlEnd = true; //starts out as true in actual game
    //IN ACTUAL GAME, when level becomes 1 after you select in the menu, lvlEnd = false
  }

  String getScreen() {
    return screen;
  }

  void changeScreen(String screenName) {
    // to change the background/which items are hidden or visible (call hide() method for each object) based on button pressed
    screen = screenName;
    if (screenName.equals("oven")) {
      if (oven.moveOn) {
        pizza.mainX = 702;
        pizza.mainY = 390;
      } else {
        pizza.mainX = 100;
        pizza.mainY = 390;
      }
    }
  }
  void checkScreen() {
    //basic testing of changing screen below, will add more for each screen later
    if (screen.equals("mainMenu")) {
      //sky
      background(#b8eaff);
      //grass
      rectMode(CORNER);
      noStroke();
      fill(#11701e);
      rect(0, 600, 800, 200);
      //store
      fill(#bf8136);
      rect(200, 300, 400, 300);
      //store sign
      fill(#f7e188);
      rect(220, 320, 360, 100);
      fill(#fad541);
      rect(230, 330, 340, 80);
      
      textSize(70);
      fill(#6e4e25);
      text("Fooderia", 250, 390);
      //store windows
      fill(#ededed);
      rect(220, 460, 100, 100);
      rect(480, 460, 100, 100);
      //door
      fill(#785007);
      rect(350, 460, 105, 140);
      
      //griya
      fill(#6e4e25);
      textSize(200);
      text("Griya's", 90, 200);
      
      //normal mode
      fill(#38c4ff);
      rect(40, 630, 340, 140);
      fill(#7dd8ff);
      rect(50, 640, 320, 120);
      
      fill(#004d6e);
      textSize(45);
      text("Normal Mode", 60, 700);
      
      
      //master mode
      fill(#38c4ff);
      rect(420, 630, 340, 140);
      fill(#7dd8ff);
      rect(430, 640, 320, 120);
      
      fill(#004d6e);
      textSize(45);
      text("Master Mode", 440, 700);
      textSize(16);
      text("**Resets Normal Mode Progress**", 450, 730);
    }
    if (screen.equals("cashier")) {
      background(#edfbff);
      customerRight.show();
      customerLeft.show();
      notepad.show();
      //button to level select
      fill(255);
      rect(0,0,100,100);
      fill(0);
      textSize(30);
      text("Levels", 4, 50);
      textSize(15);
      text("(Current: " + level + ")", 4, 75);
      if (lvlEnd) {
        rectMode(CENTER);
        //window
        fill(255);
        stroke(0);
        rect(400, 400, 500, 300);
        //text on window
        fill(0);
        textSize(35);
        text("Money Earned: $" + moneyEarned, 215, 321);
        
        //button to level select
        fill(200);
        rect(400, 425, 300, 100);
        fill(0);
        textSize(25);
        text("Go to Level Select", 289, 425);
        
        rectMode(CORNER);
      }
    }
    if (screen.equals("sauce")) {
      noStroke();
      textSize(13);
      
      background(#fffff5);
      pizza.mainX = 400;
      pizza.mainY = 450;
      pizza.shrink = false;
      //sauce table
      fill(200);
      rect(0, height/5, width, height/2*1.2);
      
      //tomato sauce
      fill(#800505);
      rect(10, 170, 100, 100);
      fill(255);
      text("Tomato Sauce", 20, 200);
      
      //pesto sauce IF DAY 2 UNLOCKED
      if (level >= 2) {
        fill(#81b368);
        rect(10, 280, 100, 100);
        fill(255);
        text("Pesto Sauce", 20, 310);
      }
      
      //buffalo sauce IF DAY 3 UNLOCKED
      if (level >= 3) {
        fill(#ff7e33);
        rect(10, 390, 100, 100);
        fill(255);
        text("Buffalo Sauce", 20, 420);
      }
      
      //cheese
      fill(#f0e800);
      rect(120, 170, 100, 100);
      fill(0);
      text("Cheese", 140, 200);
      
      //pepperoni
      fill(#ff4d4d);
      rect(230, 170, 100, 100);
      fill(0);
      text("Pepperoni", 250, 200);
      
      //olives
      fill(#2e2e2e);
      rect(340, 170, 100, 100);
      fill(255);
      text("Olives", 360, 200);
      
      //mushroom IF DAY 2 UNLOCKED
      if (level >= 2) {
      fill(#736246);
      rect(450, 170, 100, 100);
      fill(255);
      text("Mushrooms", 470, 200);
      }
      
      //chicken IF DAY 3 UNLOCKED
      if (level >= 3) {
      fill(#dbbf8c);
      rect(560, 170, 100, 100);
      fill(0);
      text("Chicken", 580, 200);
      }
      
      //restart button
      fill(#ebdab9);
      rect(10, 544, 160, 60);
      fill(0);
      text("Restart Pizza", 30, 570);
      notepad.show();
      pizza.show();
    }
    if (screen.equals("oven")) {
      background(#fff0f4);
      //conveyor belt
      fill(#dbdbdb);
      rect(0, 300, 800, 200);
      //button to start oven
      fill(#8fbaff);
      rect(10,510,150,50);
      fill(0);
      text("Start Oven", 46, 540);
      

      pizza.shrink = true;
      pizza.show();
      oven.show();
      notepad.show();
    }
    
    if (screen.equals("selectLevels")) {
      background(255);
      
      //button to menu
      fill(#38c4ff);
      rect(600, 20, 150, 80);
      fill(#7dd8ff);
      rect(610, 30, 130, 60);
      
      fill(#004d6e);
      textSize(45);
      text("Menu", 615, 75);
      
      //reset progress button
      if (mode.equals("normal")) {
        fill(#e33434);
        rect(400, 20, 150, 80);
        
        fill(#5e0909);
        textSize(25);
        text("Reset", 440, 55);
        text("Progress", 425, 85);
      }
      
      //reset level itself button
      if (!lvlEnd) {
        fill(#ffbb00);
        rect(200, 20, 150, 80);
        
        fill(#a36f14);
        textSize(20);
        text("Reset", 240, 55);
        text("Current Level", 215, 85);
      }
      
      
      //back button to cashier if level not ended
      if (!lvlEnd) {
        fill(10);
        rect(100,0,100,100);
        fill(255);
        textSize(30);
        text("Back", 104, 50);
      }
      
      //level 1 box
      fill(200);
      rect(120,120,150,150);
      fill(0);
      textSize(30);
      text("Level 1", 135, 195);
      
      //level 2 box
      fill(200);
      rect(300,120,150,150);
      fill(0);
      textSize(30);
      if (lvlTwoUnlocked) text("Level 2", 315, 195);
      else text("Locked", 315, 195);
      
      
      //level 3 box
      fill(200);
      rect(480,120,150,150);
      fill(0);
      textSize(30);
      if (lvlThreeUnlocked) text("Level 3", 495, 195);
      else text("Locked", 495, 195);
      
      
      textSize(15);
    }
    
    if (!screen.equals("selectLevels") && !screen.equals("mainMenu")) screenButtons.show();
  }

  void addMoney(double money) {
    moneyEarned += money;
  }

  void setMoney(double money) {
    moneyEarned = money;
  }

  double getMoney() {
    return 0.0;
  }

  void addCustomer() {
    customerCounter++;
  }

  int getCustomerNum() {
    return customerCounter;
  }

  void newPizza() {
    pizza = new Pizza();
    oven = new Oven();
  }

  void levelEnds() {
    //if moneyEarned >= some threshold for next level then set boolean for next level to true,
    //println("level end is called");
    lvlEnd = true;
    if (level == 1) {
      //  TEMPORARILY JUST GREATER THAN $1 FOR TESTING PURPOSES
      if (moneyEarned >= 40) lvlTwoUnlocked = true;
    }
    else if (level == 2) {
      //  TEMPORARILY JUST GREATER THAN $1 FOR TESTING PURPOSES
      if (moneyEarned >= 45) lvlThreeUnlocked = true;
    }
  }
  
  //ACTIVATES AFTER USER IN LEVELENDS SCREEN CLICKS GO TO LEVELS BUTTON 
  void resetLevel() {
    changeScreen("selectLevels");
    //set everything to 0 and reinitialize all classes
    moneyEarned = 0;
    customerCounter = 0;
    customerRight = new Customer("right");
    customerLeft = new Customer("left");
    level = 0;
    customerThere = false;
    
    screenButtons = new Buttons();
    pizza = new Pizza();
    
    oven = new Oven();
    notepad = new Notepad();
  }
}
