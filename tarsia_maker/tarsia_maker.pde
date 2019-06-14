int TRIANGLE_SIZE = 50;
Triangle triangle;
void setup() {
  size(600,800);
  triangle = new Triangle(width/2, height/2);
}

void draw() {
  triangle.display();
}
