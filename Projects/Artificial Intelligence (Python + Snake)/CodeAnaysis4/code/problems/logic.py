from csp_problem import ConstraintProblem
import copy


class Logic(ConstraintProblem):
    # Input is the size of the puzzle and user-friendly constraints
    def __init__(self):
        ConstraintProblem.__init__(self)
        self.variables = self.construct_vars()

        self.construct_all_unique_constraints()

        self.construct_const()

    def construct_vars(self):

        variables = ["Alice", "Bennie", "Cher", "Dominique"]

        init_domain = [("dog","pirate"),("dog","clown"),("dog", "hotdog"),
                       ("dog","ghost"),("cat","pirate"),("cat","clown"),
                       ("cat", "hotdog"),("cat","ghost"), ("fish","pirate"),
                       ("fish","clown"),("fish", "hotdog"),("fish","ghost"),
                       ("bird","pirate"),("bird","clown"),("bird", "hotdog"),
                       ("bird","ghost")]
        adict = dict()
        for v in variables:
            adict[v] = self.Variable(v, copy.deepcopy(init_domain))
        return adict

    def construct_const(self):

        self.all_constraints.append(self.Constraint(["Alice"], "",(lambda x: (x[1] == "pirate"))))
        self.all_constraints.append(self.Constraint(["Bennie"], "",(lambda x: (x[1] == "clown"))))
        self.all_constraints.append(self.Constraint(["Cher"], "",(lambda x: (x == ("dog", "hotdog")))))
        self.all_constraints.append(self.Constraint(["Cher"], "",(lambda x: (x[0] != "fish") or (x == ("fish", "ghost")))))
        self.all_constraints.append(self.Constraint(["Bennie"], "", (lambda x: (x[0] != "fish") or (x == ("fish", "ghost")))))
        self.all_constraints.append(self.Constraint(["Alice"], "", (lambda x: (x[0] != "fish") or (x == ("fish", "ghost")))))
        self.all_constraints.append(self.Constraint(["Dominique"], "",(lambda x: (x[0] != "fish") or (x == ("fish", "ghost")))))
        self.all_constraints.append(self.Constraint(["Alice"], "", (lambda x: (x[0] != "cat"))))

    def construct_all_unique_constraints(self):
      # generate a list of constraints that implement the all-different constraint
      # for all variable combinations in variables
      for var1 in self.variables:
          for var2 in self.variables:
              if (not var1 == var2):
                  # Reminder, domains are (animal, costume) and x/y are differing names (variables)
                  # No two people can have the same animal or the same costume
                  c = self.Constraint(
                      [var1, var2], "", lambda x, y: (x[0] != y[0] and x[1] != y[1]))
                  self.all_constraints.append(c)
                  self.add_neighbor(var2, c)
