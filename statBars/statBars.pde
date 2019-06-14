Bars b;
void setup() {
  size(1400,800);
  textAlign(LEFT, CENTER);
  frameRate(10);
  loading();
  b = new Bars(5);
}

void draw() {
  if (frameCount > 30) {
    background(255);
    text("UK Job Vacancies (thousands)", 50,20);
    text(b.getCurrentDate(), 50, 50);
    b.display();
  } else {
    loading();
  }
}

void loading() {
  background(0);
  fill(255);
  text("Loading...", width/2, height/2);
}

void mousePressed() {
  b.date = 0;
}
