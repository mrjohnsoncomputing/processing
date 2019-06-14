PVector last;
Boolean sameThread;
int colour = 0;
void setup() {
  size(600, 1080);
  background(255);
  last = new PVector(0,0);
}

void draw() {
  if(mousePressed) {
    if(sameThread == true) {
      stroke(colour);
      strokeWeight(5);
      line(last.x, last.y, mouseX, mouseY);
      last.x = mouseX;
      last.y = mouseY;
    } else {
      sameThread = true;
      last.x = mouseX;
      last.y = mouseY;
    }
  } else {
    sameThread = false;
  }
  
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    if (colour == 255) {
      colour = 0;
    } else {
      colour = 255;
    }
  }
}
