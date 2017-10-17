// Avatar
//
// A class that defines an avatar that the players can move whereverthey please
// when pressing keys


class Score {

  /////////////// Properties ///////////////

  // The location of the avatar
  int scoreX;
  int scoreY;
  int scoreNumber;

  // The speed and size of the avatar
  int scoreSize;

  // The color of the avatar
  color scoreColor;

  /////////////// Constructor ///////////////

  Score(int _scoreX, int _scoreY, int _scoreColor) {
    scoreX = _scoreX;
    scoreY = _scoreY;
    scoreColor = _scoreColor;
  
  }

  /////////////// Methods ///////////////

  // reset()
  //
  // Resets the avatar to the centre of the screen when it touches the ball
  // Note that it KEEPS its velocity

  // collide(Avatar avatarPlayer1)
  //
  // Checks whether this avatar is colliding with the ball passed as an argument
  // If it is, it makes the avatar restart at the center (reset) and the player
  // loses 1 pt

  /*void collide(Ball ball) {
    if ((avatarX + avatarSize/2 == ball.x - ball.SIZE/2) && (avatarY + avatarSize/2 == ball.y - ball.SIZE/2)) 
    }*/


  /*void update() {
   scoreX = width/2;
   scoreY = height/2;
   }*/

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


  void display() {
    // Set up the body of the avatar
    text("score="+scoreNumber, 10,10);
    textAlign(CENTER, CENTER);
    textSize(32);
  }
}