class Agent {
  PVector pos; 
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector size;
  int col;
  float speed = 5;
  Agent(float x, float y, float w, float h, int col) {
    this.pos = new PVector(x, y);
    this.size = new PVector(w, h);
    this.col = col;
  }

  void render() {
    fill(0);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.size.x, this.size.y);
  }

  void applyForce(PVector force) {
    this.acceleration.add(force);
  }

  void updatePosition() {
    this.velocity.add(this.acceleration);
    this.velocity.mult(FRICTION);
    this.pos.add(this.velocity);
    this.acceleration.mult(0);
  }

  void changeDirection() {
    this.velocity.mult(-1);
    PVector f = new PVector(0, 0);
    if (this.pos.x <= 0) {
      f.x = this.size.x/4;
    } else if (this.pos.x >= width) {
      f.x = -this.size.x/4;
    } else if (this.pos.y >= height) {
      f.y = -this.size.y/4;
    } else if (this.pos.y < 0) {
      f.y = this.size.y/4;
    }
    this.applyForce(f);
  }

  boolean isOutOfBounds() {
    if ((this.pos.x >= width-this.size.x || this.pos.x <= 0) || (this.pos.y >= height-this.size.y || this.pos.y <= 0)) {
      return true;
    } else {
      return false;
    }
  }
}
