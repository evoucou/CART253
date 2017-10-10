/* In this code, we use a class named ''bouncer'' which allows us to use to create an object and use it twice
but with different proprieties, in this case different colors and different directions.*/

color backgroundColor = color(200,150,150);
Bouncer bouncer; //variable BOUNCER with the new object, bouncer
Bouncer bouncer2; //same variable but with another object

void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,70,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,-2,50,70,color(0,0,150,50),color(0,0,255,50)); //CONSTRUCTOR, CREATES A NEW OBJECT
}

//METHODS of the object
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw(); //or bouncer.display
  bouncer2.draw();

} 