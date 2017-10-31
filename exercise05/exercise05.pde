PImage bg;
boolean timerRunning = false;
int startTime = 0;
char spaceValue = ' ';
String firstText = "Press SPACE to begin";
String secondText = "Press any other key and try to undestand the logic behind the screen resizing";
String displayed = "";
PFont font;

void setup() {
  size(600, 400);
  bg = loadImage("halloween.png");
  displayed = firstText;
  font = createFont("arial", 20);
  textFont(font);
  fill(255);
}

void draw() {

  image(bg, 0, 0);
  text(displayed, width/2 - textWidth(displayed)/2, height/2);
  

  if (timerRunning) {
    int timeElapsed = (millis() - startTime)/1000;
    println(timeElapsed);
    spaceValue = 0;
    

    if (timeElapsed == 20) {
      println("Prank message");
      timerRunning = false;
      text("Just kidding! There is no logic, all random :)", 300, 200);
      textAlign(CENTER);
      surface.setSize(600, 400);
      //with this variable, we make sure the second text doesn't appear again at the end
    }
  }
}


// keyPressed calls the clickSize function


void keyPressed() {
  if (key == spaceValue) {
    startTime = millis();
    timerRunning = true;
    displayed = displayed.equals(firstText)? secondText:firstText;
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