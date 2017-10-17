// Avatar
//
// A class that defines an avatar that the players can move whereverthey please
// when pressing keys


class Score {

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


  void display() {
    // Set up the body of the score
    text(scoreText,scoreX,scoreY);
    textAlign(CENTER,CENTER);
    textSize(32);
  }
}