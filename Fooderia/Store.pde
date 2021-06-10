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
    text("$10", 175, 385);
    //cactus details
    
    //flower
    //INCREASES WAITING TIME FOR BOTH CUST BY 10 SECS
    fill(#fc88ed);
    rect(165, 440, 100, 100);
    fill(0);
    textSize(20);
    text("Flower", 175, 490);
    text("$20", 175, 515);
    
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
  }
  
  void clicked() {
    //X button
    if (mouseX > 130 && mouseX < 160 && mouseY > 220 && mouseY < 250) {
      store.toggleShow = false;
    }
    
  }
}
