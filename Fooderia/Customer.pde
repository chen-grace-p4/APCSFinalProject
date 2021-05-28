public class Customer {
  String [] order;
  String[][] menu = {{"Cheese Pizza", "Marinara Sauce", "Cheese"}, {"Pepperoni Pizza", "Marinara Sauce","Cheese", "Pepperoni"}, {"Olive Pizza", "Marinara Sauce", "Cheese", "Olives"},{"Pepperoni and Olive Pizza", "Marinara Sauce","Cheese", "Pepperoni", "Olives"}};
  boolean selected;
  String location;
  color c;
  int x, y;
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
    int rand = (int)(Math.random()*4);
   
    order = menu[rand];
    
    if (rand >= 0){
      price = 6.50; 
    }
    if (rand>=1){
      price = 8.00;
    }
    if (rand>=3){
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
    if (moveOut){
      if (getLocation()=="right")text("$" + price, x+50, y-150);
    if (getLocation()=="left")text("$"+price, x-100, y-150);
    }
    else {
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
    
    if (ordercorrect==false || pizza.baked==false){
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
  
  void selectedTrue(){
  selected = true;
  }
  void selectedFalse(){
  selected = false;
  }
}
