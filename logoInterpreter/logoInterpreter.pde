Turtle turtle;
String myText = "Type something";
void setup() {
  size(600,800);
  turtle = new Turtle();
  textAlign(CENTER);
  textSize(30);
  fill(0);
}

void draw() {
  background(255);
  turtle.display();
   text(myText, 0, 0, width, height);
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } else if (keyCode == DELETE) {
    myText = "";
  } else if (keyCode == RETURN) {
    turtle.interperet(myText);
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    myText = myText + key;
  }
}
