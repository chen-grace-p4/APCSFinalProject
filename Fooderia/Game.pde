public class Game {
  ArrayList<Things> things;
  String screen;
  double moneyEarned;
  int customerCounter;
  
  Game() {
    things = new ArrayList<Things>();
    screen = "cashier";
    moneyEarned = 0;
    customerCounter = 0;
  }
  
  void changeScreen(String screenName) {
  // to change the background/which items are hidden or visible (call hide() method for each object) based on button pressed
    screen = screenName;
  }
  void checkScreen() {
    //basic testing of changing screen below, will add more for each screen later
    if (screen.equals("cashier")) background(100, 0, 0);
    if (screen.equals("sauce")) background(0, 100, 0);
    if (screen.equals("oven")) background(0, 0, 100);
    
    //will change below to a show method of an object later
    noStroke();
    fill(255);
    rect(0,0,100,100);
    fill(200);
    rect(100,0,100,100);
    fill(150);
    rect(200,0,100,100);
  }
  
  void addMoney(double money) {
  }
  
  void setMoney(double money) {
  }
  
  double getMoney() {
    return 0.0;
  }
  
  void addCustomer() {
  }
  
  int getCustomerNum() {
    return 0;
  }
  
  void levelEnds() {
    //clear arraylist of objects, show total moneyEarned, 
    //if moneyEarned >= some threshold for next level then set boolean for next level to true, 
    //setMoney to 0, set customerCounter to 0 
  }
}
