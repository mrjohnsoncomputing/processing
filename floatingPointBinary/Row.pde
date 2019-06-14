class Row {
  Squares squares;
  Texts texts;
  Dots dots;
  
  Row() {
    int SQUARES = 8;
    squares = new Squares(SQUARES);
    float w = squares.array[0].size;
    texts = new Texts(SQUARES, w);
    dots = new Dots(w);
  }
  
  void changeColour() {
    dots.changeColour();
    squares.changeColour();
    texts.changeColour();
  }

  void display() {
    this.squares.display();
    this.dots.display();
    this.texts.display();
  }
  
  private void changeBinaries(Dot dot) {
     int j = this.dots.getCurrentDot(dot);
     this.texts.changeBinaries(j);
  }
  
  void clicked(float x, float y, String s) {    
    //Basic
    if (s.equals(STATES[0])) {
      this.squares.clicked(x,y);
    } else {
    //Not basic
     Dot dotClicked = dots.clicked(x,y);
     if (dotClicked == null) { 
      this.squares.clicked(x,y);
      this.checkNegative(s);
      } else {
        if (dotClicked.pos.x == -1) {
          this.texts.resetBinaries();
          this.dots.hide();
        } else {
          this.changeBinaries(dotClicked);
        }
      this.checkNegative(s);
      }
    }
  }
  
  void checkNegative(String state) {
    char s = this.squares.array[0].text;
    
    if (state.equals(STATES[1])) {
      String t = this.texts.array[0].current;
      if (s == '1') {
        this.texts.array[0].current = "-";
      } else if (s == '0') {
        this.texts.array[0].current = "+";
      }
    } else if (state.equals(STATES[3])) {
      String t = this.texts.array[0].current.substring(0,1);
      if (s == '1' && !t.equals("-")) {
        this.texts.array[0].current = "-" + this.texts.array[0].current;
      } else if (s == '0' && t.equals("-")) {
        this.texts.array[0].current = this.texts.array[0].current.substring(1);
      }
    }
  }
}
