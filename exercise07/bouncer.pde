// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity and make a sound.

class Bouncer {


  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // Variable for speed
  float speed = 0;

  // The size of the Bouncer
  float size;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  // The sound linked with the bouncer
  SoundFile sound;

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(SoundFile tempSound, float tempX, float tempY, float tempSize, color tempDefaultColor) { 
    sound = tempSound;
    x = tempX;
    y = tempY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    x += vx;
    y += vy;

    handleBounce();
  }


  // handleBounce()
  //
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately AND plays a sound

  void handleBounce() {
    // Check the left and right
    if (x - size/2 < 0 || x + size/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
      // Play the sound
      sound.play();
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
      // Play the sound
      sound.play();
    }


    // Make sure the Bouncer isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }


  // call()
  //
  // Call the bouncer so it starts moving

  void call() {
    speed = random(3,12);
    vx = speed;
    vy = speed;
  }

  // stop()
  //
  // Stops the bouncer

  void freeze() {
    speed = 0;
    vx = speed;
    vy = speed;
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}