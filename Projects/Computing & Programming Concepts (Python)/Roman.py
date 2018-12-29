import math
def comparison(values):
    x=values
    y=0
    count=0
    while count<len(values):
        if x[y] == "I":
            return "1"
        if x[y]=="V":
            return"2"
        if x[y]=="X":
            return"3"
        if x[y]=="L":
            return "4"
        if x[y]=="C":
            return "5"
        if x[y]=="D":
            return"6"
        if x[y]=="M":
            return "7"
        y=y+1
        count=count+1
def one(x):
    if "I":
        "I"=="1"
    if "V":
        "V"=="5"
    if "X":
        "X"=="10"
    if "L":
        "L"== "50"
    if "C":
        "C"== "100"
    if "D":
        "D"=="500"
    if "M":
        "M"== "1000"
def conversion(x):
    y=0
    z=1
    if x[y] == "I" or x[z]=="I":
        return "1"
    if x[y]=="V" or x[z]=="V":
        return"5"
    if x[y]=="X" or x[z]=="X":
        return"10"
    if x[y]=="L" or x[z]=="L":
        return "50"
    if x[y]=="C" or x[z]=="C":
        return "100"
    if x[y]=="D" or x[z]=="D":
        return"500"
    if x[y]=="M" or x[z]=="M":
        return "1000"
    y=y+1
    z=z+1

def romanNumerals():
    values =((input("Enter a Roman Numeral: ")))
    results=0
    y=0
    z=1
    values = comparison(values)
    count=1
    if len(values) == 1:
        values=one(values)
        return(result)
 
    else:
        while count!=len(values):
            if values[y]>=values[z]:
                values=(conversion(values))
                result=result+int(values[y])
                values=comparison(values)
                print('b')
            if values[y]<values[z]:
                values=conversion(values)
                result=result+int(values[y])
                values=comparison(values)
                print('c')
            count=count+1
            y=y+1
            z=z+1
        while len(values) == count and count!=1:
            if values[-1]>=values[-2]:
                values=conversion(values)
                result=result+int(values[-1])
                values=comparison(values)
                print('d')
            if values[-1]<values[-2]:
                result=result-int(values[-1])
                print('e')
            y=y+1
            z=z+1
            count=count+1
    return(result)
        
