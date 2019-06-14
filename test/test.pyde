points = [{"x":-1,"y":-1}]

def setup():
    size(800,600)
    
def draw():
    s = 10
    for i in range(100):
        x = int(random(width))
        y = int(random(height))
        point = {
                 "x": x,
                 "y": y
                 }
        pex = False
        # for p in points:
        #     px = p.get("x")
        #     py = p.get("y")
        #     if (x >= px and x < px+s and y >= py and y < py+s):
        #         pex = True
        #         break
        if pex == False:    
            points.append(point)
            r = random(255)
            g = random(255)
            b = random(255)
            w = random(255)
            a = 100
            noStroke()
            if ((x >= 0 and x < 10) or (x <= width and x > width-20) or (y >= 0 and y < 10) or (y <= height and y > height-20)):
                c = color(0, a)
                #stroke(255)
            elif ((x > width/2 - 10 and x < width / 2 + 10) or (y > height/2 - 10 and y < height/2 + 10)):
                if w < 150:
                    w += 100
                c = color(w, a)
                #stroke(0)
            elif ((x > width/2 and x < width) and (y >=0 and y < height/2)):
                randomInt = int(random(2))
                if randomInt == 0:
                    c = color(w, a)
                else:
                    if (r < 100):
                        r += 100
                    c = color(r, 0,0, a)
            #stroke(0)
            else:
                
                c = color(r,g,b, a)
            
            fill(c)
            rect(x,y, s,s)
