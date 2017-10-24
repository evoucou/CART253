// Griddies
// by Pippin Barr
// MODIFIED BY: Marie-Ève
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // griddies[i] tells the program to create a griddie one by one (starting at 0) until the value of lenght (100) and tells it to give them a random x,y value at the beginning (because it's setup).
  // We multiply the size with these variables to make sure that the griddie doesn't overlaps one (moves at least its size further).
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update(); //

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // if j is the same value as i, the program goes back up to check the loop and j++ (so j isn't equal to i anymore)
      // they can't be equal because it would be a ''fake'' collide because it's the same griddie
      if (j != i) {
        // QUESTION: What does this line check?
        // This line checks if the cell checked by int i is colliding with the cell checked by int j
        griddies[i].collide(griddies[j]);
      }
    } 
    
    // Display the griddies
    griddies[i].display();
  }
}