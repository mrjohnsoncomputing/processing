class Letter {
  PVector position;
  PVector size = new PVector(20,20);
  char letter ='0';
  color colour = color(100,255,10);
  float speed;;
  float text_size = 20;
  Letter(float x, float y, float speed) {
    position = new PVector(x,y);
    this.speed = speed;
  }
  
  void update() {
    this.position.y += this.speed;
    this.change();
  }
  
  void display() {
    textSize(this.text_size);
    fill(this.colour);
    text(this.letter,this.position.x, this.position.y);
  }
  
  void change() {
    float r = random(1);
    if (r < 0.05) {
       if (this.letter == '1') {
         this.letter = '0';
       } else {
         this.letter = '1';
       }
    }
  }
}
