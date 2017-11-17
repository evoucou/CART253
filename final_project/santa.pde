// Santa
//
// A class that defines Santa, whom acts a bit like a paddle


class Santa {

  ///////// Properties //////////

  int speed;
  int HEIGHT = 10;
  int WIDTH = 30;

  int x;
  int y;
  int vx;
  int vy;


  ///////// Constructor //////////

  Santa(int tempX, int tempY, int tempSpeed) {

    x = tempX;
    y = tempY;
    vx = 0;
    vy = 0;
    speed = tempSpeed;
  }

  ///////// Methods //////////

  // update()
  //
  // Updates position based on velocity and constraints Santa to the window

  void update() {
    x += vx;
    y += vy;

    x = constrain(x, 0 + WIDTH/2, width - WIDTH/2);
  }

  // display()
  //
  // Display Santa at its location

  void display() {
    noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT);
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        vx = -speed;
        println("LEFT");
      } else if (keyCode == RIGHT) {
        vx = speed;
        println("RIGHT");
      }
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    if (key == CODED) {
      if (keyCode == LEFT && vx < 0) {
        vx = 0;
      } else if (keyCode == RIGHT && vx > 0) {
        vx = 0;
      }
    }
  }
}