public class Pizza implements Things {
  String getType() {
    return "Pizza";
  }
  void show() {
  }
  
  boolean sauceSelected;
  boolean cheeseSelected;
  boolean pepSelected;
  boolean olivesSelected;
  
  ArrayList<String> toppingList;

//first makes all booleans false, attach topping to cursor, make toppingtype
//selected = truse and attach that topping to the cursor
  void toppingSelected(String toppingType) {
  }

  //the topping boolean that is selected will be dropped on the pizza
  //dropping on the pizza means the whole pizza will be covered with that topping
  //then set boolean to false and add to arraylist of toppings
  //if no topping boolean is true, then holdPizza()
  void dropTopping() {
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
