// Score
//
// A class that defines the score



class Score {

  /////////////// Properties ///////////////

  // The location of the avatar
  //int scoreXPlayer1 = (width/2 - 20);
  //int scoreY = 10;
  //int scoreXPlayer2 = (width/2 + 20);
  int scoreX;
  int scoreY;
  int scorePlayer;
  char scoreText;

  // The color of the avatar
  int scoreColor;

  /////////////// Constructor ///////////////

 Score(int _scoreX, int _scoreY, int _scoreColor) {
   scoreX = _scoreX;
   scoreY = _scoreY;
   scoreColor = _scoreColor; 
 }

  /*Score() {
  }
  void Player1() {
    if (ball.x - ball.SIZE/2 > width) {
      scorePlayer1++;
    }
  }
  void Player2() {
    if (ball.x + ball.SIZE/2 < 0) {
      scorePlayer2++;
    }
  }*/

  /////////////// Methods ///////////////



void display() { 
//text(scoreText,scoreX, scoreY);
rect(scoreX,scoreY,10,10);
}

}