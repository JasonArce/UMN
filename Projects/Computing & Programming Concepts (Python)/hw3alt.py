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
    while y<378:
        t1.goto(150*math.cos(x),150*math.sin(x))
        turtle.goto(t1.xcor()+80*math.cos(z),t1.ycor()+80*math.sin(z))
        x=x+0.05
        z=z+0.2
        y=y+1
def ptrip(a,b,c):
    import math
    if a**2+b**2 == c**2:
        return('True')
    else:
        return('False')
def findtriples():
    import math
    n=int(input("Enter an upper bound:"))
    count=0
    a=1
    b=1
    c=1
    retry = 0
    while retry<3:
        if n<10:
            print("Input error! must be > 10")
            n=int(input('Enter an upper bound:'))
        else:
            while a<=n:
                while b<=n:
                    while c<=n:
                        if a**2+b**2==c**2:
                            if a<b and b<c:
                                print(a,b,c)
                        c = c + 1
                    c = 1
                    b = b + 1
                b = 1
                a = a + 1
        retry = 3
 
