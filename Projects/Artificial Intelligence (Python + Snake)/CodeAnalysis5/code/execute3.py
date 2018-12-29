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


        '''print("-----------------------------------------------------------")
        print("--- Solving NQUEENS slide random")
        print("-----------------------------------------------------------")
        x = 1
        y = 5
        start = timeit.default_timer()
        while(x < y):
            print("--- Nqueens slide random size: ", x)
            start = timeit.default_timer()
            problem = NQueens(x,
                              neighbor_selection="slide",
                              objective_fn="all",
                              start_fn="random",
                              start_state=[6, 6, 6, 0, 7, 0, 8, 6, 9, 7])

            algorithm = SimulatedAnnealing(
                verbose=False,
                alpha=.98,
                start=600000,
                end=.25,
                iterations=500)

            solution = algorithm.solve(problem)
            algorithm.print_solution()
            algorithm.print_stats()
            stop = timeit.default_timer()
            print('Time: ', stop - start)
            print("")
            x = x + 1'''

        '''print("-----------------------------------------------------------")
        print("--- Solving NQUEENS swap random")
        print("-----------------------------------------------------------")
        x = 7
        start = timeit.default_timer()
        while((timeit.default_timer()-start)<120):
            print("--- Nqueens swap random size: ", x)
            start = timeit.default_timer()
            problem = NQueens(x,
                              neighbor_selection="swap",
                              objective_fn="all",
                              start_fn="random",
                              start_state=[6, 6, 6, 0, 7, 0, 8, 6, 9, 7])

            algorithm = SimulatedAnnealing(
                verbose=False,
                alpha=.98,
                start=600000,
                end=.25,
                iterations=500)

            solution = algorithm.solve(problem)
            algorithm.print_solution()
            algorithm.print_stats()
            stop = timeit.default_timer()
            print('Time: ', stop - start)
            print("")
            x = x + 1'''

        print("-----------------------------------------------------------")
        print("--- Solving NQUEENS swap permute")
        print("-----------------------------------------------------------")
        z = 15
        x = 1
        y = 6
        start = timeit.default_timer()
        while(x < y):
            print("--- Nqueens swap permute size: ", z)
            start = timeit.default_timer()
            problem = NQueens(z,
                              neighbor_selection="swap",
                              objective_fn="all",
                              start_fn="permute",
                              start_state=[6, 6, 6, 0, 7, 0, 8, 6, 9, 7])

            algorithm = SimulatedAnnealing(
                verbose=False,
                alpha=.98,
                start=10000,
                end=.25,
                iterations=500)

            solution = algorithm.solve(problem)
            algorithm.print_solution()
            algorithm.print_stats()
            stop = timeit.default_timer()
            print('Time: ', stop - start)
            print("")
            x = x + 1

        '''print("-----------------------------------------------------------")
        print("--- Solving NQUEENS slide permute")
        print("-----------------------------------------------------------")
        x = 7
        start = timeit.default_timer()
        while((timeit.default_timer()-start)<120):
            print("--- Nqueens slide permute size: ", x)
            start = timeit.default_timer()
            problem = NQueens(x,
                              neighbor_selection="slide",
                              objective_fn="all",
                              start_fn="permute",
                              start_state=[6, 6, 6, 0, 7, 0, 8, 6, 9, 7])

            algorithm = SimulatedAnnealing(
                verbose=False,
                alpha=.98,
                start=600000,
                end=.25,
                iterations=500)

            solution = algorithm.solve(problem)
            algorithm.print_solution()
            algorithm.print_stats()
            stop = timeit.default_timer()
            print('Time: ', stop - start)
            print("")
            x = x + 1'''
