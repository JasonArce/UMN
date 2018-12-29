# This is an outline of how you can approach iddfs .
# You do not have to do it like this BUT
# We must be able to run execute5.py as it is written.

# These should be placed in search.py
class DL_DFS(Search):
    def __init__(self, verbose=False, depth_limit=5, tree=True):
        Search.__init__(self,
            strategy="DFS", tree=tree, depth_limit=depth_limit, verbose=verbose)

class ID_DFS(Search):
    def __init__(self, verbose=False, tree=True):
        Search.__init__(self)

    def solve(self, problem):
        for i in ...:
            algo = DL_DFS(depth_limit=i,tree=tree)
            solution = algo.solve(problem)
            # save statistics/data
            # check if solution found
