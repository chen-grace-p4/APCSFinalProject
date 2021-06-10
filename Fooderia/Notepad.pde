public class Notepad {
  ArrayList<String> order;
  Customer customer;
  color c;
  Notepad(){
  c = color(245,245,220);
  
  }
  
  void takeOrder(Customer customer){
    if (!fooderia.lvlEnd) {
      customerRight.selectedFalse();
      customerLeft.selectedFalse();
      customer.selectedTrue();
      order = customer.getOrder();
      this.customer = customer;
    }
  }
  //both customers selectedFalse(), custName.selectedTrue(), update notepad with
  //custName's order and call customer.changeSelected()
  
  //clears notepad
  void deleteOrder() {
    order = null;
  }
  
  void show(){
  fill(c);
  rect(0,650,800,150);
  
  for (int i = 1; i <40; i++){
    fill(color(128,128,128));
    stroke(color(128,128,128));
    rect(20*i,660, 10, 10);
    fill(0);
    stroke(0);
    rect(20*i,645,3,20);
    circle(20*i+2,647,3);
    rect(20*i+7,645,3,20);
    circle(20*i+9,647,3);
    stroke(224,243,176);
    line(0,660+10*i,800,660+10*i);
  }
  textSize(30);
  text("Order" + (fooderia.customerCounter - 1) + ":", 50,700);
  if(order!=null){
    int totalsize = 6;
    for (int i = 0; i<order.size(); i++){
      textSize(15);
      
      if(i>0){
        text(order.get(i), totalsize, 750);
      }
      else{text(order.get(i), 60, 750);}
      totalsize += (order.get(i).length()*15);
    }
  }
  // println(order.size());
  noStroke();
  }
  
  
}
