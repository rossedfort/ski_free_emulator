//This is my skier class
class Skier {
  float centerX, centerY;
  boolean moveUp, moveDown, moveRight, moveLeft;
  PImage skier;
  
//This is the constructor for the skier. I am loading the image and assigning values to the variables which I have created. This is also where
//I set up the booleans for the key handler back in my main sketch
  Skier(float xPassed, float yPassed) {
    skier= loadImage("skier.png");
    strokeWeight(2);
    centerX=width/2;
    centerY=100;
    centerX=xPassed;
    centerY=yPassed;
    moveUp=false;
    moveDown=false;
    moveRight=false;
    moveLeft=false;
  }
  
//this is the move function in charge of moving the skier left and right so he can dodge the trees and moguls. This is where the booleans come into play
  void move() {
    if (moveLeft) {
      centerX-=3;
    }
    if (moveRight) {
      centerX+=3;
    }
  }
  
//This piece of code just displays the skier at a certain location on the screen, in this case, at the top center.
  void display() {
    imageMode(CENTER);
    image(skier, centerX, centerY);
  }
}

//created by Ross Edfort

