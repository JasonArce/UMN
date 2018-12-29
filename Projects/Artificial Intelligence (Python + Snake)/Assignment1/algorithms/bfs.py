'''
The intent with these search functions is to create a generic framework
that can be applied to any problem. It should be configured so that you
can use both this search and the Node class without modification, provided
you write problem specific code in the Problem class
'''

from collections import deque
from node import Node, NodeFactory
from algorithm import Algorithm
from nqueens import  NQueens

class BFS(Algorithm):
    def __init__(self, verbose=False):
        Algorithm.__init__(self, verbose)

    def solve(self, problem, all_solutions=False):
        self.reset()
        self.problem = problem
        # Generate the initial (root) node
        node_factory = NodeFactory(False,True)
        self.max_frontier_node_count = 0
        node = node_factory.make_node( problem.initial_state )

        # For efficiency, check if node is goal state BEFORE putting on Q
        if problem.is_goal( node.state ):
            self.solution = node
            self.total_node_count = 1
            if all_solutions == False: #added
                return node
            else:
                self.problem.pretty_print(self.solution.state)
                counter = counter + 1
        # Start the frontier Q by adding the root
        frontier=deque()
        frontier.append(node)

        loops = 0

        # Search tree til nothing left to explore (i.e. frontier is empty)
        # OR a solution is found
        while len(frontier) > 0:

            node = frontier.popleft()
            #POTENTIAL IMPROVEMENT: Use generator
            for child in node_factory.expand(node, problem):
                if problem.is_goal( child.state ):
                    if self.verbose:
                        print("Max Frontier Count: ", self.max_frontier_node_count)
                    self.solution = child

                    # added for all_solutions being true, print after one is found. If all_solutions
                    # is false, just return child
                    if all_solutions == True:
                        self.problem.pretty_print(self.solution.state)
                    else:
                        self.total_node_count = node_factory.node_count
                        return child

                frontier.append(child)
                if len(frontier) > self.max_frontier_node_count:
                    self.max_frontier_node_count = len(frontier)

        # added for all_solutions being true, will return the last child, however, in execute
        # a case for this is changed so duplicate solutions won't be printed.
        if all_solutions == True:
            self.total_node_count = node_factory.node_count
            return child

        self.solution = None
        self.total_node_count = node_factory.node_count
        return None
