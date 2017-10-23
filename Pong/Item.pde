// Item
//
// A class that defines an object that appears randomly on the screen
// and if the player gets it, it freezes the opponent



class Item {

  /////////////// Properties ///////////////

  // The location of the item
  float x;
  float y;
  float newX;
  float newY;
  
  int size = 30;
  
  // The image of the item
  PImage image;

  /////////////// Constructor ///////////////

  Item(float _x, float _y, PImage _image) {
    x = _x;
    y = _y;
    _y = newY;
    _x = newX;
    image = _image;
  }

  /////////////// Methods ///////////////
  
   // reset()
  //
  // Generates a new random position for the item
  
  void reset() {
  x = newX;
  y = newY;
  }

  void display() { 
    //text(scoreText,scoreX, scoreY);
    fill(color(150));
    rect(x, y, 10, 10);
  }
}