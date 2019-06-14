class Asteroid {
  float aInc = 0.005;
  PVector pos;
  float r;
  int noiseMax = 3;
  float z = 0.1;
  PVector speed = new PVector(random(-3,3), random(-3,3));
  int seed = int(random(100));
  float rotate = 0;
  PVector nM = new PVector(0,0);
  Asteroid(float x, float y, float r) {
    this.pos = new PVector(x,y);
    this.r = r;
  }
  
  void display() {
    noiseSeed(this.seed);
    noFill();
    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(this.rotate);
    this.rotate+=0.01;
    beginShape();
    for (float a = 0; a < TWO_PI; a += this.aInc) {
      float xoff = map(cos(a), -1,1,0,this.noiseMax);
      float yoff = map(sin(a), -1,1,0,this.noiseMax);
      float r = map(noise(xoff, yoff, this.z), 0, 1, 5, this.r);
      float x = r * cos(a);
      float y = r * sin(a);
      vertex(x,y);
    }
    endShape(CLOSE);
    popMatrix();
    this.z += this.aInc;
  }
  
  void move() {
    //float x = map(noise(this.nM.x), 0,1, -5, 5);
    //float y = map(noise(this.nM.y), 0,1, -5, 5);
    //this.nM.x += this.speed;
    //this.nM.y += this.speed;
    this.pos.x += this.speed.x;
    this.pos.y += this.speed.y;
    this.wrap();
  }
  
  void wrap() {
    if (this.pos.x  > width + this.r) {
      this.pos.x = 0;
    } else if (this.pos.x < 0 - this.r) {
      this.pos.x = width;
    }
    if (this.pos.y > height + this.r) {
      this.pos.y = 0;
    } else if (this.pos.y < 0 - this.r) {
      this.pos.y = height;
    }
  }
}
