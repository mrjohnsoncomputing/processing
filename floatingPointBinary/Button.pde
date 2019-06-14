class Button extends Shape {
  PVector size;
  String text;

  Button(float x, float y, float w, float h, String t) {
    super(x,y);
    this.size = new PVector(w, h);
    this.text = t;
  }
  
  void display() {
    stroke(this.colour);
    noFill();
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y, 60);
    fill(this.colour);
    textAlign(CENTER, CENTER);
    textSize(15);
    text(this.text, this.pos.x+(this.size.x/2), this.pos.y+(this.size.y/2));
  }
  
  void clicked() {
    if (!this.clicked) {
      this.colour = this.hoverColour;
      this.clicked = true;
    } else {
      this.colour = this.col;
      this.clicked = false;
    }
  }
}

class Buttons {
  Button[] array;
  Buttons() {
    this.array = new Button[STATES.length];
    this.create();
    this.array[0].clicked();
  }
  
  private void create() {
    float x = 10;
    float y = 10;
    float w = 150;
    float h = 50;
    int spacing = 20;
    String t;
    for (int i = 0; i < STATES.length; i++) {
      t = STATES[i];
      Button b = new Button(x,y,w,h,t);
      this.array[i] = b;
      x+=w+spacing;
    }
  }
  
  void changeColour() {
    for (Button button : this.array) {
      button.changeColour();
    }
  }
  
  void display() {
    for (Button button : this.array) {
      button.display();
    }
  }
  
  void mouseOver() {
    for(Button obj : this.array) {
      if(mouseX > obj.pos.x && mouseX < (obj.pos.x + obj.size.x) && mouseY > obj.pos.y && mouseY < (obj.pos.y + obj.size.y)) {
        obj.mouseOver();
      } else if (!obj.clicked){
        obj.mouseOut();
      }
    }
  }
  
  String clicked(float x, float y, String state) {
    for(Button obj : this.array) {
      if(x > obj.pos.x && x < (obj.pos.x + obj.size.x) && y > obj.pos.y && y < (obj.pos.y + obj.size.y)) {
        this.clickReset();
        obj.clicked();
        return obj.text;
      } 
    }
    return state;
  }
  
  void clickReset() {
    for(Button obj : this.array) {
      obj.colour = obj.col;
      obj.clicked = false;
    }
  }
}
