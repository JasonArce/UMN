## Assessment for HW3 intersection_size

Run on October 19, 14:48:15 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that hw3 files compile without errors

## Feedback Tests (total possible value: 2)

+  _2.0_ / _2.0_ : Pass: 
Check that the result of evaluating
   ```
   intersection_size ["a"; "b"] ["a"]
   ```
   matches the pattern `1`.

   




#### Subtotal: _2.0_ / _2.0_

## Additional automated tests

+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["l"; "o"; "j"; "z"; "d"; "v"] ["s"; "a"; "w"; "u"; "c"; "f"; "o"; "m"; "r"; "d"; "g"; "t"; "n"; "b"; "x"; "k"; "p"; "h"])
   ```
   matches the pattern ` (2)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "a"; "w"; "q"; "l"; "c"; "f"; "o"; "r"; "i"; "m"; "d"; "e"; "n"; "x"; "b"; "t"; "p"; "h"; "v"] ["s"; "f"; "y"; "z"; "j"; "r"; "o"; "e"; "g"; "n"; "t"; "b"; "k"; "v"])
   ```
   matches the pattern ` (9)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["a"; "s"; "w"; "l"; "c"; "u"; "f"; "y"; "z"; "i"; "r"; "j"; "d"; "m"; "e"; "o"; "x"; "k"; "p"] ["a"; "w"; "q"; "l"; "c"; "y"; "o"; "r"; "d"; "g"; "x"; "b"; "t"; "p"; "k"; "h"; "v"])
   ```
   matches the pattern ` (11)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["m"; "r"; "d"; "e"; "h"; "v"] ["s"; "w"; "u"; "y"; "z"; "j"; "i"; "m"; "d"; "e"; "g"; "x"; "b"; "t"; "h"])
   ```
   matches the pattern ` (4)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "c"; "m"; "r"; "t"; "p"; "v"] ["w"; "l"; "f"; "z"; "r"; "m"; "j"; "i"; "e"; "g"; "b"; "p"; "h"])
   ```
   matches the pattern ` (3)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "a"; "w"; "q"; "u"; "z"; "i"; "d"; "g"; "x"; "p"; "h"; "v"] ["s"; "w"; "l"; "u"; "f"; "z"; "m"; "i"; "o"; "j"; "r"; "g"; "x"; "b"; "t"; "v"])
   ```
   matches the pattern ` (8)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "a"; "q"; "l"; "u"; "f"; "i"; "j"; "r"; "g"; "x"; "n"; "h"] ["s"; "a"; "w"; "q"; "u"; "f"; "r"; "g"; "b"; "h"])
   ```
   matches the pattern ` (8)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["a"; "w"; "c"; "y"; "m"; "e"; "g"; "b"; "k"; "p"] ["u"; "f"; "y"; "z"; "i"; "d"; "b"; "x"; "p"; "k"; "v"])
   ```
   matches the pattern ` (4)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "q"; "l"; "u"; "f"; "z"; "i"; "j"; "d"; "e"; "g"; "t"; "n"; "p"; "k"; "h"; "v"] ["a"; "s"; "w"; "l"; "c"; "y"; "o"; "r"; "j"; "i"; "e"; "n"; "b"; "t"; "p"; "k"; "h"; "v"])
   ```
   matches the pattern ` (11)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "w"; "q"; "c"; "f"; "y"; "o"; "r"; "i"; "m"; "d"; "j"; "e"; "g"; "x"; "n"; "b"; "p"; "v"] ["s"; "y"; "z"; "j"; "m"; "r"; "o"; "b"; "k"])
   ```
   matches the pattern ` (7)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "a"; "l"; "u"; "c"; "f"; "y"; "r"; "d"; "n"; "t"; "x"; "g"; "h"] ["w"; "u"; "z"; "r"; "g"; "x"; "n"; "h"; "v"])
   ```
   matches the pattern ` (6)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["a"; "w"; "l"; "u"; "z"; "j"; "m"; "i"; "d"; "x"; "p"; "h"; "v"] ["a"; "u"; "c"; "o"; "m"; "e"; "x"; "h"])
   ```
   matches the pattern ` (5)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["c"; "o"; "i"; "m"; "d"; "n"; "t"; "b"; "k"] ["a"; "w"; "q"; "u"; "c"; "z"; "j"; "i"; "r"; "m"; "e"; "g"; "b"; "x"; "t"; "n"; "p"; "k"; "h"])
   ```
   matches the pattern ` (7)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["a"; "s"; "w"; "q"; "l"; "u"; "c"; "f"; "y"; "z"; "i"; "j"; "d"; "g"; "x"; "b"; "k"; "h"; "v"] ["a"; "w"; "u"; "c"; "f"; "y"; "z"; "o"; "d"; "e"; "t"; "b"; "x"; "k"; "v"])
   ```
   matches the pattern ` (12)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["a"; "l"; "m"; "r"; "n"; "b"; "p"; "h"; "v"] ["c"; "z"; "o"; "b"; "h"; "v"])
   ```
   matches the pattern ` (3)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["a"; "w"; "q"; "l"; "c"; "f"; "y"; "o"; "m"; "i"; "j"; "r"; "e"; "n"; "b"; "t"; "g"; "p"; "k"; "v"] ["a"; "q"; "l"; "u"; "c"; "y"; "o"; "r"; "m"; "z"; "i"; "e"; "n"; "x"; "b"; "t"; "h"; "v"])
   ```
   matches the pattern ` (14)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["c"; "f"; "r"; "j"; "i"; "n"; "x"; "v"] ["s"; "a"; "q"; "l"; "c"; "f"; "y"; "z"; "j"; "o"; "m"; "r"; "g"; "x"; "b"; "t"; "k"; "p"; "h"; "v"])
   ```
   matches the pattern ` (6)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["l"; "i"; "a"; "e"; "y"] ["a"; "s"; "u"; "y"; "z"; "m"; "j"; "d"; "k"; "p"])
   ```
   matches the pattern ` (2)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["l"; "c"; "f"; "i"; "m"; "r"; "e"; "g"; "n"; "b"; "h"; "v"] ["l"; "u"; "f"; "o"; "i"; "j"; "z"; "x"; "p"; "k"; "h"])
   ```
   matches the pattern ` (4)`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
    (intersection_size ["s"; "a"; "w"; "q"; "c"; "f"; "y"; "o"; "m"; "r"; "z"; "d"; "n"; "b"; "t"; "x"; "p"; "k"; "h"; "v"] ["s"; "q"; "l"; "c"; "f"; "y"; "r"; "i"; "j"; "g"; "b"; "t"; "k"; "p"; "v"])
   ```
   matches the pattern ` (11)`.

   




#### Subtotal: _2.999999999999999_ / _2.999999999999999_

## Manual tests entered by TA: blowe012

+  _2_ / _2_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _3_ / _3_ : Pass: Uses an appropriate style (including reuse of previous functions where appropriate) for implementation

    score: 3 (out of 3)


+ Pass: Other Stylistic Comments & Feedback

    Good job!

#### Subtotal: _5_ / _5_

