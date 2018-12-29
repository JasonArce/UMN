import sys
sys.path.append('problems')
sys.path.append('algorithms')

from csp import CSP
from kenken import KenKen
from logic import Logic
from crossmath import CrossMath

puzzle_constraints1 = [
    ['-', 2, ['A1','A2']],
    ['==',2,['A3']],
    ['/',2,['B1','C1']],
    ['/',3,['B2','B3']],
    ['-',1,['C2','C3']]
    ]

## NOTE !!!! There are no ternary constraints listed, even though
## there is one in this puzzle. It seems to still be solvable.
puzzle_constraints2 = [
    ['-', 2, ['A1','B1']],
    ['/', 2, ['A2','A3']],
    ['-', 1, ['A4','A5']],
    ['==', 1, ['B2']],
    ['-', 2, ['B3','B4']],
    ['*', 6, ['C1','C2']],
    ['==', 4, ['C3']],
    ['+', 3, ['C4','D4']],
    ['-', 3, ['D1','E1']],
    ['*', 15, ['D2','D3']],
    ['+', 9, ['E2','E3']],
    ['-', 1, ['E4','E5']]
    ]

difficult = [
    ['+', 11, ['A1','B1']],
    ['/', 2, ['A2','A3']],
    ['-', 3, ['B2','B3']],
    ['*', 20, ['A4','B4']],
    ['/', 3, ['B5','C5']],
    ['*', 6, ['C3','C4']],
    ['*', 6, ['D3','E3']],
    ['*', 30, ['D5','D6']],
    ['*', 6, ['E1','E2']],
    ['+', 9, ['E6','F6']],
    ['/', 2, ['F4','F5']],
    ['+', 8, ['F1','F2','F3']],
    ['+', 7, ['D4','E4','E5']],
    ['*',240,['C1','C2','D1','D2']],
    ['*',6,['A5','A6','B6','C6']],
    ]





# pretty-print is quite minimal
# you might want to make a nice looking grid to see results -- but not necessary!

def run_example2(size, puzzle):
    kenken = KenKen(size, puzzle)
    kenken.variables['A1'].domain = [5]
    kenken.variables['A2'].domain = [6]
    #kenken.variables['A3'].domain = [3]
    #kenken.variables['A4'].domain = [4]
    #kenken.variables['A5'].domain = [1]
    #kenken.pretty_print(kenken.variables)
    csp = CSP()
    solution = csp.solve(kenken)
    print(solution)
    csp.print_solution()
    print("\n")


def run_experiment5():
  kenken = KenKen(6,difficult)
  csp = CSP()
  csp.solve(kenken)
  A1domain = csp.variables['A1'].domain
  A2domain = csp.variables['A2'].domain
  A3domain = csp.variables['A3'].domain
  print('RESULTS of AC3 Only')
  #print('A1 domain: ', A1domain)
  #print('A2 domain: ', A2domain)
  #print('A3 domain: ', A3domain)
  csp.print_solution()
  return
  print('\nNow, try searching to reduce domains')
  for i in A1domain:
    kenken.variables['A1'].domain = [i]
    kenken.variables['A2'].domain = A2domain
    kenken.variables['A3'].domain = A3domain
    answer = csp.solve(kenken)
    if answer == None:
      print('A1=',i,' No Solution Found.');
      continue;
    for j in A2domain:
      kenken.variables['A2'].domain = [j]
      kenken.variables['A3'].domain = A3domain
      answer = csp.solve(kenken)
      if answer == None:
        print('A1=',i,' A2=',j,' No Solution Found.')
        continue;
      for k in A3domain:
        kenken.variables['A3'].domain = [k]
        answer = csp.solve(kenken)
        if answer == None:
          print('A1=',i,' A2=',j,' A3=',k,' No Solution Found.')
        else:
          print('A1=',i,' A2=',j,' A3=',k)
          csp.print_solution()
          print("\n")

def run_experiment():
    kenken = KenKen(6,difficult)
    csp = CSP()
    csp.solve(kenken)
    print('RESULTS of AC3 Only')
    csp.print_solution()
    print('\nNow, try searching to reduce domains')
    A1domain = csp.variables['A1'].domain
    A2domain = csp.variables['A2'].domain
    A3domain = csp.variables['A3'].domain
    for i in A1domain:
      kenken.variables['A1'].domain = [i]
      kenken.variables['A2'].domain = A2domain
      kenken.variables['A3'].domain = A3domain
      answer = csp.solve(kenken)
      if answer == None:
        print('A1=',i,' No Solution Found.');
        continue;
      for j in A2domain:
        kenken.variables['A2'].domain = [j]
        kenken.variables['A3'].domain = A3domain
        answer = csp.solve(kenken)
        if answer == None:
          print('A1=',i,' A2=',j,' No Solution Found.')
          continue;
        for k in A3domain:
          kenken.variables['A3'].domain = [k]
          answer = csp.solve(kenken)
          if answer == None:
            print('A1=',i,' A2=',j,' A3=',k,' No Solution Found.')
          else:
            # This is a viable combination
            print('A1=',i,' A2=',j,' A3=',k)
            csp.print_solution()
            print("\n")




# pretty-print is quite minimal
# you might want to make a nice looking grid to see results -- but not necessary!

def run_example(size, puzzle):
  kenken = KenKen(size, puzzle)
  kenken.pretty_print(kenken.variables)
  csp = CSP()
  csp.solve(kenken)
  csp.print_solution()

#run_example(3, puzzle_constraints1)
#run_example2(6, difficult)
run_experiment()

#logicprob = Logic()
#csp = CSP()
#csp.solve(logicprob)
#csp.print_solution()

#crossmapc = [
#    ['+','+',15,['A1','A2','A3']],
#    ['+','*',24,['B1','B2','B3']],
#    ['+','-',14,['C1','C2','C3']],
#    ['+','-',3,['A1','B1','C1']],
#    ['*','-',12,['A2','B2','C2']],
#    ['/','/',4,['A3','B3','C3']]
#    ]

'''crossmapc = [
    ['-','/',1,['A1','A2','A3']],
    ['*','-',66,['B1','B2','B3']],
    ['-','-',2,['C1','C2','C3']],
    ['+','/',2,['A1','B1','C1']],
    ['+','*',10,['A2','B2','C2']],
    ['*','-',14,['A3','B3','C3']]
    ]'''

#cross = CrossMath(crossmath)
#csp = CSP()
#csp.solve(cross)
#csp.print_solution()
