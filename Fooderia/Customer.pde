public class Customer {
  String [] order;
  String[][] menu = {{"Cheese Pizza", "Marinara Sauce", "Cheese"}, {"Pepperoni Pizza", "Marinara Sauce", "Pepperoni"}, {"Olive Pizza", "Marinara Sauce", "Olives"}};
  boolean selected;
  String location;
  color c;
  int x, y;
  boolean moveIn, moveOut;

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
  }

  
}
