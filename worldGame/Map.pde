class Map {
  PVector pos = new PVector(0,0);
  ArrayList<Terrain> terrains = new ArrayList<Terrain>();
  PVector nw_edge;
  PVector se_edge;
  PVector tile_size = new PVector(width, height);
  PVector grid_size;
  Map() {
    createStartArea(4);
  }
  
  void createStartArea(int size) {
    this.grid_size = new PVector(size, size);
    float start_x = 0;
    float y = 0;
    for (int i = 0; i < size/2; i++) {
      start_x -= this.tile_size.x;
      y -= this.tile_size.y;
    }
    float x = start_x;
    this.nw_edge = new PVector(start_x, y);
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        
        Terrain terrain = new Terrain(x,y,this.tile_size.x,this.tile_size.y);
        this.terrains.add(terrain);
        x += this.tile_size.x;
      }
      y += this.tile_size.y;
      this.se_edge = new PVector(x, y);
      x = start_x;
    }
    
    println("Terrain generation complete.");
  }
  
  void display() {
    for (Terrain t : this.terrains) {
      t.display();
    }
  }
  
  void updatePosition(PVector distance) {
    this.nw_edge.add(distance);
    this.se_edge.add(distance);
  }
  
  void scroll(float x, float y) {
    PVector distance = new PVector(x,y);
    for (Terrain t : this.terrains) {
      t.updatePosition(distance);
    }
    
    this.updatePosition(distance);
    this.checkEdges();
  }
  
  void addTerrainTile(float x, float y, String dir) {
    float tile_number = this.grid_size.x;
    float xmod = this.tile_size.x;
    float ymod = this.tile_size.y;
    if (dir == "Y") {
      tile_number = this.grid_size.y;
      xmod = 0;
      this.grid_size.x += 1;
    } else {
      ymod = 0;
      this.grid_size.y += 1;
    }
    for (int i = 0; i < tile_number; i++) {
      Terrain terrain = new Terrain(x,y,this.tile_size.x,this.tile_size.y);
      this.terrains.add(terrain);
      x += xmod;
      y += ymod;
    }
  }
  
  void checkEdges() {
    if (this.pos.x < this.nw_edge.x + this.tile_size.x) {
      this.nw_edge.x -= this.tile_size.x;
      addTerrainTile(this.nw_edge.x, this.nw_edge.y, "Y");
    }
    if (this.pos.x > this.se_edge.x - this.tile_size.x) {
      addTerrainTile(this.se_edge.x, this.nw_edge.y, "Y");
      this.se_edge.x += this.tile_size.x;
    }
    if (this.pos.y < this.nw_edge.y + this.tile_size.y) {
      this.nw_edge.y -= this.tile_size.y;
      addTerrainTile(this.nw_edge.x,this.nw_edge.y, "X");
      
    }
    if (this.pos.y > this.se_edge.y - this.tile_size.y) {
      addTerrainTile(this.nw_edge.x, this.se_edge.y, "X");
      this.se_edge.y += this.tile_size.y;
    }
    //println(this.nw_edge.x, this.nw_edge.y, this.se_edge.x, this.se_edge.y);
  }
}
