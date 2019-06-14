class Ship {
  PVector pos1 = new PVector(110,100);
  PVector pos2 = new PVector(100,130);
  PVector pos3 = new PVector(120,130);
  PVector mid_point = new PVector(110, 115);
  float speed = 10;
  float rotation = 0;
  float rSpeed = 10;
  
  Ship() {

  }
  
  void moveLeft() {
    //for (PVector p : this.pos) {
    //  p.x -= this.speed;
    //}
    this.rotation -= this.rSpeed;
  }
  void moveRight() {
    //for (PVector p : this.pos) {
    //  p.x += this.speed;
    //}
    this.rotation += this.rSpeed;
  }
  
  void moveUp () {
      this.pos1.y -= this.speed;
      this.pos2.y -= this.speed;
      this.pos3.y -= this.speed;
  }
  void moveDown () {
     this.pos1.y += this.speed;
     this.pos2.y += this.speed;
     this.pos3.y += this.speed;
  }
  
  void midPoint() {
    this.mid_point.x = (this.pos1.x + this.pos2.x + this.pos3.x)/3;
    this.mid_point.y = (this.pos1.y + this.pos2.y + this.pos3.y)/3;
  }
  
  void display() {
    this.midPoint();
    noFill();
    stroke(255);
    strokeWeight(2);
    pushMatrix();
    translate(this.mid_point.x, this.mid_point.y);
    rotate(radians(this.rotation));
    triangle(0, -15, -10, 15, 10,15 );
    popMatrix();  
    
}
  
}
