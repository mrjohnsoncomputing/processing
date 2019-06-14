class Square extends Shape {
  int size = 100;
  char text = '0';
  Square(float x, float y) {
    super(x,y);
  }
  
  void clicked() {
    if (this.text == '0') {
      this.text = '1';
    } else {
      this.text = '0';
    }
  }
  
  
  
  void display() {
    noStroke();
    fill(this.colour);
    textSize(50);
    float w = this.size/2;
    textAlign(CENTER, CENTER);
    text(this.text, this.pos.x + w, this.pos.y + w);
    stroke(this.colour);
    noFill();
    rect(this.pos.x, this.pos.y, this.size, this.size);
  }
}
