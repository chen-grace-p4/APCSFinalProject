Game fooderia = new Game();
Buttons screenButtons = new Buttons();
Pizza pizza = new Pizza();
Customer customerRight = new Customer("right");
Customer customerLeft = new Customer("left");
Oven oven = new Oven();
Notepad notepad = new Notepad();

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
  //mousex = pizza.mainX;
  //mousey = pizza.mainY;
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
  //for oven scene
  if (fooderia.getScreen().equals("oven")) {
    //if (pizza.shrink) {
      //SOME WAY TO PAUSE HERE?
      if (oven.startMove) pizza.move();
    //}
      oven.afterBake();
      oven.light();
  }

   ///////////////////////////////////////////Code below is responsible for customers movingout:
  if (customerRight.moveOut()==true){
      if (customerRight.getX()<900){
        customerRight.move("right");

      }
      else{
        customerRight.stopMoving();
        //TEMP LESS THAN 1 FOR TESTING
        if (fooderia.getCustomerNum() < 1) {
          println(fooderia.getCustomerNum()); //DEBUG
          customerRight = new Customer("right");
        } else {
          if (fooderia.customerThere == false) {
            fooderia.customerThere = true;
            fooderia.levelEnds();
          }
        }
      }
  }
    if (customerLeft.moveOut()==true){
      if (customerLeft.getX()>-100){
        println(fooderia.getCustomerNum()); //DEBUG
        customerLeft.move("left");

      }
      else{
        customerLeft.stopMoving();
        //TEMP LESS THAN 1 FOR TESTING
        if (fooderia.getCustomerNum() < 1) {
          customerLeft = new Customer("left");
        } else {
          if (fooderia.customerThere == false) {
            fooderia.customerThere = true;
            fooderia.levelEnds();
          }
        }
      }
  }

  //////////////////////////////////////////////////////////
}

void mousePressed() {
  //calls takeOrder(), changeScreen(), toppingSelected(String toppingType) in toppings class, dropTopping() in toppings class,
  //**make sure to distinguish toppings based on level
  //changing screens
  if (!fooderia.screen.equals("selectLevels") && !fooderia.screen.equals("menu")) {
    if (mouseX > width-100 && mouseY < 100) {
      fooderia.changeScreen("oven");
    }
    else if (mouseX > width-200 && mouseY < 100) {
      fooderia.changeScreen("sauce");
    }
    else if (mouseX > width-300 && mouseY < 100) {
      fooderia.changeScreen("cashier");
    }
  }
  
  if (fooderia.screen.equals("selectLevels")) {
    if (!fooderia.lvlEnd && mouseX > 100 && mouseX < 200 && mouseY < 100) {
      fooderia.changeScreen("cashier");
    }
    
    //*****ADDITIONAL FEATURE?
    //MAYBE MAKE IT SO THAT IF UR CLICKING THE LEVEL UR PLAYING RIGHT NOW, THE GAME ASKS IF U WANT TO 
    //^^RESET THE DAY AND IF THE PLAYER CLICKS YES, THEN IT RESETS THE LEVEL FOR THE SAME DAY
    
    //level 1 button
    if (mouseX > 120 && mouseX < 270 && mouseY > 120 && mouseY < 270) {
      //if a level is played but level is not 1 or if level is not being played and level = 0
      if (fooderia.level != 1) {
        fooderia.resetLevel();
        fooderia.level = 1;
        fooderia.lvlEnd = false;
        fooderia.changeScreen("cashier");
      }
    }
    //level 2 button
    if (mouseX > 300 && mouseX < 450 && mouseY > 120 && mouseY < 270) {
      if (fooderia.lvlTwoUnlocked) {
        if (fooderia.level != 2) {
          fooderia.resetLevel();
          fooderia.level = 2;
          fooderia.lvlEnd = false;
          fooderia.changeScreen("cashier");
        }
      }
    }
    
    //level 3 button
    if (mouseX > 480 && mouseX < 630 && mouseY > 120 && mouseY < 270) {
      if (fooderia.lvlThreeUnlocked) {
        if (fooderia.level != 3) {
          fooderia.resetLevel();
          fooderia.level = 3;
          fooderia.lvlEnd = false;
          fooderia.changeScreen("cashier");
        }
      }
    }
  }
  
  
  if (mouseX > width-300 && mouseY <100) fooderia.checkScreen();

  //toppings station/sauce screen
  if (fooderia.getScreen().equals("cashier")) { 
       if (mouseX > 525 && mouseX < 675 && mouseY > 375 && mouseY < 625) {
         //JUST FOR TESTING PURPOSES
         //customerRight.customerLeaves(customerRight.getOrder());
         notepad.takeOrder(customerRight);
      }
      if (mouseX > 125 && mouseX < 275 && mouseY > 375 && mouseY < 625) {
        //JUST FOR TESTING PURPOSES
         //customerLeft.customerLeaves(customerLeft.getOrder());
         notepad.takeOrder(customerLeft);
      }
      if (mouseX < 100 && mouseY < 100) {
        fooderia.changeScreen("selectLevels");
      }
      
      if (fooderia.lvlEnd) {
        if (mouseX > 250 && mouseX < 550 && mouseY > 325 && mouseY < 525) {
          fooderia.resetLevel();
        }
      }
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
    else if (mouseX > 340 && mouseX < 440 && mouseY > 170 && mouseY < 270) {
      pizza.toppingSelected("olives");
    }
    else if (mouseX > 10 && mouseX < 110 && mouseY > 300 && mouseY < 600) {
      fooderia.newPizza();
    }
    int x = width/2;
    int y = height/2;
    float inside = (mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY-y);
    double dist = Math.sqrt(inside);
    if (dist < 175) pizza.dropTopping();
  }
  
  if (fooderia.getScreen().equals("oven")) {
    if (oven.moveOn) {
      if (mouseX > 630 && mouseX < 780 && mouseY > 510 && mouseY < 560) {
        fooderia.changeScreen("cashier");
        oven = new Oven();
        pizza.next();
      }
    }
    if (mouseX > 10 && mouseX < 160 && mouseY > 510 && mouseY < 560) {
        oven.startMove = true;
      }
  }
}
