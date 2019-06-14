float segments = 26;
float angle = 0;

void setup() {
  size(500,500);

  drawCircle();
  float a = 360/segments;
  drawSegments(a);
  save("circle.png");
}

void drawCircle() {
  noFill();
  ellipseMode(CORNER);
  ellipse(0,0,width, height);
}

void drawSegments(float a) {
  float x = ceil(segments/2);
  for (int i = 0; i < x; i++) {
    print(angle, "\n");
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(angle));
    line(0, -height/2, 0, height/2);
    popMatrix();
    angle += a;
  }
}
