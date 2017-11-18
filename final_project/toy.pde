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

  boolean timerRunning = false;
  int startTime = 0;
  
  boolean reset = false;


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
  
  void toyStart() {
    startTime = millis();
    timerRunning = true;
  }

  void toyFreq() { 
    if (timerRunning) {
      int timeElapsed = (millis() - startTime)/1000;
      println(timeElapsed);

      if (timeElapsed == 5) {
        vy = 3;
      }
    }
  }
  
     void collide(Santa other) {

    if (y > other.y && y < other.y + other.SIZE) {
      println("collide");
      reset = true;
    }
    if (reset == true) {
    
    }
  }
 


  void display() {
    noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, SIZE, SIZE);
  }
}