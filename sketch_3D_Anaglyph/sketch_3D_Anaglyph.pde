Anaglyph A;
void setup() {
  size(640, 480);
  PImage Limg = loadImage("dino_left.jpg");
  PImage Rimg = loadImage("dino_right.jpg");
  A = new Anaglyph(Rimg, Limg, 52, 5);
  A.create();
}

void draw() {
  A.display();
}
