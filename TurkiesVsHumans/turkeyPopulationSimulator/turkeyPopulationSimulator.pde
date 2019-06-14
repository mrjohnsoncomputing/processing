//https://www.reddit.com/r/dataisbeautiful/comments/9iav3b/what_if_every_day_1_of_humans_turned_into_turkeys/

int humanPopulation = 30000;
int turkeyPopulation = 10000; 
int totalPopulation = humanPopulation + turkeyPopulation;
int sizeWeight = 5;
int size = (int) Math.round(Math.sqrt(totalPopulation));
ArrayList<Dot> dots = new ArrayList();
int day = 1;
void generateGrid() {
  int w = width/size;
  int h = height/size;
  int col = 0;
  int populationCount = 0;
  for (int i = 0; i < width; i+=w) {
    for (int j = 0; j < height; j+=h) {
      if (populationCount > humanPopulation) {
        col = 150;
      }
      Dot dot = new Dot(i, j, w, h, col);
      dots.add(dot);
      populationCount++;
    }
  }
}
void settings() {
  size(size*sizeWeight, size*sizeWeight);
}

void setup() {
  noStroke();
  rectMode(CENTER);
  generateGrid();
  frameRate(1);
}

void draw() {
  for (Dot dot : dots) {
    dot.change();
    dot.render();
  }
  fill(255);
  textSize(50);
  text("Day: " + day, 100, 100);
  text("Humans: " + humanPopulation, 100,200);
  text("Turkeys: " + turkeyPopulation, 100,300);
  day++;
}
