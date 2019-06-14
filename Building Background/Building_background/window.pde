class Window extends Movingrectangle {
  Window(int x, int y, int w, int h) {
    super(x,y,w,h, 0);
  }
  
  void getLight() {
    int r = int(random(10));
    if (r == 1) {
      this.colour = color(50,255,0);
    }
  }
}
