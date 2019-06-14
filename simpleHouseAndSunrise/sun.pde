float sunX = 0;
float sunY = 250;
float sunW = 40;
float sunSpeed = 0.01;
float angle = 0;
float blue = 0;
float red = 0;
float green = 0;
boolean day = false;

void drawSun() {
  if (angle < 180) {
    blue = map(angle, 0, 180, 50, 250);
    red = map(angle, 0, 180, 0, 150);
    green = map(angle, 0, 180, 0, 50);
    day = true;
  } else {
    blue = map(angle, 180, 360, 250, 50);
    red = map(angle, 180, 360, 150, 0);
    green = map(angle, 180, 360, 50, 0);
    day = false;
  }
  background(red,green,blue);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));
  noStroke();
  fill(20,255,10);
  circle(sunX,sunY,sunW);
  popMatrix();
  noStroke();
  fill(50,200,50);
  rect(0, height/2, width, height);
  angle += sunSpeed;
  if (angle > 360) {
    angle = 0;
  }
}
