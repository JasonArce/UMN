import sys
sys.path.append('problems')
sys.path.append('algorithms')

from nqueens import NQueens
from bfs import BFS

if __name__ == "__main__":
    #added just for easy testing, change to True/False if you want/do not want pruning.
    do_prune = True
    problem = NQueens(9, do_prune)
    bfs = BFS()
    #added just for easy testing, change to True/False if you want/do not want all solutions.
    find_all_solutions = True
    bfs.solve(problem, find_all_solutions)
    #added so duplicate solutions will not be printed
    if find_all_solutions == False:
        bfs.print_solution()
    bfs.print_stats()
