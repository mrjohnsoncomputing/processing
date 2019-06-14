Map map;

void setup() {
  size(800, 800);
  //size(400,400);
  map = new Map();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  map.display();

}

void keyPressed() {
  // 37 left, 38 up, 39 right, 40 down
    if (keyCode == 37) {
      map.scroll(10,0);
    } else if (keyCode == 38) {
      map.scroll(0,10);
    } else if (keyCode == 39) {
      map.scroll(-10,0);
    } else if (keyCode == 40) {
      map.scroll(0,-10);
    }
}

void mousePressed() {
  
}
