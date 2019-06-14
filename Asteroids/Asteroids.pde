Belt b;
Ship s; 
void setup() {
  size(600,600);
  b = new Belt();
  s = new Ship();
}

void draw() {
  background(0);
  b.display();
  s.display();
}

void keyPressed() {
  //37 L, 38 U, 39 R, 40 D
  if (keyCode == 37) {
    s.moveLeft();
  } else if (keyCode == 38) {
    s.moveUp();
  } else if (keyCode == 39) {
    s.moveRight();
  } else if (keyCode == 40) {
    s.moveDown();
  }
}
