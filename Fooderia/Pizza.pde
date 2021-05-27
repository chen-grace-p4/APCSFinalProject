public class Pizza implements Things { 
  int mainX, mainY;
  
  boolean sauceSelected;
  boolean cheeseSelected;
  boolean pepSelected;
  boolean olivesSelected;
  
  boolean sauceOn;
  boolean cheeseOn;
  boolean pepOn;
  boolean olivesOn;
  
  boolean shrink;
  boolean baked;
  boolean moving;
  
  ArrayList<String> toppingList;
  
  Pizza() {
    toppingList = new ArrayList<String>();
    mainX = 400;
    mainY = 450;
  }
  
  String getType() {
    return "Pizza";
  }
  
  void show() {
    //MUST REMAKE USING X AND Y INSTANCE VARIABLES IN ORDER TO MOVE LATER
    ellipseMode(CENTER);
    noStroke();
    fill(#ebdab9);
    if (baked) fill(#f0c573);
    if (shrink) ellipse(mainX, mainY, 100, 100);
    else ellipse(mainX, mainY, 350, 350);
    
    if (sauceOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#800505);
      if (baked) fill(#a31010);
      if (shrink) ellipse(mainX, mainY, 80, 80);
      else ellipse(mainX, mainY, 300, 300);
    }
    if (cheeseOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#ffd829);
      if (baked) fill(#ffeb87);
      if (shrink) ellipse(mainX, mainY, 70, 70);
      else ellipse(mainX, mainY, 290, 290);
      //BELOW BROKEN BECAUSE SHOW RUNS EVERY DRAW
      //int minX = width/2 - 150;
      //int maxX = width/2 + 150;
      //int minY = height/2 - 150;
      //int maxY = height/2 + 150;
      //for (int i = 0; i < 100; i++) {
      //  int randomX = (int) (Math.random() * (maxX-minX+1)+minX);
      //  int randomY = (int) (Math.random() * (maxY-minY+1)+minY);
      //  fill(#f0e800);
      //  noStroke();
      //  ellipse(randomX, randomY, 3, 3);
      //}
    }
      
    if (pepOn) {
      //TEMP PEPPERONI IN A GRID
      if (shrink) {
        for (int y = mainY - 20; y < mainY+30; y += 10) {
          for (int x = mainX-20; x < mainX+30; x += 10) {
            ellipseMode(CENTER);
            noStroke();
            fill(#ff4d4d);
            if (baked) fill(#cc4141);
            ellipse(x, y, 6, 6);
          }
        }
      }
      else {
        for (int y = mainY - 100; y < mainY+117; y += 40) {
          for (int x = mainX-100; x < mainX+102; x += 40) {
            ellipseMode(CENTER);
            noStroke();
            fill(#ff4d4d);
            if (baked) fill(#cc4141);
            ellipse(x, y, 30, 30);
          }
        }
      }
    }
    
    if (olivesOn) {
      //TEMP OLIVES IN A GRID
      if (shrink) {
        for (int y = mainY - 20; y < mainY+30; y += 10) {
          for (int x = mainX-20; x < mainX+30; x += 10) {
            ellipseMode(CENTER);
            noStroke();
            fill(#545454);
            if (baked) fill(#2e2e2e);
            ellipse(x, y, 3, 3);
          }
        }
      }
      else {
        for (int y = mainY - 100; y < mainY+117; y += 40) {
          for (int x = mainX-100; x < mainX+102; x += 40) {
            ellipseMode(CENTER);
            noStroke();
            fill(#545454);
            if (baked) fill(#2e2e2e);
            ellipse(x, y, 20, 20);
          }
        }
      }
    }
  }
  
  
//first makes all booleans false, attach topping to cursor, make toppingtype
//selected = truse and attach that topping to the cursor
  void toppingSelected(String top) {
    sauceSelected = false;
    cheeseSelected = false;
    pepSelected = false;
    if (top.equals("sauce")) sauceSelected = true;
    if (top.equals("cheese")) cheeseSelected = true;
    if (top.equals("pep")) pepSelected = true;
    if (top.equals("olives")) olivesSelected = true;
  }
  //called in draw() and only does something if one of them is true
  //one them can only be true if toppingSelected is called in click
  void toppingDrag() {
    if (fooderia.getScreen().equals("sauce")) {
      if (sauceSelected) {
        noStroke();
        fill(#800505);
        ellipse(mouseX, mouseY, 20, 20);
      } else if (cheeseSelected) {
        noStroke();
        fill(#f0e800);
        ellipse(mouseX, mouseY, 20, 20);
      } else if (pepSelected) {
        noStroke();
        fill(#ff4d4d);
        ellipse(mouseX, mouseY, 20, 20);
      } else if (olivesSelected) {
        noStroke();
        fill(#545454);
        ellipse(mouseX, mouseY, 20, 20);
      }
    }
  }

  //the topping boolean that is selected will be dropped on the pizza
  //dropping on the pizza means the whole pizza will be covered with that topping
  //then set boolean to false and add to arraylist of toppings
  //if no topping boolean is true, then holdPizza()
  void dropTopping() {
    //sauceOn = false; cheeseOn = false; pepOn = false; olivesOn = false;
    if (sauceSelected) {
        sauceOn = true;
        sauceSelected = false;
        toppingList.add("Marinara Sauce");
    } else if (cheeseSelected) {
        cheeseOn = true;
        cheeseSelected = false;
        toppingList.add("Cheese");
    } else if (pepSelected) {
        pepOn = true;
        pepSelected = false;
        toppingList.add("Pepperoni");
    } else if (olivesSelected) {
        olivesOn = true;
        olivesSelected = false;
        toppingList.add("Olives");
    }
    if (sauceOn||cheeseOn||pepOn||olivesOn) show();
  }

  //makes toppings and pizza darker after being put in the oven
  void bakedTopping() {
    baked = true;
  }
  
  //moves pizza while on conveyor belt to oven
  //when it moves right enough so that the belt ends: call next()
  
  void move() {
    if (mainX <= 700) {
      moving = true;
      mainX += 2;
    } else {
      fooderia.changeScreen("cashier");
      next();
    }
  }
  
  //call changeScreen(Cashier)
  //check which customer is selected, store the getPlace() for selected customer
  //call customerLeaves(getIngredients())
  //if getCustomerNum() < 12 then construct new customer with same stored place
  // else levelEnds()
  void next() {
    if (customerRight.selected) {
      println(toppingList);
      customerRight.customerLeaves(toppingList);
      //if (fooderia.getCustomerNum() < 12) {
      //  customerRight = new Customer("right");
      //}
    }
    else if (customerLeft.selected) {
      println(toppingList);
      customerLeft.customerLeaves(toppingList);
      //if (fooderia.getCustomerNum() < 12) {
      //  customerLeft = new Customer("left");
      //}
    }
    
  }

  boolean holding;
  //if holding, then drop pizza and set holding false
  //if not holding, hold pizza and set holding true
  //hold refers to attach pizza and its toppingsto cursor
  void holdPizza() {
    //REQUIRES X AND Y INSTANCE VARIABLES + FIXED SHOW  
  }

  //returns toppingList
  ArrayList<String> getIngredients() {
    return toppingList;
  }

}
