class Text extends Shape {
  String current = "";
  Text(float x, float y) {
    super(x,y);
  }
  
  void display() {
    textSize(30);
    noStroke();
    fill(this.colour);
    text(this.current, this.pos.x, this.pos.y);
  }
}

class Texts {
  Text[] array;
  String[] binaries = {"128", "64", "32", "16", "8", "4", "2", "1", "1/2", "1/4", "1/8", "1/16", "1/32", "1/64", "1/128", "1/256"};
  Texts(int SQUARES, float w) {
    array = new Text[SQUARES];
    this.create(w);
  }
  
  private void resetBinaries() {
    for (int i = 0; i < this.array.length; i++) {
      this.array[i].current = this.binaries[i];
    }
  }
  
  public void changeBinaries(int j) {
    for (Text text : this.array) {
        text.current = this.binaries[j];
        j++;
     }
   }
   
   public void refreshSignedBit() {
    String s = this.array[1].current;
    int i;
    for (i = 0; i < this.binaries.length; i++) {
      if (s.equals(this.binaries[i])) {
        break;
     }
    }
    this.array[0].current = this.binaries[i-1];
   }
  
  private void create(float wd) {
    float w = wd;
    float x = w/2;
    float y = height/2 - w/4;
    for (int i = 0; i < this.array.length; i++) {
      Text text = new Text(x,y);
      text.current = this.binaries[i];
      x += w;
      this.array[i] = text;
    }
  }
  
   private void display() {
    for (Text t : this.array) {
      t.display();
    }
  }
  
  void changeColour() {
    for (Text t : this.array) {
      t.changeColour();
    }
  }
}
