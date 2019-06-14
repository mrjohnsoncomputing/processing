class Grid {
  ArrayList<Column> columns = new ArrayList();
  int column_width = 20;
  int total_columns = width/this.column_width;
  Grid() {
    this.create();
  }
  
  private void create() {
    float x = 0;
    for (int i = 0; i < this.total_columns; i++) {
      Column column = new Column(x);
      this.columns.add(column);
      x += this.column_width;
    }
  }
  
  void display() {
    for (Column column : columns) {
      column.display();
    }
  }
}
