public class Buttons {
  void show() {
    textSize(15);
    noStroke();
    //cashier

    if (fooderia != null && fooderia.cashierHover) {
      fill(#a0d0eb);
      rect(width-300, 0, 100, 100);
    } else if (fooderia != null && !fooderia.cashierHover) {
      fill(#c2e9ff);
      rect(width-300, 0, 100, 100);
    }

    fill(0);
    text("Cashier", width-270, 50);

    //sauce
    if (fooderia != null && fooderia.sauceHover) {
      fill(#edd798);
      rect(width-200, 0, 100, 100);
    }
    if (fooderia != null && !fooderia.sauceHover) {
      fill(#ffefbf);
      rect(width-200, 0, 100, 100);
    }
    fill(0);
    text("Sauce", width-165, 50);

    //oven
    if (fooderia != null && fooderia.ovenHover) {
    fill(#edabb0);
    rect(width-100, 0, 100, 100);
    }
    if (fooderia != null && !fooderia.ovenHover) {
    fill(#ffc2c7);
    rect(width-100, 0, 100, 100);
    }
        
    fill(0);
    text("Oven", width-65, 50);
  }
}
