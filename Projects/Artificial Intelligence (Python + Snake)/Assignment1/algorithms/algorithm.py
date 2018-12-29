class Algorithm:
    def __init__(self, verbose=False):
        self.verbose = verbose
        self.total_node_count = -1
        self.max_frontier_node_count = -1
        self.max_depth = -1
        self.solution = None
        self.problem = None

    def solve(self, problem, all_solutions=False):
        self.reset()
        self.problem = problem

    def reset(self):
        self.total_node_count = -1
        self.max_frontier_node_count = -1
        self.solution = None
        self.max_depth = -1
        self.problem = None

    def print_solution(self):
        if not self.solution:
            print("No solution found.")
            return
        print('state: ', self.solution.state)
        self.problem.pretty_print(self.solution.state)

    def print_stats(self):
        print("Total node count: ", self.total_node_count)
        print("Max frontier count: ", self.max_frontier_node_count)
        print("Max depth of tree: ", self.max_depth)
