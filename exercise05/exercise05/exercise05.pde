PImage bg;

void setup() {
  size(600, 400);
  background(color(243, 156, 18));
  bg = loadImage("halloween.png");
}

void draw() {
  if (width == 600 && height == 400) {
  text("Press any key and try to find the logic behing the screen resizing interaction", 300, 200);
  textAlign(CENTER);
  textSize(10);
  }
  image(bg, 0, 0);
}

void keyPressed() {
  clickSize();
}

float clickSize() {
  float value = random(0, 1);
  if (value < 0.03) {
    println("400,20");
    surface.setSize(400, 20);
  } else if (value < 0.1) {
    println("10,675");
    surface.setSize(10, 675);
  } else if (value < 0.10) {
    println("1600,200");
  } else if (value < 0.24) {
    println("1000,860");
    surface.setSize(1000, 860);
  } else if (value < 0.53) {
    println("30,50");
    surface.setSize(30, 50);
  }
  return value;
}