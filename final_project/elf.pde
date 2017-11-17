// Elf
//
// A class that defines Santa's little helpers at the top


class Elf {

  ///////// Properties //////////

  //int speed;
  int HEIGHT = 30;
  int WIDTH = 30;

  int x;
  int y;
  int vx = 3;
  
  int distance = 20;


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
    
    //x = constrain(x, 0 + WIDTH/2, width - WIDTH/2);

    // Check if the elf is going further than the 50 px margins on both sides
    // and if it is, reverse its velocity
    if (x - WIDTH/2 < 50 || x + WIDTH/2 > width - 50) {
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
    rect(x, y, WIDTH, HEIGHT);
  }
}