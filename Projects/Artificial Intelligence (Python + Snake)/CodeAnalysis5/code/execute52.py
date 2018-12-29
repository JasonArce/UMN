import sys
import random
import timeit
sys.path.append('problems')
sys.path.append('algorithms')

from towers import TowersOfHanoi
from nqueens import NQueens

from search import ID_DFS, BFS_Tree, BFS_Graph, DFS_Tree, DFS_Graph

from annealing import SimulatedAnnealing
from nqueens import NQueens
from scheduling import Scheduling

def test_iddfs():

    print("-----------------------------------------------------------")
    print("--- Solving NQueens with BFS Tree")
    print("-----------------------------------------------------------")
    x = 4
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Solving NQueens with BFS Tree size", x)
        start = timeit.default_timer()
        nqueens = NQueens(x,pruning=True)
        iddfs_tree = BFS_Tree(verbose=False)
        solution = iddfs_tree.solve(nqueens)
        #iddfs_tree.print_solution()
        iddfs_tree.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        print("")
        x = x + 1

    '''print("--- Solving NQueens with IDDFS Tree")
    nqueens = NQueens(5,pruning=True)
    iddfs_tree = ID_DFS(verbose=False, tree=True)
    solution = iddfs_tree.solve(nqueens)
    iddfs_tree.print_solution()
    iddfs_tree.print_stats()'''

    '''print("")
    print("--- Solving Towers with IDDFS Graph")
    towers = TowersOfHanoi(tower_size=9)
    #iddfs_graph = ID_DFS(verbose=False, tree=False, duplication="advanced_list")
    iddfs_graph = BFS_Graph(verbose=False, duplication="simple_list")
    solution = iddfs_graph.solve(towers)
    iddfs_graph.print_solution()
    iddfs_graph.print_stats()'''

    '''print("")
    print("--- Solving Towers with BFS Graph")
    towers = TowersOfHanoi(tower_size=4)
    bfs_graph = BFS_Graph(verbose=False)
    solution = bfs_graph.solve(towers)
    bfs_graph.print_solution()
    bfs_graph.print_stats()

    print("")
    print("--- Solving Towers with DFS Graph")
    towers = TowersOfHanoi(tower_size=4)
    dfs_graph = DFS_Graph(verbose=False)
    solution = dfs_graph.solve(towers)
    dfs_graph.print_solution()
    dfs_graph.print_stats()'''

    '''print("-----------------------------------------------------------")
    print("--- Solving Towers with ID_DFS Graph using visited list")
    print("-----------------------------------------------------------")
    x = 1
    start = timeit.default_timer()
    while((timeit.default_timer()-start)<120):
        print("--- Towers ID_DFS Graph Visited List size: ", x)
        start = timeit.default_timer()
        towers = TowersOfHanoi(tower_size=x)
        id_dfs_graph = ID_DFS(verbose=False, tree=False, duplication="simple_list")
        solution = id_dfs_graph.solve(towers)
        #id_dfs_graph.print_solution()
        id_dfs_graph.print_stats()
        stop = timeit.default_timer()
        print('Time: ', stop - start)
        print("")
        x = x + 1'''

test_iddfs()
