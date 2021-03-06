'''
The intent with this search function is to create a generic framework
that can be applied to any problem. It should be configured so that you
can use this search and the Node class for any problem constructed using
the Problem class.
'''

from collections import deque
from node import Node, NodeFactory
from algorithm import Algorithm

# Specific search algorithm classes are defined below, all derived from Search.
# These include BFS_Tree, BFS_Graph, DFS_Tree, DFS_Graph
# The default Search method is a BFS tree search.

class Search(Algorithm):
    # BFS Tree Search is the default
    def __init__(self, strategy="BFS", tree=True, verbose=False):
        Algorithm.__init__(self, verbose)
        #self.log_count = 1
        self.visited = []   # visisted/explored list for Graph Search
        self.solution = []  # list of solutions (only 1 if all_solutions=False)
        self.tree = tree    # True for tree search, False for Graph search
        if not strategy == "BFS" and not strategy == "DFS":
            return 'ERROR: strategy must be "DFS" or "BFS" (case sensitive)'
        else:
            self.strategy = strategy


    # expands the node to create all children. If in Graph Search, remove all
    # child nodes with states that have been previously visited
    def valid_children(self, node, problem, node_factory):
        children = node_factory.expand(node, problem)
        if self.tree:
            return children
        # vvvvvvvvv   COMPLETE THE ELSE PART FOR GRAPH SEARCH   vvvvvvvvvvvv
        # vvvvvvvvv   maintain self.visited by adding each child if not already visited
        # vvvvvvvvv   make sure you do not mutate the list over which you are iterating
        else:
            return children

    # The primary function to solve any problem with the instantiated search algorithm.
    # path=True indicates path is part of the solution.
    # Can choose to find 1 solution (if it exists) or all solutions.
    def solve(self, problem, path=True, all_solutions=False):
        self.reset()
        self.problem = problem

        # Generate the initial (root) node
        node_factory = NodeFactory(verbose=self.verbose, record_parent=path )
        self.max_frontier_node_count = 0
        node = node_factory.make_node( problem.initial_state )

        # For efficiency, check if node is goal state BEFORE putting on Q
        if problem.is_goal( node.state ):
            self.solution.append(node)
            self.total_node_count = 1
            if not all_solutions:
                return self.solution

        # Start the frontier Q by adding the root
        frontier=deque()
        frontier.append(node)
        self.visited.append(node.state)

        # Select a node from the frontier (using the  til nothing left to explore (i.e. frontier is empty)
        # OR a solution is found
        while len(frontier) > 0:
            #print(frontier)
            # vvvvvvvvvvvvvvvvvvvvvvvvv    add code block for if and elif:
            #  if self.strategy=="BFS"
            #  elif self.strategy=="DFS"
            node = frontier.popleft()
            for child in self.valid_children(node, problem, node_factory):
                if child.depth > self.max_depth:
                    self.max_depth = child.depth
                if problem.is_goal( child.state ):
                    if self.verbose:
                        print("Max Frontier Count: ", self.max_frontier_node_count)
                    self.solution.append(child)
                    self.total_node_count = node_factory.node_count
                    if not all_solutions:
                        return child
                frontier.append(child)
                if len(frontier) > self.max_frontier_node_count:
                    self.max_frontier_node_count = len(frontier)
        self.total_node_count = node_factory.node_count
        if self.solution==[]:
            self.solution = None
        return self.solution

#####################################################################################################
# These are variations of Search that were created to make it more user friendly.
# You can instantiate Search directly and set appropriate parameters to achieve the same results.

class BFS_Tree(Search):
    def __init__(self, verbose=False):
        Search.__init__(self, strategy="BFS", tree=True, verbose=verbose)

class BFS_Graph(Search):
    def __init__(self, verbose=False):
        Search.__init__(self, strategy="BFS", tree=False, verbose=verbose)

class DFS_Tree(Search):
    def __init__(self, verbose=False):
        Search.__init__(self, strategy="DFS", tree=True, verbose=verbose)

class DFS_Graph(Search):
    def __init__(self, verbose=False):
        Search.__init__(self, strategy="DFS", tree=False, verbose=verbose)



