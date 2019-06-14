public class Building extends Movingrectangle {
  ArrayList<Window> windows = new ArrayList();
  Building(int x, int y, int w, int h, color c) {
    super(x,y,w,h,c);
    this.generateWindows();
  }
 
  Boolean update() {
    if (this.position.x < 0 - this.size.x) {
      return false;
    } else {
      this.updateWindows();
      this.position.x -= this.speed;
      return true;
    }
  }
  
  void updateWindows() {
    for (Window window : this.windows) {
      window.display();
      window.update();
    }
  }
  
  private void generateWindows() {
    float y_divisor = 20;
    float x_divisor = 30;
    int columns = floor(this.size.y/y_divisor);
    int rows = floor(this.size.x/x_divisor);
    float padding = 0.5;
    int w = int(x_divisor * padding);
    int h = int(y_divisor * padding);
    int x = int(this.position.x + x_divisor*(1-padding));
    int y = int(this.position.y + y_divisor*(1-padding));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        Window new_window = new Window(x,y,w,h);
        new_window.getLight();
        this.windows.add(new_window);
        y += y_divisor;
      }
      x += x_divisor;
      y = int(this.position.y + y_divisor*(1-padding));
    }
  }
  
 
}
