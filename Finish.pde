//here is my class for the finish line. I set up the variables necessary to display the image at the right place and time.
class Finish {
  PImage finishLine;
  float startTime, ellapsedTime;
  float finishSpeed;
  float xLoc, yLoc;
  
//this is the constructor which holds the information is assigned to the variables
  Finish(float xLocPassed, float yLocPassed, float speed)  {
  xLoc = random(100,700);
  yLoc = 900;
  finishSpeed=speed;
  ellapsedTime=millis()-startTime;
  finishLine = loadImage("FinishLine.png");
}  

//this is the move function for when the image is displayed. it will move it at a certain speed.
  void move() {
    if (yLoc>=100) {
    yLoc-=finishSpeed;
  }
  }//end move

//this is the display function to make the image appear.
    void display() {
    imageMode(CENTER);
    image(finishLine, xLoc, yLoc);
  }
}//end class

//created by Ross Edfort
