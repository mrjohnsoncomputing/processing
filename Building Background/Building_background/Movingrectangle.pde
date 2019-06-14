public class Movingrectangle {
  PVector position;
  PVector size;
  color colour;
  int speed = 2;
  Movingrectangle(int x, int y, int w, int h, color c) {
    this.position = new PVector(x,y);
    this.size = new PVector(w,h);
    this.colour = c;
  }
  
  void display() {
    fill(this.colour);
    stroke(10);
    rect(this.position.x, this.position.y, this.size.x, this.size.y);
  }
  
  Boolean update() {
    this.position.x -= this.speed;
    return true;
  }
  
 
}
