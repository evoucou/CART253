// Santa Rush
//
// A game inspired by Space Invaders in which you play santa and you need
// to catch the toys that the Christmas elves are dropping.


// We generate Santa
Santa santa;

// We generate our array of toys
//Toy[] toys = new Toy[5];

// We generate our array of Christmas elves
//Elf[] elves = new Elf[12];

// The distance from the edge of the window a paddle should be
int santaInset = 8;


// The background image
//PImage bgImage;

// 
//int score;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Load the background image
  //bgImage = loadImage("background.jpg");

  // Create Santa at the bottom
  santa = new Santa(width/2 - santa.WIDTH/2, santaInset, 5, 5);

  // Create the elves at the top with the loop
  /*for (int i = 0; i < elves.length; i++) {
    elves[i] = new Elf(random(0, width), random(0, height), random(-5, 5), random(-5, 5), random(20, 50), color(255));

    // Create the toys with the loop
    for (int i = 0; i < toys.length; i++) {
      toys[i] = new Toy(random(0, width), random(0, height), random(-5, 5), random(-5, 5), random(20, 50), color(255));
    }*/
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
    //toys[i].display();
    //elves[i].display();
    santa.display();


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