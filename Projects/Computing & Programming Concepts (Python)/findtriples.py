import math
def Findtriples():
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
            while count<=n:
                    while c<=n:
                        if b<c:
                            a=math.sqrt(c**2-b**2)
                            a = math.floor(a)
                            b=math.sqrt(c**2-a**2)
                            b = math.floor(b)
                            if a**2+b**2==c**2  and a<b
                                print(a,b,c)
                            x=1+x
                            b=x
                        else:
                            c=c+1
                            x=1
                            
                    count =count+1
        retry = 3
Findtriples()
