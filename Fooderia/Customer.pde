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
    {"Pesto Mushroom and Olive Pizza", "Pesto Sauce", "Cheese", "Mushrooms", "Olives"}, 
    {"Pesto Pepperoni and Mushroom Pizza", "Pesto Sauce", "Cheese", "Pepperoni", "Mushrooms"}, 
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
    {"Buffalo Mushroom and Olive Pizza", "Buffalo Sauce", "Cheese", "Mushrooms", "Olives"}, 
    {"Buffalo Pepperoni and Mushroom Pizza", "Buffalo Sauce", "Cheese", "Pepperoni", "Mushrooms"}, 
    {"Buffalo Pepperoni and Olive Pizza", "Buffalo Sauce", "Cheese", "Pepperoni", "Olives"}, 
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
  int x, y, rand, leavingTime;
  boolean ordercorrect, moveIn, moveOut;
  double price, sec, timeleft, totalTime;
  
  String custLetter;
  PImage cust;
  Customer(String location) {
    //RANDOMIZE LETTER FOR IMAGE HERE
    String[] letters = {"A", "B", "C", "D", "E"};
    int rand = (int) (Math.random()*5);
    custLetter = letters[rand];
    String custImage = "cust" + custLetter + ".png";
    cust = loadImage(custImage);
    leavingTime = 1000;
    c = 0;
    if (location.equals("right")) {
      x = 1000;
      y = 500;
    }
    if (location.equals("left")) {
      x = -200;
      y = 500;
    }
    totalTime = (int)(Math.random()*30) + 60;
    if (store!=null && store.cactusUse==true){
    totalTime += 5;
    }
    if (store != null && store.flowerUse==true){
    totalTime+=10;
    }
    if (store != null && store.catUse==true){
    totalTime+=15;
    }
    if (store != null && store.dogUse==true){
    totalTime+=20;
    }
    
    sec = (millis()/1000)+totalTime;
    moveIn = false;
    moveOut = false;
    selected = false;
        if (fooderia.level == 1) {
      rand = (int)(Math.random()*4);
    }
    if (fooderia.level == 2) {
      rand = (int)(Math.random()*13);
    }
    if (fooderia.level == 3) {
      rand = (int)(Math.random()*32);
    }

    order = menu[rand];
    //println(rand);
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
    if (rand>=13) {
      price = 7.50;
    }
    if (rand>=14) {
      price = 8.50;
    }
    if (rand>=18) {
      price = 9.50;
    }
    if (rand>=24) {
      price = 10.50;
    }
    if (rand>=27) {
      price = 10.00;
    }
    if (rand>=29) {
      price = 12.50;
    }
    if (rand>=30) {
      price = 11.50;
    }
    if (rand>=31) {
      price = 10.50;
    }

    this.location = location;
    customerComes(location);
    //println(order[0]);
  }

  void show() {
    if (!fooderia.lvlEnd) {
      fill(c);
      imageMode(CENTER);
      image(cust, x, y);
      //ellipse(x, y, 150, 250);
      //timeleft = (sec- millis()/1000);
  
  
      //Change font below: (needs to be in data directory)
      /*PFont mono = createFont("andalemo.ttf", 0);
       textFont(mono); */
     if (location.equals("right")){
      strokeWeight(5);
      for (int i = 0; i<((timeleft/totalTime)-.50)*20; i++) {
        stroke(255-25.5*i, 250, 0);
        line(x+100, y-50-5*i, x+120, y-50 - 5*i);
      }
      if ((timeleft/totalTime)>.5) {
        for (int i = 0; i <=10; i++) {
          stroke(color(255, 25.5*i, 0));
          line(x+100, y-5*i, x+120, y - 5*i);
        }
       }
      else {
        for (int i = 0; i <((timeleft/totalTime))*20; i++) {
          stroke(color(255, 25.5*i, 0));
          line(x+100, y-5*i, x+120, y - 5*i);
        }
      }
      stroke(0);
      noFill();
      rect(x+100, y-100, 20, 100);
      strokeWeight(1);
     }
     
     if (location.equals("left")){
     strokeWeight(5);
      for (int i = 0; i<((timeleft/totalTime)-.50)*20; i++) {
        stroke(255-25.5*i, 250, 0);
        line(x-120, y-50-5*i, x-100, y-50 - 5*i);
      }
      if ((timeleft/totalTime)>.5) {
        for (int i = 0; i <=10; i++) {
          stroke(color(255, 25.5*i, 0));
          line(x-120, y-5*i, x-100, y - 5*i);
        }
       }
      else {
        for (int i = 0; i <((timeleft/totalTime))*20; i++) {
          stroke(color(255, 25.5*i, 0));
          line(x-120, y-5*i, x-100, y - 5*i);
        }
      }
      stroke(0);
      noFill();
      rect(x-120, y-100, 20, 100);
      strokeWeight(1);
     }
     
     float ang = (float)(1-(timeleft/totalTime))*4.5;
     strokeWeight (5);
     line(x+15,y-105,x+25+ang, y-(2*ang)-103);    
     line(x-15,y-105,x-25-ang, y-(2*ang)-103);    

     strokeWeight(1); 
      if (moveOut) {
        if (getLocation()=="right")text("$" + price, x+50, y-150);
        if (getLocation()=="left")text("$"+price, x-100, y-150);
      } else {
        if (getLocation()=="right") {
          text(""+(timeleft), x+90, y-110);
          if (selected){
             text(order[0], x-100, y-150);
          }
        }
        if (getLocation()=="left") {
          text(""+(timeleft), x-125, y-110);
          if (selected){
           text(order[0], x-100, y-150);    
          }
        }
      }
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
    //println(ordercorrect);
    /////////////////////////////////

    if (ordercorrect==false || pizza.baked==false) {
      price = 0;
    }
    price = price * (timeleft/totalTime);
    price = (double)Math.round(price*100) /100;
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
