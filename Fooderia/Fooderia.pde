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
  if (fooderia.getScreen().equals("sauce"))pizza.toppingDrag();
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
  if (fooderia.getScreen().equals("sauce")) {
    if (mouseX > 10 && mouseX < 110 && mouseY > 170 && mouseY < 270) {
      pizza.toppingSelected("sauce");
    }
    int x = width/2;
    int y = height/2;
    float inside = (mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY-y);
    double dist = Math.sqrt(inside);
    if (dist < 175) pizza.dropTopping();
  }
}
