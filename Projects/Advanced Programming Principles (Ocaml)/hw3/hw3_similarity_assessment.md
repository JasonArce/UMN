## Assessment for HW3 similarity

Run on October 19, 18:13:45 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that hw3 files compile without errors

## Feedback Tests (total possible value: 1)

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   similarity ["a"; "b"] ["a"]
   ```
   matches the pattern `0.5`.

   




#### Subtotal: _1.0_ / _1.0_

## Additional automated tests

+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["a"; "b"; "h"; "j"; "l"; "s"; "r"; "x"] ["a"; "c"; "b"; "d"; "f"; "l"; "n"; "r"; "u"; "w"; "v"; "z"])
   ```
   matches the pattern ` (0.25)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["d"; "g"; "i"; "h"; "k"; "j"; "m"; "p"; "r"; "v"; "y"; "x"] ["f"; "i"; "m"; "l"; "o"; "n"; "q"; "p"; "s"; "u"; "t"; "v"; "y"])
   ```
   matches the pattern ` (0.25)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["c"; "p"; "s"; "r"; "u"; "y"] ["a"; "c"; "b"; "e"; "d"; "g"; "f"; "i"; "k"; "j"; "m"; "o"; "s"; "u"; "t"; "w"; "y"; "z"])
   ```
   matches the pattern ` (0.2)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["p"; "s"; "u"; "d"; "n"] ["c"; "i"; "k"; "m"; "w"; "v"])
   ```
   matches the pattern ` (0.0)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["a"; "c"; "e"; "f"; "i"; "h"; "j"; "o"; "n"; "q"; "p"; "s"; "u"; "t"; "v"; "x"] ["c"; "b"; "d"; "f"; "i"; "n"; "s"; "r"; "u"; "t"; "w"])
   ```
   matches the pattern ` (0.35)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["a"; "c"; "b"; "e"; "i"; "h"; "k"; "o"; "n"; "p"; "s"; "u"; "t"; "w"; "y"; "z"] ["d"; "i"; "k"; "l"; "q"; "s"; "u"; "t"; "w"; "v"])
   ```
   matches the pattern ` (0.3)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["b"; "e"; "d"; "i"; "j"; "m"; "p"; "s"; "y"; "z"] ["b"; "e"; "f"; "h"; "j"; "l"; "p"; "t"; "v"; "y"; "x"; "z"])
   ```
   matches the pattern ` (0.375)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["a"; "c"; "b"; "e"; "d"; "g"; "f"; "k"; "m"; "l"; "n"; "q"; "p"; "w"; "v"; "y"; "x"; "z"] ["a"; "c"; "b"; "e"; "g"; "h"; "k"; "j"; "m"; "o"; "n"; "q"; "s"; "r"; "u"; "t"; "w"; "v"; "x"])
   ```
   matches the pattern ` (0.48)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["b"; "h"; "p"; "u"; "y"; "x"; "z"] ["c"; "b"; "e"; "g"; "i"; "h"; "j"; "m"; "l"; "o"; "n"; "q"; "p"; "s"; "u"; "t"; "v"; "y"; "z"])
   ```
   matches the pattern ` (0.3)`.

   




+  _0.3_ / _0.3_ : Pass: 
Check that the result of evaluating
   ```
    (similarity ["a"; "e"; "d"; "g"; "m"; "s"; "t"; "w"; "x"; "z"] ["c"; "b"; "g"; "f"; "i"; "o"; "n"; "x"])
   ```
   matches the pattern ` (0.125)`.

   




#### Subtotal: _2.9999999999999996_ / _2.9999999999999996_

## Manual tests entered by TA: luhmx009

+  _2_ / _2_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _4_ / _4_ : Pass: Uses an appropriate style (including reuse of previous functions where appropriate) for implementation

    score: 4 (out of 4)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _6_ / _6_

