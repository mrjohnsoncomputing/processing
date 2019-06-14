Row row;

void setup() {
  size(801,300);
  row = new Row();
}

void draw() {
  background(row.bgColour);
  row.display();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    row.clicked(mouseX, mouseY);
  } else {
    row.changeTheme();
  }
}
