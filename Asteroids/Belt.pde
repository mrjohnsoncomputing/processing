class Belt {
  ArrayList<Asteroid> asteroids = new ArrayList();
  Belt() {
    this.createAsteroids();
  }
  
  void createAsteroids() {
    for (int i = 0; i < 10; i ++) {
      float x = random(0,width);
      float y = random(0, height);
      float r = random(20, 70);
      Asteroid a = new Asteroid(x,y,r);
      this.asteroids.add(a);
    }
    
  }
  
  void display() {
    for (Asteroid a : this.asteroids) {
        a.move();
        a.display();
    }
  }
}
