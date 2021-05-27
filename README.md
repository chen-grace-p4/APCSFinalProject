# APCSFinalProject
Group Name - Griya's Fooderia

Group Members - Shriya Anand, Grace Chen

Prototype - https://docs.google.com/document/d/1b2osotSTCKECF9ko4jVFnmKhODuhoFFuMdUleYN6Fjs/edit?usp=sharing

Updated UML Diagram - https://drive.google.com/file/d/1v0eUgFTC0-HxjgfnIsaIKVxw0nTNVNoq/view?usp=sharing

Brief Project Description:
Our project will be a food-making game inspired by a combination of cooking fever, papa’s pizzeria, and good pizza great pizza. It will consist of a minimum three levels of playing, each level with customers that come in and order food, a waiting time limit for each customer while the player makes the food, different stages for the food-making process, and finally giving the food to the customer. As the game progresses, more ingredients will be unlocked for cooking. A goal for money made must be reached each level to reach the next level. There will be a decreased money earned per order if the customer waits for too long, or the order is made incorrectly. Ideally, there will be multiple foods but for now we are focused on just making a pizzeria.

5-24 (class + home) Grace C: Made basic blueprints for Notepad, Things, Pizza, and Game. Coded very basic prototype of changing screens with the use of the main Fooderia file and a Game object.

5-24 (class+ home) Shriya A: Listed out the methods/ a brief description of their function for the main file to code later and tested out issues with having static vs non-static methods.

5-25 (home) Grace C: Fixed basic layout/color for screen changing and made it more efficient by creating a Buttons class. Completed most methods in pizza object (and added appropriate code in Fooderia and Game class) so that there is a very basic pizza making station in the "sauce" screen.

5-25 (home) Shriya A: Made the blueprint for the Customers Class; created the constructor and instance variables for said class along with some of the main methods such as those that return the variables, the show() method, move(), and customerComes() method. I added code for those methods to work in the main file under draw as well as in the Game class.

5-26 (class + home) Grace C: Completed move() method in Pizza and created Oven in order to do that. Modified Fooderia and Customer to make it so move() makes the customer you're serving the pizza leave (after giving money) and have new customers come in unless the customer limit per level is reached.

5-26(class) Shriya A: Completed the Customer class (which needed the selected methods as well as completing the CustomerLeaves method- which needed me to add code to the main file). I also started the Notepad class and added the constructor, instance variables, and part of a method.

5-27 (home) Grace C: Added some details such as not counting uncooked toppings when evaluating pizza, some buttons to make the oven screen operate more naturally, and made it so the oven screen stays stable between screen switches (for every new pizza). 
