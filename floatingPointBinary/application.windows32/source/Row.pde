class Row {
  Dot[] dots;
  Square[] squares;
  Text[] texts;
  String[] binaries = {"128", "64", "32", "16", "8", "4", "2", "1", "1/2", "1/4", "1/8", "1/16", "1/32", "1/64", "1/128", "1/256"};
  int bgColour = 0;
  Row() {
    int DOTS = 7;
    int SQUARES = 8;
    dots = new Dot[DOTS];
    squares = new Square[SQUARES];
    texts = new Text[SQUARES];
    this.makeSquares();
    this.makeDots();
    this.makeTexts();
    
  }
  
  private void makeTexts() {
    float w = this.squares[0].size;
    float x = w/2;
    float y = height/2 - w/4;
    for (int i = 0; i < this.squares.length; i++) {
      Text text = new Text(x,y);
      text.current = this.binaries[i];
      x += w;
      this.texts[i] = text;
    }
  }
  
  private void makeSquares() {
    float x = 0;
    float y = height/2;
    for (int i = 0; i < this.squares.length; i++) {
      Square square = new Square(x,y);
      x += square.size;
      this.squares[i] = square;
    }
  }
  
  private void makeDots() {
    float w = this.squares[0].size;
    float x = w;
    float y = height/2 + w/2;
    for (int i = 0; i < this.dots.length; i++) {
      Dot dot = new Dot(x,y);
      this.dots[i] = dot;
      x += w;
    }
  }
  
  private void showDots() {
    for (Dot dot : this.dots) {
      dot.display();
    }
  }
  
  private void hideDots() {
    for (Dot dot : this.dots) {
      dot.hide();
    }
  }
  
  private void showTexts() {
    for (Text t : this.texts) {
      t.display();
    }
  }
  
  void showSquares() {
    for (Square square : this.squares) {
      square.display();
    }
  }
  
  void display() {
    this.showDots();
    this.showSquares();
    this.showTexts();
  }
  
  private void resetBinaries() {
    for (int i = 0; i < this.texts.length; i++) {
      this.texts[i].current = this.binaries[i];
    }
  }
  
  private void changeBinaries(Dot dot) {
     int j = 7;
     for (int i = 0; i < this.dots.length; i++) {
       if (this.dots[i] == dot) {
         j -= i;
         break;
       }
     }
     for (Text text : this.texts) {
        text.current = this.binaries[j];
        j++;
     }
  }
  
  void clicked(float x, float y) {
    boolean dotClicked = false;
    
    for (Dot d : this.dots) {
      if ((x > d.pos.x - (d.size*2)) && (x < d.pos.x + (d.size*2)) && (y > d.pos.y - (d.size*2)) && (y < d.pos.y + (d.size*2))) {
        if (!d.hidden) {
          d.hide();
          this.resetBinaries();
        } else {
          this.hideDots();
          d.show();
          this.changeBinaries(d);
        }
        dotClicked = true;
      }
    }
    
    if (!dotClicked) {
      for (Square s : this.squares) {
        if ((x > s.pos.x) && (x < s.pos.x + s.size) && (y > s.pos.y) && (y < s.pos.y + s.size)) {
          s.clicked();
          break;
        }
       
      }
    }
    if (this.squares[0].text == '1' && !this.texts[0].current.substring(0,1).equals("-")) {
      this.texts[0].current = "-" + this.texts[0].current;
    } else if (this.squares[0].text == '0' && this.texts[0].current.substring(0,1).equals("-")) {
      this.texts[0].current = this.texts[0].current.substring(1);
    }
    
  }
  
  void changeTheme() {
    for (Square square : this.squares) {
      square.changeColour();
    }
    for (Dot dot : this.dots) {
      dot.changeColour();
    }
    for (Text text : this.texts) {
      text.changeColour();
    }
    if (this.bgColour == 0) {
      this.bgColour = 255;
    } else {
      this.bgColour = 0;
    }
  }
}
