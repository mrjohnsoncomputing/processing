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

class Squares {
  Square[] array;
  
  Squares(int SQUARES) {
    array = new Square[SQUARES];
    this.makeSquares();
  }
  
  private void makeSquares() {
    float x = 0;
    float y = height/2;
    for (int i = 0; i < this.array.length; i++) {
      Square square = new Square(x,y);
      x += square.size;
      this.array[i] = square;
    }
  }
  
  void changeColour() {
    for (Square square : this.array) {
        square.changeColour();
    }
  }
  
  private void display() {
    for (Square square : this.array) {
      square.display();
    }
  }
  
  public void clicked(float x, float y) {
    for (Square s : this.array) {
      if ((x > s.pos.x) && (x < s.pos.x + s.size) && (y > s.pos.y) && (y < s.pos.y + s.size)) {
        s.clicked();
        break;
      }
    }
  }
}
