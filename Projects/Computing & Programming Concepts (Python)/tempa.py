import math
def tempa():
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
                        #print(a,b,c)
                        if a**2+b**2==c**2:
                            if a<b and b<c:
                                print(a,b,c)
                        c = c + 1
                    c = 1
                    b = b + 1
                b = 1
                a = a + 1
        retry = 3
    print("exiting")
tempa()
                        
            
            
