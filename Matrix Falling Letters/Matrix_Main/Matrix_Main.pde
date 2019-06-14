Grid grid;
void setup() {
  size(900, 800);
  background(0);
  grid = new Grid();
}

void draw() {
  bg(10);
  grid.display();
}

void bg(int alpha) {
  fill(0,alpha);
  rect(0,0,width,height);
}
