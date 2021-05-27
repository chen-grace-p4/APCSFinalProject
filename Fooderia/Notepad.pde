public class Notepad {
  ArrayList order;
  Customer customer;
  color c;
  Notepad(){
  c = color(245,245,220);
  }
  
  void takeOrder(Customer customer){
    customerRight.selectedFalse();
    customerLeft.selectedFalse();
    customer.selectedTrue();
    order = customer.getOrder();
    this.customer = customer;
  }
  //both customers selectedFalse(), custName.selectedTrue(), update notepad with
  //custName's order and call customer.changeSelected()
  
  //clears notepad
  void deleteOrder() {
    
  }
  
  void show(){
  fill(c);
  rect(0,650,800,150);
  
  }
}
