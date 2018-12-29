## Assessment for HW2 find_sat_set

Run on October 06, 12:23:56 PM.

+ Pass: Change into directory "hw2".

## Feedback Tests (total possible value: 5)

+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   find_sat_set (Const false)
   ```
   matches the pattern `None`.

   




+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   find_sat_set (Const true)
   ```
   matches the pattern `Some []`.

   




+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   find_sat_set (Or (Id "x", Const false))
   ```
   matches the pattern `Some ["x"]`.

   




#### Subtotal: _5.0_ / _5.0_

+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Const false))
   ```
   matches the pattern ` (None)`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Not(Const true)))
   ```
   matches the pattern ` (None)`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Or((Or((Const true),(Const false))),(Const false))))
   ```
   matches the pattern ` (Some [])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Eq((Const true),(Const false))))
   ```
   matches the pattern ` (None)`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Id "y"))
   ```
   matches the pattern ` (Some ["y"])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Nand((Const true),(Id "p"))))
   ```
   matches the pattern ` (Some [])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Or((Or((Id "y"),(Const false))),(Const false))))
   ```
   matches the pattern ` (Some ["y"])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Xor((Id "a"),(Const false))))
   ```
   matches the pattern ` (Some ["a"])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Not(Or((Nand((Const false),(Const false))),(Id "a")))))
   ```
   matches the pattern ` (None)`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (And((Const true),(And((Xor((Xor((Const false),(Const false))),(Const false))),(Eq((And((Const false),(Const false))),(Eq((Const false),(Const false))))))))))
   ```
   matches the pattern ` (None)`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Or((Id "p"),(Const false))))
   ```
   matches the pattern ` (Some ["p"])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Xor((Eq((Const false),(Const false))),(Const false))))
   ```
   matches the pattern ` (Some [])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Eq((Not(Id "c")),(Eq((Const false),(Xor((Not(Const true)),(And((Const true),(Const true))))))))))
   ```
   matches the pattern ` (Some ["c"])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Or((And((Const true),(Const true))),(Id "e"))))
   ```
   matches the pattern ` (Some [])`.

   




+  _0.5_ / _0.5_ : Pass: 
Check that the result of evaluating
   ```
    (find_sat_set (Not(Xor((Eq((Id "e"),(Const true))),(Const true)))))
   ```
   matches the pattern ` (Some ["e"])`.

   




#### Subtotal: _7.5_ / _7.5_

## Manual tests entered by TA: luhmx009

+  _5_ / _5_ : Pass: Overall grade for code quality (includes useful comments, appropriate task decomposition, efficient algorithm...)

    score: 5 (out of 5)


+ Pass: Other Stylistic Comments & Feedback

    Perfect!

#### Subtotal: _5_ / _5_

