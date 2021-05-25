Game fooderia = new Game();
Buttons screenButtons = new Buttons();
Pizza pizza = new Pizza();

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
}

void mousePressed() {
  //calls takeOrder(), changeScreen(), toppingSelected(String toppingType) in toppings class, dropTopping() in toppings class, 
  //**make sure to distinguish toppings based on level
  
  //testing of changing screens below
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
  //testing of changing screens ends

}
