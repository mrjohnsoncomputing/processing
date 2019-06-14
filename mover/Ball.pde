class Ball extends Agent {
  float speed = 1;
  Ball(float x, float y, float w, float h, int col) {
    super(x,y,w,h,col);
    this.velocity.y = 2;
    
  }
  
  void render() {
    PVector f = new PVector(0, this.speed);
    this.applyForce(f);
    this.updatePosition();
    if (this.isOutOfBounds()) {
      this.changeDirection();
      this.speed *= -1;
    }
    fill(0);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.size.x, this.size.y);
  } 
}
