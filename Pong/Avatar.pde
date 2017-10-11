// Avatar
//
// A class that defines an avatar that the players can move whereverthey please
// when pressing keys


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
  int avatarSize;

  // The characters used to make the avatar move, defined in constructor
  char upKey;
  char downKey;
  char rightKey;
  char leftKey;


  // The color of the avatar
  int avatarColor = color(250);

  /////////////// Constructor ///////////////

  Avatar (int _avatarX, int _avatarY, int _avatarSize, char _upKey, char _downKey, char _leftKey, char _rightKey) {
    avatarX = _avatarX;
    avatarY = _avatarY;
    avatarSize = _avatarSize;

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

  // reset()
  //
  // Resets the avatar to the centre of the screen when it touches the ball
  // Note that it KEEPS its velocity

  /*void reset() {
   avatarX = width/2;
   avatarY = height/2;
   }*/

  // collide(Avatar avatarPlayer1)
  //
  // Checks whether this avatar is colliding with the ball passed as an argument
  // If it is, it makes the avatar restart at the center (reset) and the player
  // loses 1 pt

  void collide(Ball ball) {
    if ((avatarX + avatarSize/2 == ball.x - ball.SIZE/2) || (avatarY + avatarSize/2 == ball.y - ball.SIZE/2)) {
      avatarX = width/2;
      avatarY = height/2;
    }


    // Calculate possible overlaps with the paddle side by side
    /*boolean insideLeft = (avatarX + avatarSize/2 > ball.x - ball.SIZE/2);
     boolean insideRight = (avatarX - avatarSize/2 < ball.x + ball.SIZE/2);
     boolean insideTop = (avatarY + avatarSize/2 > ball.y - ball.SIZE/2);
     boolean insideBottom = (avatarY - avatarSize/2 < ball.y + ball.SIZE/2);
     
     // Check if the avatar overlaps with the ball
     if (insideLeft && insideRight && insideTop && insideBottom) {
     // If it was moving to the left
     if (avatarVX < 0) {
     // Reset its position to align with the right side of the ball
     avatarX = ball.x + 16/2;
     } else if (avatarVX > 0) {
     // Reset its position to align with the left side of the ball
     avatarX = ball.x - 16/2;
     }
     // And make it reappear at the center
     avatarX = width/2;
     avatarY = height/2;
     }*/
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
        println("top");
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity
      avatarVY = avatarSpeed;
        println("down");
    } // Otherwise check if the key is our down key 
    else if (key == leftKey) {
      // If so we want a negative x velocity
      avatarVX = -avatarSpeed;
        println("left");
    } // Otherwise check if the key is our down key 
    else if (key == rightKey) {
      // If so we want a positive x velocity
      avatarVX = avatarSpeed;
      println("right");
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
      // If so it should stop
      avatarVY = 0;
    } // Otherwise check if the key is our left key and avatar is moving left
    else if (key == leftKey && avatarVX < 0) {
      // If so it should stop
      avatarVX = 0;
    } // Otherwise check if the key is our right key and avatar is moving right
    else if (key == rightKey && avatarVX > 0) {
      // If so it should stop
      avatarVX = 0;
    }
  }


  void display() {
    // Set up the body of the avatar
    noStroke();
    fill(avatarColor);
    rectMode(CENTER);


    // Draw the avatar (as a rectangle because we will put an image)
    rect(avatarX, avatarY, avatarSize, avatarSize);
  }
}