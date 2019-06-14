class Agent:
    def __init__(self, x, y, Xdir, Ydir, s, col, speed):
        self.pos = {"x": x, "y": y}
        self.speed = speed
        self.direction = {"x":Xdir, "y":Ydir}
        self.col = col
        self.size = s
        
    def show(self):
        stroke(0)
        fill(self.col)
        rect(self.pos.get("x"), self.pos.get("y"), self.size, self.size)
        
    def update(self):
        randomX = random(-2, 2)
        randomY = random(-2, 2)
        self.pos["x"] += self.speed * self.direction.get("x")
        self.pos["y"] += self.speed * self.direction.get("y")
        if self.pos.get("x") <= 0 or self.pos.get("x") >= width:
            self.changeDirection("x")
        if self.pos.get("y") <= 0 or self.pos.get("y") >= height:
            self.changeDirection("y")
            
    def changeDirection(self, dir):
        self.direction[dir] *= -1
