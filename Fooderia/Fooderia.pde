Game fooderia = new Game();

void setup() {
  //testing of changing screens below
  size(800, 800);
  background(255); 
  
  //will change below to a show method of an object later
  noStroke();
  fill(255);
  rect(0,0,100,100);
  fill(200);
  rect(100,0,100,100);
  fill(150);
  rect(200,0,100,100);
  //testing of changing screens ends
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
