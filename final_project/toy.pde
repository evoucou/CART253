// Paddle
//
// A class that defines a toy dropped by the elves


class Toy {

  ///////// Properties //////////

  int SIZE = 25;

  float x;
  int y;
  int resetX;
  int resetY;
  int resetVX;
  int vy = 0;
  int vx;
  
  int delay;
  
  boolean timerRunning = false;
  int startTime = 0;
  
  PImage img;
  
  Elf myElf;
  
  //int startTime = 0;
  //boolean timerRunning = true;

  //boolean timerRunning = false;
  //int startTime = 0;


  ///////// Constructor //////////

  Toy(Elf tempElf, int tempDelay, PImage tempImg) { 

    myElf = tempElf;
    delay = tempDelay;    
    img = tempImg;
    tempDelay = (millis() - startTime)/1000;


    //x = tempX;
    //y = tempY;

    //resetY = tempY;
    //resetX = tempX;

    //vx = tempVX;
    //resetVX = tempVX;
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
    //x = resetX;
    //y = resetY;

    //vx = resetVX;
    y = -100;
    vy = 0;
  }
  
    void delayStart() {
   startTime = millis();
   timerRunning = true;
   }


  // display()
  //
  // Display the toy at its location

  /*void countMillis() { 
   if (timerRunning) {
   int timeElapsed = (millis() - startTime)/1000;
   println("TOY FALL"+timeElapsed);
   
   if (timeElapsed == 3) {
   vy = 0;
   vx = 0;
   }
   }
   }*/

  /*boolean fall() {
   return(vy == 3 && vx == 0);
  }*/
   
   
          /*startTime = millis();
   timerRunning = true;
   countMillis();
   }*/


  boolean santaCollide() {

    // Calculate possible overlaps with the ball on its side
    boolean insideLeft = (x + SIZE/2 > santa.x - santa.SIZE/2);
    boolean insideRight = (x - SIZE/2 < santa.x + santa.SIZE/2);
    boolean insideTop = (y + SIZE/2 > santa.y - santa.SIZE/2);

    return(insideLeft && insideRight && insideTop);
  }

  void fall() {    
   x = myElf.x;
   y = myElf.y;
   vy = 3;
  }


  void display() {
    if (vy == 0) return;
    
    noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, SIZE, SIZE);
  }

}

/*
class Button {
  int x;
  int y;
  int size;
  Button() {
    x = width/2;
    y = height/2;
    size = width/4;
  }
  void mouseClicked() {
    // Without this if statement, the Button would say it
    // was clicked whenever the user clicked ANYWHERE
    // With this if statement, the Button will say it is
    // clicked ONLY if the click was inside its circle
    if (dist(mouseX,mouseY,x,y) < size/2) {
      println("Button was clicked!");
    }
  }
  void display() {
    ellipse(x,y,size,size);
  }
}*/