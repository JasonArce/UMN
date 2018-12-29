import sys
sys.path.append('problems')
sys.path.append('algorithms')


from annealing import SimulatedAnnealing
from nqueens import NQueens

    
if __name__ == '__main__':

    problem = NQueens(10,
                      neighbor_selection="swap",
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
    #algorithm.save_data()
    algorithm.print_solution()
    algorithm.print_stats()

    # For when scheduling is working
    # n = 20 # (number of jobs)
    # p = 5 # (number of people)
    # times = [random.randint(0,p-1) for i in range(n)]
    # problem = scheduling( job_times = times, people_count = p)
    #
    # solution = algorithm.solve(problem)
    # algorithm.print_solution()
    # algorithm.print_stats()

