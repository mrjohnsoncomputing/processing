class Triangle {
  PVector pos1;
  PVector pos2;
  PVector pos3;
  String[] words = new String[3]; 
  int word_padding = 5;
  color word_colour = color(50);
  Boolean rotated = false;
  Triangle(float x1, float y1, float x2, float y2, float x3, float y3 ) {
    this.pos1 = new PVector(x1,y1);
    this.pos2 = new PVector(x2, y2); //+TRIANGLE_SIZE, y);
    this.pos3 = new PVector(x3, y3); //+(TRIANGLE_SIZE/2), y-TRIANGLE_SIZE);
    this.words[0] = "Side 1";
    this.words[1] = "Side 2";
    this.words[2] = "Side 3";
  }
  
  void rotate180() {
   this.rotated = true;
   this.pos1.y -= TRIANGLE_SIZE;
   this.pos2.y -= TRIANGLE_SIZE;
   this.pos3.y += TRIANGLE_SIZE;
  }
  
  void display() {
    fill(255);
    triangle(this.pos1.x, this.pos1.y, this.pos2.x, this.pos2.y, this.pos3.x, this.pos3.y);
    this.drawText();
  }
  
  void addWord(String s) {
    int word_count = this.words.length;
    if (word_count < 3) {
      this.words[word_count] = s;
    } else {
      print("Error - Array 'triangle.words' already contains 3 words, unable to add more.");
    }
  }
  
  private void drawText() {
    this.drawWord1();
    this.drawWord2();
    this.drawWord3();
    
  }
  
  private void drawWord1() {
   pushMatrix();
   fill(this.word_colour);
   textAlign(CENTER);
   float x1 = this.pos1.x + TRIANGLE_SIZE/2;
   float y1 = this.pos1.y - this.word_padding;
   if (this.rotated) {
     y1 += 7 + word_padding;
     translate(x1,y1);
     rotate(radians(180));
     x1 = 0;
     y1 = 0;
   }
   text(this.words[0], x1, y1);
   popMatrix();
  }
  
  private void drawWord2() {
   pushMatrix();
   fill(this.word_colour);
   textAlign(CENTER);
   PVector new_pos2 = PVector.add(this.pos3, this.pos2);
   new_pos2.mult(0.5);
   float x2 = new_pos2.x;
   float y2 = new_pos2.y;
   translate(x2,y2);
   y2 = 0;
   x2 = 0;
   if (this.rotated) {
     y2 = 7 + this.word_padding;
     rotate(radians(117));
     
   } else {
     y2 = -this.word_padding;
     rotate(radians(-115));
   }
   text(this.words[1], x2, y2);
   popMatrix();
  }
  
  private void drawWord3() {
   pushMatrix();
   fill(this.word_colour);
   textAlign(CENTER);
   PVector new_pos3 = PVector.add(this.pos3, this.pos1);
   new_pos3.mult(0.5);
   float x3 = new_pos3.x;
   float y3 = new_pos3.y;
   translate(x3,y3);
   y3 = 0;
   x3 = 0;
   if (this.rotated) {
     y3 = 7 + this.word_padding;
     rotate(radians(-117));
     
   } else {
     y3 = -this.word_padding;
     rotate(radians(115));
   }
   text(this.words[2], x3, y3);
   popMatrix();
  }
  
}
