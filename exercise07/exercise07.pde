
// Exercise 06
//
// Using sound

// Import the library
import processing.sound.*;

// The SoundFile class comes with the library, it allows us to store
// a sound in a variable
SoundFile daddy;

// An array of bouncers which will create a random melody
Bouncer[] bouncers = new Bouncer[5];

// Set the text
String text = "In this exercise, we experiment with a diversity of sounds ;";
String text2 = "Press S,D,F,G OR H to generate bouncers and create weird music!";
String line = "";
String line2 = "";


// setup()
//
// Creates the bouncers

void setup() {
  size(640, 480);

  // Creating a new SoundFile and giving it the path to the file
  daddy = new SoundFile(this, "sounds/daddy.wav");
  //tone = new SoundFile(this, "sounds/vocal.wav");
  //tone = new SoundFile(this, "sounds/symbal.wav");
  //tone = new SoundFile(this, "sounds/drum.wav");
  //tone = new SoundFile(this, "sounds/voice.wav");

  // Set the text
  line = text;
  line2 = text2;
  fill(255);
  textSize(15);

  // Our old friend the for-loop used to go through the length of an
  // array adding new objects to it (Bouncers in this case)
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-5, 5), random(-5, 5), random(20, 50), color(255));
  }
}

// draw()
//
// Processes the frame of video, draws the video to the screen, updates the Bouncers
// and then just draws an ellipse at the brightest pixel location. You code should
// do something much more interesting in order to actually interact with the Bouncers.

void draw() {

  // Draw the background
  background(0);

  // Draw the text
  text(line, width/2 - textWidth(line)/2, height/2-10);
  text(line2, width/2 - textWidth(line2)/2, height/2+10);

  // Our old friend the for-loop running through the length of an array to
  // update and display objects, in this case Bouncers.
  // If the brightness (or other video property) is going to interact with all the
  // Bouncers, it will need to happen in here.
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].update();
    bouncers[i].display();
  }
}

void keyPressed() {
  if (key == 'd') {
    daddy.play();
  }
}