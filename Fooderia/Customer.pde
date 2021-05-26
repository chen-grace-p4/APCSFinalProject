public class Customer {
  String [] order;
  String[][] menu = {{"Cheese Pizza", "Marinara Sauce", "Cheese"}, {"Pepperoni Pizza", "Marinara Sauce", "Pepperoni"}, {"Olive Pizza", "Marinara Sauce", "Olives"}};
  boolean selected;
  String location;
  color c;
  int x, y;
  boolean moveIn, moveOut, ordercorrect;

  Customer(String location) {
    c = 0;
    if (location.equals("right")) {
      x = 900;
      y = 500;
    }
    if (location.equals("left")) {
      x = -100;
      y = 500;
    }
    moveIn = false;
    moveOut = false;
    int rand = (int)(Math.random()*3);
    order = menu[rand];
    this.location = location;
    customerComes(location);
    println(order[0]);
  }

  void show() {
    fill(c);
    ellipse(x, y, 150, 250);
    if (getLocation()=="right")text(order[0], x+100, y-150);
    if (getLocation()=="left")text(order[0], x-100, y-150);
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
  }

  void customerLeaves(ArrayList ingredients) {
    //////////////////////// Code below checks if the order is correct:
    
    ordercorrect = true;
    for (int i = 1; i<order.length-1; i++) {
      if (ingredients.indexOf(order[i])<0) {
        ordercorrect = false;
      }
    }
    for (int i = 0; i<ingredients.size(); i++) {
      boolean ingredientcorrect = false;
      for (int j = 1; j<order.length-1; j++) {
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
    moveIn = false;
    moveOut = true;
    
    
  }
  //getOrder() IS JUST FOR TESTING PURPOSES
  ArrayList getOrder() {
    ArrayList ans = new ArrayList();
    for (int i = 1; i<order.length-1; i++) {
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
}
