public class Oven {
  boolean moveOn;
  boolean startMove;
  
  void show() {
    fill(#949494);
    rect(200, 250, 400, 300);
  }
  
  void afterBake() {
    if (moveOn) {
      fill(#8fbaff);
      rect(630,510,150,50);
      fill(0);
      text("Give to customer", 650, 540);
      
    }
  }
  
  void light() {
    fill(#f52222);
    if(startMove) fill(#f5e722);
    if (moveOn) fill(#23e019);
    rect(222,507,10,20);
  }
 
}
