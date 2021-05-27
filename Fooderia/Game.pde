public class Game {
  //ArrayList<Things> things;
  String screen;
  double moneyEarned;
  int customerCounter;

  Game() {
    //things = new ArrayList<Things>();
    screen = "cashier";
    moneyEarned = 0;
    customerCounter = 0;
  }

  String getScreen() {
    return screen;
  }

  void changeScreen(String screenName) {
    // to change the background/which items are hidden or visible (call hide() method for each object) based on button pressed
    screen = screenName;
    if (screenName.equals("oven") && !oven.moveOn) {
      pizza.mainX = 60;
      pizza.mainY = 390;
    }
  }
  void checkScreen() {
    //basic testing of changing screen below, will add more for each screen later
    if (screen.equals("cashier")) {
      background(#edfbff);
      customerRight.show();
      customerLeft.show();
      notepad.show();
    }
    if (screen.equals("sauce")) {
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

      pizza.shrink = true;
      pizza.show();
      oven.show();
      notepad.show();
    }
    screenButtons.show();
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
  }

  void levelEnds() {
    //clear arraylist of objects, show total moneyEarned,
    //if moneyEarned >= some threshold for next level then set boolean for next level to true,
    //setMoney to 0, set customerCounter to 0
  }
}
