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

  Game() {
    //things = new ArrayList<Things>();
    screen = "cashier"; //CHANGE TO MAIN MENU LATER ON
    moneyEarned = 0;
    customerCounter = 0;
    level = 1;
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
    if (screen.equals("cashier")) {
      background(#edfbff);
      customerRight.show();
      customerLeft.show();
      notepad.show();
      if (lvlEnd) {
        rectMode(CENTER);
        fill(255);
        stroke(0);
        rect(400, 400, 500, 300);
        fill(0);
        textSize(35);
        text("Money Earned: $" + moneyEarned, 215, 321);
        
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
      //restart button
      fill(#ebdab9);
      rect(10, 300, 100, 300);
      fill(0);
      text("Restart Pizza", 20, 350);
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
    }
    
    if (screen.equals("menu")) {
      
    }
    
    if (!screen.equals("selectLevels") && !screen.equals("menu")) screenButtons.show();
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
    lvlEnd = true;
    if (level == 1) {
      //  TEMPORARILY JUST GREATER THAN $1 FOR TESTING PURPOSES
      if (moneyEarned > 1) lvlTwoUnlocked = true;
    }
    else if (level == 2) {
      //  TEMPORARILY JUST GREATER THAN $1 FOR TESTING PURPOSES
      if (moneyEarned > 1) lvlThreeUnlocked = true;
    }
  }
  
  //ACTIVATES AFTER USER IN LEVELENDS SCREEN CLICKS GO TO LEVELS BUTTON 
  void resetLevel() {
    changeScreen("selectLevels");
    //set everything to 0 and reinitialize all classes
    moneyEarned = 0;
    customerCounter = 0;
    
    screenButtons = new Buttons();
    pizza = new Pizza();
    customerRight = new Customer("right");
    customerLeft = new Customer("left");
    oven = new Oven();
    notepad = new Notepad();
  }
}
