// Avatar
//
// A class that defines an avatar that the player can move to go get bonus point scores
// but he can also lose points by getting hit by the ball



class Avatar {

  /////////////// Properties ///////////////

  // The location of the avatar
  int avatarX;
  int avatarY;

  // The velocity of the avatar
  int avatarVX;
  int avatarVY;

  // The speed and size of the avatar
  int avatarSpeed;
  int avatarSize = 20;

  // The keys u make the avatar move, defined in constructor
  char upKey;
  char downKey;
  char rightKey;
  char leftKey;
  
  // Image of the avatar
  PImage imagePlayer;

  /////////////// Constructor ///////////////

  Avatar (int _avatarX, int _avatarY, char _upKey, char _downKey, char _leftKey, char _rightKey, PImage _imagePlayer) {
    avatarX = _avatarX;
    avatarY = _avatarY;
    imagePlayer = _imagePlayer;

    upKey = _upKey;
    downKey = _downKey;
    leftKey = _leftKey;
    rightKey = _rightKey;
  }

  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the avatar move.

  void update() {
    // First update the location based on the velocity (so the avatar moves)
    avatarX += avatarVX;
    avatarY += avatarVY;

    // Restrains the avatar from going off the screen
    avatarY = constrain(avatarY, 0 + avatarSize/2, height - avatarSize/2);
    avatarX = constrain(avatarX, 0 + avatarSize/2, width - avatarSize/2);
  }

  // collide(Ball ball)
  //
  // Checks whether this avatar is colliding with the ball passed as an argument
  // If it is, it makes the avatar restart at the center (reset) and the player
  // loses 1 point

  void collide(Ball ball) {
    // Calculate possible overlaps with the ball side by side
    boolean insideLeft = (avatarX + avatarSize/2 > ball.x - ball.SIZE/2);
    boolean insideRight = (avatarX - avatarSize/2 < ball.x + ball.SIZE/2);
    boolean insideTop = (avatarY + avatarSize/2 > ball.y - ball.SIZE/2);
    boolean insideBottom = (avatarY - avatarSize/2 < ball.y + ball.SIZE/2);

    // Check if the ball overlaps with the avatar
    if (insideLeft && insideRight && insideTop && insideBottom) {
    //If it's the case, reset it to the center and the player loses a point
      avatarX = width/2;
      avatarY = height/2;
    }
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program

  void keyPressed() {
    avatarSpeed = 5;

    // Check if the key is our up key
    if (key == upKey) {
    // If so we want a negative y velocity
      avatarVY = -avatarSpeed;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
    // If so we want a positive y velocity
      avatarVY = avatarSpeed;
    } // Otherwise check if the key is our down key 
    else if (key == leftKey) {
    // If so we want a negative x velocity
      avatarVX = -avatarSpeed;
    } // Otherwise check if the key is our down key 
    else if (key == rightKey) {
    // If so we want a positive x velocity
      avatarVX = avatarSpeed;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the avatar is moving up
    if (key == upKey && avatarVY < 0) {
    // If so it should stop
      avatarVY = 0;
    } // Otherwise check if the key is our down key and avatar is moving down 
    else if (key == downKey && avatarVY > 0) {
    // Same
      avatarVY = 0;
    } // Otherwise check if the key is our left key and avatar is moving left
    else if (key == leftKey && avatarVX < 0) {
    // Same
      avatarVX = 0;
    } // Otherwise check if the key is our right key and avatar is moving right
    else if (key == rightKey && avatarVX > 0) {
    // Same
      avatarVX = 0;
    }
  }

  // display()
  //
  // Display the avatar at its location

  void display() {
   rect(avatarX, avatarY, avatarSize, avatarSize);
  }
}