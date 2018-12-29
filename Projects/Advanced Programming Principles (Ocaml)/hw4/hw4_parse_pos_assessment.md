## Assessment for HW4 parse_pos

Run on November 05, 16:36:21 PM.

+ Pass: Change into directory "hw4".

+ Pass: Check that hw4 files compile without errors

## Feedback Tests (total possible value: 6)

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   try (raise (Unclosed 1)) with Unclosed _ -> 1 | _ -> 2
   ```
   matches the pattern `1`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   try (raise (Unused 1)) with Unused _ -> 1 | _ -> 2
   ```
   matches the pattern `1`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   try (raise (SyntaxError 1)) with SyntaxError _ -> 1 | _ -> 2
   ```
   matches the pattern `1`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   try `No (parse_pos [OP; OP]) with (SyntaxError 1) -> `Yes
   ```
   matches the pattern ``Yes`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   try `No (parse_pos [OP; PLUS; CONST 1; CONST 1; CP; CONST 1]) with (Unused 5) -> `Yes
   ```
   matches the pattern ``Yes`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   try `No (parse_pos [OP; TIMES; OP; PLUS; CONST 0; CONST 1; CONST 2; CP; CONST 3; CP]) with (Unclosed 6) -> `Yes
   ```
   matches the pattern ``Yes`.

   




#### Subtotal: _6.0_ / _6.0_

## Additional automated tests

## Manual tests entered by TA: telan024

+  _1_ / _1.0_ : Pass: Is the interface of parse_pos to track positions correctly implemented ?

    score: 1 (out of 1.0)


+  _1_ / _1.0_ : Pass: Is SyntaxError correctly raised ?

    score: 1 (out of 1.0)


+  _1_ / _1.0_ : Pass: Is Unclosed correctly raised ?

    score: 1 (out of 1.0)


+  _1_ / _1.0_ : Pass: Is Unused correctly raised ?

    score: 1 (out of 1.0)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _4_ / _4.0_

