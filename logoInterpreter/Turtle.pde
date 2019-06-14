class Turtle {
  PVector pos;
  Turtle() {
    this.pos = new PVector(width/2, height/2);
  }
  
  void move(String instruction, int distance) {
    switch (instruction) {
      case "fd":
      
      break;
      case "bk":
      
      break;
      case "rt": 
      
      break;
      case "lt": 
      
      break;
    }
  }
  
  void display() {
    fill(255);
    ellipse(this.pos.x, this.pos.y, 20,20);
  }
  
  void interperet(String code) {
    
  }
}
