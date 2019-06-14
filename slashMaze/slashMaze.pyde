sc = 20
x = 0
y = 0
paused = False
def setup():
    size(800,600)
    background(255)
    #frameRate(20)
    
def draw():
    global sc
    global x
    global y
    w = width/sc
    h = height/sc
    
    if x < width:
        r = random(1)
        if (r < 0.5):
            drawBackslash(x,y,sc)
        else:
            drawForwardslash(x,y,sc)
        x += sc
    else:
        y += sc
        x = 0
    if (y > height):
        background(255)
        sc+=1
        y = 0
        x = 0

    
def drawBackslash(x,y,sc):
    stroke(0)
    line(x, y, x + sc, y + sc)
    
def drawForwardslash(x,y,scale):
    stroke(0)
    line(x, y+scale, x + scale, y)
    
def keyPressed(key):
    global paused
    if (keyCode == 32):
        if (paused == False):
            noLoop()
            paused = True
        else:
            loop()
            paused = False
