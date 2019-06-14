class Shape {
  int colour = 255;
  PVector pos;
  boolean hidden = true;
  
  Shape(float x, float y) {
    this.pos = new PVector(x,y);
  }
  
  void changeColour() {
    if (this.colour == 0) {
      this.colour = 255;
    } else {
      this.colour = 0;
    }
  }
  
  void hide() {
    this.hidden = true;
  }
  
  void show() {
    this.hidden = false;
  }
}
