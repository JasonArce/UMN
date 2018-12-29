def orbit():
    import turtle
    import math
    t1=turtle.Turtle()
    turtle.speed(0)
    turtle.delay(0)
    turtle.dot(80,'yellow')
    turtle.color('green')
    turtle.shape('circle')
    turtle.penup()
    turtle.goto(150,0)
    turtle.left(90)
    t1.shape('circle')
    t1.color('blue')
    t1.penup()
    t1.goto(230,0)
    x=0
    y=0
    z=0
    a=0
    b=0
    while y<378:
        turtle.goto(t1.xcor()+80*math.cos(z),t1.ycor()+80*math.sin(z))
        t1.goto(150*math.cos(x),150*math.sin(x))
        x=x+0.05
        z=z+0.2
        y=y+1
orbit()
def ptrip(a,b,c):
    if a**2+b**2 == c**2:
        return('True')
    else:
        return('False')
import math
def findtriples():
    n=int(input("Enter an upper bound:"))
    count=0
    a=1
    b=1
    x=1
    c=2
    retry = 0
    while retry<3:
        if n<10:
            print("Input error! must be > 10")
            n=int(input('Enter an upper bound:'))
        else:
            while c<=n:
                if b<c:
                    a=math.sqrt(c**2-b**2)
                    a = math.floor(a)
                    b=math.sqrt(c**2-a**2)
                    b = math.floor(b)
                    if a**2+b**2==c**2 and a<b:
                        print(a,b,c)
                    x=1+x
                    b=x
                else:
                    c=c+1
                    x=1
                    b=x
        retry = retry+1
