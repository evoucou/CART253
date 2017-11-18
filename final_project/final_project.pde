// Santa Rush //<>//
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


// The distance from the edge of the window the elements should be
int santaMargin = 10;
int elfMargin = 120;

// The distance and position of an elf in its array
int elfDistance;
int elfXPos = 75;

int strikes = 3;

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

  // Set the timer
  //text("REMAINING TIME : "+scorePlayer1, width-50, 50); 
  //fill(color(255));

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
      println("collide");
      toys[i].reset();
    }  /*else if (toys[i].noCollide()) {
      strikes--;
      println("-1");
    }*/
  }

  // Check if the toy has collided with Santa

  /*if (leftPaddle.scorePointPlayer1()) {
   // If the ball goes out of the screen on the right side, point for player 1
   // The first one who gets to 25 wins
   scorePlayer1 = 0;
   scorePlayer1++;
   println("+1 GREEN MONSTER");
   }  
   
   
   if (avatarPlayer1.ballTouch()) {
   // Check if the ball overlaps with the avatar
   //If it's the case, reset it to the center and the player loses a point
   avatarPlayer1.avatarX = avatarPlayer1.avatarResetX;
   avatarPlayer1.avatarY = avatarPlayer1.avatarResetY;
   scorePlayer1--;
   }
   
   if (avatarPlayer2.ballTouch()) {
   // Check if the ball overlaps with the avatar
   //If it's the case, reset it to the center and the player loses a point
   avatarPlayer2.avatarX = avatarPlayer2.avatarResetX;
   avatarPlayer2.avatarY = avatarPlayer2.avatarResetY;
   scorePlayer2--;
   }
   
   if (avatarPlayer1.itemTouch()) {
   // If it is, +1 for player 1
   scorePlayer1++;
   item.reset();
   }
   
   if (avatarPlayer2.itemTouch()) {
   // If it is, +1 for player 2
   scorePlayer2++;
   item.reset();
   }*/


  // Display the elements
  santa.display();

  for (int i = 0; i < columns; i++) {
    upperRow[i].display();
    lowerRow[i].display();
  }

  for (int i = 0; i < toys.length; i++) {
    toys[i].display();
  }


  // Display the images
  /*image(avatarPlayer2.imagePlayer, avatarPlayer2.avatarX, avatarPlayer2.avatarY);
   image(avatarPlayer1.imagePlayer, avatarPlayer1.avatarX, avatarPlayer1.avatarY);
   image(item.image, item.x, item.y);
   imageMode(CENTER);
   }*/
}


// keyPressed()
//
// Santa needs to know if he should move based on keyPressed
// When the keys are released, he stops moving

void keyPressed() {
  santa.keyPressed();
}

// keyReleased()
//
// When the keys are released, he stops moving

void keyReleased() {
  // Call both paddles' and avatars' keyReleased methods
  santa.keyReleased();
}