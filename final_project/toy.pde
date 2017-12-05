// Paddle
//
// A class that defines a toy dropped by the elves


class Toy {

  ///////// Properties //////////

  int SIZE = 25;

  float x;
  int y;
  int vy = 0;
  int vx;

  int delay;

  boolean timerRunning = false;
  int startTime = 0;

  PImage img;

  // Creates a new elf inside the toy class so that we can track
  //  its position in the main game
  Elf myElf;

  ///////// Constructor //////////

  Toy(Elf tempElf, PImage tempImg) { 

    myElf = tempElf;    
    img = tempImg;
  }

  ///////// Methods //////////


  // update()
  //
  // Updates position based on velocity and constraints toy to the window

  void update() {
    y += vy;
    x += vx;

    x = constrain(x, 50, width-50);
    y = constrain(y, 30, height);
  }

  // reset()
  //
  // What happens when the toy resets
  
  void reset() {
    y = -100;
    vy = 0;
  }

  //void timerStart() {
  //  startTime = millis();
  //  timerRunning = true;
  //}

  // santaCollide()
  //
  // Checks every side of the toy to see if it has collided with Santa

  boolean santaCollide() {

    // Calculate possible overlaps with the ball on its side
    boolean insideLeft = (x + SIZE/2 > santa.x - santa.SIZE/2);
    boolean insideRight = (x - SIZE/2 < santa.x + santa.SIZE/2);
    boolean insideTop = (y + SIZE/2 > santa.y - santa.SIZE/2);

    return(insideLeft && insideRight && insideTop);
  }
  
  // fall()
  //
  // Where the toy falls from and its velocity

  void fall() {
    // Tells the toy to fall from an elf's position
    x = myElf.x;
    y = myElf.y;
    vy = 3;
  }

  // display()
  //
  // Displays the toy and its image

  void display() {
    // If the toy isn't falling, it isn't displayed
    if (vy == 0) return;
    image(img, x, y);
    rectMode(CENTER);
  }
}