//PImage bg;
boolean timerRunning = false;
int startTime = 0;
char spaceValue = ' ';

void setup() {
  size(600, 400);
  background(color(243, 156, 18));
  //bg = loadImage("halloween.png");
}

void draw() {
  if (width == 600 && height == 400) {
    text("Press SPACE to begin", 300, 200);
    textAlign(CENTER);
    textSize(10);
    if (timerRunning == true) {
      text("Press any key to see what happens, and try to find the logic", 300, 200);
      textAlign(CENTER);
      textSize(10);
          /*if (keyPressed() = true) {
      text("Press any key to see what happens, and try to find the logic", 300, 200);
      textAlign(CENTER);
      textSize(10);
    }*/
    }
  }
  //image(bg, 0, 0);

  if (timerRunning) {
    int timeElapsed = (millis() - startTime)/1000;
    println(timeElapsed);
    spaceValue = 0;

    if (timeElapsed == 40) {
      println("Prank message");
      timerRunning = false;
      text("Just kidding! There is no logic, all random :)", 300, 200);
      textAlign(CENTER);
    }
  }
}

// keyPressed calls the clickSize function


void keyPressed() {
  if (key == spaceValue) {
    startTime = millis();
    timerRunning = true; 
  } else {
    clickSize();
  }
}




// Here, we use a controlled random float to give the user the impression that there is in fact a logic.

float clickSize() {
  float value = random(0, 1);
  if (value < 0.1) {
    println("400,20");
    surface.setSize(460, 200);
  } else if (value < 0.2) {
    println("200,675");
    surface.setSize(80, 80);
  } else if (value < 0.39) {
    println("1600,200");
    surface.setSize(100, 800);
  } else if (value < 0.54) {
    println("1000,860");
    surface.setSize(1000, 860);
  } else {
    println("80,80");
    surface.setSize(300, 675);
  }
  return value;
}