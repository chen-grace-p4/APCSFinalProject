Game fooderia = new Game();
Buttons screenButtons = new Buttons();

void setup() {
  //testing of changing screens below
  size(800, 800);
  background(255); 
  screenButtons.show();
}

void draw() {
  fooderia.checkScreen();
}

void mousePressed() {
  //calls takeOrder(), changeScreen(), toppingSelected(String toppingType) in toppings class, dropTopping() in toppings class, 
  //**make sure to distinguish toppings based on level
  
  //testing of changing screens below
  if (mouseX < 100 && mouseY < 100) {
    fooderia.changeScreen("cashier");  
  }
  else if (mouseX < 200 && mouseY < 100) {
    fooderia.changeScreen("sauce");  
  }
  else if (mouseX < 300 && mouseY < 100) {
    fooderia.changeScreen("oven");  
  }
  if (mouseX < 300 && mouseY <100) fooderia.checkScreen();  
  //testing of changing screens ends

}
