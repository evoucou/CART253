//This file tells Processing what exactly is a bouncer (bouncer class)

class Bouncer {

  //properties of the class
  int x;
  int y;
  int vx;
  int vy;
  int size;
  int clickSize;
  int defSize; //ADDED (defaultSize) for mouseClick
  color fillColor;
  color defaultColor;
  color hoverColor;

  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempDefSize, int tempClickSize, color tempDefaultColor, color tempHoverColor) /*here, we create new variables for the bouncer.
   They're defined in the main file, for example, (width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50)). This way, we can give them different
   sizes, color, etc. */ {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    defSize = tempDefSize;
    clickSize = tempClickSize;
    size = defSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  } 


  void update() /*void update updates the ball each frame and makes it move*/ {
    x += vx;
    y += vy;

    handleMouse(); //functions of the bouncer
    handleBounce();
    mousePressed();//ADDED function
  }


  //ADDED, the fonction mousePressed tells the computer that when it is true, the circles change
  //size to 70, and once it is false, the circles change back to default size. I had to add the variable defSize
  //because in the "else" command, we could not tell the circles to go back to the original size without it. ("size = size" obviously
  //doesnt work - because at first, we only had size and clickSize).
  void mousePressed() {
    if (mousePressed == true) {
      size = clickSize;
    } else {
      size = defSize;
    }
  }

  //this condition tells the object to bounce back when it hits any side of the screen. 
  void handleBounce() {


    if (x - size/2 < 0 || x + size/2 > width) { 
      vx = -vx; 
      x=width/2;
      y=height/2; //CHANGED: when the ball touches the borders, its position reinitializes.
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
      x=width/2;
      y=height/2; //CHANGED: when the ball touches the borders, its position reinitializes. (at some point it seems like
      //nothing is happening because it's always the same position, we could fix that by changing the color for every new streak
      //OR making the streak disappear each time.
    }


    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }


  //this condition tells the object that if it crosses the mouth's path, it changes color. If not, default color.
  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  } 


  //draws the shape that constructs the object itself and specifies its shape, its color etc.
  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}