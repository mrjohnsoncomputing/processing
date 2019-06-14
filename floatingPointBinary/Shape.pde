class Shape {
  int colour = 255;
  PVector pos;
  boolean hidden = true;
  int col;
  int hoverColour = 100;
  Boolean clicked = false;
  Shape(float x, float y) {
    this.pos = new PVector(x,y);
    this.col = this.colour;
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
  
  void mouseOver() {
    if (this.colour != this.hoverColour) {
      this.col = this.colour;
      this.colour = this.hoverColour;
    }
  }
  
  void mouseOut() {
    if (this.colour == this.hoverColour) {
      this.colour = this.col;
    }
  }
}
