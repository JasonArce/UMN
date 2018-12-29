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
    print("--- Solving Towers with ID_DFS Graph using simple visited list")
    print("-----------------------------------------------------------")
    x = 5
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Towers ID_DFS Graph Simple Visited List size: ", x)
        start = timeit.default_timer()
        towers = TowersOfHanoi(tower_size=x)
        id_dfs_graph = ID_DFS(verbose=False, tree=False, duplication="simple_list")
        solution = id_dfs_graph.solve(towers)
        id_dfs_graph.print_solution()
        id_dfs_graph.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        print("")
        x = x + 1

    print("-----------------------------------------------------------")
    print("--- Solving Towers with ID_DFS Graph using advanced visited list")
    print("-----------------------------------------------------------")
    x = 5
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Towers ID_DFS Graph Advanced Visited List size: ", x)
        start = timeit.default_timer()
        towers = TowersOfHanoi(tower_size=x)
        id_dfs_graph = ID_DFS(verbose=False, tree=False, duplication="advanced_list")
        solution = id_dfs_graph.solve(towers)
        id_dfs_graph.print_solution()
        id_dfs_graph.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        print("")
        x = x + 1

    print("-----------------------------------------------------------")
    print("--- Solving Towers with ID_DFS Graph using parent trace")
    print("-----------------------------------------------------------")
    x = 5
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Towers ID_DFS Graph Parent Trace size: ", x)
        start = timeit.default_timer()
        towers = TowersOfHanoi(tower_size=x)
        id_dfs_graph = ID_DFS(verbose=False, tree=False, duplication="parent_trace")
        solution = id_dfs_graph.solve(towers)
        id_dfs_graph.print_solution()
        id_dfs_graph.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        print("")
        x = x + 1

    print("-----------------------------------------------------------")
    print("-----------------------------------------------------------")
    print("-----------------------------------------------------------")
    print("--- Solving Nqueens with BFS Tree")
    print("-----------------------------------------------------------")
    x = 5
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Nqueens BFS Tree size: ", x)
        start = timeit.default_timer()
        nqueens = NQueens(x,pruning=False)
        search = BFS_Tree()
        search.solve(nqueens, all_solutions=False)
        search.print_solution()
        search.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        x = x + 1

    print("-----------------------------------------------------------")
    print("--- Solving Nqueens with DFS Tree")
    print("-----------------------------------------------------------")
    x = 5
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Nqueens DFS Tree size: ", x)
        start = timeit.default_timer()
        nqueens = NQueens(x,pruning=False)
        search = DFS_Tree()
        search.solve(nqueens, all_solutions=False)
        search.print_solution()
        search.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        x = x + 1

    print("-----------------------------------------------------------")
    print("--- Solving Nqueens with ID_DFS Tree")
    print("-----------------------------------------------------------")
    x = 5
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Nqueens ID_DFS Tree size: ", x)
        start = timeit.default_timer()
        nqueens = NQueens(x,pruning=False)
        search = ID_DFS(verbose=False, tree=True)
        search.solve(nqueens, all_solutions=False)
        search.print_solution()
        search.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        x = x + 1
