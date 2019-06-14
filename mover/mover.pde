Player player;
Ball ball;
Agent [] agents = new Agent[2];
float FRICTION = 0.9;
void setup() {
  size(800, 600);
  ellipseMode(CORNER);
  rectMode(CENTER);
  int col = 100;
  player = new Player(width/2, height/2, 10, 10, col);
  float ballSize = 20;
  ball = new Ball(width/2, height/2, ballSize, ballSize, 0);
  agents[0] = player;
  agents[1] = ball;
}

void draw() {
  background(255);
  for (int i = 0; i < agents.length; i++) {
    agents[i].render();
  }
  checkForCollisions();
}

void checkForCollisions() {
  for (int i = 0; i < agents.length-1; i++) {
    Agent agent1 = agents[i];
    Agent agent2 = agents[i+1];
    if ((agent1.pos.x >= agent2.pos.x && agent1.pos.x <= agent2.pos.x + agent2.size.x) && (agent1.pos.y >= agent2.pos.y && agent1.pos.y <= agent2.pos.y + agent2.size.y)) {
      agent2.changeDirection();
      agent2.speed *= -1;
      agent1.changeDirection();
      agent1.speed *= -1;
    }
  }
}
