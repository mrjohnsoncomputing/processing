class Bar {
  PVector pos = new PVector(0, 120);
  PVector size = new PVector(1,15);
  String name;
  color col;
  Table dataset;
  Bar(Table data, String name, float ypos) {
    this.dataset = data; 
    this.pos.y = ypos;
    name = name.replace("data/", "");
    name = name.replace(".csv", "");
    this.name = name;
  }
  
  void display(float scale, float displayLength) {
    noStroke();
    fill(this.col);
    float width = map(this.size.x, 0, scale, 0, displayLength);
    rect(this.pos.x, this.pos.y, width, this.size.y);
    fill(0);
    text(this.name, this.pos.x+5, this.pos.y-10);
    text(int(this.size.x), width, this.pos.y+this.size.y/2);
  }
  
  void getSize(String date) {
    TableRow result = this.dataset.findRow(date, "Title");
    this.size.x = result.getInt("Count");
  }
}
