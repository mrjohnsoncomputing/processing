class Shape {
  Point[] points;
  Shape(int n) {
    this.points = new Point[n];
    this.create();
  }
  
  void create() {
     for (int i = 0; i < this.points.length; i++) {
       float x = random(width);
       float y = random(height);
       
         while (!this.checkPoint(x,y,i)) {
           x = random(width);
           y = random(height);
       }
       Point p = new Point(x,y);
       p.chance = i;
       p.display();
       this.points[i] = p;
     }
  }
  
  Point getPoint(int n) {
    for (Point p : this.points) {
      if (p.chance == n) {
        return p;
      }
    }
    return new Point(-1,-1);
  }
  
  private Boolean checkPoint(float x, float y, int j) {
    PVector xy = new PVector(x,y);
    Boolean valid = true;
    for (int i = 0; i < j; i++) {
      Point p = this.points[i];
      println(p.pos.x, p.pos.y);
      if (xy.dist(p.pos) < 300) {
         valid = false;
      }
    }
    return valid;
  }
}
