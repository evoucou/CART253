// Item
//
// A class that defines an object that appears randomly on the screen
// and if the player gets it with its avatar, he gets +1 point



class Item {

  /////////////// Properties ///////////////

  // The location of the item
  float itemX;
  float itemY;

  /////////////// Constructor ///////////////

  Item(float _itemX, float _itemY) {
    itemX = _itemX;
    itemY = _itemY;
  }

  /////////////// Methods ///////////////


  void display() { 
    //text(scoreText,scoreX, scoreY);
    fill(color(150));
    rect(itemX, itemY, 10, 10);
  }
}