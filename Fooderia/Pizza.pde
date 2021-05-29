public class Pizza implements Things { 
  int mainX, mainY;
  
  boolean sauceSelected;
  boolean cheeseSelected;
  boolean pepSelected;
  boolean olivesSelected;
  //unlocked day 2
  boolean onionsSelected;
  boolean pestoSauceSelected;
  //unlocked day 3
  boolean mushroSelected;
  boolean buffSauceSelected; 
  
  boolean sauceOn;
  boolean cheeseOn;
  boolean pepOn;
  boolean olivesOn;
  //unlocked day 2
  boolean onionsOn;
  boolean pestoSauceOn;
  //unlocked day 3
  boolean mushroOn;
  boolean buffSauceOn; 
  
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
    if (shrink) ellipse(mainX, mainY, 200, 200);
    else ellipse(mainX, mainY, 350, 350);
    
    if (sauceOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#800505);
      if (baked) fill(#a31010);
      if (shrink) ellipse(mainX, mainY, 170, 170);
      else ellipse(mainX, mainY, 300, 300);
    } 
    // UNLOCKS DAY 2 
    if (pestoSauceOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#81b368);
      if (baked) fill(#a31010);
      if (shrink) ellipse(mainX, mainY, 170, 170);
      else ellipse(mainX, mainY, 300, 300);
    } 
    //UNLOCKS DAY 3
    if (buffSauceOn){
      ellipseMode(CENTER);
      noStroke();
      fill(#ff7e33);
      if (baked) fill(#a31010);
      if (shrink) ellipse(mainX, mainY, 170, 170);
      else ellipse(mainX, mainY, 300, 300);
    }
    if (cheeseOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#ffd829);
      if (baked) fill(#ffeb87);
      if (shrink) ellipse(mainX, mainY, 160, 160);
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
        for (int y = mainY - 60; y < mainY+70; y += 20) {
          for (int x = mainX- 60; x < mainX+70; x += 20) {
            ellipseMode(CENTER);
            noStroke();
            fill(#ff4d4d);
            if (baked) fill(#cc4141);
            ellipse(x, y, 15, 15);
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
        for (int y = mainY - 60; y < mainY+70; y += 20) {
          for (int x = mainX- 60; x < mainX+70; x += 20) {
            ellipseMode(CENTER);
            noStroke();
            fill(#545454);
            if (baked) fill(#2e2e2e);
            ellipse(x, y, 10, 10);
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
    else if (top.equals("cheese")) cheeseSelected = true;
    else if (top.equals("pep")) pepSelected = true;
    else if (top.equals("olives")) olivesSelected = true;
    else if (top.equals("pesto")) pestoSauceSelected = true;
    else if (top.equals("buffalo")) buffSauceSelected = true;
    else if (top.equals("onions")) onionsSelected = true;
    else if (top.equals("mushrooms")) mushroSelected = true;
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
      } else if (pestoSauceSelected) {
        noStroke();
        fill(#81b368);
        ellipse(mouseX, mouseY, 20, 20);
      } else if (buffSauceSelected) {
        noStroke();
        fill(#ff7e33);
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
        if (!baked) toppingList.add("Marinara Sauce");
    } else if (cheeseSelected) {
        cheeseOn = true;
        cheeseSelected = false;
        if (!baked) toppingList.add("Cheese");
    } else if (pepSelected) {
        pepOn = true;
        pepSelected = false;
        if (!baked) toppingList.add("Pepperoni");
    } else if (olivesSelected) {
        olivesOn = true;
        olivesSelected = false;
        if (!baked) toppingList.add("Olives");
    } else if (pestoSauceSelected) {
        pestoSauceOn = true;
        pestoSauceSelected = false;
        if (!baked) toppingList.add("Pesto Sauce");
    } else if (buffSauceSelected) {
        buffSauceOn = true;
        buffSauceSelected = false;
        if (!baked) toppingList.add("Buffalo Sauce");
    }
    //if (sauceOn||cheeseOn||pepOn||olivesOn) show();
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
      if (mainX > 400) baked = true;
      mainX += 2;
    } else {
      //fooderia.changeScreen("cashier");
      //next();
      oven.moveOn = true;
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
    }
    else if (customerLeft.selected) {
      println(toppingList);
      customerLeft.customerLeaves(toppingList);
    }
    fooderia.newPizza();
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
