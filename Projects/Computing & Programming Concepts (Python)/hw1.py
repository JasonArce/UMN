def windchill(temp,wind):
    print(35.74+0.6215*temp-35.75*wind**0.16+0.4275*temp*wind**0.16)
windchill(0,10)

def computeWC():
    temp = input('Enter temperature (F):')
    wind = input('Enter wind velocity (MPH): ')
    temp = float(temp)
    wind = float(wind)
    print('The windchill is: ')
    print(windchill(temp,wind))
computeWC()

def SideLengthOne():
    turtle.left(216)
    One = input('Enter Side One')
    One = float(One)
    turtle.forward(One)
def SideLengthTwo():
    turtle.left(216)
    Two = input('Enter Side Two')
    Two = float(Two)
    turtle.forward(Two)
def SideLengthThree():
    turtle.left(216)
    Three = input('Enter side Three')
    Three = float(Three)
    turtle.forward(Three)
def SideLengthFour():
    turtle.left(216)
    Four = input('Enter side Four')
    Four = float(Four)
    turtle.forward(Four)
def SideLengthFive():
    turtle.left(216)
    Five = input('Enter side Five')
    Five = float(Five)
    turtle.forward(Five)
import turtle
turtle.showturtle
SideLengthOne()
SideLengthTwo()
SideLengthThree()
SideLengthFour()
SideLengthFive()
