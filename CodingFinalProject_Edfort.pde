//This piece of code imports part of the minim library which allows me to play an audio file

import ddf.minim.*;

// here is where I delcare my variables and give names to some of my classes

Skier skier;
Control gc;
float framerate;
Minim minim;
AudioPlayer player;
float startTime, ellapsedTime;
boolean playGame;
int score;
PFont startText;

//In the setup, I am doing several different things. I needed several different ways to keep track of time for 
//placing trees, keeping score, etc. I also created my window, loaded the audio file, and told it to play at the start
//of the game. I created a boolean to actually play the game so that when skier hits the finish line, the playGame boolean
//(which is set to true) changes to false, and the game stops.
void setup() {
  startTime=millis();
  ellapsedTime=millis()-startTime;
  background(255);
  size(800, 700);
  smooth();
  gc= new Control();
  minim = new Minim(this);
  player = minim.loadFile("SkiFreeMusic.mp3");
  player.play();
  playGame=true;
  startText= loadFont("HelveticaNeue-BoldItalic-96.vlw");
  
//MUSIC TAKEN FROM http://www.youtube.com/watch?v=sikzRtLwX5s
}

//The only purpose of the draw section is to give the background color and run the game control class.
void draw() {
  if(playGame) {
  background(255);
  gc.runGame();
}
  if (ellapsedTime() < 3) {
    textAlign(CENTER);
    textFont(startText);
    text("START!", width/2, 300);
  }
}

//Here are my handle keys for the movement of the skier. it is set up with booleans so that when the keys
//are held down the skier moves. when they are released, he stops. 'A' moves him left and 'D moves him right
void keyPressed() {
  if (key=='a') {
    gc.skier.moveLeft=true;
  }
  if (key=='d') {
    gc.skier.moveRight=true;
  }
}

void keyReleased() {
  if (key=='a') {
    gc.skier.moveLeft=false;
  }
  if (key=='d') {
    gc.skier.moveRight=false;
  }
}

//this time variable keeps track of the ellapsed time since the start of the sketch
float ellapsedTime() {
  float eTime=(millis()-startTime)/1000;
  return eTime;
}

//created by Ross Edfort
