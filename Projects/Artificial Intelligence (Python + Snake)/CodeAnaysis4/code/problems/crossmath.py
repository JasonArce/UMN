import functools
from functools import reduce
from csp_problem import ConstraintProblem
from inspect import getsourcelines

# The primary problem set-up consists of "variables" and "constraints":
#   "variables" are a dictionary of constraint variables (of type ConstraintVar), example variables['A1']
#   For KenKen, each row is labeled with a letter. "A" is the top row.
#       And each column is a number. "1" is the leftmost column.
#
#   "constraints" are the unary and binary constraints that must be satisfied.
#   For KenKen, constraints will include uniqueness for rows and columns (generic for all kenken's)
#       And for the specifics of the puzzle, which are provided in a "user-friendly" format,
#       then converted to a usable representation.
#

class CrossMath(ConstraintProblem):
    # Input is the size of the puzzle and user-friendly constraints
    def __init__(self, constraints, size=3):
        ConstraintProblem.__init__(self)
        self.size = size
        self.row_labels = []
        self.column_labels = []
        # Create the "A1", "A2", ... variables
        # Each variable has a name and domain. It's stored in a dictionary indexed by the name (e.g. "A1")
        self.construct_variables()
        # Construct the constraints to ensure unique column and row values
        self.construct_all_unique()
        # Convert the user-friendly constraints to formally defined ones.
        self.construct_user_constraints(constraints)
        # This is not really used, but might come in handy later -- make separate groups for unary and binary.
        self.sort_constraints()

    def construct_variables(self):
        # creating labels 'A1' 'A2' ... 'B1' 'B2' ...
        A_ascii = ord('A')
        self.row_labels = [chr(i+A_ascii) for i in range(0, self.size)]
        self.column_labels = [str(i) for i in range(1, self.size+1)]
        for row in self.row_labels:
            for col in self.column_labels:
                # Make it and store in the dictionary of variables.
                self.variables[row+col] = self.Variable(row+col, [d for d in range(1, 10)])

    def construct_rows_unique_constraints(self):
        if self.row_labels == [] or self.column_labels == []:
            # This is not a graceful exit.
            print('You must first call construct_variables() before constructing constraints')
            exit()
        for row in self.row_labels:
            labels = []
            for col in self.column_labels:
                labels.append( row+col )
            # Creates binary "not ==" constraints for all pair combinations in the list
            self.create_all_unique_constraints(labels)

    def construct_columns_unique_constraints(self):
        if self.row_labels == [] or self.column_labels == []:
            print('You must first call construct_variables() before constructing constraints')
            return
        for col in self.column_labels:
            labels = []
            for row in self.row_labels:
                labels.append( row+col )
            # Creates binary "not ==" constraints for all pair combinations in the list
            self.create_all_unique_constraints(labels)

    def construct_all_unique_constraints(self):
        if self.row_labels == [] or self.column_labels == []:
            print('You must first call construct_variables() before constructing constraints')
            return
        labels = []
        for col in self.column_labels:
            for row in self.row_labels:
                labels.append( row+col )
            # Creates binary "not ==" constraints for all pair combinations in the list
        print("LABELS: " + '_'.join(labels))
        self.create_all_unique_constraints(labels)

    def construct_all_unique(self):
        #self.construct_columns_unique_constraints()
        #self.construct_rows_unique_constraints()
        self.construct_all_unique_constraints()

    def construct_user_constraints(self, user_friendly_constraints):
        # constraints are provided in a more user-friendly format
        # EXAMPLES: ['-', 2, ['A1','B1']], ['==', 1, ['B2']]
        # This will convert that to a format required by the csp algorithm
        # ufc is a triplet:
        # - index 0 is the operator,
        # - index 1 is the result value
        # - index 2 is a variable list (required to have 1 or 2 elements only)

        def make_lambda(opchar1, opchar2, value):
            #print (opchar1, opchar2, value)
            return (lambda x,y,z:
                    (value == ConstraintProblem.operators[opchar2](ConstraintProblem.operators[opchar1](x,y) ,z)) and
                    (x != y) and
                    (y != z) and
                    (z != x)
                    )

        def make_lambda2(opchar1, opchar2, value):
            #print (opchar1, opchar2, value)
            return (lambda x,y,z:
                    (value == ConstraintProblem.operators[opchar2](ConstraintProblem.operators[opchar1](y,x) ,z)) and
                    (x != y) and
                    (y != z) and
                    (z != x)
                    )

        def make_lambda3(opchar1, opchar2, value):
            #print (opchar1, opchar2, value)
            return (lambda z,x,y:
                    (value == ConstraintProblem.operators[opchar2](ConstraintProblem.operators[opchar1](x,y) ,z)) and
                    (x != y) and
                    (y != z) and
                    (z != x)
                    )

        for ufc in user_friendly_constraints:
            if len(ufc[3]) == 3:

                vars1 = ufc[3]
                vars2 = [ufc[3][0], ufc[3][2], ufc[3][1]]
                vars3 = [ufc[3][1], ufc[3][0], ufc[3][2]]
                vars4 = [ufc[3][1], ufc[3][2], ufc[3][0]]
                vars5 = [ufc[3][2], ufc[3][0], ufc[3][1]]
                vars6 = [ufc[3][2], ufc[3][1], ufc[3][0]]
                op1 = ufc[0]
                op2 = ufc[1]

                #Vars1:F1F2F3 Vars2:F1F3F2 Vars3:F2F1F3 Vars4:F2F3F1 Vars5:F3F1F2 Vars6:F3F2F1

                #print('Vars1:' + ''.join(vars1) + ' Vars2:' + ''.join(vars2) + ' Vars3:' + ''.join(vars3) + ' Vars4:' + ''.join(vars4) + ' Vars5:' + ''.join(vars5) + ' Vars6:' + ''.join(vars6))

                c = self.Constraint(vars1, op1, make_lambda(op1, op2, ufc[2]))
                self.all_constraints.append(c)
                self.add_neighbor(vars1[0], c)
                self.add_neighbor(vars1[1], c)
                self.add_neighbor(vars1[2], c)

                c = self.Constraint(vars3, op1, make_lambda2(op1, op2, ufc[2]))
                self.all_constraints.append(c)
                self.add_neighbor(vars3[0], c)
                self.add_neighbor(vars3[1], c)
                self.add_neighbor(vars3[2], c)

                c = self.Constraint(vars5, op1, make_lambda3(op1, op2, ufc[2]))
                self.all_constraints.append(c)
                self.add_neighbor(vars5[0], c)
                self.add_neighbor(vars5[1], c)
                self.add_neighbor(vars5[2], c)



                '''make_lambda(op1, op2, ufc[2])
                c = self.Constraint(vars6, op1, make_lambda(op2, op1, ufc[2]))
                self.all_constraints.append(c)
                self.add_neighbor(vars6[0], c)
                self.add_neighbor(vars6[1], c)
                self.add_neighbor(vars6[2], c)'''


                '''c = self.Constraint(vars3, op1, make_lambda(op1, op2, ufc[2]))
                self.all_constraints.append(c)
                self.add_neighbor(vars3[1], c)
                self.add_neighbor(vars3[2], c)

                c = self.Constraint(vars5, op1, make_lambda(op1, op2, ufc[2]))
                self.all_constraints.append(c)
                self.add_neighbor(vars5[1], c)
                self.add_neighbor(vars5[2], c)'''
                '''
                A1   [2, 4, 5]
                A2   [2, 3, 4, 5, 7, 9]
                A3   [8]
                B1   [1, 2, 3, 4, 5, 6, 7, 8, 9]
                B2   [1, 2, 3, 4, 5, 6, 7, 8, 9]
                B3   [1, 2, 3, 4, 5, 6, 7, 9]
                C1   [6, 7, 8, 9]
                C2   [1, 2, 3, 4, 5, 6, 7, 8, 9]
                C3   [1, 2, 3, 4, 5, 6, 7, 9]
                '''



            else:
                print("Not yet equipped to manage more than arc consistency")
                return

    def pretty_print(self, variables):
        for k, v in variables.items():
            print(v.name,' ', v.domain)
