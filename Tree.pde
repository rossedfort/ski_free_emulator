//This is the class for the trees that are being displayed. I needed to use states to randomly display either the image with one tree or two
class Tree {
  PImage[] cImage;
  int state;
  float xLoc, yLoc, speed;
  float treeSpeed;
  
//Here is the constructor for the trees. It is where I assign the respective images to state 1 or state 2. in the parameters for when the arraylist
//is called i used a random selector of either one or two so that it decides whether to display one tree or two at random.
  Tree(float xLocPassed, float yLocPassed, int cstate, float speed) {
    state=cstate;
    cImage= new PImage[2];
    cImage[0]= loadImage("onetree.png");
    cImage[1]= loadImage("twotrees.png");
    cImage[0].resize(50, 75);
    cImage[1].resize(50, 75);
    xLoc=random(50, 750);
    xLoc=xLocPassed;
    yLoc=0;
    yLoc=yLocPassed;
    treeSpeed=speed;
  }//end constructor
  
//this is a simple function to increase the speed of the trees. It is taking the speed and multiplying it by 1.0001. This slowly
//increases the rate at which the trees move up the screen. This is easily changed to make the game harder or easier
  void increaseSpeed() {
    treeSpeed*=(1.0001);
  }

//here is the move function for the trees to ensure that they are moving up the screen creating the illusion that the skier is moving. the 
//speed needs to be the same as the moguls so that it looks real. in the move function, I wrote a piece of code to take the individual tree
//from the top of the screen and replace it to the bottom of the screen, while moving it to a random x position. This creates the illusion of
//a continous flow of trees
  void move() {
    if (yLoc>=height);
    yLoc-=treeSpeed;
    if (yLoc<0) { 
      yLoc=height; 
      xLoc=(random(50, 750));
    }
    increaseSpeed();
  }//end move

//This is the display function in charge of actually displaying the trees on the screen.
  void display() {
    image(cImage[state], xLoc, yLoc);
  }//end display
}//end class


//created by Ross Edfort
