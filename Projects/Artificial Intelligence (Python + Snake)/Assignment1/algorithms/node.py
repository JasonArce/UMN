from copy import deepcopy

class NodeFactory:
	def __init__(self, verbose=False, log_count = False, record_parent = False):
		self.log_count = log_count
		self.node_count = 0
		self.record_parent = record_parent
		self.verbose = verbose

	def make_node(self, state, parent=None, action=None):
		if self.log_count:
			if self.verbose and 0 == (self.node_count % 100):
				print('node count: ', self.node_count)
		self.node_count += 1
		result = Node(state, parent, action)
		if self.record_parent:
			result.parent = parent
		else:
			result.parent = None
		return result

	def expand(self, node, problem):
		return [self.make_child(node, problem, action) for action in problem.get_actions(node.state)]

	def make_child(self, node, problem, action):
		child_state = deepcopy(node.state)
		problem.apply_action(child_state, action)
		return self.make_node(child_state, node, action)

class Node:
	def __init__(self, state, parent=None, action=None):
		self.state = state
		self.key = None
		if parent:
			self.depth = parent.depth + 1
		else:
                        self.depth = 0

