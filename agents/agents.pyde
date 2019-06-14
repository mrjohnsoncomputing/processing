from agent import *
agents = []
def setup():
    rectMode(CENTER)
    size(800, 600)
    global agents
    for i in range(100):
        randomX = random(width)
        randomY = random(height)
        speed = int(random(1,6))
        colour = random(255)
        s = random(5,15)
        direction = getDirections()
        Xdir = direction.get("Xdir")
        Ydir = direction.get("Ydir")
        agent = Agent(randomX, randomY, Xdir, Ydir, s, colour, speed)
        agents.append(agent)

def draw():
    background(255, 180)
    global agents
    for agent in agents:
        agent.show()
        agent.update()
        collider = checkOtherAgents(agent)
        
        if collider != False:
            agent.changeDirection("x")
            agent.changeDirection("y")
            agent.update()
            collider.changeDirection("x")
            collider.changeDirection("y")
            collider.update()
        
def getDirections():
    Xdir = int(random(-1, 2))
    Ydir = int(random(-1, 2))
    if Xdir == 0 and Ydir == 0:
        return getDirections()
    else:
        return {"Xdir": Xdir, "Ydir": Ydir} 
    
def checkOtherAgents(agent):
    for otherAgent in agents:
        #print("agent.X", int(agent.pos.get("x")), "agent.X", int(agent.pos.get("y")), "otherAgent.x", int(otherAgent.pos.get("x")), "otherAgent.y", int(otherAgent.pos.get("y")))
        if agent == otherAgent:
            continue
        if (int(agent.pos.get("x")) >= int(otherAgent.pos.get("x")) and int(agent.pos.get("x")) <= int(otherAgent.pos.get("x")) + otherAgent.size) and (int(agent.pos.get("y")) >= int(otherAgent.pos.get("y")) and int(agent.pos.get("y")) <= int(otherAgent.pos.get("y")) + otherAgent.size):
            return otherAgent
    return False
