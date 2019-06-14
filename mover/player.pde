class Player extends Agent {
   Player(float x, float y, int w, int h, int col) {
     super(x,y,w,h,col);
   }
   
   void render() {
     this.updatePosition();
     if (this.isOutOfBounds()) {
      this.changeDirection();
    }
     fill(this.col);
     rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
   }
}
