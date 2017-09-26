final int CIRCLE_SPEED = 7;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
final color NEW_COLOR = color(100, 50, 50); //ADDED
final int CIRCLE_SIZE = 50;

/* A new color has been inserted under the identification of NEW_COLOR */

int circleX;
int circleY;
int circleVX;
int circleVY;
int circleColor; 

/* We have to indicate that the integer circleX exists, as example, because if not, the program would tell us that the variable circleX doesn't exist,
 since it's only found lower inside curly brackets. It also allows us to use the integer as many times as we want. */

void setup() {
  size(640, 480);
  circleX = width/2;
  circleY = height/2;
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  circleColor = NO_CLICK_FILL_COLOR;
  stroke(STROKE_COLOR);
  fill(circleColor);
  background(BACKGROUND_COLOR);
}

/* void setup indicates what we want to happen at the start.
 CIRCLE_SPEED makes the circles move. Instead of being X and Y coordinates, we simply place the original circle at the center by indicating that it 
 is situated at half the height and half the lenght of our given surface. We don't have to rewrite the actual color of the background, 
 for instance, because we already told processing that BACKGROUND_COLOR is (250,150,150). Same for stroke, fill and circle's position and velocity. */

void draw()
{

  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    circleColor=CLICK_FILL_COLOR;
  } //ADDED CONDITION
  else if (circleY + CIRCLE_SIZE/2 <= 100 || circleY - CIRCLE_SIZE/2 >= 380) {
    circleColor=color(random(0,255),55,100);
  } //END OF ADDED CONDITION
  else {
    circleColor=NO_CLICK_FILL_COLOR;
  }
  
  fill(circleColor); //ADDED VARIABLE

  /* void draw indicates the program that this is what we want to happen every frame. This indicates that if the mouse crosses the circle's path, the color is changed
   for the one that has been attributed to CLICK_FILL_COLOR which is blue. The "else" variable is important because it specifies that the circle 
   must be blue ONLY when meeting the cursor, and as soon as it moves away, it becomes pink again. 
   

  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

/*|| means that it's true if either one condition or the other is true, otherwise it's false. The first "it" tells the circle that once it touches either the
 right or the left side of the screen, it has to bounce back (it's going to change direction because circleVY becomes negative). 
 The second "if" means that it's the same thing but if it touches either the bottom or the top. We use 'CIRCLE_SIZE/2' because if we didn't, it would mean
 that the circle would bounce back when its radius touches the screen, so half the circle would be out of the frame. 
 */

void mousePressed() {
  background(BACKGROUND_COLOR);
}

/* mousePressed means that the background is pink when we click, erasing everything that was there before, and the animation starts over. */