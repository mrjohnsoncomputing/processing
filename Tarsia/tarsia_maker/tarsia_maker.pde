int TRIANGLE_SIZE = 100;
int TRIANGLE_NUMBER = 16; 
Tarsia tarsia;
void setup() {
  size(600,800);
  tarsia = new Tarsia();
}

void draw() {
  tarsia.display();
}
