// Santa Rush //<>// //<>// //<>// //<>//
//
// A game inspired by Space Invaders in which you play santa and you need
// to catch the toys that the Christmas elves are dropping.
//
// PRESS SPACEBAR TO BEGIN

// Imports sound library
import processing.sound.*;

// Generates Santa
Santa santa;

// Generates the array of toys
Toy[] toys = new Toy[3];
int randomToyImg;
int randomElfIndex;
int presentDelay;

// Generates the array of images for the toys
PImage images[] = new PImage[3]; 

// Generates the array of Christmas elves
int columns = 6;
Elf[] upperRow = new Elf[columns];
Elf[] lowerRow = new Elf[columns];

// The distance and initial position of an elf in its array
int elfDistance = 60;
int elfXPos = width/2;

// Generates snowflakes
int quantity = 200;
float [] flakeX = new float[quantity];
float [] flakeY = new float[quantity];
int [] flakeSize = new int[quantity];
int [] flakeDirection = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

// Generates text
String textBeginning = "Use the left and right arrow keys to move Santa\nPress spacebar to start.";
String retry = "Game over! Press spacebar to retry.";
String victory = "You won!";
String timer;
String line = "";
String blank = "";

// Loads the elements for music, images and fonts
SoundFile music;
PImage bg;
PFont font;

// The distance from the edge of the window
int santaMargin = 60;
int elfMargin = 130;
int toyMargin = 10;

// General variables for the game
boolean timerRunning = false;
boolean playing = false;
boolean gameOver = false;
boolean win = false;
int startTime = 0;
int strikes;

// setup()
//
// Sets the size and creates the elements

void setup() {

  size(740, 580);
  noStroke();
  noFill();
  smooth();
  startTime = millis();
  
  // Creates the music file
  music = new SoundFile(this, "/Users/Marie-Eve/Documents/cart253/final_project/music.mp3");

  // Creates Santa at the bottom
  santa = new Santa(width/2, height - santaMargin, loadImage("santa.png"));

  // Creates the elves at the top with the loop
  for (int i = 0; i < columns; i++) {

    // To define the elf's x position (so they're not on top of each other),
    // we first add its size + incremented distance between each.
    elfXPos = (elfXPos += elfDistance);

    upperRow[i] = new Elf(elfXPos + 50*4, elfMargin, 2, loadImage("elf.png"));
    lowerRow[i] = new Elf(elfXPos, elfMargin + 80, -2, loadImage("elf.png"));
  }

   // Creates the array of toys
   for (int i = 0; i < toys.length; i++) {  
      float r = random(1);
      
      // Generates the images inside the array
      images[0] = loadImage("car.png");
      images[1] = loadImage("teddy.png");
      images[2] = loadImage("tambourin.png");

      // Controls the "randomness" so that toys are generated from the upper row and lower row equally
      if (r < 0.5) {
        // Generates random values to determine which image will be displayed
        // and from which elf it will fall. 
        randomToyImg = floor(random(0, images.length));
        randomElfIndex = floor(random(0, lowerRow.length));
        toys[i] = new Toy(lowerRow[randomElfIndex], images[randomToyImg]);
      } else {
        randomToyImg = floor(random(0, images.length));
        randomElfIndex = floor(random(0, upperRow.length));
        toys[i] = new Toy(upperRow[randomElfIndex], images[randomToyImg]);
      }
    }
  
  // Creates our snowflakes
  for (int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    flakeX[i] = random(0, width);
    flakeY[i] = random(0, height);
    flakeDirection[i] = round(random(0, 1));
  }
}

// draw()
//
// Handles all the magic of making the elements move and displaying/updating everything.

void draw() {

  // Loads the background image
  bg = loadImage("bg.jpg");
  background(bg);

  // Loads text
  font = createFont("arial", 18);
  textAlign(CENTER, CENTER); // Center align both horizontally and vertically
  textLeading(34); // Line height for text
  textFont(font);
  fill(color(227, 6, 19));
  text(line, width/2, height/2);

  // Only do the following if the game is playing
  if (playing) {

    // No text is displayed
    line = blank;

    // Creates the images
    for (int i = 0; i < columns; i++) {
      image(upperRow[i].img, upperRow[i].x, upperRow[i].y);
      image(lowerRow[i].img, lowerRow[i].x, lowerRow[i].y);
    }
    image(santa.img, santa.x, santa.y);
    imageMode(CENTER);

    // Updates the elements
    santa.update();
    santa.display();

    for (int i = 0; i < columns; i++) {
      upperRow[i].update();
      lowerRow[i].update();
      
    // Tells the elves to reverse direction at the same time
    // if they hit the 20px margin on each side
      if (upperRow[upperRow.length - 1].x > width - 20 || upperRow[0].x < 20) {
        upperRow[i].vx = -upperRow[i].vx;
        lowerRow[i].vx = -lowerRow[i].vx;
      }
      upperRow[i].display();
      lowerRow[i].display();

      /*} IF I WANT THEM TO BEHAVE SEPARATELY, THIS IS THE CODE
       for (int i = 0; i < columns; i++) {
       if (lowerRow[lowerRow.length - 1].x > width - 50 || lowerRow[0].x < 50) {
       lowerRow[i].vx = -lowerRow[i].vx;
       }*/   
    }   
  } else if (!gameOver && !win) {
    // If the game is not running and the player hasn't won or lost yet, it means
    // it displays the indications at the beginning
    line = textBeginning;
  } else if (gameOver) {
    // If the player has lost, it displays the try again text
    line = retry;
  } else if (win) {
    // If the player has won, it displays the victory text
    line = victory;
  }

  // Calls the handle functions for the elements
  handleSnow();
  handleToys();
  handleTime();
}

// startGame()
//
// Tells the program to start the timer and resets the number of strikes to 3

void startGame() {
  timerRunning = true;
  playing = true;
  strikes = 3;
}

// handleToys()
//
// Tells the program how the toys behave

void handleToys() { 

    if (playing) {
        for (int i = 0; i < toys.length; i++) {

      // Displays and update the toys
      toys[i].update();
      toys[i].display();

      // If the toy's velocity is 0, then it should fall because it means it has been reinitialized
      if (/*toys[i].delay > presentDelay  &&*/ toys[i].vy == 0) {
        toys[i].fall();
      }    

      // If the toy collides with santa, it resets the toy and regenerates it so
      // it has a new position and image
      if (toys[i].santaCollide()) {
        toys[i].reset();
        //presentDelay = toys[i].delay;
        
        // Same code as in setup
        float r = random(1);
        images[0] = loadImage("car.png");
        images[1] = loadImage("teddy.png");
        images[2] = loadImage("tambourin.png");

        if (r < 0.5) {
          randomToyImg = floor(random(0, images.length));
          randomElfIndex = floor(random(0, lowerRow.length));
          toys[i] = new Toy(lowerRow[randomElfIndex], images[randomToyImg]);
        } else {
          randomToyImg = floor(random(0, images.length));
          randomElfIndex = floor(random(0, upperRow.length));
          toys[i] = new Toy(upperRow[randomElfIndex], images[randomToyImg]);
        }
        
      // Or else if the toy doesn't collide with Santa and touches the bottom,
      // it resets the toy as well and regenerates it but the player also loses a strike
      } else if (toys[i].y >= height) {        
        strikes--;
        handleStrikes();
        toys[i].reset();
        //presentDelay = toys[i].delay;

        // Same code as in setup
        float r = random(1);
        images[0] = loadImage("car.png");
        images[1] = loadImage("teddy.png");
        images[2] = loadImage("tambourin.png");

        if (r < 0.5) {
          randomToyImg = floor(random(0, images.length));
          randomElfIndex = floor(random(0, lowerRow.length));
          toys[i] = new Toy(lowerRow[randomElfIndex], images[randomToyImg]);
        } else {
          randomToyImg = floor(random(0, images.length));
          randomElfIndex = floor(random(0, upperRow.length));
          toys[i] = new Toy(upperRow[randomElfIndex], images[randomToyImg]);
        }
      }
    }
  }
}

// handleTime()
//
// Tells the program what to do once the time is up

void handleTime() {

  int timeElapsed = (millis() - startTime)/1000;

  // If a minute has passed and the player hasn't lost yet, then he wins
  if (timeElapsed == 60) {
    playing = false;
    win = true;
  }
}

// handleStrikes()
//
// Tells the program what happens when the player loses all his strikes

void handleStrikes() {
  if (strikes == 0) {
    // It's Game Over
    gameOver = true;
    playing = false;
  }
}

// handleSnow()
//
// Tells the program how snow should behave

void handleSnow() {
  // Regenerate the snowflakes each frame
  for (int i = 0; i < flakeX.length; i++) {

    fill(255);
    ellipse(flakeX[i], flakeY[i], flakeSize[i], flakeSize[i]);


    if (flakeDirection[i] == 0) {
      flakeX[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      flakeX[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }

    flakeY[i] += flakeSize[i] + flakeDirection[i]; 

    if (flakeX[i] > width + flakeSize[i] || flakeX[i] < -flakeSize[i] || flakeY[i] > height + flakeSize[i]) {
      flakeX[i] = random(0, width);
      flakeY[i] = -flakeSize[i];
    }
  }
}

// keyPressed()
//
// Calls Santa's keyPressed function with spacebar
// Also calls startGame and starts the music when spacebar is pressed

void keyPressed() {
  santa.keyPressed();
  if (key == ' ' && !playing) {
    // !playing is really important because without it the player would be able
    // to restart the timer anytime
    startGame(); 
    for (int i = 0; i < toys.length; i++) {
    }
    if (!gameOver && !win) {
    // This ensures that the music doesn't start playing more than once
    // only at the beginning of the game
      music.loop();
    }
  }
}

// keyReleased()
//
// Calls Santa's keyReleased function

void keyReleased() {
  santa.keyReleased();
}

// DISCLAIMER
//
// Snowflakes code found here: http://solemone.de/demos/snow-effect-processing/
// I did not code them.