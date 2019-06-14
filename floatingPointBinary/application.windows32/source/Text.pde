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
