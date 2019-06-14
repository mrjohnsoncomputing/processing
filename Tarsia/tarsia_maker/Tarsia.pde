class Tarsia {
  ArrayList<Triangle> triangles = new ArrayList();
  Tarsia() {
    float x1 = width/2;
    float y1 = TRIANGLE_SIZE;
    float x2 = x1 + TRIANGLE_SIZE;
    float y2 = y1;
    float x3 = x1 + (TRIANGLE_SIZE/2);
    float y3 = y1 - TRIANGLE_SIZE;
    for (int i = 1; i <= TRIANGLE_NUMBER/4; i++) {
      int old_i = i-1;
      for (int j = 0; j < i + old_i; j++) {
        x2 = x1 + TRIANGLE_SIZE;
        y2 = y1;
        x3 = x1 + (TRIANGLE_SIZE/2);
        y3 = y1 - TRIANGLE_SIZE;
        
        Triangle triangle = new Triangle(x1, y1, x2, y2, x3, y3);
        if (j % 2 != 0) {
          triangle.rotate180();
        }
        this.triangles.add(triangle);
        x1 += TRIANGLE_SIZE/2;
      }
      x1 = width/2;
      x1 -= TRIANGLE_SIZE/2 * i;
      y1 += TRIANGLE_SIZE;
    }
  }
  
  
  void display() {
    for (Triangle triangle : this.triangles) {
      triangle.display();
    }
  }
}
