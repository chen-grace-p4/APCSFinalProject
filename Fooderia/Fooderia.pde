Game fooderia = new Game();
Buttons screenButtons = new Buttons();
Pizza pizza;
Customer customerRight;
Customer customerLeft;
Oven oven = new Oven();
Notepad notepad = new Notepad();

//for testing purposes
int mousex, mousey;
//

void setup() {
  size(800, 800);
  background(255);
  screenButtons.show();

  customerRight = new Customer("right");
  customerLeft = new Customer("left");
  pizza = new Pizza();
}

void draw() {
  fooderia.checkScreen();
  //TESTING PURPOSES
  mousex = mouseX;
  mousey = mouseY;
  //mousex = pizza.mainX;
  //mousey = pizza.mainY;
  textSize(15);
  fill(0);
  text(mousex + ", " + mousey, width-70, 125);
  //
  if (fooderia.getScreen().equals("sauce"))pizza.toppingDrag();

  customerRight.timeleft = (customerRight.sec- millis()/1000);
  customerLeft.timeleft = (customerLeft.sec- millis()/1000);
  ///////////////////////////////////////////Code below is responsible for customers coming in:
  if (customerRight.moveIn()==true) {
    if (customerRight.getX()>600) {
      customerRight.move("left");
    } else {
      customerRight.stopMoving();
    }
  }
  if (customerLeft.moveIn()==true) {
    if (customerLeft.getX()<200) {
      customerLeft.move("right");
    } else {
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


  ////////// Customer leaves if timer has run out:
  ArrayList temp = new ArrayList();
  if (customerRight.timeleft <0 && !fooderia.lvlEnd) {
    customerRight.customerLeaves(temp);   
    if (customerRight.leavingTime>0) {
      fill(255, 105, 97);
      rect(100, 0, 400, 100);
      fill(255, 255, 255);
      textSize(20);
      text("Customer on the right has gone", 120, 40);
      customerRight.leavingTime --;
    }
    if (customerRight.selected==true) {
      notepad.deleteOrder();
    }
  }
  if (customerLeft.timeleft<0 && !fooderia.lvlEnd) {
    customerLeft.customerLeaves(temp);
    fill(255, 105, 97);
    rect(100, 0, 400, 100);
    fill(255, 255, 255);
    textSize(20);
    text("Customer on the left has gone", 120, 70);
    if (customerLeft.selected==true) {
      notepad.deleteOrder();
    }
  }
  ///////////////////////////////////////////Code below is responsible for customers movingout:
  if (customerRight.moveOut()==true) {
    if (customerRight.getX()<900) {
      customerRight.move("right");
    } else {
      customerRight.stopMoving();
      if (fooderia.getCustomerNum() < 10) {
        //println(fooderia.getCustomerNum()); //DEBUG
        customerRight = new Customer("right");
      } else {
        if (fooderia.customerThere == false) {
          fooderia.customerThere = true;
          //fooderia.levelEnds();
          fooderia.customerCounter += 1;
        } else {
          fooderia.levelEnds();
        }
      }
    }
  }
  if (customerLeft.moveOut()==true) {
    if (customerLeft.getX()>-100) {
      //println(fooderia.getCustomerNum()); //DEBUG
      customerLeft.move("left");
    } else {
      customerLeft.stopMoving();
      if (fooderia.getCustomerNum() < 10) {
        customerLeft = new Customer("left");
      } else {
        if (fooderia.customerThere == false) {
          fooderia.customerThere = true;
          //fooderia.levelEnds();
          fooderia.customerCounter += 1;
        } else {
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
  if (!fooderia.lvlEnd && !fooderia.screen.equals("selectLevels") && !fooderia.screen.equals("mainMenu")) {
    if (mouseX > width-100 && mouseY < 100) {
      if (pizza.moving != true) fooderia.changeScreen("oven");
    } else if (mouseX > width-200 && mouseY < 100) {
      if (pizza.moving != true) fooderia.changeScreen("sauce");
    } else if (mouseX > width-300 && mouseY < 100) {
      if (pizza.moving != true) fooderia.changeScreen("cashier");
    }
  }
  
  if (fooderia.help) {
    //X button
    if (mouseX > 130 && mouseX < 160 && mouseY > 220 && mouseY < 250) {
      fooderia.help = false;
    }
  }

  if (fooderia.screen.equals("mainMenu")) {
    boolean prevTwo = fooderia.lvlTwoUnlocked;
    boolean prevThree = fooderia.lvlThreeUnlocked;
    if (mouseX > 40 && mouseX < 380 && mouseY > 630 && mouseY < 770) {
      if (fooderia.masterClicked) {
        fooderia.lvlTwoUnlocked = false;
        fooderia.lvlThreeUnlocked = false;
        fooderia.masterClicked = false;
        
        fooderia.lvlEnd = true;
        fooderia.resetLevel();
      } else {
        fooderia.lvlTwoUnlocked = prevTwo;
        fooderia.lvlThreeUnlocked = prevThree;
      }
      fooderia.mode = "normal";
      fooderia.changeScreen("selectLevels");
    } 
    if (mouseX > 420 && mouseX < 760 && mouseY > 630 && mouseY < 770) {
      fooderia.lvlEnd = true;
      fooderia.resetLevel();
      
      fooderia.lvlTwoUnlocked = true;
      fooderia.lvlThreeUnlocked = true;
      fooderia.masterClicked = true;
      fooderia.mode = "master";
      fooderia.changeScreen("selectLevels");
    }
    //tutorial button
    if (mouseX > 10 && mouseX < 190 && mouseY > 460 && mouseY < 560) {
      fooderia.help = true;
    }
  }

  if (fooderia.screen.equals("selectLevels")) {
    //back button
    if (!fooderia.lvlEnd && mouseX < 100 && mouseY > 100 && mouseY < 200) {
      fooderia.changeScreen("cashier");
    }

    //to menu
    if (mouseX > 600 && mouseX < 750 && mouseY > 20 && mouseY < 100) {
      fooderia.changeScreen("mainMenu");
    }
    //to reset progress
    if (fooderia.mode.equals("normal")) {
      if (mouseX > 400 && mouseX < 550 && mouseY > 20 && mouseY < 100) {
        fooderia.lvlTwoUnlocked = false;
        fooderia.lvlThreeUnlocked = false;
        
        fooderia.lvlEnd = true;
        fooderia.resetLevel();
      }
    }
    //to reset current level
    if (!fooderia.lvlEnd && mouseX > 200 && mouseX < 350 && mouseY > 20 && mouseY < 100) {
      int currentLvl = fooderia.level;
      fooderia.resetLevel();
      fooderia.level = currentLvl;
    }
    //*****ADDITIONAL FEATURE?
    //MAYBE MAKE IT SO THAT IF UR CLICKING THE LEVEL UR PLAYING RIGHT NOW, THE GAME ASKS IF U WANT TO 
    //^^RESET THE DAY AND IF THE PLAYER CLICKS YES, THEN IT RESETS THE LEVEL FOR THE SAME DAY

    //level 1 button
    if (mouseX > 120 && mouseX < 270 && mouseY > 120 && mouseY < 270) {
      //if a level is played but level is not 1 or if level is not being played and level = 0
      if (fooderia.level != 1) {
        fooderia.level = 1;
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
          fooderia.level = 2;
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
          fooderia.level = 3;
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
    
    if (mouseX > 110 && mouseX < 290 && mouseY < 100) {
      fooderia.help = true;
    }

    if (fooderia.lvlEnd) {
      if (mouseX > 250 && mouseX < 550 && mouseY > 325 && mouseY < 525) {
        fooderia.resetLevel();
        fooderia.changeScreen("selectLevels");
      }
    }
  }

  if (fooderia.getScreen().equals("sauce")) {
    if (fooderia.lvlEnd) {
      if (mouseX > 250 && mouseX < 550 && mouseY > 325 && mouseY < 525) {
        fooderia.resetLevel();
        fooderia.changeScreen("selectLevels");
      }
    } else {
      if (mouseX > 10 && mouseX < 110 && mouseY > 170 && mouseY < 270) {
         pizza.toppingSelected("sauce");
      } else if (mouseX > 120 && mouseX < 220 && mouseY > 170 && mouseY < 270) {
        pizza.toppingSelected("cheese");
      } else if (mouseX > 230 && mouseX < 330 && mouseY > 170 && mouseY < 270) {
        pizza.toppingSelected("pep");
      } else if (mouseX > 340 && mouseX < 440 && mouseY > 170 && mouseY < 270) {
        pizza.toppingSelected("olives");
      } else if (fooderia.level >= 2 && mouseX > 10 && mouseX < 110 && mouseY > 280 && mouseY < 380) {
          pizza.toppingSelected("pesto");
      } else if (fooderia.level >= 2 && mouseX > 450 && mouseX < 550 && mouseY > 170 && mouseY < 270) {
          pizza.toppingSelected("mushrooms");
      } else if (fooderia.level >= 3 && mouseX > 10 && mouseX < 110 && mouseY > 390 && mouseY < 490) {
          pizza.toppingSelected("buffalo");
      } else if (fooderia.level >= 3 && mouseX > 560 && mouseX < 660 && mouseY > 170 && mouseY < 270) {
          pizza.toppingSelected("chicken");
      } else if (mouseX > 10 && mouseX < 170 && mouseY > 544 && mouseY < 604) {
        fooderia.newPizza();
      }
      
  
      int x = 400;
      int y = 450;
      float inside = (mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY-y);
      double dist = Math.sqrt(inside);
      if (dist < 175) pizza.dropTopping();
    }
  }

  if (fooderia.getScreen().equals("oven")) {
    if (fooderia.lvlEnd) {
      if (mouseX > 250 && mouseX < 550 && mouseY > 325 && mouseY < 525) {
        fooderia.resetLevel();
        fooderia.changeScreen("selectLevels");
      }
    } else {
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
}
