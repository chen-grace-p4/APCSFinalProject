public class Store { 
  boolean toggleShow;
  
  boolean catBought;
  boolean dogBought;
  
  boolean plantBought;
  boolean flowerBought;
  
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
  }
  
  void clicked() {
    //X button
    if (mouseX > 130 && mouseX < 160 && mouseY > 220 && mouseY < 250) {
      store.toggleShow = false;
    }
    
  }
}
