## Assessment for HW3 union_size

Run on October 19, 15:43:00 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that hw3 files compile without errors

## Feedback Tests (total possible value: 2)

+  _2.0_ / _2.0_ : Pass: 
Check that the result of evaluating
   ```
   union_size ["a"; "b"] ["a"]
   ```
   matches the pattern `2`.

   




#### Subtotal: _2.0_ / _2.0_

## Additional automated tests

+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["z"; "l"; "d"; "v"; "j"; "o"] ["a"; "k"; "g"; "h"; "n"; "d"; "b"; "p"; "w"; "f"; "s"; "u"; "m"; "c"; "x"; "t"; "r"; "o"])
   ```
   matches the pattern ` (22)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["o"; "h"; "q"; "n"; "l"; "d"; "p"; "i"; "b"; "w"; "f"; "s"; "m"; "x"; "v"; "e"; "c"; "t"; "r"; "a"] ["o"; "k"; "g"; "z"; "n"; "b"; "f"; "s"; "e"; "v"; "j"; "t"; "r"; "y"])
   ```
   matches the pattern ` (25)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["y"; "k"; "o"; "z"; "l"; "d"; "p"; "i"; "w"; "f"; "s"; "u"; "c"; "e"; "m"; "x"; "j"; "a"; "r"] ["a"; "y"; "h"; "g"; "k"; "q"; "l"; "d"; "b"; "p"; "w"; "c"; "x"; "v"; "t"; "r"; "o"])
   ```
   matches the pattern ` (25)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "d"; "m"; "e"; "v"; "r"] ["h"; "g"; "z"; "d"; "b"; "i"; "w"; "s"; "u"; "m"; "x"; "e"; "j"; "t"; "y"])
   ```
   matches the pattern ` (17)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["p"; "s"; "m"; "c"; "v"; "t"; "r"] ["h"; "g"; "z"; "l"; "b"; "i"; "w"; "p"; "f"; "m"; "e"; "j"; "r"])
   ```
   matches the pattern ` (17)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "g"; "q"; "z"; "d"; "p"; "i"; "w"; "s"; "u"; "x"; "v"; "a"] ["g"; "z"; "l"; "b"; "i"; "w"; "f"; "s"; "u"; "m"; "x"; "v"; "j"; "t"; "r"; "o"])
   ```
   matches the pattern ` (21)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "g"; "q"; "n"; "l"; "i"; "f"; "s"; "u"; "x"; "j"; "r"; "a"] ["h"; "g"; "q"; "b"; "w"; "f"; "s"; "u"; "r"; "a"])
   ```
   matches the pattern ` (15)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["k"; "g"; "b"; "p"; "w"; "c"; "e"; "m"; "a"; "y"] ["k"; "z"; "d"; "b"; "i"; "p"; "f"; "u"; "x"; "v"; "y"])
   ```
   matches the pattern ` (17)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "g"; "k"; "q"; "z"; "n"; "l"; "d"; "p"; "i"; "f"; "s"; "u"; "e"; "v"; "j"; "t"] ["r"; "h"; "y"; "k"; "n"; "l"; "b"; "p"; "w"; "i"; "s"; "c"; "e"; "v"; "j"; "t"; "a"; "o"])
   ```
   matches the pattern ` (24)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["y"; "g"; "q"; "n"; "d"; "p"; "i"; "w"; "b"; "f"; "s"; "c"; "x"; "v"; "e"; "m"; "j"; "r"; "o"] ["o"; "k"; "z"; "b"; "s"; "m"; "j"; "r"; "y"])
   ```
   matches the pattern ` (21)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["a"; "h"; "g"; "n"; "l"; "d"; "f"; "s"; "u"; "c"; "x"; "t"; "r"; "y"] ["h"; "g"; "n"; "z"; "w"; "u"; "x"; "v"; "r"])
   ```
   matches the pattern ` (17)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "z"; "l"; "d"; "p"; "i"; "w"; "u"; "m"; "x"; "v"; "j"; "a"] ["h"; "u"; "m"; "x"; "c"; "e"; "a"; "o"])
   ```
   matches the pattern ` (16)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["k"; "n"; "d"; "b"; "i"; "m"; "c"; "t"; "o"] ["h"; "g"; "k"; "q"; "n"; "z"; "b"; "p"; "w"; "i"; "u"; "c"; "e"; "x"; "m"; "j"; "t"; "a"; "r"])
   ```
   matches the pattern ` (21)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "g"; "k"; "q"; "z"; "l"; "d"; "b"; "i"; "w"; "f"; "s"; "u"; "c"; "x"; "v"; "j"; "a"; "y"] ["y"; "k"; "z"; "d"; "b"; "w"; "f"; "u"; "c"; "x"; "v"; "e"; "t"; "a"; "o"])
   ```
   matches the pattern ` (22)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "n"; "l"; "p"; "b"; "m"; "v"; "a"; "r"] ["h"; "z"; "b"; "c"; "v"; "o"])
   ```
   matches the pattern ` (12)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["y"; "k"; "g"; "r"; "q"; "n"; "l"; "p"; "i"; "w"; "b"; "f"; "m"; "e"; "v"; "c"; "j"; "t"; "a"; "o"] ["a"; "h"; "o"; "q"; "n"; "z"; "l"; "b"; "i"; "u"; "m"; "x"; "e"; "c"; "v"; "t"; "r"; "y"])
   ```
   matches the pattern ` (24)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["n"; "i"; "f"; "c"; "x"; "v"; "j"; "r"] ["o"; "h"; "g"; "k"; "a"; "q"; "z"; "l"; "b"; "p"; "f"; "s"; "m"; "x"; "v"; "c"; "j"; "t"; "r"; "y"])
   ```
   matches the pattern ` (22)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["y"; "e"; "l"; "i"; "a"] ["k"; "z"; "d"; "p"; "s"; "u"; "m"; "j"; "a"; "y"])
   ```
   matches the pattern ` (13)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["h"; "g"; "n"; "l"; "b"; "i"; "f"; "m"; "c"; "v"; "e"; "r"] ["h"; "k"; "z"; "l"; "p"; "i"; "f"; "u"; "x"; "j"; "o"])
   ```
   matches the pattern ` (19)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (union_size ["r"; "h"; "k"; "y"; "q"; "n"; "z"; "d"; "b"; "p"; "w"; "f"; "s"; "m"; "x"; "v"; "c"; "t"; "a"; "o"] ["k"; "g"; "q"; "l"; "b"; "i"; "p"; "f"; "s"; "c"; "v"; "j"; "t"; "r"; "y"])
   ```
   matches the pattern ` (24)`.

   




#### Subtotal: _2.999999999999999_ / _2.999999999999999_

## Manual tests entered by TA: blowe012

+  _3_ / _3_ : Pass: Useful comments and indentation

    score: 3 (out of 3)


+  _1_ / _2_ : Pass: Uses an appropriate style (including reuse of previous functions where appropriate) for implementation

    score: 1 (out of 2)


+ Pass: Other Stylistic Comments & Feedback

    could have made use of intersection_size

#### Subtotal: _4_ / _5_

