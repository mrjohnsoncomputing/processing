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

public class DoodlePad extends PApplet {

PVector last;
Boolean sameThread;
int colour = 0;
public void setup() {
  
  background(255);
  last = new PVector(0,0);
}

public void draw() {
  if(mousePressed) {
    if(sameThread == true) {
      stroke(colour);
      strokeWeight(5);
      line(last.x, last.y, mouseX, mouseY);
      last.x = mouseX;
      last.y = mouseY;
    } else {
      sameThread = true;
      last.x = mouseX;
      last.y = mouseY;
    }
  } else {
    sameThread = false;
  }
  
}

public void mousePressed() {
  if (mouseButton == RIGHT) {
    if (colour == 255) {
      colour = 0;
    } else {
      colour = 255;
    }
  }
}
  public void settings() {  size(600, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "DoodlePad" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
