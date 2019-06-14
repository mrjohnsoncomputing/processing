class Entity {
  PVector pos;
  PVector size;
  PVector corner;
  Entity(float x, float y, float w, float h) {
    this.pos = new PVector(x,y);
    this.size = new PVector(w, h);
    this.corner = new PVector(this.pos.x + this.size.x, this.pos.y + this.size.y);
  }
  
  void display() {
    fill(100,0,255);
    rect(this.pos.x,this.pos.y, this.size.x, this.size.y);
  }
}
