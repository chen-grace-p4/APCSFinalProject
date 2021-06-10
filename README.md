# APCSFinalProject
Group Name - Griya's Fooderia

Group Members - Shriya Anand, Grace Chen

Prototype - https://docs.google.com/document/d/1b2osotSTCKECF9ko4jVFnmKhODuhoFFuMdUleYN6Fjs/edit?usp=sharing

Updated UML Diagram - https://drive.google.com/file/d/1OqakZHn0wDjYLPcu0FwCfmZaSt8J-gUJ/view?usp=sharing

Running Instructions: Run using Processing

Brief Project Description:
Our project will be a food-making game inspired by a combination of cooking fever, papa’s pizzeria, and good pizza great pizza. It will consist of a minimum three levels of playing, each level with customers that come in and order food, a waiting time limit for each customer while the player makes the food, different stages for the food-making process, and finally giving the food to the customer. As the game progresses, more ingredients will be unlocked for cooking. A goal for money made must be reached each level to reach the next level. There will be a decreased money earned per order if the customer waits for too long, or the order is made incorrectly. Ideally, there will be multiple foods but for now we are focused on just making a pizzeria.

5-24 (class + home) Grace C: Made basic blueprints for Notepad, Things, Pizza, and Game. Coded very basic prototype of changing screens with the use of the main Fooderia file and a Game object.

5-24 (class+ home) Shriya A: Listed out the methods/ a brief description of their function for the main file to code later and tested out issues with having static vs non-static methods.

5-25 (home) Grace C: Fixed basic layout/color for screen changing and made it more efficient by creating a Buttons class. Completed most methods in pizza object (and added appropriate code in Fooderia and Game class) so that there is a very basic pizza making station in the "sauce" screen.

5-25 (home) Shriya A: Made the blueprint for the Customers Class; created the constructor and instance variables for said class along with some of the main methods such as those that return the variables, the show() method, move(), and customerComes() method. I added code for those methods to work in the main file under draw as well as in the Game class.

5-26 (class + home) Grace C: Completed move() method in Pizza and created Oven in order to do that. Modified Fooderia and Customer to make it so move() makes the customer you're serving the pizza leave (after giving money) and have new customers come in unless the customer limit per level is reached.

5-26(class+home) Shriya A: Completed the Customer class (which needed the selected methods as well as completing the CustomerLeaves method- which needed me to add code to the main file). I also started the Notepad class and added the constructor, instance variables, and part of a method.

5-27 (home) Grace C: Added some details such as not counting uncooked toppings when evaluating pizza, some buttons to make the oven screen operate more naturally, and made it so the oven screen stays stable between screen switches (for every new pizza). Completed the levels screen and added appropriate buttons + popups at the end of each day to go to the levels screen; there are now unlockable levels and the game starts at the levels screen.

5-27 (home) Shriya A: I finished the Notepad class by making it visually look like a notepad. I also recorded the order onto the notepad which took some time due to Null pointer errors. I made sure that the words are spaced equally depending on their letter count.

5-28 (class+home) Grace C: Completed pesto and buffalo sauces, worked on adding onions and mushrooms as toppings, and modified some minor details to the levels button.

5-28(class+home) Shriya A: I added the 30 new orders made from the new ingredients into the customer class and fixed how the prices were decided randomly to dependent on the sauce and toppings.

5-29 (home) Grace C: Changed onions to chicken, modified some displays for toppings to match changes made in Customer class, completed chicken and mushroom toppings. Fixed some bugs including restricting screen change while oven is in use, how multiple sauces are displayed on the pizza, and added back limits for toppings so that new ones unluck every level.

5-29(home) Shriya A: I finished adding the orders to the menu and started working on the timer feature. I figured out how to keep track of and display the time. I also created a color gradient rectangle that goes down based off the time and altered the end price on how much time was left.

5-31(home) Grace C: Added menu screen and appropriate buttons to normal mode (start from level 1 and others are unlocked) and master mode (all levels unlocked). Also added reset current level and reset progress buttons that appear in the appropriate mode and situation on the levels screen.

6-2(class) Shriya A: I fixed the timer class- the display for the timer was not going down at a proper rate and got messed up if there was a gap between opening the game and clicking on the level. I also rounded the prices to two decimal places and coded the customer to leave if the timer ran out.

6-2(class) Grace C: Added sprites for pepperoni and for customers. Fixed reset current level button.

6-3(home) Shriya A: Finished the timer class- fixed it since it was only running when on the cashier screen. Also randomized the wait times for the customers. Deleted the orders from the notepad if they belonged to customers that left after timer ran out and also displayed that the timer ran out.

6-3(home) Grace C: Deleted all things for the sole purpose of testing, fixed money needed to be earned to advance to next level, completed all sprites, and other small finishing touches. Also fixed dropping toppings on the pizza.

6-7(home) Grace C: Added alerts for new level unlocked or how much more money is needed to unlock next level. Added a tutorial button and screen but didn't add instructions yet.

6-9(home-bc of AP) Shriya A: Worked on presentation for the demo and ran through it. Added eyebrows to the characters that furrow as the timer goes down to indicate irration.
