class Main {
  int bgColour;
  Row row;
  Buttons buttons;
  String state;
  
  Main() {
    bgColour = 0;
    row = new Row();
    buttons = new Buttons();
    state = STATES[0];
  }
  
  void display() {
    buttons.display();
    this.mouseOver();
    row.display(); 
  }
  
  void changeTheme() { 
    row.changeColour();
    buttons.changeColour();
    if (this.bgColour == 0) {
      this.bgColour = 255;
    } else {
      this.bgColour = 0;
    }
  }
  
  void clicked(float x, float y) {
    String oldState = this.state;
    this.state = this.buttons.clicked(x,y, this.state);
    if (!oldState.equals(this.state)) {
      if (this.state.equals(STATES[0])) {
        this.row.texts.resetBinaries();
        this.row.dots.hide();
      }
      this.row.texts.refreshSignedBit();
      this.row.checkNegative(this.state);
    }
    this.row.clicked(x,y, this.state);
  }
  
  void mouseOver() {
    this.buttons.mouseOver();
  }
  
  
}
