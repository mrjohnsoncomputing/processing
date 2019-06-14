class Triangle {
  PVector pos1;
  PVector pos2;
  PVector pos3;
  Triangle(int x, int y) {
    this.pos1 = new PVector(x,y);
    this.pos2 = new PVector(x+TRIANGLE_SIZE, y);
    this.pos3 = new PVector(x+(TRIANGLE_SIZE/2), y-TRIANGLE_SIZE);
  }
  
  void display() {
    triangle(this.pos1.x, this.pos1.y, this.pos2.x, this.pos2.y, this.pos3.x, this.pos3.y);
  }
}
