import sys
import random
import timeit
sys.path.append('problems')
sys.path.append('algorithms')

from towers import TowersOfHanoi
from nqueens import NQueens
from search import BFS_Tree, BFS_Graph, DFS_Tree, DFS_Graph, ID_DFS

from annealing import SimulatedAnnealing
from nqueens import NQueens
from scheduling import Scheduling


if __name__ == '__main__':

    print("-----------------------------------------------------------")
    print("--- Solving Towers with DFS Graph using simple visited list")
    print("-----------------------------------------------------------")
    x = 2
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Towers DFS Graph Simple Visited List size: ", x)
        start = timeit.default_timer()
        towers = TowersOfHanoi(tower_size=x)
        dfs_graph = DFS_Graph(verbose=False, duplication="simple_list")
        solution = dfs_graph.solve(towers)
        #dfs_graph.print_solution()
        dfs_graph.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        print("")
        x = x + 1
