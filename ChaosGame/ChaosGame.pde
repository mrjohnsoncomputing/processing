Shape shape;
Point lastpoint;
int v = 3;
int f = 0;
boolean paused = false;
void setup() {
  size(800, 800);
  reset();
}

void reset() {
  background(255);
  shape = new Shape(v);
  lastpoint = new Point(random(width), random(height));
  f=0;
}

void draw() {
  if (f > 100000) {
    reset();
  }
 for (int i = 0; i < 500; i++) {
    f++;
    int r = (int) random(v);
    Point p = shape.getPoint(r);
    PVector xy = PVector.sub(p.pos, lastpoint.pos);
    xy.mult(0.5);
    Point newpoint = new Point(lastpoint.pos.x+xy.x, lastpoint.pos.y+xy.y);
    newpoint.display();
    lastpoint = newpoint;
  }
}

void mousePressed() {
  if (paused) {
    loop();
    paused = false;
  } else {
    noLoop();
    paused = true;
  }
}
