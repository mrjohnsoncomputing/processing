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

class Dots {
  Dot[] array;
  Dots(float w) {
    int DOTS = 7;
    array = new Dot[DOTS];
    this.makeDots(w);
  }
  
  int getCurrentDot(Dot dot) {
    int j = 7;
    for (int i = 0; i < this.array.length; i++) {
      if (this.array[i] == dot) {
        j -= i;
        return j;
      }
    }
    return -1;
  }
  
  void changeColour() {
    for (Dot dot : this.array) {
      dot.changeColour();
    }
  }
  
  private void makeDots(float wd) {
    float w = wd;
    float x = w;
    float y = height/2 + w/2;
    for (int i = 0; i < this.array.length; i++) {
      Dot dot = new Dot(x,y);
      this.array[i] = dot;
      x += w;
    }
  }
  
  private void display() {
    for (Dot dot : this.array) {
      dot.display();
    }
  }
  
  private void hide() {
    for (Dot dot : this.array) {
      dot.hide();
    }
  }
  
  public Dot clicked(float x, float y) {
    for (Dot d : this.array) {
      if ((x > d.pos.x - (d.size*2)) && (x < d.pos.x + (d.size*2)) && (y > d.pos.y - (d.size*2)) && (y < d.pos.y + (d.size*2))) {
        if (!d.hidden) {
          d.hide();
          return new Dot(-1,-1);
        } else {
          this.hide();
          d.show();
          return d;
        }
      }
    }
    return null;
  }
}
