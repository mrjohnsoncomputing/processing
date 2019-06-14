class Ruler {
  PVector pos1;
  PVector pos2;
  int scale = 100;
  Ruler(float x1, float y1, float x2, float y2) {
    this.pos1 = new PVector(x1,y1);
    this.pos2 = new PVector(x2,y2);
  }
  
  void display() {
    fill(0);
    stroke(0);
    strokeWeight(1);
    line(this.pos1.x, this.pos1.y, this.pos2.x, this.pos2.y);
    int divisor = 10;
    float xpos = 0;
    float distance = this.getWidth()/divisor;
    float increment = this.scale/divisor;
    float measure = 0;
    for (int i = 0; i < divisor; i++) {
      xpos += distance;
      measure += increment;
      float ypos = this.pos1.y + 10;
      stroke(0);
      strokeWeight(1);
      line(xpos, this.pos1.y, xpos, ypos);
      text(" "+int(measure), xpos, ypos);
    }
  }
  
  
  float getWidth() {
    return this.pos2.x - this.pos1.x;
  }
}
