Game fooderia = new Game();
Buttons screenButtons = new Buttons();
Pizza pizza = new Pizza();
Customer customerRight = new Customer("right");
Customer customerLeft = new Customer("left");

//for testing purposes 
int mousex, mousey;
//

void setup() {
  //testing of changing screens below
  size(800, 800);
  background(255); 
  screenButtons.show();

}

void draw() {
  fooderia.checkScreen();
  //TESTING PURPOSES
  mousex = mouseX;
  mousey = mouseY;
  text(mousex + ", " + mousey, width-70, 125);
  //
  if (fooderia.getScreen().equals("sauce"))pizza.toppingDrag();
  
  ///////////////////////////////////////////Code below is responsible for customers coming in:
  if (customerRight.moveIn()==true){
      if (customerRight.getX()>600){
        customerRight.move("left");
        
      }
      else{
        customerRight.stopMoving();
      }
  }
    if (customerLeft.moveIn()==true){
      if (customerLeft.getX()<200){
        customerLeft.move("right");
        
      }
      else{
        customerLeft.stopMoving();
      }
  }
  
  //////////////////////////////////////////////////////////
 
  
}

void mousePressed() {
  //calls takeOrder(), changeScreen(), toppingSelected(String toppingType) in toppings class, dropTopping() in toppings class, 
  //**make sure to distinguish toppings based on level
  //changing screens
  if (mouseX > width-100 && mouseY < 100) {
    fooderia.changeScreen("oven");  
  }
  else if (mouseX > width-200 && mouseY < 100) {
    fooderia.changeScreen("sauce");  
  }
  else if (mouseX > width-300 && mouseY < 100) {
    fooderia.changeScreen("cashier");  
  }
  if (mouseX > width-300 && mouseY <100) fooderia.checkScreen();  
  
  //toppings station/sauce screen
  if (fooderia.getScreen().equals("cashier")) {
     //JUST FOR TESTING PURPOSES
     customerRight.customerLeaves(customerRight.getOrder());
    } 
    
  if (fooderia.getScreen().equals("sauce")) {
    if (mouseX > 10 && mouseX < 110 && mouseY > 170 && mouseY < 270) {
      pizza.toppingSelected("sauce");
    } 
    else if (mouseX > 120 && mouseX < 220 && mouseY > 170 && mouseY < 270) {
      pizza.toppingSelected("cheese");
    }
    else if (mouseX > 230 && mouseX < 330 && mouseY > 170 && mouseY < 270) {
      pizza.toppingSelected("pep");
    }
    int x = width/2;
    int y = height/2;
    float inside = (mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY-y);
    double dist = Math.sqrt(inside);
    if (dist < 175) pizza.dropTopping();
  }
}
