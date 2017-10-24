// Bobbie //<>//
//
// A class defining the behaviour of a single Bobbie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Bobbie.

class Bobbie {
  // Limits for energy level and gains/losses
  int maxEnergy = 155;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(0, 150, 150);


  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Bobbie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

 // update()
  //
  // Move the Griddie and update its energy levels
  void update() {

    // QUESTION: What is this if-statement for?
    // If the energy equals zero, the rest of the function is ignored and the program moves on because the griddie is 'dead'
    if (energy == 0) {
      return;
    }

    // QUESTION: How does the Griddie movement updating work?
    // THIS MAKES A SINGLE GRIDDIE MOVE
    // The griddie moves between backwards 1 and upwards 2, so that gives the new location
    // We multiply the size with these variables to make sure that the griddie doesn't overlaps one (moves at least its size further).
    int xMoveType = floor(random(-3, 3));
    int yMoveType = floor(random(-3, 3));
    x += size * xMoveType;
    y += size * yMoveType;

    // QUESTION: What are these if statements doing?
    // If the griddie goes out of the screen either on X or Y axis, it comes back on the opposite side.
    if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }
    
    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;

    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  //
  // Checks if a bobbie collided with a griddie

  void collide(Griddie other) {

    if (x == other.x && y == other.y) {
      // Change the color
      fill(fill, energy);
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);
      println(x,y);
    }
  }


  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    // It tells the program that the less energy, the less the opacity
    noStroke();
    rect(x, y, size, size);
  }
}