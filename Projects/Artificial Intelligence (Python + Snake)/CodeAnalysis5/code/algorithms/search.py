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
    def __init__(self, strategy="BFS", tree=True, verbose=False, max_depth=0, duplicate_strategy="advanced_list"):
        Algorithm.__init__(self, verbose)
        #self.log_count = 1
        self.visited = []   # visisted/explored list for Graph Search
        self.solution = []  # list of solutions (only 1 if all_solutions=False)
        self.tree = tree    # True for tree search, False for Graph search
        if not strategy == "BFS" and not strategy == "DFS" and not strategy == "IDDFS":
            return 'ERROR: strategy must be "DFS" or "BFS" or "IDDFS" (case sensitive)'
        #ensure duplication checking strategy for graphs is on of the following:
        if not duplicate_strategy == "advanced_list" and not duplicate_strategy == "simple_list" and not duplicate_strategy == "parent_trace":
            return 'ERROR: strategy must be "advanced_list" or "simple_list" or "parent_trace" (case sensitive)'
        self.strategy = strategy
        print(duplicate_strategy)
        self.dupstrat = duplicate_strategy
        if strategy == "IDDFS":
            self.id_depth = 1
            self.max_id_depth = max_depth


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
            #---------------------------------------------------------------------------------------
            #print(node.depth)
            if self.dupstrat == "simple_list":
                subset = []
                for child in children:
                    if child.state not in self.visited:
                        self.visited.append(child.state)
                        subset.append(child)
                return subset

            if self.dupstrat == "advanced_list":
                if node.depth == 1 or node.depth == 0:
                    self.visited = []
                for vs in self.visited:
                    if vs.depth > node.depth:
                        self.visited.remove(vs)
                subset = []
                for child in children:
                    addchild = True
                    for vs in self.visited:
                        if child.state == vs.state:
                            addchild = False
                    if addchild:
                        self.visited.append(child)
                        subset.append(child)
                return subset

            if self.dupstrat == "parent_trace":
                subset = []
                for child in children:
                    add = 1;
                    temp = node
                    while temp != None and temp.parent != None and add == 1:
                        if temp.state == child.state:
                            add = 0;
                        else:
                            temp = temp.parent
                    if(add == 1):
                        subset.append(child)
                return subset

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
        #
        if self.dupstrat == "simple_list":
            self.visited.append(node.state)
        if self.dupstrat == "advanced_list":
            self.visited.append(node)

        # Select a node from the frontier (using the  til nothing left to explore (i.e. frontier is empty)
        # OR a solution is found
        while len(frontier) > 0:
            while len(frontier) > 0:
                self.steps = self.steps + 1
                #print(self.max_depth)
                #print(frontier)
                # vvvvvvvvvvvvvvvvvvvvvvvvv    add code block for if and elif:
                #---------------------------------------------------------------------------------------
                if self.strategy=="BFS":
                    node = frontier.popleft()
                elif self.strategy=="DFS":
                    node = frontier.pop()
                elif self.strategy=="IDDFS":
                    node = frontier.pop()
                for child in self.valid_children(node, problem, node_factory):
                    if self.strategy == "IDDFS":
                        if child.depth > self.max_depth:
                            self.max_depth = child.depth
                        if problem.is_goal( child.state ):
                            if self.verbose:
                                print("Max Frontier Count: ", self.max_frontier_node_count)
                            self.solution.append(child)
                            self.total_node_count = node_factory.node_count
                            if not all_solutions:
                                return child
                        if child.depth <= self.id_depth:
                            frontier.append(child)
                        if len(frontier) > self.max_frontier_node_count:
                            self.max_frontier_node_count = len(frontier)
                    else:
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
            if self.strategy == "IDDFS" and self.id_depth < self.max_id_depth:
                self.id_depth = self.id_depth + 1
                #print("Inc depth limit: ",self.id_depth)
                node = node_factory.make_node( problem.initial_state )
                frontier.append(node)
                self.visited = []
            else:
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
    def __init__(self, verbose=False, duplication="simple_list"):
        Search.__init__(self, strategy="BFS", tree=False, verbose=verbose, duplicate_strategy=duplication)

class DFS_Tree(Search):
    def __init__(self, verbose=False):
        Search.__init__(self, strategy="DFS", tree=True, verbose=verbose)

class DFS_Graph(Search):
    def __init__(self, verbose=False, duplication="simple_list"):
        Search.__init__(self, strategy="DFS", tree=False, verbose=verbose, duplicate_strategy=duplication)

class ID_DFS(Search):
    def __init__(self, verbose=False, mdepth=99999, tree=True, duplication="simple_list"):
        Search.__init__(self, strategy="IDDFS", tree=tree, verbose=verbose, max_depth=mdepth, duplicate_strategy=duplication)
