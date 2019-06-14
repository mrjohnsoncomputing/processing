PImage img;
ImgTool tool;
void setup() {
  size(640, 480);
  img = loadImage("dino_left.jpg");
  tool = new ImgTool();
  frameRate(1);
}

void draw() {
  image(img, 0,0);
  img = tool.brighten(img, 20);
}
