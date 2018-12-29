### Code+Analysis Homework 1
### DUE: September 12 at 10:00pm
#### Submit written responses via Canvas.
#### We will check your repository for your code modification.

<hr>

_If you have never programmed in Python before, please do not hesitate to consult with a TA or Dr. Larson to better understand the code._
<hr>

#### The n-Queens Problem

n-Queens (p. 71 in textbook) is a toy AI problem in which you are to place n queens on an nxn checkerboard under the constraints that:
- No two queens are in the same row.
- No two queens are in the same column.
- No two queens are diagonal from each other.

The code provided represents a state as a series of "n" or fewer numbers, each of which represents the column for a particular row. The first element in the series represents the column of the queen in the first row. The second element represents the column of the queen in the second row, etc. For 4-queens, a series of 0321 is equivalent to:

 Q | _ | _ | _ |<br>
 _ | _ | _ | Q |<br>
 _ | _ | Q | _ |<br>
 _ | Q | _ | _ |<br>

which meets the constraints for rows and columns, but not for diagonals. A state of 132 would mean that the puzzle is not yet complete. A state of 1123 is complete but violates the columns and diagonal constraints. The state 1302 is a solution. The state of 2031 is also a solution. Note that given this representation, the constraint of distinct rows can never be violated.

#### Theoretical Analysis

_Theoretically_ means to think through the problem and use the formulas from the textbook to calculate these values, not to run experiments and report on your findings. Your theoretical results might not correspond to your actual findigs -- that is OKAY -- just make sure you justify your thinking.

Please answer all questions using the state representation of a series of n or fewer numbers, as described above.

1. State theoretically how many nodes will be generated for BFS to solve 6-queens under the circumstance in which no pruning occurs (i.e. not limiting any actions based on a constraint violation) and **ALL** solutions are found. Note that the algorithm will not stop after a single solution is found -- it must find all solutions. **_Justify your answer by using the formulas in the book. Be sure to define all of your terms and make it clear how the formula relates to 6-queens._**

2. State theoretically the minimum number of nodes that will be generated for BFS to find a single solution to 6-queens under the best of circumstances (assume that at the point that a node/state is generated, the algorithm will check if it is the goal state). **_Justify your answer by describing the best of circumstances, using the formula, and relating the formula to the 6-queens problem._**

3. State theoretically the maximum number of nodes that will be in the frontier (i.e. held in the queue) during the execution of BFS when solving 6-queens. **_Justify your response._**

4. Completely guess how many nodes will be generated to find a single solution to 6-queens AND to 8-queens (note that it probably will not be the best-case nor the worst-case scenario). Report your numbers here BEFORE you experiment with the code. (We will not judge you in any way regardless of how off your guess is, so don't go changing your guess after you run some experiments. :-)

#### The Set-Up

It is recommended that you create a CSCI4511 directory into which you clone the class-repo and your individual repo. If you have never used github before, please go to the office hour of one of the teaching staff for help.

You will need to modify the BFS algorithm and the n-queens problem, thus copy those over into your class-repo keeping the structure of separate directories for problems and algorithms.

**_Remember to PUSH your changes to your repo regularly. There is no excuse for you to lose more than a day's work because your laptop died. And if you are in the mad final dash to complete your assignment, don't go for more than a few hours to push up those changes._**

#### Code Modification

1. Copy the code into your personal repo, maintaining filenames and directory structure even when modifying. Do not create copies of these files and modify the copy.
1. Modify the BFS (Breadth-First Search) algorithm in your repo so that it has the option of finding ALL solutions. This means it has to try everything. Consult with a classmate or attend an office hour if you are unsure how to do this. _Consulted classmate_: please don't just tell them what to do or worse, change her/his code -- help that person understand the algorithm and what aspects need changing.

2. Modify the n-Queens problem in your repo so that pruning will generate actions that do not violate the constraint of queens being in the same <del>row</del> **__column__**. Note that the way the problem is represented guarantees that multiple queens will never be placed in the same <del>column</del> **__row__**. You do not need to check for actions that violate the constraint of diagonal queens.

3. Please include the lines of code that you added/modified in the BFS and nQueens file as part of the report. You will be graded on what is included in the report.

#### Experiments and Report

1. Use the code to find ALL solutions to 6-queens. Report the solutions, how many nodes were generated, and the maximum size of the frontier queue.

2. Use the code to find ALL solutions to 6-queens USING your pruning. How many nodes were generated and what is the maximum size of the frontier queue?

3. Use the code to find ONE solution to 6-queens and 8-queens (no pruning). How many nodes were generated? Look back at your guess and contemplate your results. What was the difference and why?

4. WITHOUT pruning, keep increasing "n" until you are tired of waiting for the results (I would think you could wait at least 5 minutes for the answer). What was the largest "n" before your patience ran out? How many nodes were generated for that sized puzzle?

5. WITH pruning, keep increasing "n" until you are tired of waiting for the results (I would think you could wait at least 5 minutes for the answer). What was the largest "n" before your patience ran out? How many nodes were generated for that sized puzzle? Note that this number will be different for everyone based on the speed of your computer and what else is running at the time.

PUSH your code up to your repository. We will check it when we grade this assignment.
