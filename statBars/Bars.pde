class Bars {
  ArrayList<Bar> bars = new ArrayList<Bar>();
  String[] SOURCES;
  String[] DATES;
  int date = 0;
  float scale;
  float maxWidth;
  Ruler ruler = new Ruler(0,60,width-150,60);
  Bars(float scale) {
    this.scale = scale;
    this.getData();
  }
  
  void getData() {
    Table data = new Table();
    Table dataset = loadTable("data/filenames.csv");
    String path = "data/";
    String ext = ".csv";
    float ypos = 120;
    float padding = 20;
    for (TableRow row : dataset.rows()) {
      String d = path + row.getString(0) + ext;
      data = loadTable(d, "header");
      Bar bar = new Bar(data, d, ypos);
      ypos += bar.size.y + padding;
      this.bars.add(bar);
    }
    this.DATES = data.getStringColumn("Title");
  }
  
  String getCurrentDate() {
    return this.DATES[date];
  }
  
  void sortBars() {
    float record = 0;
    for (Bar b1 : this.bars) {
      if (b1.size.x > record) {
        record = b1.size.x;
      }
      for (Bar b2 : this.bars) {
        if (b1.size.x > b2.size.x &  b1.pos.y > b2.pos.y) {
          this.swapPosition(b1,b2);
        }
      }
    }
    this.maxWidth = ceil(record);
  }
  
  void swapPosition(Bar bar1, Bar bar2) {
    float y = bar1.pos.y;
    bar1.pos.y = bar2.pos.y;
    bar2.pos.y = y;
  }
  
  void display() {
    this.sortBars();
    if (this.maxWidth > this.ruler.scale) {
      this.ruler.scale *= 2;
    } else if (this.maxWidth < this.ruler.scale / 2) {
      this.ruler.scale /= 2;
    }
    this.ruler.display();
    for (Bar b : this.bars) {
      b.getSize(this.DATES[date]);
      b.display(this.ruler.scale, this.ruler.getWidth());
    }
    if (date < this.DATES.length-1) {
      date += 1;
    }
    
  }
}
