Main main;
public String[] STATES = {"Basic", "Signed Bit", "One's Complement", "Two's Complement"};
void setup() {
  size(801,300);
  main = new Main();
}

void draw() {
  background(main.bgColour);
  main.display();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    main.clicked(mouseX, mouseY);
  } else {
    main.changeTheme();
  }
}
