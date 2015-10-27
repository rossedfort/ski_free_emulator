//This is my control class, it is in charge of displaying every other aspect of the game, checking for collisions, 
//adjusting the score, and keeping track of time for displaying new aspects of the game.
//I have 3 time-keeping variables, random time, my skier class, arraylists that display the trees, moguls and finish line,
//variables for the fonts and texts, speeds, and location variables for my collision detection. 
class Control {
  float startTime1, startTime2, startTime3; 
  float ellapsedTime1, ellapsedTime2, ellapsedTime3, ranTime;
  int score;
  Skier skier;
  ArrayList trees;
  ArrayList moguls;
  ArrayList finish;
  PFont scoreText, timerText, endText;
  float centerX, centerY;
  float resetSpeed, speed, treeSpeed, mogulSpeed;

//Here is where the game starts
  Control() {
    startGame();
  }
  
//In the run game section, I am giving values to my variables, and displaying my score, my time, and my skier. I am also calling
//for the movement of the skier.
  void runGame() { 
    endText=loadFont("HelveticaNeue-BoldItalic-96.vlw");
    ranTime=(random(800, 3000));
    this.displayScore();
    this.displayTime();
    skier.move();
    skier.display();
    ellapsedTime1=millis()-startTime1;
    ellapsedTime2=millis()-startTime2;
    ellapsedTime3=millis()-startTime3;
    speed=3;
    resetSpeed=speed;

//This is where I initiate the tree Arraylist.
    if (ellapsedTime1>ranTime) {
      for (int i=0; i<trees.size(); i++) {
        Tree tempTree=(Tree)trees.get(i);
        tempTree.display();
        tempTree.move();
      }
    }
    
//This is where I initiate the moguls Arraylist
      for (int i=0; i<moguls.size(); i++) {
        Mogul tempMogul=(Mogul)moguls.get(i);
        stroke(75);
        noFill();
        tempMogul.display();
        tempMogul.move();
      }
      
//This is where I initiate Finish Line Arraylist. It is displayed off the screen for the duration of the game. however when 
//the third ellapsed time variable reaches 120 seconds it moves up the screen so the game can finish.
      for (int i=0; i<finish.size(); i++) {
        Finish tempFinish=(Finish)finish.get(i);
        tempFinish.display();
       if (ellapsedTime3() >= 120) {
        tempFinish.move();
       }
    }
//This is a simple function that adds 10 points to the score every 10 seconds that has ellapsed. The resetTime function
//ensures that the millis goes back to 0 so that the fif statement still applies.
    if (ellapsedTime2() > 1) {
      this.adjScore(10);
      resetTime2();
    }

//This is the collision detection for trees.
    for (int j=0; j<trees.size(); j++) {
      checkCollision(skier, (Tree)trees.get(j), j);
    }
    
//This is the collision detection for moguls 
    for (int j=0; j<moguls.size();j++) {
      checkCollision(skier, (Mogul)moguls.get(j), j);
    }
    
//This is the collision detection for the finish line 
    for (int j=0; j<finish.size();j++) {
      checkCollision(skier, (Finish)finish.get(j));
    }
    
//This next set of code is in charge of placing new trees, and new moguls after 600 frames, or 10 seconds. It uses a modulo to 
//keep track of the framerate In order to place them at the current speed of the previously placed objects, I use a temporary object,
//get the speed from that and display the new object at that speed.
    if (frameCount % 600==0) {
      Tree tempTree=(Tree)trees.get(0);
      float tempSpeed=tempTree.treeSpeed;
      trees.add(new Tree(random(50, 750), 800, (int)round(random(1)), tempSpeed));
    }
    if (frameCount % 600==0) {
      Mogul tempMogul=(Mogul)moguls.get(0);
      float tempSpeed=tempMogul.mogulSpeed;
      moguls.add(new Mogul(random(50, 750), 800, color(255), tempSpeed));
    }
  }//end run Game 
  
//The startGame function calls my arraylists and has information regarding the display of the score and timer text.
    void startGame() {
    skier= new Skier(400, 200);
    
//This is where I call the tree Arraylist
    trees=new ArrayList();
    for (int i=0; i<6; i++) {
      trees.add(new Tree(random(50, 750), random(800, 1600), (int)round(random(1)), 3));
    }
    
//This is where I call the moguls Arraylist
    moguls=new ArrayList();
    for (int i=0; i<12; i++) {
      moguls.add(new Mogul(random(50, 750), random(800, 1600), color(255), 3));
    }
    
//This is where I call the finish Line Arraylist
    finish=new ArrayList();
    Mogul tempMogul=(Mogul)moguls.get(0);
    float tempSpeed=tempMogul.mogulSpeed;
    for (int i=0; i<1; i++) {
      finish.add(new Finish(width/2, height, tempSpeed));
    }
 
//This sets up the font for the score and the timer text
    scoreText = loadFont("Arial-Black-24.vlw");
    timerText = loadFont("Arial-Black-24.vlw");
    score=0;
  }
  
//This function resets the game so that it can start at the beginning each time the sketch is initiated
  void resetGame() {
    startGame();
  }
  
//These functions are for reseting the time. They are used in the scoring functions, displaying new trees, and displaying new moguls.  
  float resetTime1() {
    startTime1=millis();
    return startTime1;
  }
  float resetTime2() {
    startTime2=millis();
    return startTime2;
  }
  float resetTime3() {
    startTime3=millis();
    return startTime3;
  }
  
//These functions use the start time subtracted from the millis. this creates an ellapsed time which can be used to keep track 
//many aspects of the game such as the score.
  float ellapsedTime1() {
    float eTime=(millis()-startTime1)/1000;
    return eTime;
  }
  float ellapsedTime2() {
    float eTime=(millis()-startTime2)/1000;
    return eTime;
  }
  float ellapsedTime3() {
    float eTime=(millis()-startTime3)/1000;
    return eTime;
  }
  
//This piece of code is for adjusting the score. It sets up the parameters for when the score is raised or lowered
  void adjScore(int amount) {
    score+=amount;
  }
  
//This is for displaying the score. It sets up the font, the positioning and the color of the text.
  void displayScore() {
    fill(0);
    textFont(scoreText);
    textAlign(CENTER);
    text("Score "+score, width-100, 30) ;
  }
  
//This sets up the color, font, positioning and the parameters for the timer. the nf part sets up the amount of decimal
//places that are displayed.
  void displayTime() {
    fill(0);
    textFont(timerText);
    textAlign(CENTER);
    text("Time "+nf(ellapsedTime1(), 2, 1), 100, 30) ;
  }

//This is the collision checker for the skier to the trees. it uses a distance function to check the distance between the two objects
//if they are less than a certain distance apart from eachother, 50 points is removed from the score, and the item is removed from the arraylist.
//it also resets the speed of the objects.
  void checkCollision(Skier sk, Tree tr, int index) {
    if (dist(sk.centerX, sk.centerY, tr.xLoc, tr.yLoc)<=15) {
      this.adjScore(-50);
      trees.remove(index);
    }
  }//end collision checker for trees
  
//This is the collision checker for the skier to the moguls. it uses a distance function to check the distance between the two objects
//if they are less than a certain distance apart from eachother, 50 points is removed from the score, and the item is removed from the arraylist.
//it also resets the speed of the objects.
  void checkCollision(Skier sk, Mogul mg, int index) {
    if (dist(sk.centerX, sk.centerY, mg.xPos, mg.yPos)<=15) {
      this.adjScore(-10);
      moguls.remove(index);
    }
  }//end collision checker for moguls

//This is the collision checker for the finish line. It is set up so that when the skier hits the finish line, the game stops and the score is displayed on
//a refreshed white background
void checkCollision(Skier sk, Finish fn) {
    if (dist(sk.centerX, sk.centerY, fn.xLoc, fn.yLoc)<=20) {
      playGame=false;
    }
    if (playGame==false) {
      background(255);
      textAlign(CENTER);
      textFont(endText);
      text("FINISH!", width/2, 300);
      text("Score: " + score, width/2, height/2);
  }
  }
}//end class

//created by Ross Edfort
