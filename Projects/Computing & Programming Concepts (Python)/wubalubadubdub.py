def convert(x):
    if x == "I":
        return 1
    if x == "V":
        return 5
    if x == "X":
        return 10
    if x == "L":
        return 50
    if x == "C":
        return 100
    if x == "D":
        return 500
    if x == "M":
        return 1000


def romanNumbers():
    inputa = input("Enter roman shit here: ")
    if len(inputa) == 0:
        return 0
    while len(inputa) > 0:
        
    output = 0
    temp = 0
    if inputa 
    while len(inputa)>0:
        temp = convert(inputa[0])
        if len(inputa)>1 and temp >= convert(inputa[1]):
            output = output + temp
        elif len(inputa)>1 and temp < convert(inputa[1]):
            output = output + convert(inputa[1]) - temp
            inputa = inputa[1:len(inputa)]
        else:
            output = output + temp
        inputa = inputa[1:len(inputa)]
    print(output)
            
            
        
    
    
