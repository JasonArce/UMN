def shortestDist(x):
    import math
    alist=x
    blist=[]
    count=1
    y=1
    dlist=[]
    while len(alist)>0:
        while len(alist)>count:
            xcoor1=alist[0][0]
            ycoor1=alist[0][1]
            xcoor2=alist[y][0]
            ycoor2=alist[y][1]
            hold=[math.sqrt((abs(xcoor2-xcoor1)**2)+(abs(ycoor2-ycoor1)**2))]
            blist.append(hold)
            count=count+1
            y=y+1             
        dlist=blist+dlist
        blist=[]
        y=0
        count=0
        alist.pop((0))
    return((dlist))
