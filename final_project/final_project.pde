// Santa Rush //<>// //<>//
//
// A game inspired by Space Invaders in which you play santa and you need
// to catch the toys that the Christmas elves are dropping.

int columns = 7;

// We generate Santa
Santa santa;

// We generate our array of toys
Toy[] toys = new Toy[5];

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


// The distance from the edge of the window the elements should be
int santaMargin = 10;
int elfMargin = 120;
int toyMargin = 10;

// The distance and position of an elf in its array
int elfDistance;
int elfXPos = 75;

// Number of "lives"
int strikes = 3;

// Variables for the timer
boolean timerRunning = false;
boolean playing = false;
int startTime = 0;


// The background image
//PImage bgImage;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
  noStroke();
  smooth();
  fill(50);

  // Load the background image
  //bgImage = loadImage("background.jpg");

  // Create Santa at the bottom
  santa = new Santa(width/2, height - santaMargin);

  // Create the elves at the top with the loop
  for (int i = 0; i < columns; i++) {
    upperRow[i] = new Elf(elfXPos, elfMargin);
    lowerRow[i] = new Elf(elfXPos, elfMargin + 50);

    // To define the elf's x position (so they're not on top of each other),
    // we first add its size + incremented distance between each.
    elfXPos = 25 + (elfDistance += 50);
  }

  // Create the toys with the loop
  for (int i = 0; i < toys.length; i++) {
    toys[i] = new Toy(upperRow[3].x, lowerRow[3].y + (lowerRow[3].SIZE + toyMargin), 2);
    toys[i].toyStart();
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

  // Fill the background each frame so we have animation
  //background(bgImage);
  background(color(0));

  // We only do the following if the game is playing
  if (playing) {

    // Update the elements
    santa.update();


    for (int i = 0; i < columns; i++) {
      upperRow[i].update();
      lowerRow[i].update();
    } 
    // Tell the elves to move together
    if (upperRow[upperRow.length - 1].x > width - 50 || upperRow[0].x < 50) {
      for (int i = 0; i < columns; i++) {
        upperRow[i].vx = -upperRow[i].vx;
        lowerRow[i].vx = -lowerRow[i].vx;
      }
    }

    for (int i = 0; i < toys.length; i++) {
      // Tell the toy to follow the elve's x trajectory
      if (upperRow[upperRow.length - 1].x > width - 50 || upperRow[0].x < 50) {
        toys[i].vx = -toys[i].vx;
      }
      toys[i].update();
      toys[i].toyFreq();
      //toys[i].collide(santa);

      if (toys[i].santaCollide()) {
        toys[i].reset();
      }

      timerStart();
    }

    // Regenerate the snowflakes each frame
    for (int i = 0; i < flakeX.length; i++) {

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
}

// timerStart()
//
// Start the timer (5 minutes)

void timerStart() { 

  if (timerRunning) {

    int timeElapsed = (millis() - startTime)/1000;
    println("GAME TIMER:"+timeElapsed);

    // Verify if the time is up
    if (timeElapsed == 300) {
      println("YOU WIN");
      playing = false;
    }
  }

  // Display the elements only if the game is playing
  if (playing) {

    santa.display();

    for (int i = 0; i < columns; i++) {
      upperRow[i].display();
      lowerRow[i].display();
    }

    for (int i = 0; i < toys.length; i++) {
      toys[i].display();
    }
  }
}

// startGame()
//
// Tell the program what to do once the game starts

void startGame() {
  startTime = millis();
  timerRunning = true;
  playing = true;
}

// keyPressed()
//
// Santa needs to know if he should move based on keyPressed. We also call startGame when spacebar is pressed

void keyPressed() {
  santa.keyPressed();
  if (key == ' ') {
    startGame();
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