class Terrain extends Entity{
  float noise_scale = 0.02;
  int texture_detail = 100;
  PGraphics image;
  Terrain(float start_x, float start_y, float area_width, float area_height) {
    super(start_x,start_y,area_width, area_height); 
    createTerrainImage();
  }
  
  void createTerrainImage() {
    this.image = createGraphics(floor(this.size.x), floor(this.size.y));
    this.image.beginDraw();
    float w = this.size.x / this.texture_detail;
    float h = this.size.y / this.texture_detail;
    for (int y = 0; y < this.size.y; y+=h) {  
      for (int x = 0; x < this.size.x; x+=w) {
        float noiseVal = noise(this.pos.x + x * this.noise_scale, this.pos.y + y * this.noise_scale);
        this.image.fill(noiseVal*200, 200, noiseVal*200);
        this.image.noStroke();
        this.image.rect(x,y,w,h);
        if (random(100) < 2 && x > 0 && y > 0 && x < this.size.x - w && y < this.size.y - h) {
          this.image.fill(noiseVal*255, 255, noiseVal*255, 100);
          this.image.ellipse(x,y,w,h);
        }      
      }
    }
    this.image.endDraw();
  }
  
  void display() {
    image(this.image, this.pos.x, this.pos.y);
  }
  
  void updatePosition(PVector distance) {
    this.pos.add(distance);
  }
}
