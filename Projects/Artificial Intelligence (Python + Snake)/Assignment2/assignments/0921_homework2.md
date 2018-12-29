### Code+Analysis Homework 2
### DUE: Fri, September 21 at 10:00pm
#### Submit written responses via Canvas.
#### We will check your repository for your code modification.

<hr>

#### The Towers of Hanoi (TOH) Problem

Towers of Hanoi is a toy problem in which each of n discs is placed on each of 3 pegs under the constraint that no disc is stacked on another smaller disc. Traditionally, the discs all start on the leftmost peg, and the object of the game is to get the discs all stacked on the rightmost peg without violating the stacking constraint. Ideally, the player would want to do this in the least (optimal) number of moves.

The code provided represents a state as a series of 3 lists, each of which represents a peg. The list for a peg represents the discs stacked on that peg, in order. The number n is the largest disc and the number 1 is the smallest. For example, the initial state for 3 discs is [[3,2,1],[],[]] and the goal state is [[],[],[3,2,1]].

An action consists of moving the topmost disc of a peg to another peg. In code, this means popping the last element off of a list and appending it to another list. Of course, you can only make legal actions that do not violate the stacking constraint.

The goal state is known, and the solution is a series of moves. A move is a list of 2 numbers that represent the peg the disc is being moved from and the peg the disc is moving to. For example, for the initial state the legal actions are [0,1] and [0,2], which would result in the states [[3,2],[1],[]] and [[3,2],[],[1]], respectively.

#### Theoretical Analysis

Please answer all questions using the state representation and actions as described above.

1. Think about the use of tree search for solving TOH. It is known that the optimal solution to TOH with n discs is (2^n)-1. Use that information to explain the incredible difference in the number of nodes generated for a BFS tree search when using 3 discs versus 4 discs (which is evidenced by the very long wait for BFS_Tree to solve 4 discs -- if you can even wait that long). **_Justify your answer._**

2. Justify the statement that TOH (even at 3 discs) is intractable when solving with DFS Tree Search.

3. Actions are generated in the same order every time a node is expanded. Argue that randomizing the order of applied actions might improve performance for TOH. (For fun, you can make it an option in your code and see what happens.)

4. Justify the statement that Graph Search is not a good fit for nQueens (or Sudoku or KenKen).

#### The Set-Up

The code in the class-repo has been reworked to a more generic framework. If you cloned it before, you can _pull_ to get the latest version. Otherwise, use the download button to get the new code.

**_Remember to PUSH your changes to your repo regularly. There is no excuse for you to lose more than a day's work because your laptop died. And if you are in the mad final dash to complete your assignment, don't go for more than a few hours to push up those changes._**

#### Code Modification

Modify the Search class in your repo to
  1. Use either BFS or DFS search, and
  2. Use either Tree or Graph search.

There are some directions in the code as to where those changes should take place.

As before, there is an execute.py that instantiates an algorithm and a problem, then calls solve.

#### Experiments and Report

1. Please include the lines of code that you added/modified in Search as part of the report. You will be graded on what is included in the report.

1. Use BFS_Tree and DFS_Tree to solve 5 queens (single solution). Print the statistics and report them here. Explain the differences (if there are any) between node count of the two algorithms and for max frontier size of the two algorithms.

2. Use BFS_Graph and DFS_Graph to solve TOH with 4 discs. Explain why the number of moves to solve the puzzle for the two algorithms is different.

PUSH your code up to your repository. We will check it when we grade this assignment.
