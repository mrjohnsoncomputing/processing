import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class floatingPointBinary extends PApplet {

Row row;

public void setup() {
  
  row = new Row();
}

public void draw() {
  background(row.bgColour);
  row.display();
}

public void mousePressed() {
  if (mouseButton == LEFT) {
    row.clicked(mouseX, mouseY);
  } else {
    row.changeTheme();
  }
}
class Dot extends Shape {
  
  int size = 10;
  Dot(float x, float y) {
    super(x,y);
  }
  

  
  public void display() {
    if (!this.hidden) {
      noStroke();
      fill(this.colour);
      ellipse(this.pos.x, this.pos.y, this.size, this.size);
    }
  }
}
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
  
  public void showSquares() {
    for (Square square : this.squares) {
      square.display();
    }
  }
  
  public void display() {
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
  
  public void clicked(float x, float y) {
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
  
  public void changeTheme() {
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
class Shape {
  int colour = 255;
  PVector pos;
  boolean hidden = true;
  
  Shape(float x, float y) {
    this.pos = new PVector(x,y);
  }
  
  public void changeColour() {
    if (this.colour == 0) {
      this.colour = 255;
    } else {
      this.colour = 0;
    }
  }
  
  public void hide() {
    this.hidden = true;
  }
  
  public void show() {
    this.hidden = false;
  }
}
class Square extends Shape {
  int size = 100;
  char text = '0';
  Square(float x, float y) {
    super(x,y);
  }
  
  public void clicked() {
    if (this.text == '0') {
      this.text = '1';
    } else {
      this.text = '0';
    }
  }
  
  
  
  public void display() {
    noStroke();
    fill(this.colour);
    textSize(50);
    float w = this.size/2;
    textAlign(CENTER, CENTER);
    text(this.text, this.pos.x + w, this.pos.y + w);
    stroke(this.colour);
    noFill();
    rect(this.pos.x, this.pos.y, this.size, this.size);
  }
}
class Text extends Shape {
  String current = "";
  Text(float x, float y) {
    super(x,y);
  }
  
  public void display() {
    textSize(30);
    noStroke();
    fill(this.colour);
    text(this.current, this.pos.x, this.pos.y);
  }
}
  public void settings() {  size(801,300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "floatingPointBinary" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
