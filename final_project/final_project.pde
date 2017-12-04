// Santa Rush //<>// //<>// //<>//
//
// A game inspired by Space Invaders in which you play santa and you need
// to catch the toys that the Christmas elves are dropping.
//
// PRESS SPACEBAR TO BEGIN

String textBeginning = "Use the left and right arrow keys to move Santa\nPress spacebar to start.";
String gameOver = "Game over! Press spacebar to retry.";
String line = "";
String blank = "";


// Images
int columns = 6;

// We generate Santa
Santa santa;

// We generate our array of toys
Toy[] toys = new Toy[4];

//We generate our array of Christmas elves
Elf[] upperRow = new Elf[columns];
Elf[] lowerRow = new Elf[columns];

//We generate our snowflakes
int quantity = 200;
float [] flakeX = new float[quantity];
float [] flakeY = new float[quantity];
int [] flakeSize = new int[quantity];
int [] flakeDirection = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

boolean toyFall = false;

int presentDelay;
//int toyDelay;

// The distance from the edge of the window the elements should be
int santaMargin = 60;
int elfMargin = 130;
int toyMargin = 10;


// The distance and initial position of an elf in its array
int elfDistance = 60;
int elfXPos = width/2;

// Number of "lives"
int strikes;

// Variables for the timer
boolean timerRunning = false;
boolean playing = false;
boolean over = false;
int startTime = 0;

// Generate the images array for the toys
PImage images[] = new PImage[3]; 

PImage bg;
PFont font;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(740, 580);
  noStroke();
  noFill();
  smooth();
  startTime = millis();


  // Create Santa at the bottom
  santa = new Santa(width/2, height - santaMargin, loadImage("santa.png"));

  // Create the elves at the top with the loop
  for (int i = 0; i < columns; i++) {

    // To define the elf's x position (so they're not on top of each other),
    // we first add its size + incremented distance between each.
    elfXPos = (elfXPos += elfDistance);

    upperRow[i] = new Elf(elfXPos + 50*4, elfMargin, 2, loadImage("elf.png"));
    lowerRow[i] = new Elf(elfXPos, elfMargin + 80, -2, loadImage("elf.png"));
  }

  // Create the toys with the loop at an elf's location
  for (int i = 0; i < toys.length; i++) {
    float r = random(1);
    int randomElfIndex = 0;
    int randomToyImg = 0;
    images[0] = loadImage("car.png");
    images[1] = loadImage("teddy.png");
    images[2] = loadImage("tambourin.png");

    if (r < 0.5) {
      randomToyImg = floor(random(0, images.length));
      randomElfIndex = floor(random(0, lowerRow.length));
      toys[i] = new Toy(lowerRow[randomElfIndex], 9, images[randomToyImg]);
    } else {
      randomToyImg = floor(random(0, images.length));
      randomElfIndex = floor(random(0, upperRow.length));
      toys[i] = new Toy(upperRow[randomElfIndex], 3, images[randomToyImg]);
    }
  }

  // Create our snowflakes
  for (int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    flakeX[i] = random(0, width);
    flakeY[i] = random(0, height);
    flakeDirection[i] = round(random(0, 1));
  }
}

// draw()
//
// Handles all the magic of making the elements move  and displaying/updating everything.

void draw() {

  // Load the background image
  bg = loadImage("bg.jpg");
  background(bg);

  font = createFont("arial", 18);
  textAlign(CENTER, CENTER); // Center align both horizontally and vertically
  textLeading(34); // Line height for text
  textFont(font);
  fill(color(227, 6, 19));
  text(line, width/2, height/2);


  // We only do the following if the game is playing
  if (playing) {

    line = blank;

    for (int i = 0; i < columns; i++) {
      image(upperRow[i].img, upperRow[i].x, upperRow[i].y);
      image(lowerRow[i].img, lowerRow[i].x, lowerRow[i].y);
    }
    image(santa.img, santa.x, santa.y);
    imageMode(CENTER);

    // Update the elements
    santa.update();
    santa.display();

    for (int i = 0; i < columns; i++) {
      upperRow[i].update();
      lowerRow[i].update();
    } 

    // Tell the elves to move together (their velocity is different but they change
    // direction at the same time)
    for (int i = 0; i < columns; i++) {
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
  } else if (over != true) {
    line = textBeginning;
  } else {
    line = gameOver;
  }
  handleSnow();
  handleToys();
}

// handleToys()
//
// Start the timer (5 minutes)

void handleToys() { 
  if (playing) {

    int timeElapsed = (millis() - startTime)/1000;

    //println("GAME TIMER:"+timeElapsed);

    // Verify if the time is up
    if (timeElapsed == 300) {
      println("YOU WIN");
      playing = false;
    }

    // After 3 seconds, the elves drop a toy
    for (int i = 0; i < toys.length; i++) {

      // If the toy is falling, it is displayed
      toys[i].update();
      toys[i].display();


      //println(timeElapsed, presentDelay);
      if (timeElapsed > presentDelay && toys[i].vy == 0) {
        //println("timeElapsed > presentDelay");
        toys[i].fall();


        // If the toy doesn't collide with Santa, player loses a strike
      }      

      if (toys[i].santaCollide()) {
        //toyDelay = floor(random(1,8));

        toys[i].reset();
        presentDelay = timeElapsed + 3;
        //image(toys[i].newImg, toys[i].x, toys[i].y);
      } else if (toys[i].y >= height) {
        //toyDelay = floor(random(1,8));

        strikes--;
        toys[i].reset();
        presentDelay = timeElapsed + 3;
        //image(toys[i].newImg, toys[i].x, toys[i].y);
        gameOver();
      }
    }
  }
}

// startGame()
//
// Tell the program what to do once the game starts

void startGame() {
  timerRunning = true;
  playing = true;
  strikes = 3;
}

void gameOver() {
  if (strikes == 0) {

    over = true;
    playing = false;
    println(" you lose ");
  }
}

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
// Santa needs to know if he should move based on keyPressed. We also call startGame when spacebar is pressed

void keyPressed() {
  santa.keyPressed();
  if (key == ' ' && !playing) {
    startGame();
    for (int i = 0; i < toys.length; i++) {
    }
  }
}

// keyReleased()
//
// When the keys are released, he stops moving

void keyReleased() {
  // Call both paddles' and avatars' keyReleased methods
  santa.keyReleased();
}

// DISCLAIMER
//
// Snowflakes code found here: http://solemone.de/demos/snow-effect-processing/
// I did not code them.