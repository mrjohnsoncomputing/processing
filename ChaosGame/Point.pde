class Point {
  int chance;
  PVector pos;
  Point(float x, float y) {
    this.pos = new PVector(x,y);
    this.chance = -1;
  }
  
  void display() {
    
    if (this.chance > -1) {
      strokeWeight(5);
      stroke(0,255,0);
    } else {
      strokeWeight(0.5);
      stroke(0);
      fill(0);
    }
    point(this.pos.x, this.pos.y);
  }

}
