public class Pizza implements Things { 
  int mainX, mainY;
  PImage pep;
  PImage bakedpep;
  
  PImage olives;
  PImage bakedolives;
  
  PImage mushrooms;
  PImage bakedmushrooms;
  
  PImage chicken;
  PImage bakedchicken;
  
  boolean sauceSelected;
  boolean cheeseSelected;
  boolean pepSelected;
  boolean olivesSelected;
  //unlocked day 2
  boolean mushroSelected;
  boolean pestoSauceSelected;
  //unlocked day 3
  boolean chickenSelected;
  boolean buffSauceSelected; 
  
  boolean sauceOn;
  boolean cheeseOn;
  boolean pepOn;
  boolean olivesOn;
  //unlocked day 2
  boolean mushroOn;
  boolean pestoSauceOn;
  //unlocked day 3
  boolean chickenOn;
  boolean buffSauceOn; 
  
  boolean shrink;
  boolean baked;
  boolean moving;
  
  ArrayList<String> toppingList;
  
  Pizza() {
    toppingList = new ArrayList<String>();
    mainX = 400;
    mainY = 450;
    
    pep = loadImage("pepperoni.png");
    olives = loadImage("olives.png");
    mushrooms = loadImage("mushrooms.png");
    chicken = loadImage("chicken.png");
    
    bakedpep = loadImage("bakedpep.png");
    bakedolives = loadImage("bakedolives.png");
    bakedmushrooms = loadImage("bakedmushrooms.png");
    bakedchicken = loadImage("bakedchicken.png");
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
      if (baked) fill(#95ba82);
      if (shrink) ellipse(mainX, mainY, 170, 170);
      else ellipse(mainX, mainY, 300, 300);
    } 
    //UNLOCKS DAY 3
    if (buffSauceOn){
      ellipseMode(CENTER);
      noStroke();
      fill(#ff7e33);
      if (baked) fill(#de651f);
      if (shrink) ellipse(mainX, mainY, 170, 170);
      else ellipse(mainX, mainY, 300, 300);
    }
    if (cheeseOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#ffeb87);
      if (baked) fill(#ffd829);
      if (shrink) ellipse(mainX, mainY, 160, 160);
      else ellipse(mainX, mainY, 290, 290);
    }
      
    if (pepOn) {
      if (shrink) {
        if (baked) {
          imageMode(CENTER);
          image(bakedpep, mainX, mainY, 190, 190);
        } else {
          imageMode(CENTER);
          image(pep, mainX, mainY, 190, 190);
        }
      }
      else {
        if (baked) {
          imageMode(CENTER);
          image(bakedpep, mainX, mainY, 340, 340);
        } else {
          imageMode(CENTER);
          image(pep, mainX, mainY, 340, 340);
        }
      }
    }
    
    if (olivesOn) {
      if (shrink) {
        if (baked) {
          imageMode(CENTER);
          image(bakedolives, mainX, mainY, 190, 190);
        } else {
          imageMode(CENTER);
          image(olives, mainX, mainY, 190, 190);
        }
      }
      else {
        if (baked) {
          imageMode(CENTER);
          image(bakedolives, mainX, mainY, 340, 340);
        } else {
          imageMode(CENTER);
          image(olives, mainX, mainY, 340, 340);
        }

      }
    }
    
    if (mushroOn) {
      if (shrink) {
        if (baked) {
          imageMode(CENTER);
          image(bakedmushrooms, mainX, mainY, 190, 190);
        } else {
          imageMode(CENTER);
          image(mushrooms, mainX, mainY, 190, 190);
        }
      }
      else {
        if (baked) {
          imageMode(CENTER);
          image(bakedmushrooms, mainX, mainY, 340, 340);
        } else {
          imageMode(CENTER);
          image(mushrooms, mainX, mainY, 340, 340);
        }
      }
    }
    
    if (chickenOn) {
      if (shrink) {
        if (baked) {
          imageMode(CENTER);
          image(bakedchicken, mainX, mainY, 190, 190);
        } else {
          imageMode(CENTER);
          image(chicken, mainX, mainY, 190, 190);
        }
      }
      else {
        if (baked) {
          imageMode(CENTER);
          image(bakedchicken, mainX, mainY, 340, 340);
        } else {
          imageMode(CENTER);
          image(chicken, mainX, mainY, 340, 340);
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
    olivesSelected = false;
    pestoSauceSelected = false;
    buffSauceSelected = false;
    chickenSelected = false;
    mushroSelected = false;
    if (top.equals("sauce")) sauceSelected = true;
    else if (top.equals("cheese")) cheeseSelected = true;
    else if (top.equals("pep")) pepSelected = true;
    else if (top.equals("olives")) olivesSelected = true;
    else if (top.equals("pesto")) pestoSauceSelected = true;
    else if (top.equals("buffalo")) buffSauceSelected = true;
    else if (top.equals("chicken")) chickenSelected = true;
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
      } else if (mushroSelected) {
        noStroke();
        fill(#736246);
        ellipse(mouseX, mouseY, 20, 20);
      } else if (chickenSelected) {
        noStroke();
        fill(#dbbf8c);
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
        pestoSauceOn = false;
        buffSauceOn = false;
        
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
        sauceOn = false;
        buffSauceOn = false;
        
        pestoSauceSelected = false;
        if (!baked) toppingList.add("Pesto Sauce");
    } else if (buffSauceSelected) {
        buffSauceOn = true;
        sauceOn = false;
        pestoSauceOn = false;
        
        buffSauceSelected = false;
        if (!baked) toppingList.add("Buffalo Sauce");
    } else if (mushroSelected) {
      mushroOn = true;
      mushroSelected = false;
      if (!baked) toppingList.add("Mushrooms");
    } else if (chickenSelected) {
      chickenOn = true;
      chickenSelected = false;
      if (!baked) toppingList.add("Chicken");
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
      moving = false;
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
      //println(toppingList);
      customerRight.customerLeaves(toppingList);
    }
    else if (customerLeft.selected) {
      //println(toppingList);
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
