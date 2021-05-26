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

  void customerComes(String location) {
    moveIn = true;
  }
  
  boolean moveIn(){
    return moveIn;
  }
  
  boolean moveOut(){
    return moveOut;
  }
  
  void stopMoving(){
    moveIn = false;
    moveOut = false;
  } 
  
  
  void move(String direction){
    if (direction.equals("right")){
    x+=2;
    }
    if (direction.equals("left")){
    x-=2;
    }
  }  
  
  int getX(){
  return x;
  }
  
  String getLocation(){
    return location;
  }
  void show() {
    fill(c);
    ellipse(x, y, 155, 255);
  }
}
