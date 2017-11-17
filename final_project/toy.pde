// Paddle
//
// A class that defines a toy dropped by the elves


class Toy {
  
  ///////// Properties //////////

  int speed;
  int SIZE = 20;

  int x;
  int y;
  int vy;


  ///////// Constructor //////////

  Toy(int tempX, int tempY, int tempSpeed) {

    x = tempX;
    y = tempY;
    speed = tempSpeed;
    
    vy = 0;
  }

  ///////// Methods //////////

  // update()
  //
  // Updates position based on velocity and constraints toy to the window

  void update() {
    y += vy;

    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  // display()
  //
  // Display the toy at its location

  void display() {
    noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, SIZE, SIZE);
  }
}