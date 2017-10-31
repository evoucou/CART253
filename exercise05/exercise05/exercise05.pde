

void setup() {
  size(400, 600);
}

void draw() {
  text("Press any key and try to find the logic", height/2, width/2);
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