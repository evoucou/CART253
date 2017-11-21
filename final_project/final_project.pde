// Santa Rush //<>// //<>//
//
// A game inspired by Space Invaders in which you play santa and you need
// to catch the toys that the Christmas elves are dropping.

boolean start;

int columns = 7;

// We generate Santa
Santa santa;

// We generate our array of toys
Toy[] toys = new Toy[5];

//We generate our array of Christmas elves
Elf[] upperRow = new Elf[columns];
Elf[] lowerRow = new Elf[columns];


// The distance from the edge of the window the elements should be
int santaMargin = 10;
int elfMargin = 120;

// The distance and position of an elf in its array
int elfDistance;
int elfXPos = 75;

// Number of "lives"
int strikes = 3;

// Variables for timer
boolean timerRunning = false;
int startTime = 0;


// The background image
//PImage bgImage;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

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
    toys[i] = new Toy(20, 10, 3);
    toys[i].toyStart();
  }
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.
void draw() {

  // Fill the background each frame so we have animation
  //background(bgImage);
  background(color(0));

  // Update the elements
  santa.update();


  for (int i = 0; i < columns; i++) {
    upperRow[i].update();
    lowerRow[i].update();
  }

  for (int i = 0; i < toys.length; i++) {
    toys[i].update();
    toys[i].toyFreq();
    //toys[i].collide(santa);

    if (toys[i].santaCollide()) {
      toys[i].reset();
    }  /*else if (toys[i].noCollide()) {
     strikes--;
     println("-1");
     }*/
    timesUp();
  }
}

// timesUp()
//
// Because the goal of the game is to last 5 minutes without losing all your lives,
// we have to set a timer to 5 minutes and then end the game. 
// Verify if the time is up

void timesUp() { 

  if (timerRunning) {

    int timeElapsed = (millis() - startTime)/1000;
    println("GAME TIMER:"+timeElapsed);

    if (timeElapsed == 300) {
      println("YOU WIN");
    }
  }

  // Display the elements only if the player has started the game with spacebar
  if (startGame()) {

    // The timer has to start
    timerRunning = true;

    santa.display();

    for (int i = 0; i < columns; i++) {
      upperRow[i].display();
      lowerRow[i].display();
    }

    for (int i = 0; i < toys.length; i++) {
      toys[i].display();
    }
  }

  // Display the images
  /*image(avatarPlayer2.imagePlayer, avatarPlayer2.avatarX, avatarPlayer2.avatarY);
   image(avatarPlayer1.imagePlayer, avatarPlayer1.avatarX, avatarPlayer1.avatarY);
   image(item.image, item.x, item.y);
   imageMode(CENTER);
   }*/
}

// Boolean that verifies if the spacebar key has been pressed to start the game
boolean startGame() {
  return(key == ' ');
}

// keyPressed()
//
// Santa needs to know if he should move based on keyPressed
// When the keys are released, he stops moving
// We also call startGame or else program won't recognize spacebar has been pressed

void keyPressed() {
  santa.keyPressed();
  startGame();
}

// keyReleased()
//
// When the keys are released, he stops moving

void keyReleased() {
  // Call both paddles' and avatars' keyReleased methods
  santa.keyReleased();
}