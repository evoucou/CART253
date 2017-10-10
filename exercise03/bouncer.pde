//This file tells Processing what exactly is a bouncer (bouncer class)

class Bouncer {
 
 //properties of the class
 int x;
 int y;
 int vx;
 int vy;
 int size;
 int clickSize;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, int tempClickSize, color tempDefaultColor, color tempHoverColor) /*here, we create new variables for the bouncer.
 They're defined in the main file, for example, (width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50)). This way, we can give them different
 sizes, color, etc. */ {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   clickSize = tempClickSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 } 
 
 
 void update() /*void update updates the ball each frame and makes it move*/ {
   x += vx;
   y += vy;
   
   handleMouse(); //functions of the bouncer
   handleBounce();

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

   
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 

 //this condition tells the object that if it crosses the mouth's path, it changes color. If not, default color.
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 } 

 
 //draws the object itself and specifies it's an ellipse, its color etc.
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size); 
 }


 void mouseClicked() {
 size = clickSize;
 println("true");
 }
}