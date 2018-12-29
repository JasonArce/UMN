### Feedback for Exercise set 2

Run on September 17, 21:36:23 PM.

+ Pass: Change into directory "ex2".

+ Pass: Check that file "functions.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   32765 ++ 5
   ```
   matches the pattern `32767`.

   




+ Pass: 
Check that the result of evaluating
   ```
   (-32000) ++ (-1024)
   ```
   matches the pattern `-32768`.

   




+ Pass: 
Check that the result of evaluating
   ```
   0 ++ 0
   ```
   matches the pattern `0`.

   




+ Pass: 
Check that the result of evaluating
   ```
   vec_add (1.0,2.5) (3.0,-1.0)
   ```
   matches the pattern `(4., 1.5)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   vec_add (0.0,1.0) (2.0,2.0)
   ```
   matches the pattern `(2., 3.)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   dot (0.0,2.0) (1.0,3.14)
   ```
   matches the pattern `6.28`.

   




+ Pass: 
Check that the result of evaluating
   ```
   dot (1.0,-1.0) (3.0,4.0)
   ```
   matches the pattern `-1.`.

   




+ Pass: 
Check that the result of evaluating
   ```
   perp (0.,1.) (-1.,0.)
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   perp (1.,2.) (-1.,1.)
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   range 1 10
   ```
   matches the pattern `[1; 2; 3; 4; 5; 6; 7; 8; 9]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   range 2 3
   ```
   matches the pattern `[2]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   range 10 1
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   sum_positive []
   ```
   matches the pattern `0`.

   




+ Pass: 
Check that the result of evaluating
   ```
   sum_positive [-1]
   ```
   matches the pattern `0`.

   




+ Pass: 
Check that the result of evaluating
   ```
   sum_positive [1;-1;17]
   ```
   matches the pattern `18`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take 1 []
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take 2 [ "a"; "b"; "c" ]
   ```
   matches the pattern `["a"; "b"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take 0 [ 1; 2; 3 ]
   ```
   matches the pattern `[]`.

   




+ Pass: Check that file "evaluations.md" exists.

+ Pass: Item 1 of list in evaluations.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 2 of list in evaluations.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 3 of list in evaluations.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 4 of list in evaluations.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 5 of list in evaluations.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 6 of list in evaluations.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Check that file "tailrec.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   msort []
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   msort [0; 17; -32]
   ```
   matches the pattern `[-32; 0 ; 17]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   msort ["not"; "me"; "string"; "list"]
   ```
   matches the pattern `["list"; "me"; "not"; "string"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   range 1 1
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   range 13 17
   ```
   matches the pattern `[13; 14; 15; 16]`.

   




+ Pass: Check that evaluating msort (range 0 1000000) in file tailrec.ml does not result in a stack overflow.

+ Pass: Check that evaluating range 0 1000000 in file tailrec.ml does not result in a stack overflow.

+ Fail: 
Check that the result of evaluating
   ```
   3 *@ [1;2]
   ```
   matches the pattern `[1;2;1;2;1;2]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : int list = [1; 2; 1; 2]
`


+ Fail: 
Check that the result of evaluating
   ```
   0 *@ [3.14159; 2.71828]
   ```
   matches the pattern `[]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : float list = [3.14159; 2.71828; 3.14159; 2.71828]
`


+ Pass: 
Check that the result of evaluating
   ```
   17 *@ []
   ```
   matches the pattern `[]`.

   




+ Pass: Check that evaluating 1000000 *@ [1;2] in file tailrec.ml does not result in a stack overflow.

