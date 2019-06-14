class Column {
  ArrayList<Letter> letters = new ArrayList();
  PVector position;
  PVector size;
  float speed = random(1,2);
  int list_size = int(random(5,25)); 
  Column(float x) {
    position = new PVector(x, -20);
    this.create();
  }
  
  void display() {
    Letter last_letter = new Letter(0,0,0);
    for (Letter letter : this.letters) {
      letter.update();
      letter.display();
      last_letter = letter;
    }
     if (last_letter.position.y > height) {
      this.reset();
    }
  }
  
  void create() {
    float x = this.position.x;
    float y = this.position.y; 
    LeadLetter lead = new LeadLetter(x,y, this.speed);
    y -= lead.size.y;
    this.letters.add(lead);
    for (int i = 0; i < this.list_size; i++) {
      Letter letter = new Letter(x,y, this.speed);
      this.letters.add(letter);
      y -= letter.size.y;
    }
  }
  
  private void reset() {
    this.letters = new ArrayList();
    this.speed = random(1,2);
    this.list_size = int(random(5,25)); 
    this.create();
  }
}
