// Paddle
//
// A class that defines a toy dropped by the elves


class Toy {

  ///////// Properties //////////

  int SIZE = 25;

  int x;
  int y;
  int newX;
  int newY;
  int vy = 0;
  int vx;

  boolean timerRunning = false;
  int startTime = 0;


  ///////// Constructor //////////

  Toy(int tempX, int tempY, int tempVX) {

    x = tempX;
    y = tempY;
    newY = tempY;
    newX = tempX;
    vx = tempVX;
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

  void reset() {
    x = newX;
    y = newY;
    vy = 0;
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

      if (timeElapsed == 5) {
        vy = 3;
        vx = 0;
      }
    }
  }

  /*void collide(Santa other) {
   
   if (y > other.y && y < other.y + other.SIZE) {
   println("collide");
   reset = true;
   } else {
   strikes--;
   }
   }
   */
   
  boolean santaCollide() {
    //return (y > santa.y && y < santa.y + santa.SIZE);

    // Calculate possible overlaps with the ball side by side
    boolean insideLeft = (x + SIZE/2 > santa.x - santa.SIZE/2);
    boolean insideRight = (x - SIZE/2 < santa.x + santa.SIZE/2);
    boolean insideTop = (y + SIZE/2 > santa.y - santa.SIZE/2);
    boolean insideBottom = (y - SIZE/2 < santa.y + santa.SIZE/2);

    return(insideLeft && insideRight && insideTop && insideBottom);
  }

  /*boolean noCollide() { 
    return((x < santa.x && x > santa.x + santa.SIZE) && y );

    boolean insideLeft = (x + SIZE/2 < santa.x - santa.SIZE/2);
    boolean insideRight = (x - SIZE/2 > santa.x + santa.SIZE/2);
    boolean insideTop = (y + SIZE/2 < santa.y - santa.SIZE/2);
    boolean insideBottom = (y - SIZE/2 > santa.y + santa.SIZE/2);

    return(insideLeft && insideRight && insideTop && insideBottom);
  }*/


  void display() {
   noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, SIZE, SIZE);
  }
  
  /*
  float value = random(0,1);
if (value < 0.01) {
  println("Ultra rare loot drop! 1% chance of this!");
}
else if (value < 0.06) {
  println("Pretty rare loot drop! 5% chance of this!");
}
else if (value < 0.16) {
  println("Kind of rare loot drop! 10% chance of this!");
}
else if (value < 0.5) {
  println("Okay loot drop. 34% chance of this...");
}
else {
  println("The same rusty battle-axe you always find. 50% chance of this.");
}*/
}