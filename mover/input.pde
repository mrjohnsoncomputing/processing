// left 37, up 38, right 39, down 40

void keyPressed() {
  PVector speed;
  switch (keyCode) {
    case 37:
      speed = new PVector(-player.speed, 0);
      player.applyForce(speed);
    break;
    case 38:
      speed = new PVector(0, -player.speed);
      player.applyForce(speed);
    break;
    case 39:
      speed = new PVector(player.speed, 0);
      player.applyForce(speed);
    break;
    case 40:
      speed = new PVector(0, player.speed);
      player.applyForce(speed);
    break;
  }
}
