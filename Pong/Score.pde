// Avatar
//
// A class that defines an avatar that the players can move whereverthey please
// when pressing keys


/*class Score {

  /////////////// Properties ///////////////

  // The location of the avatar
  int scoreX;
  int scoreY;
  int scoreText;

  // The color of the avatar
  int scoreColor;

  /////////////// Constructor ///////////////

  Score(int _scoreX, int _scoreY, int _scoreColor, int _scoreText) {
    scoreX = _scoreX;
    scoreY = _scoreY;
    scoreColor = _scoreColor;
    scoreText = _scoreText;
  
  }

  /////////////// Methods ///////////////

  /*void update() {
   scoreX = width/2;
   scoreY = height/2;
   }*/

<<<<<<< HEAD
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
     }

=======
>>>>>>> 7b3b15b20252db1a6c55dcb2d3cc549d17507df9

  void display() {
    // Set up the body of the score
    text(scoreText,scoreX,scoreY);
    textAlign(CENTER,CENTER);
    textSize(32);
  }
}*/