// Exercise 07
//
// Using the sound library and bouncers

// Import the library
import processing.sound.*;

// The SoundFile class comes with the library, it allows us to store
// a sound in a variable
SoundFile daddy;
SoundFile ice;

// Five defined bouncers which will create a random melody
Bouncer daddyBouncer;
Bouncer iceBouncer;

// Set the instructions at the beginning
String text = "In this exercise, we experiment with a diversity of sounds ;";
String text2 = "Press S,D,F,G OR H to generate bouncers and create weird music!";
String line = "";
String line2 = "";

// setup()
//
// Create the initial bouncers

void setup() {
  size(640, 480);

  // Creating a new SoundFile and giving it the path to our five files
  daddy = new SoundFile(this, "sounds/daddy.wav");
  ice = new SoundFile(this, "sounds/ice.wav");
  //tone = new SoundFile(this, "sounds/.wav");
  //tone = new SoundFile(this, "sounds/.wav");
  //tone = new SoundFile(this, "sounds/.wav");

  // Set the text
  line = text;
  line2 = text2;
  fill(255);
  textSize(15);

  daddyBouncer = new Bouncer("sounds/daddy.wav", width/2, height/2, 40, color(255));
  iceBouncer = new Bouncer("sounds/ice.wav", width/2, height/2, 40, color(255));
  //bouncerDaddy = new Bouncer(width/2, height/2, random(-5, 5), random(-5, 5), 30, color(255));
  //bouncerDaddy = new Bouncer(width/2, height/2, random(-5, 5), random(-5, 5), 30, color(255));
  //bouncerDaddy = new Bouncer(width/2, height/2, random(-5, 5), random(-5, 5), 30, color(255));
}


// draw()
//
// Call the bouncer's functions and draw the text

void draw() {

  // Draw the background
  background(0);

  //ice.play();
  //daddy.play();

  // Draw the text
  text(line, width/2 - textWidth(line)/2, height/2-10);
  text(line2, width/2 - textWidth(line2)/2, height/2+10);

  // Our old friend the for-loop running through the length of an array to
  // update and display objects, in this case Bouncers.
  daddyBouncer.display();
  daddyBouncer.update();

  iceBouncer.display();
  iceBouncer.update();
}


// keyPressed()
//
// Verify if the keys are pressed to make the bouncers move

void keyPressed() {
  if (key == 'd') {
    daddyBouncer.call();
    println("d");
  }
  if (key == 'i') {
    iceBouncer.call();
    println("i");
  }
}