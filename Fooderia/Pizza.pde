public class Pizza implements Things { 
  boolean sauceSelected;
  boolean cheeseSelected;
  boolean pepSelected;
  boolean olivesSelected;
  
  boolean sauceOn;
  boolean cheeseOn;
  boolean pepOn;
  boolean olivesOn;
  
  ArrayList<String> toppingList;
  
  String getType() {
    return "Pizza";
  }
  
  void show() {
    ellipseMode(CENTER);
    noStroke();
    fill(#ebdab9);
    ellipse(width/2, height/2 + 50, 350, 350);
    if (sauceOn) {
      ellipseMode(CENTER);
      noStroke();
      fill(#800505);
      ellipse(width/2, height/2 + 50, 300, 300);
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
  }
  //called in draw() and only does something if one of them is true
  //one them can only be true if toppingSelected is called in click
  void toppingDrag() {
    if (fooderia.getScreen().equals("sauce")) {
      if (sauceSelected) {
        noStroke();
        fill(#800505);
        ellipse(mouseX, mouseY, 10, 10);
      } else if (cheeseSelected) {
        noStroke();
        fill(#f0e800);
        ellipse(mouseX, mouseY, 10, 10);
      } else if (pepSelected) {
        noStroke();
        fill(#ff4d4d);
        ellipse(mouseX, mouseY, 10, 10);
      }
    }
  }

  //the topping boolean that is selected will be dropped on the pizza
  //dropping on the pizza means the whole pizza will be covered with that topping
  //then set boolean to false and add to arraylist of toppings
  //if no topping boolean is true, then holdPizza()
  void dropTopping() {
    sauceOn = false; cheeseOn = false; pepOn = false; olivesOn = false;
    if (sauceSelected) {
        sauceOn = true;
        sauceSelected = false;
        //intialize list later***********
        //toppingList.add("sauce");
    } else if (cheeseSelected) {
        cheeseOn = true;
        cheeseSelected = false;
        //toppingList.add("cheese");
    } else if (pepSelected) {
        pepOn = true;
        pepSelected = false;
        //toppingList.add("pepperoni");
    }
    if (sauceOn||cheeseOn||pepOn) show();
  }

  //makes toppings and pizza darker after being put in the oven
  void bakedTopping() {
  }

  //moves pizza while on conveyor belt to oven
  //when it moves right enough so that the belt ends:
  //call changeScreen(Cashier)
  //check which customer is selected, store the getPlace() for selected customer
  //call customerLeaves(cust.getIngredients())
  //if getCustomerNum() < 12 then construct new customer with same stored place
  // else levelEnds()
  void move() {
  }

  boolean holding;
  //if holding, then drop pizza and set holding false
  //if not holding, hold pizza and set holding true
  //hold refers to attach pizza and its toppingsto cursor
  void holdPizza() {
  }

  //returns toppingList
  ArrayList<String> getIngredients() {
    return toppingList;
  }

}
