import java.util.Random;

Random rand = new Random();

public class Dot {
  PVector pos;
  PVector size;
  int col;
  Dot(int x, int y, int w, int h, int col) {
    this.pos = new PVector(x,y);
    this.size = new PVector(w,h);
    this.col = col;
  }
  
  void render() {
    fill(this.col);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
  }
  
  void change() {
    double n = Math.random() * 100;
    if (n <= 0.1) {
      this.changeColour();
    }
  }
  
  void changeColour() {
    if (this.col == 0) {
      this.col = 150;
      turkeyPopulation++;
      humanPopulation--;
    } else {
      this.col = 0;
      turkeyPopulation--;
      humanPopulation++;
    }
  }
  
}
