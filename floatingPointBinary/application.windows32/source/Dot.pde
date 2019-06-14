class Dot extends Shape {
  
  int size = 10;
  Dot(float x, float y) {
    super(x,y);
  }
  

  
  void display() {
    if (!this.hidden) {
      noStroke();
      fill(this.colour);
      ellipse(this.pos.x, this.pos.y, this.size, this.size);
    }
  }
}
