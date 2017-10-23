// Pong //<>//
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.


// HOW TO PLAY
// RED MONSTER moves with r, c, d, f (up, down, left, right), paddle 1,Q
// GREEN MONSTER MOVES WITH y, b, g, h (up, down, left, right) paddle 0,p
// When your monster touches the white star, you get one point
// Each time the ball resets, there is a faceoff.
// RED MONSTER has to press z, GREEN MONSTER has to press m.
// The first one to hit the key sends the ball the opposite direction.
// If your monster is hit by the ball or touches it, you lose a point.


// Global variables for the paddles, ball, avatars, item and score
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Item item;
Avatar avatarPlayer1;
Avatar avatarPlayer2;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;


// The background image
PImage bgImage;

// 
int scorePlayer1;
int scorePlayer2;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Load the background image
  bgImage = loadImage("background.jpg");

  // Create the paddles on either side of the screen. 
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create both avatars at the center of the screen
  avatarPlayer1 = new Avatar(width/2 - 35, height/2, 'r', 'c', 'd', 'f', loadImage("monster1.png"));
  avatarPlayer2 = new Avatar(width/2 + 35, height/2, 'y', 'b', 'g', 'h', loadImage("monster2.png"));

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);

  // Create the random item opponent
  item = new Item(random(0, width), random(0, height), loadImage("freeze.png"));
}
// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.
void draw() {

  // Fill the background each frame so we have animation
  background(bgImage);

  // Set the players' score
  text("RED MONSTER : "+scorePlayer1, 0+50, 50); 
  text("GREEN MONSTER : "+scorePlayer2, width-130, 50); 
  fill(color(255));

  // Update the paddles, ball and avatars by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  avatarPlayer1.update();
  avatarPlayer2.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  

  if (leftPaddle.scorePointPlayer1()) {
    // If the ball goes out of the screen on the right side, point for player 1
    // The first one who gets to 25 wins
      scorePlayer1 = 0;
      scorePlayer1++;
      println("+1 GREEN MONSTER");
  }

  if (rightPaddle.scorePointPlayer2()) {
    // If the ball goes out of the screen on the left side, point for player 2
    // The first one who gets to 25 wins 
      scorePlayer2 = 0;
      scorePlayer2++;
      println("+1 RED MONSTER"); //<>//
  }

  if (ball.ballMiddle()) {
    // If it is, start the face-off (this is for the first frame)
    ball.faceOff();
  }
  
  if (ball.isOffScreen()) {
    // If it has, reset the ball and call the face-off
    ball.reset();
    ball.faceOff();
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
  }


  // Display the paddles, the item, the balls, avatars and score
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  avatarPlayer1.display();
  avatarPlayer2.display();
  item.display();

  // Display the images
  image(avatarPlayer2.imagePlayer, avatarPlayer2.avatarX, avatarPlayer2.avatarY);
  image(avatarPlayer1.imagePlayer, avatarPlayer1.avatarX, avatarPlayer1.avatarY);
  image(item.image, item.x, item.y);
  imageMode(CENTER);
}


// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' and avatars' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
  avatarPlayer1.keyPressed();
  avatarPlayer2.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' and avatars' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
  avatarPlayer1.keyReleased();
  avatarPlayer2.keyReleased();
}