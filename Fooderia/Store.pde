public class Store { 
  boolean toggleShow;
  
  boolean catBought;
  boolean dogBought;
  boolean catUse;
  boolean dogUse;
  
  boolean cactusBought;
  boolean flowerBought;
  boolean cactusUse;
  boolean flowerUse;
  
  boolean cactusNotEnough;
  boolean flowerNotEnough;
  
  boolean cactusShowFirst;
  boolean flowerShowFirst;
  
  void show() {
    fill(255);
    stroke(0);
    rect(120, 210, 550, 400);
    fill(0);
    textSize(30);
    text("Items To Help Gameplay", 220, 250);
    
    //X button
    fill(255, 0, 0);
    noStroke();
    rect(130, 220, 30, 30);
    fill(0);
    textSize(30);
    text("X", 135, 245);
    
    //labels
    text("Plants", 175, 290);
    text("Pets", 370, 290);
    
    //CAN ONLY CHOOSE ONE PLANT AND ONE PET TO USE
    
    //cactus
    //INCREASES WAITING TIME FOR BOTH CUST BY 5 SECS
    fill(#77d96f);
    rect(165, 310, 100, 100);
    fill(0);
    textSize(20);
    text("Cactus", 175, 360);
    if (cactusUse) text("(Using)", 175, 385);
    else if (cactusBought) text("(Owned)", 175, 385);
    else text("$10", 175, 385);
    
    //flower
    //INCREASES WAITING TIME FOR BOTH CUST BY 10 SECS
    fill(#fc88ed);
    rect(165, 440, 100, 100);
    fill(0);
    textSize(20);
    text("Flower", 175, 490);
    if (flowerUse) text("(Using)", 175, 515);
    else if (flowerBought) text("(Owned)", 175, 515);
    else text("$20", 175, 515);
    
    //cat
    //INCREASES WAITING TIME FOR BOTH CUST BY 15 SECS
    fill(#d1d1d1);
    rect(350, 310, 100, 100);
    fill(0);
    textSize(20);
    text("Cat", 360, 360);
    text("$50", 360, 385);
    
    //dog
    //INCREASES WAITING TIME FOR BOTH CUST BY 20 SECS
    fill(#826739);
    rect(350, 440, 100, 100);
    fill(0);
    textSize(20);
    text("Dog", 360, 490);
    text("$75", 360, 515);
    
    //DETAILS THAT SHOW WHEN HOVERED
    //cactus details
    if (mouseX > 165 && mouseX < 265 && mouseY > 310 && mouseY < 410) {
      fill(#c6ffc2);
      stroke(#77d96f);
      rect(mouseX, mouseY, 150, 100);
      fill(0);
      if(cactusBought) {
        textSize(15);
        if (fooderia.lvlEnd) text("Click to toggle use", mouseX + 10, mouseY + 50);
        else {
          text("Can't Toggle", mouseX + 10, mouseY + 25);
          text("Level in progress", mouseX + 10, mouseY + 50);
        }
      } else {
        if (!cactusShowFirst && cactusNotEnough){
          textSize(15);
          text("Not Enough Money", mouseX+10, mouseY+50);
        } else text("Spiky plant...", mouseX + 10, mouseY + 50);
      }
      textSize(15);
      text("Wait Time +5s", mouseX + 15, mouseY + 75);
      noStroke();
    } else {
      cactusShowFirst = true;
      cactusNotEnough = false;
    }
    
    //flower details
    if (mouseX > 165 && mouseX < 265 && mouseY > 440 && mouseY < 540) {
      fill(#ffe6fc);
      stroke(#fc88ed);
      rect(mouseX, mouseY, 150, 100);
      fill(0);
      if(flowerBought) {
        textSize(15);
        if (fooderia.lvlEnd) text("Click to toggle use", mouseX + 10, mouseY + 50);
        else {
          text("Can't Toggle", mouseX + 10, mouseY + 25);
          text("Level in progress", mouseX + 10, mouseY + 50);
        }
      } else {
        if (!flowerShowFirst && flowerNotEnough){
          textSize(15);
          text("Not Enough Money", mouseX+10, mouseY+50);
        } else text("Pretty plant!", mouseX + 10, mouseY + 50);
      }
      textSize(15);
      text("Wait Time +10s", mouseX + 15, mouseY + 75);
      noStroke();
    } else {
      flowerShowFirst = true;
      flowerNotEnough = false;
    }
    
  }
  
  void clicked() {
    //X button
    if (mouseX > 130 && mouseX < 160 && mouseY > 220 && mouseY < 250) {
      store.toggleShow = false;
    }
    //buy or use cactus
    if (mouseX > 165 && mouseX < 265 && mouseY > 310 && mouseY < 410) {
      if (!cactusBought) {
        if (fooderia.totalMoney >= 10) {
          fooderia.totalMoney -= 10;
          fooderia.totalMoney = (double) Math.round(fooderia.totalMoney*100)/100;
          cactusBought = true;
        } else {
          cactusShowFirst = false;
          cactusNotEnough = true;
        }
      } else {
        //TOGGLE FLOWER USE SO ONLY ONE CAN BE USED AT A TIME
        // if (flowerBought && flowerUse)...
        if (fooderia.lvlEnd) cactusUse = !cactusUse;
      }
    }
    //buy or use flower
    if (mouseX > 165 && mouseX < 265 && mouseY > 440 && mouseY < 540) {
      if (!flowerBought) {
        if (fooderia.totalMoney >= 20) {
          fooderia.totalMoney -= 20;
          fooderia.totalMoney = (double) Math.round(fooderia.totalMoney*100)/100;
          flowerBought = true;
        } else {
          flowerShowFirst = false;
          flowerNotEnough = true;
        }
      } else {
        //TOGGLE FLOWER USE SO ONLY ONE CAN BE USED AT A TIME
        // if (flowerBought && flowerUse)...
        if (fooderia.lvlEnd) flowerUse = !flowerUse;
      }
    }
    
  }
  
}
