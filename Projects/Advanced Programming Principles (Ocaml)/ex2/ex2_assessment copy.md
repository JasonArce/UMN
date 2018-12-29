## Assessment for Exercise Set 2

Run on September 23, 16:44:30 PM.

+ Pass: Change into directory "ex2".

### Part 1: Functions, Recursion, Lists, and Patterns

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   32765 ++ 5
   ```
   matches the pattern `32767`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   (-32000) ++ (-1024)
   ```
   matches the pattern `-32768`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   0 ++ 0
   ```
   matches the pattern `0`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   vec_add (1.0,2.5) (3.0,-1.0)
   ```
   matches the pattern `(4., 1.5)`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   vec_add (0.0,1.0) (2.0,2.0)
   ```
   matches the pattern `(2., 3.)`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   dot (0.0,2.0) (1.0,3.14)
   ```
   matches the pattern `6.28`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   dot (1.0,-1.0) (3.0,4.0)
   ```
   matches the pattern `-1.`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   perp (0.,1.) (-1.,0.)
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   perp (1.,2.) (-1.,1.)
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   range 1 10
   ```
   matches the pattern `[1; 2; 3; 4; 5; 6; 7; 8; 9]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   range 2 3
   ```
   matches the pattern `[2]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   range 10 1
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   sum_positive []
   ```
   matches the pattern `0`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   sum_positive [-1]
   ```
   matches the pattern `0`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   sum_positive [1;-1;17]
   ```
   matches the pattern `18`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take 1 []
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take 2 [ "a"; "b"; "c" ]
   ```
   matches the pattern `["a"; "b"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take 0 [ 1; 2; 3 ]
   ```
   matches the pattern `[]`.

   




#### Subtotal: _18_ / _18_

### Part 2: Evaluations

+  _1_ / _1_ : Pass: Item 1 of list in evaluations.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 2 of list in evaluations.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 3 of list in evaluations.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 4 of list in evaluations.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 5 of list in evaluations.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 6 of list in evaluations.md passes  line 2 is "Legal" and line 3 is not empty  test

#### Subtotal: _6_ / _6_

### Part 3: Tail Recursion

+ Pass: Check that file "tailrec.ml" exists.

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   msort []
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   msort [0; 17; -32]
   ```
   matches the pattern `[-32; 0 ; 17]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   msort ["not"; "me"; "string"; "list"]
   ```
   matches the pattern `["list"; "me"; "not"; "string"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   range 1 1
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   range 13 17
   ```
   matches the pattern `[13; 14; 15; 16]`.

   




+  _0_ / _1_ : Fail: Check that evaluating msort (range 0 1000000) in file tailrec.ml does not result in a stack overflow.
No overflow, but there was an error:File "(stdin)", line 79, characters 14-20:
Warning 26: unused variable helper.
File "(stdin)", line 85, characters 3-4:
Warning 11: this match case is unused.


+  _1_ / _1_ : Pass: Check that evaluating range 0 1000000 in file tailrec.ml does not result in a stack overflow.

+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   3 *@ [1;2]
   ```
   matches the pattern `[1;2;1;2;1;2]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : int list = [1; 2; 1; 2]
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   0 *@ [3.14159; 2.71828]
   ```
   matches the pattern `[]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : float list = [3.14159; 2.71828; 3.14159; 2.71828]
`


+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   17 *@ []
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: Check that evaluating 1000000 *@ [1;2] in file tailrec.ml does not result in a stack overflow.

#### Subtotal: _8_ / _11_

#### Total score: _64_ / _70_

