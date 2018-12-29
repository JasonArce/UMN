## Assessment for HW2 eval_bool_exp

Run on October 08, 19:20:34 PM.

+ Pass: Change into directory "hw2".

## Feedback Tests (total possible value: 5)

+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (Not (Const false)) []
   ```
   matches the pattern `true`.

   




+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (Eq (Const false, Const true)) []
   ```
   matches the pattern `false`.

   




+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (Xor (Const false, Const true)) []
   ```
   matches the pattern `true`.

   




+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (And (Const false, Or (Id "y", Const true))) []
   ```
   matches the pattern `false`.

   




#### Subtotal: _5.0_ / _5.0_

+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Nand((Or((And((Const true),(Eq((Id "h"),(Id "f"))))),(Xor((Eq((Const false),(Or((Id "h"),(Id "v"))))),(Xor((Id "x"),(And((Id "x"),(Id "e"))))))))),(Not(And((Const false),(Const true)))))) ["e"; "x"; "v"; "h"])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Or((Const false),(Const false))) [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Xor((Nand((Not(Const false)),(Xor((And((Or((Id "y"),(Id "a"))),(Const true))),(Const false))))),(Nand((Eq((Eq((Not(Id "y")),(Const true))),(Id "l"))),(Id "q"))))) [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Const false) [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Eq((Id "w"),(Not(Or((Or((Id "g"),(Id "h"))),(Const false)))))) ["w"; "g"; "h"])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Eq((And((Or((Xor((Id "k"),(Id "a"))),(Id "y"))),(Const false))),(And((Nand((Id "h"),(Id "k"))),(Const true))))) ["h"])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Not(Xor((Eq((And((Id "q"),(Id "s"))),(Not(Id "d")))),(Or((Eq((Id "c"),(Id "b"))),(And((Id "w"),(Id "z")))))))) ["q"; "c"])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Id "o") ["o"])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Eq((Const true),(Id "a"))) ["a"])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Not(Or((And((Const false),(Or((Or((Id "q"),(Id "f"))),(Xor((Id "v"),(Id "j"))))))),(Id "a")))) ["f"; "q"; "j"])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Const false) [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Not(And((Const true),(Nand((Const true),(Nand((Id "e"),(Id "q")))))))) ["q"; "e"])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Xor((Nand((And((Xor((Or((Id "k"),(Id "u"))),(Const false))),(Const false))),(Not(Id "l")))),(Id "v"))) [""])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Id "g") [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Const true) [""])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Not(Or((Const false),(And((Not(Id "z")),(Id "v")))))) [""])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Xor((Id "s"),(Or((Id "w"),(And((Id "n"),(Id "q"))))))) [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Nand((And((Xor((Eq((Or((Id "u"),(Id "x"))),(Nand((Id "u"),(Id "t"))))),(Not(Or((Id "f"),(Id "k")))))),(Const true))),(Eq((Const true),(Not(Or((Id "w"),(Id "c")))))))) [""])
   ```
   matches the pattern ` (false)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Id "h") ["h"])
   ```
   matches the pattern ` (true)`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (eval_bool_exp (Or((Nand((And((Nand((Eq((Id "v"),(Id "p"))),(Or((Id "h"),(Id "m"))))),(Not(Nand((Id "g"),(Id "a")))))),(Nand((Not(Or((Id "r"),(Id "w")))),(Const false))))),(Const false))) ["r"])
   ```
   matches the pattern ` (true)`.

   




#### Subtotal: _5.0_ / _5.0_

## Manual tests entered by TA: telan024

+  _5_ / _5_ : Pass: Overall grade for code quality (includes useful comments, appropriate task decomposition, efficient algorithm...)

    score: 5 (out of 5)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _5_ / _5_

