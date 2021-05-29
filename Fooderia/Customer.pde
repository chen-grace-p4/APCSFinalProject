public class Customer {
  String [] order;
  String[][] menu = {{"Cheese Pizza", "Marinara Sauce", "Cheese"}, 
    {"Pepperoni Pizza", "Marinara Sauce", "Cheese", "Pepperoni"}, 
    {"Olive Pizza", "Marinara Sauce", "Cheese", "Olives"}, 
    {"Pepperoni and Olive Pizza", "Marinara Sauce", "Cheese", "Pepperoni", "Olives"}, 

    {"Pesto Cheese Pizza", "Pesto Sauce", "Cheese"}, 
    {"Pesto Pepperoni Pizza", "Pesto Sauce", "Cheese", "Pepperoni"}, 
    {"Pesto Olive Pizza", "Pesto Sauce", "Cheese", "Olives"}, 
    {"Pesto Mushroom Pizza", "Pesto Sauce", "Cheese", "Mushrooms"},
    {"Pesto Mushroom and Olive Pizza", "Pesto Sauce", "Cheese", "Mushroom", "Olives"}, 
    {"Pesto Pepperoni and Mushroom Pizza", "Pesto Sauce", "Cheese", "Pepperoni", "Mushroom"}, 
    {"Pesto Pepperoni and Olive Pizza", "Pesto Sauce", "Cheese", "Pepperoni", "Olives"}, 
    {"POM Pizza", "Marinara Sauce", "Cheese", "Pepperoni", "Olives", "Mushrooms"}, 
    {"Pesto POM Pizza", "Pesto Sauce", "Cheese", "Pepperoni", "Olives", "Mushrooms"},

    {"Buffalo Sauce Pizza", "Buffalo Sauce", "Cheese"}, 
    {"Buffalo Pepperoni Pizza", "Buffalo Sauce", "Cheese", "Pepperoni"}, 
    {"Buffalo Olive Pizza", "Buffalo Sauce", "Cheese", "Olives"}, 
    {"Buffalo Mushroom Pizza", "Buffalo Sauce", "Cheese", "Mushrooms"}, 
    {"Buffalo Chicken Pizza", "Buffalo Sauce", "Cheese", "Chicken"}, 
    {"Buffalo Pepperoni and Chicken Pizza", "Buffalo Sauce", "Cheese", "Pepperoni", "Chicken"}, 
    {"Buffalo Olive and Chicken Pizza", "Buffalo Sauce", "Cheese", "Chicken", "Olives"}, 
    {"Buffalo Mushroom and Chicken Pizza", "Buffalo Sauce", "Cheese", "Mushrooms", "Chicken"}, 
    {"Buffalo Mushroom and Olive Pizza", "Pesto Sauce", "Cheese", "Mushrooms", "Olives"}, 
    {"Buffalo Pepperoni and Mushroom Pizza", "Pesto Sauce", "Cheese", "Pepperoni", "Mushrooms"}, 
    {"Buffalo Pepperoni and Olive Pizza", "Pesto Sauce", "Cheese", "Pepperoni", "Olives"}, 
    {"Buffalo POM Pizza", "Buffalo Sauce", "Cheese", "Pepperoni", "Olives", "Mushrooms"}, 
    {"Buffalo MCP Pizza", "Buffalo Sauce", "Cheese", "Mushrooms", "Chicken", "Pepperoni" }, 
    {"Buffalo COM Pizza", "Buffalo Sauce", "Cheese", "Chicken", "Olives", "Mushrooms" }, 
    {"Pesto MCP Pizza", "Pesto Sauce", "Cheese", "Mushrooms", "Chicken", "Pepperoni" }, 
    {"Pesto COM Pizza", "Pesto Sauce", "Cheese", "Chicken", "Olives", "Mushrooms" }, 
    {"Buffalo Deluxe Pizza", "Buffalo Sauce", "Cheese", "Chicken", "Olives", "Mushrooms", "Pepperoni" }, 
    {"Pesto Deluxe Pizza", "Pesto Sauce", "Cheese", "Chicken", "Olives", "Mushrooms", "Pepperoni" }, 
    {"Regular Deluxe Pizza", "Marinara Sauce", "Cheese", "Chicken", "Olives", "Mushrooms", "Pepperoni" }};



  boolean selected;
  String location;
  color c;
  int x, y, rand;
  boolean ordercorrect, moveIn, moveOut;
  float price;

  Customer(String location) {
    c = 0;
    if (location.equals("right")) {
      x = 1000;
      y = 500;
    }
    if (location.equals("left")) {
      x = -200;
      y = 500;
    }
    moveIn = false;
    moveOut = false;
    selected = false;
    println("level is" + fooderia.level);
    if (fooderia.level == 1){
      rand = (int)(Math.random()*4);
    }
    if (fooderia.level == 2){
      rand = (int)(Math.random()*13);
    }
    if (fooderia.level == 3){
      rand = (int)(Math.random()*32);
    }

    order = menu[rand];
    println(rand);
    if (rand >= 0) {
      price = 6.50;
    }
    if (rand>=1) {
      price = 7.50;
    }
    if (rand>=3) {
      price = 8.50;
    }
    if (rand>=4) {
      price = 7.00;
    }
    if (rand>=5) {
      price = 8.00;
    }
    if (rand>=8) {
      price = 9.00;
    }
    if (rand>=11) {
      price = 9.50;
    }
    if (rand>=12) {
      price = 10.00;
    }
    if (rand>=13){
      price = 7.50;
    }
    if (rand>=14){
    price = 8.50;
    }
    if (rand>=18){
    price = 9.50;
    }
    if (rand>=24){
    price = 10.50;
    }
    if (rand>=27){
    price = 10.00;
    }
    if (rand>=29){
    price = 12.50;
    }
    if (rand>=30){
    price = 11.50;
    }
    if (rand>=31){
    price = 10.50;
    }
    
    this.location = location;
    customerComes(location);
    println(order[0]);
  }

  void show() {
    fill(c);
    ellipse(x, y, 150, 250);
    //Change font below: (needs to be in data directory)
    /*PFont mono = createFont("andalemo.ttf", 0);
     textFont(mono); */
    if (moveOut) {
      if (getLocation()=="right")text("$" + price, x+50, y-150);
      if (getLocation()=="left")text("$"+price, x-100, y-150);
    } else {
      if (getLocation()=="right")text(order[0], x+50, y-150);
      if (getLocation()=="left")text(order[0], x-100, y-150);
    }
  }

  void move(String direction) {
    if (direction.equals("right")) {
      x+=2;
    }
    if (direction.equals("left")) {
      x-=2;
    }
  }  

  void customerComes(String location) {
    moveOut = false;
    moveIn = true;
    fooderia.addCustomer();
  }

  void customerLeaves(ArrayList ingredients) {
    //////////////////////// Code below checks if the order is correct:

    ordercorrect = true;

    for (int i = 1; i<order.length; i++) {
      if (ingredients.indexOf(order[i])<0) {
        ordercorrect = false;
      }
    }

    for (int i = 0; i<ingredients.size(); i++) {
      boolean ingredientcorrect = false;
      for (int j = 1; j<order.length; j++) {
        if (ingredients.get(i).equals(order[j])) {
          ingredientcorrect = true;
        }
      }

      if (ingredientcorrect == false) {
        ordercorrect = false;
      }
    }
    println(ordercorrect);
    /////////////////////////////////

    if (ordercorrect==false || pizza.baked==false) {
      price = 0;
    }
    fooderia.addMoney(price);

    moveIn = false;
    moveOut = true;
  }
  //getOrder() IS JUST FOR TESTING PURPOSES
  ArrayList getOrder() {
    ArrayList ans = new ArrayList();
    for (int i = 1; i<order.length; i++) {
      ans.add(order[i]);
    }
    return ans;
  }

  boolean moveIn() {
    return moveIn;
  }

  boolean moveOut() {
    return moveOut;
  }

  void stopMoving() {
    moveIn = false;
    moveOut = false;
  } 




  int getX() {
    return x;
  }

  String getLocation() {
    return location;
  }

  boolean isSelected() {
    return selected;
  }

  void selectedTrue() {
    selected = true;
  }
  void selectedFalse() {
    selected = false;
  }
}
