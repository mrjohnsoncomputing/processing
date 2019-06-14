public static class PathShape {
  this.direction = 0.01;
  this.yposition = 1;  
  
  float[] circle(x,y) {
    for (int i = 0; i < 100; i ++) {
      circle(x,y,10);
      if (x > r || x < -r) {
        direction *= -1;
        yposition *= -1;
      }
      x += direction;
      y = (float)Math.sqrt((r*r) - (x*x));
      y *= yposition;
    }
    return {x,y}; 
  }
}
