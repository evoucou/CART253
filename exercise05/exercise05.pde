// THIS GAME TELLS THE USER TO PRESS THE Q,W,E AND R KEYS AND TO FIND THE CORRELATION BETWEEN THESE KEYS AND THE SCREEN SIZE.
// BUT IN REALITY, THERE IS NO LOGIC, BECAUSE IT'S ALL RANDOM!
// THIS GAME IS A PRANK :) 

// Variables for timer

boolean timerRunning = false;
int startTime = 0;

// Variables keyPressed and screen resizing

char spaceValue = ' ';

// Variables for text

String firstText = "Press SPACE to begin";
String secondText = "Press simultaneously the keys q, w, e, and r and try";
String secondText2 = "to undestand the logic behind the screen resizing";
String lastText = "YOU HAVE BEEN PRANKED!";
String lastText2 = "There is no logic, only randomness :)";
String line1 = "";
String line2 = "";
String blank = "";

// Drawing font and image

PFont font;
PImage bg;

void setup() {
  size(600, 400);
  bg = loadImage("halloween.png");
  line1 = firstText;
  line2 = blank;
  font = createFont("arial", 20);
  textFont(font);
  fill(255);
}

void draw() {

  image(bg, 0, 0);
  text(line1, width/2 - textWidth(line1)/2, height/2-11); //Sets the two lines for the text
  text(line2, width/2 - textWidth(line2)/2, height/2+11);

  // If timerRunning is true, the count starts

  if (timerRunning) {
    int timeElapsed = (millis() - startTime)/1000;
    spaceValue = 0;

    // When the time count is at 10, the "game" ends and the prank message appears

    if (timeElapsed == 10) {
      timerRunning = false;
      line1 = line1.equals(lastText)? secondText:lastText;
      line2 = line2.equals(lastText2)? secondText2:lastText2;
      surface.setSize(600, 400);
    }
  }
}


// keyPressed starts the timer, if the spacebar is pressed, and calls clickSize if it's any other key. (Clears the text as well)

void keyPressed() {
  if (key == spaceValue) {
    startTime = millis();
    timerRunning = true;
    line1 = line1.equals(firstText)? secondText:firstText;
    line2 = line2.equals(blank)? secondText2:blank;
  } else {
    clickSize();
    line2 = blank;
    line1 = blank;
  }
}


// Here, we use a controlled random float to give the user the impression that there is in fact a logic. Each value is attributed to a
// (controlled as well) random screen size.

float clickSize() {
  float value = random(0, 1);
  if (value < 0.1) {
    surface.setSize(460, 200);
  } else if (value < 0.2) {
    surface.setSize(80, 80);
  } else if (value < 0.39) {
    surface.setSize(100, 800);
  } else if (value < 0.54) {
    surface.setSize(1000, 860);
  } else {
    ;
    surface.setSize(300, 675);
  }
  return value;
}