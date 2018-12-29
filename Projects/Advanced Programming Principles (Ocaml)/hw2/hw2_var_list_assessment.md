## Assessment for HW2 var_list

Run on October 09, 17:41:58 PM.

+ Pass: Change into directory "hw2".

## Feedback Tests (total possible value: 5)

+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   var_list (Id "avar")
   ```
   matches the pattern `["avar"]`.

   




+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   var_list (Const true)
   ```
   matches the pattern `[]`.

   




+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   var_list (And (Id "avar", Id "avar"))
   ```
   matches the pattern `["avar"]`.

   




+  _1.25_ / _1.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare (var_list (And (Id "var1", Or (Id "var2", Const false))))
   ```
   matches the pattern `["var1"; "var2"]`.

   




#### Subtotal: _5.0_ / _5.0_

+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Nand((Or((And((Const true),(Eq((Id "h"),(Id "f"))))),(Xor((Eq((Const false),(Or((Id "h"),(Id "v"))))),(Xor((Id "x"),(And((Id "x"),(Id "e"))))))))),(Not(And((Const false),(Const true)))))))
   ```
   matches the pattern `List.sort compare  (["h"; "f"; "v"; "x"; "e"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Or((Const false),(Const false))))
   ```
   matches the pattern `List.sort compare  ([])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Xor((Nand((Not(Const false)),(Xor((And((Or((Id "y"),(Id "a"))),(Const true))),(Const false))))),(Nand((Eq((Eq((Not(Id "y")),(Const true))),(Id "l"))),(Id "q"))))))
   ```
   matches the pattern `List.sort compare  (["y"; "a"; "l"; "q"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Const false))
   ```
   matches the pattern `List.sort compare  ([])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Eq((Id "w"),(Not(Or((Or((Id "g"),(Id "h"))),(Const false)))))))
   ```
   matches the pattern `List.sort compare  (["w"; "g"; "h"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Eq((And((Or((Xor((Id "k"),(Id "a"))),(Id "y"))),(Const false))),(And((Nand((Id "h"),(Id "k"))),(Const true))))))
   ```
   matches the pattern `List.sort compare  (["k"; "a"; "y"; "h"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Not(Xor((Eq((And((Id "q"),(Id "s"))),(Not(Id "d")))),(Or((Eq((Id "c"),(Id "b"))),(And((Id "w"),(Id "z")))))))))
   ```
   matches the pattern `List.sort compare  (["q"; "s"; "d"; "c"; "b"; "w"; "z"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Id "o"))
   ```
   matches the pattern `List.sort compare  (["o"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Eq((Const true),(Id "a"))))
   ```
   matches the pattern `List.sort compare  (["a"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Not(Or((And((Const false),(Or((Or((Id "q"),(Id "f"))),(Xor((Id "v"),(Id "j"))))))),(Id "a")))))
   ```
   matches the pattern `List.sort compare  (["q"; "f"; "v"; "j"; "a"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Const false))
   ```
   matches the pattern `List.sort compare  ([])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Not(And((Const true),(Nand((Const true),(Nand((Id "e"),(Id "q")))))))))
   ```
   matches the pattern `List.sort compare  (["e"; "q"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Xor((Nand((And((Xor((Or((Id "k"),(Id "u"))),(Const false))),(Const false))),(Not(Id "l")))),(Id "v"))))
   ```
   matches the pattern `List.sort compare  (["k"; "u"; "l"; "v"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Id "g"))
   ```
   matches the pattern `List.sort compare  (["g"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Const true))
   ```
   matches the pattern `List.sort compare  ([])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Not(Or((Const false),(And((Not(Id "z")),(Id "v")))))))
   ```
   matches the pattern `List.sort compare  (["z"; "v"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Xor((Id "s"),(Or((Id "w"),(And((Id "n"),(Id "q"))))))))
   ```
   matches the pattern `List.sort compare  (["s"; "w"; "n"; "q"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Nand((And((Xor((Eq((Or((Id "u"),(Id "x"))),(Nand((Id "u"),(Id "t"))))),(Not(Or((Id "f"),(Id "k")))))),(Const true))),(Eq((Const true),(Not(Or((Id "w"),(Id "c")))))))))
   ```
   matches the pattern `List.sort compare  (["u"; "x"; "t"; "f"; "k"; "w"; "c"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Id "h"))
   ```
   matches the pattern `List.sort compare  (["h"])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (var_list (Or((Nand((And((Nand((Eq((Id "v"),(Id "p"))),(Or((Id "h"),(Id "m"))))),(Not(Nand((Id "g"),(Id "a")))))),(Nand((Not(Or((Id "r"),(Id "w")))),(Const false))))),(Const false))))
   ```
   matches the pattern `List.sort compare  (["v"; "p"; "h"; "m"; "g"; "a"; "r"; "w"])`.

   




#### Subtotal: _5.0_ / _5.0_

## Manual tests entered by TA: larum001

+  _5_ / _5_ : Pass: Overall grade for code quality (includes useful comments, appropriate task decomposition, efficient algorithm...)

    score: 5 (out of 5)


+ Pass: Other Stylistic Comments & Feedback

    Great job.

#### Subtotal: _5_ / _5_

