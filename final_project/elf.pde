// Elf
//
// A class that defines Santa's little helpers at the top


class Elf {

  ///////// Properties //////////

  //int speed;
  int SIZE = 25;

  float x;
  int y;
  int vx = 3;


  ///////// Constructor //////////

  Elf(float tempX, int tempY) {
    x = tempX;
    y = tempY;   

  }

  ///////// Methods //////////

  
  // update()
  //
  // Updates position based on velocity

  void update() {
    x += vx;

    // Check if the elf is going further than the 50 px margins on both sides
    // and if it is, reverse its velocity
    if (x < 75 || x > width - 75) {
      vx = -vx;
    }
  }
 
  
  // display()
  //
  // Display the elves

  void display() {
    noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the elves as a rectangle
    rect(x, y, SIZE, SIZE);
  }
}