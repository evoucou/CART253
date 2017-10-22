// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Avatar avatarPlayer1;
Avatar avatarPlayer2;
Score scorePlayer1;
Score scorePlayer2;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//text("score ="+score,10,10);


// The background image
PImage bgImage;


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
  
  // Loat the background image
  bgImage = loadImage("background.jpg");

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');
  
  // Create both avatars at the center of the screen
  avatarPlayer1 = new Avatar(width/2 - 35, height/2, 'r', 'f', 'd', 'g', loadImage("monster1.png"));
  avatarPlayer2 = new Avatar(width/2 + 35, height/2, 'u', 'j', 'h', 'k', loadImage("monster2.png"));

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);

  // Create the score for both players
  scorePlayer1 = new Score((width/2 - 20),10,color(250));
  scorePlayer2 = new Score((width/2 + 20),10,color(150));  

}
  // draw()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.
  void draw() {
    
    // Fill the background each frame so we have animation
    background(bgImage);
  
    // Update the paddles, ball and avatars by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    avatarPlayer1.update();
    avatarPlayer2.update();
    //score.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);
    avatarPlayer1.collide(ball);
    avatarPlayer2.collide(ball);
    
    if (ball.ballMiddle()){
      // If it is, start the face-off (before any ball reset is called)
      ball.faceOff();
    }
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
      ball.faceOff();
    }   //<>// //<>//

    // Display the paddles, the ball and the avatars
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    avatarPlayer1.display();
    avatarPlayer2.display();
    scorePlayer1.display();
    scorePlayer2.display();
    
    // Display the images
    image(avatarPlayer2.imagePlayer,avatarPlayer2.avatarX,avatarPlayer2.avatarY);
    image(avatarPlayer1.imagePlayer,avatarPlayer1.avatarX,avatarPlayer1.avatarY);
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
    //ball.keyPressed();
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
  