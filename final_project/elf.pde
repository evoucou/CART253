// Elf
//
// A class that defines Santa's little helpers at the top

class Elf {

  ///////// Properties //////////

  //int speed;
  int SIZE = 25;

  int x;
  int y;
  int vx;
  
  PImage img;


  ///////// Constructor //////////

  Elf(int tempX, int tempY, int tempVX, PImage tempImg) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    img = tempImg;
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
  // Displays the elves

  void display() {
    noStroke();
    fill(color(250));
    rectMode(CENTER);

  }
}