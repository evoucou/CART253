// Elf
//
// A class that defines Santa's little helpers at the top


class Elf {

  ///////// Properties //////////

  //int speed;
  int SIZE = 25;

  int x;
  int y;
  int vx = 3;


  ///////// Constructor //////////

  Elf(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  ///////// Methods //////////


  // update()
  //
  // Updates position based on velocity

  void update() {
    x += vx;
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