//this is my mogul class, here is where I delcare any necessary variables
class Mogul {
  float xPos, yPos;
  color mogulColor;
  float speed, mogulSpeed;

//this is the constructor for the moguls, it gives values to the variables and sets up the parameters for the arraylist. 
  Mogul(float xPosPassed, float yPosPassed, color mogulColorPassed, float speed) {
    mogulColor=255;
    mogulColor= mogulColorPassed;
    xPos= random(50, 750);
    xPos= xPosPassed;
    yPos= random(800, 1500);
    yPos= yPosPassed;
    mogulSpeed=speed;
  }
//this is a simple function to increase the speed of the moguls. It is taking the speed and multiplying it by 1.0001. This slowly
//increases the rate at which the moguls move up the screen. This is easily changed to make the game harder or easier
  void increaseSpeed() {
    mogulSpeed*=(1.0001);
  }
  
//here is the move function for the moguls to ensure that they are moving up the screen creating the illusion that the skier is moving. the 
//speed needs to be the same as the trees so that it looks real. in the move function, I wrote a piece of code to take the individual mogul
//from the top of the screen and replace it to the bottom of the screen, while moving it to a random x position. This creates the illusion of
//a continous flow of moguls
  void move() {
    if (yPos>=height);
    yPos-=mogulSpeed;
    if (yPos<0) { 
      yPos=height; 
      xPos=(random(50, 750));
    }
    increaseSpeed();
  }//end move
  
//This is the display function in charge of actually displaying the moguls on the screen. I used a bezier curve to create the moguls.
  void display() {
    smooth();
    bezier(xPos, yPos, xPos+10, yPos-10, xPos+10, yPos-10, xPos+20, yPos);
  }
}//end class

//created by Ross Edfort
