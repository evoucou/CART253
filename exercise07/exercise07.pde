// Exercise 07
//
// Using the sound library and bouncers

// Import the library
import processing.sound.*;

// The SoundFile class comes with the library, it allows us to store
// a sound in a variable
SoundFile daddy;
SoundFile ice;
SoundFile sms;
SoundFile chaching;
SoundFile bird;

// Five defined bouncers which will create a random "melody"
Bouncer daddyBouncer;
Bouncer iceBouncer;
Bouncer smsBouncer;
Bouncer chaBouncer;
Bouncer birdBouncer;

// Set the instructions at the beginning
String text = "In this exercise, we experiment with a diversity of sounds ;";
String text2 = "Press S,I,D,C OR B to generate bouncers and create weird music!";
String line = "";
String line2 = "";

// setup()
//
// Create the initial bouncers

void setup() {
  size(640, 480);

  // Creating a new SoundFile and giving it the path to our five files
  daddy = new SoundFile(this, "GitHub/cart253/exercise07/sounds/daddy.wav");
  ice = new SoundFile(this, "GitHub/cart253/exercise07/sounds/ice.wav");
  sms = new SoundFile(this, "GitHub/cart253/exercise07/sounds/sms.wav");
  chaching = new SoundFile(this, "GitHub/cart253/exercise07/sounds/chaching.wav");
  bird = new SoundFile(this, "GitHub/cart253/exercise07/sounds/bird.wav");

  // Set the text
  line = text;
  line2 = text2;
  fill(255);
  textSize(15);

  daddyBouncer = new Bouncer(daddy, width/2, height/2, 40, color(255));
  iceBouncer = new Bouncer(ice, width/2, height/2, 40, color(255));
  smsBouncer = new Bouncer(sms, width/2, height/2, 40, color(255));
  chaBouncer = new Bouncer(chaching, width/2, height/2, 40, color(255));
  birdBouncer = new Bouncer(bird, width/2, height/2, 40, color(255));
}


// draw()
//
// Call the bouncer's functions and draw the text

void draw() {

  // Draw the background
  background(0);

  // Draw the text
  text(line, width/2 - textWidth(line)/2, height/2-60);
  text(line2, width/2 - textWidth(line2)/2, height/2-40);

  // Our old friend the for-loop running through the length of an array to
  // update and display objects, in this case Bouncers.
  daddyBouncer.display();
  daddyBouncer.update();

  iceBouncer.display();
  iceBouncer.update();
  
  smsBouncer.display();
  smsBouncer.update();
  
  chaBouncer.display();
  chaBouncer.update();
  
  birdBouncer.display();
  birdBouncer.update();
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
    if (key == 's') {
    smsBouncer.call();
    println("s");
  }
      if (key == 'c') {
    chaBouncer.call();
    println("c");
  }
        if (key == 'b') {
    birdBouncer.call();
    println("b");
  }
}

void keyReleased() {
if (key == 'd') {
    daddyBouncer.freeze();
  }
  if (key == 'i') {
    iceBouncer.freeze();
  }
    if (key == 's') {
    smsBouncer.freeze();
  }
      if (key == 'c') {
    chaBouncer.freeze();
  }
        if (key == 'b') {
    birdBouncer.freeze();
  }
}