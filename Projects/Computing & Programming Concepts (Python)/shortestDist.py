def shortestDist(x):
    import math
    alist=x
    blist=[]
    count=1
    count2=0
    y=1
    while len(alist)>0:
        while len(alist)>count:
            xcoor1=alist[0][0]
            ycoor1=alist[0][1]
            xcoor2=alist[y][0]
            ycoor2=alist[y][1]
            if count2==0:
                value=math.sqrt((abs(xcoor2-xcoor1)**2)+(abs(ycoor2-ycoor1)**2))
            newvalue=math.sqrt((abs(xcoor2-xcoor1)**2)+(abs(ycoor2-ycoor1)**2))
            if newvalue<value:
               value=newvalue
            y=y+1 
            count=count+1
            count2=count2+1
        y=1
        count=1
        alist.pop((0))
    blist.append(value)
    return(((blist)))
def unitTest(x):
    return(shortestDist(x))

