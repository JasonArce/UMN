## Assessment for HW3 to_set

Run on October 23, 22:30:53 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that hw3 files compile without errors

## Feedback Tests (total possible value: 2)

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare (to_set ["a"; "b"; "a" ; "b"])
   ```
   matches the pattern `["a"; "b"]`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare (to_set ["a"; "a"; "b"; "c"; "b"; "a"])
   ```
   matches the pattern `["a"; "b"; "c"]`.

   




#### Subtotal: _2.0_ / _2.0_

## Additional automated tests

+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["x"; "b"; "y"; "e"; "w"; "u"; "b"; "s"; "r"])
   ```
   matches the pattern `List.sort compare  (["y"; "e"; "u"; "x"; "s"; "r"; "b"; "w"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["x"; "k"; "s"; "d"; "n"])
   ```
   matches the pattern `List.sort compare  (["d"; "x"; "s"; "n"; "k"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["r"; "c"; "b"; "r"; "d"; "l"; "a"; "o"; "x"; "v"; "j"; "r"; "b"; "s"])
   ```
   matches the pattern `List.sort compare  (["a"; "l"; "o"; "x"; "s"; "d"; "r"; "c"; "b"; "v"; "j"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["d"; "u"; "m"; "r"; "r"; "o"; "m"; "u"; "b"; "g"; "v"])
   ```
   matches the pattern `List.sort compare  (["g"; "m"; "u"; "o"; "d"; "r"; "v"; "b"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["g"; "i"; "g"; "t"; "d"; "v"; "j"; "d"; "k"; "g"; "b"; "w"; "e"; "f"; "e"; "a"; "q"; "r"])
   ```
   matches the pattern `List.sort compare  (["w"; "g"; "a"; "q"; "e"; "t"; "k"; "f"; "d"; "v"; "j"; "b"; "r"; "i"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["h"; "t"; "u"; "j"; "j"; "s"])
   ```
   matches the pattern `List.sort compare  (["j"; "u"; "s"; "t"; "h"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["t"; "q"; "i"; "x"; "c"; "z"; "m"; "q"; "i"; "h"; "j"; "i"; "x"; "x"; "d"; "g"; "u"])
   ```
   matches the pattern `List.sort compare  (["z"; "g"; "q"; "m"; "t"; "h"; "u"; "x"; "j"; "c"; "d"; "i"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["z"; "c"; "k"; "v"; "v"; "g"; "b"; "x"; "k"; "j"; "e"; "e"])
   ```
   matches the pattern `List.sort compare  (["z"; "g"; "e"; "k"; "x"; "v"; "c"; "j"; "b"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["a"; "x"; "c"; "o"; "s"; "o"; "x"; "g"; "g"; "i"; "s"; "v"; "y"; "m"; "o"; "a"; "z"; "y"; "k"; "u"])
   ```
   matches the pattern `List.sort compare  (["y"; "z"; "g"; "a"; "m"; "k"; "u"; "x"; "o"; "s"; "v"; "c"; "i"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["j"; "c"; "a"; "h"; "y"; "y"; "p"; "h"])
   ```
   matches the pattern `List.sort compare  (["y"; "a"; "p"; "h"; "j"; "c"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["g"; "v"; "y"; "y"; "l"; "u"; "g"; "t"; "q"; "r"; "t"; "o"; "i"; "t"; "p"])
   ```
   matches the pattern `List.sort compare  (["y"; "g"; "q"; "l"; "t"; "p"; "u"; "o"; "v"; "r"; "i"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["o"; "u"; "k"; "t"; "g"; "p"; "x"; "d"; "y"; "m"; "g"; "z"; "q"; "y"; "g"; "q"; "u"])
   ```
   matches the pattern `List.sort compare  (["y"; "z"; "g"; "q"; "m"; "p"; "t"; "k"; "u"; "o"; "x"; "d"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["m"; "g"; "y"; "l"; "r"; "s"; "y"; "b"; "j"])
   ```
   matches the pattern `List.sort compare  (["y"; "g"; "m"; "l"; "s"; "j"; "r"; "b"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["s"; "k"; "q"; "e"; "d"; "k"; "v"; "r"; "s"; "n"; "n"; "e"; "b"; "x"; "g"; "f"; "q"; "i"; "d"])
   ```
   matches the pattern `List.sort compare  (["g"; "q"; "e"; "k"; "f"; "s"; "n"; "x"; "d"; "v"; "r"; "b"; "i"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["z"; "p"; "x"; "a"; "d"; "i"; "d"; "x"; "x"; "i"; "z"; "i"])
   ```
   matches the pattern `List.sort compare  (["z"; "a"; "p"; "x"; "d"; "i"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["f"; "a"; "z"; "q"; "q"; "a"; "f"])
   ```
   matches the pattern `List.sort compare  (["z"; "a"; "q"; "f"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["v"; "q"; "r"; "q"; "n"; "o"; "b"; "q"; "x"; "o"; "b"; "w"; "u"])
   ```
   matches the pattern `List.sort compare  (["q"; "u"; "n"; "o"; "x"; "v"; "r"; "b"; "w"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["m"; "a"; "z"; "u"; "n"; "j"; "s"; "s"; "b"; "h"; "j"; "k"; "r"; "x"; "z"; "s"])
   ```
   matches the pattern `List.sort compare  (["z"; "a"; "m"; "h"; "k"; "u"; "n"; "s"; "x"; "j"; "r"; "b"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["o"; "u"; "f"; "b"; "c"; "n"; "n"; "a"; "y"; "j"; "y"; "y"; "u"; "c"; "b"; "v"; "f"])
   ```
   matches the pattern `List.sort compare  (["y"; "a"; "f"; "u"; "o"; "n"; "j"; "c"; "v"; "b"])`.

   




+  _0.15_ / _0.15_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (to_set ["w"; "e"; "k"; "l"; "v"; "k"; "e"; "v"; "t"; "x"; "r"; "u"; "e"; "x"; "s"; "j"; "d"; "k"; "u"; "s"])
   ```
   matches the pattern `List.sort compare  (["e"; "l"; "t"; "k"; "u"; "x"; "s"; "v"; "r"; "j"; "d"; "w"])`.

   




#### Subtotal: _2.999999999999999_ / _2.999999999999999_

## Manual tests entered by TA: jaswa003

+  _2_ / _2_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _3_ / _3_ : Pass: Uses an appropriate style (including reuse of previous functions where appropriate) for implementation

    score: 3 (out of 3)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _5_ / _5_

