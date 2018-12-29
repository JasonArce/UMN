### Feedback for Exercise set 6

Run on October 14, 22:14:01 PM.

+ Pass: Change into directory "ex6".

+ Pass: Check that file "syntax.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   e_collatz
   ```
   matches the pattern `Let ("n", Const 31, Let ("n2", Div (Name "n", Const 2), If (Eq (Mul (Name "n2", Const 2), Name "n"), Name "n2", Add (Mul (Const 3, Name "n"), Const 1))))`.

   




+ Pass: 
Check that the result of evaluating
   ```
   e_ifchain
   ```
   matches the pattern `Let ("x", Sub (Const 42, Const 17), If (And (Gt (Name "x", Const 17), Bool true), If (Or (Lt (Name "x", Const 31), Bool false), Const 1, Const 0), Const (-1)))`.

   




+ Pass: 
Check that the result of evaluating
   ```
   e_uclid
   ```
   matches the pattern `Let ("p1", Add (Mul (Const 2, Const 3), Const 1),Let ("p2", Add (Mul (Const 5, Sub (Name "p1", Const 1)), Const 1), Add (Mul (Const 7, Sub (Name "p2", Const 1)), Const 1)))`.

   




+ Pass: Check that expression `Mod (Const 8, Const 5)` following file syntax.ml has type `expr`

+ Fail: 
Check that the result of evaluating
   ```
   eval (Mod (Const 17, Const 3)) []
   ```
   matches the pattern `2`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24mError: This expression has type int but an expression was expected of type
         (string * bool) list -> int

   ```



+ Pass: 
Check that the result of evaluating
   ```
   eval (Mod (Const 17, Const 3)) [] []
   ```
   matches the pattern `2`.

   




+ Pass: Check that expression `BLet ("cnd", BConst true, If(BName "cnd", Const 1, Const (-1)))` following file syntax.ml has type `expr`

+ Pass: Check that expression `And (BName "bvar", BConst true)` following file syntax.ml has type `boolExpr`

+ Pass: 
Check that the result of evaluating
   ```
   beval (BName "v") [] [("v", true)]
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval (BLet ("c", BConst false, If (BName "c", Const 1, Const 17))) [] []
   ```
   matches the pattern `17`.

   




+ Pass: Check that file "typecheck.ml" exists.

+ Pass: Item 1 of list in typecheck.ml passes Typing Rule test: UConst

+ Fail: Item 2 of list in typecheck.ml 

+ Pass: Item 3 of list in typecheck.ml passes Typing Rule test: SConst

+ Fail: Item 4 of list in typecheck.ml 

+ Fail: Item 5 of list in typecheck.ml 

+ Fail: Item 6 of list in typecheck.ml 

+ Pass: Check that expression `Print (Const 2)` following file typecheck.ml has type `expr`

+ Pass: Check that expression `Eq (SConst "a", SFirst (SConst "ab"))` following file typecheck.ml has type `expr`

+ Pass: Check that expression `Concat (SConst "a", SRest (SConst "b"))` following file typecheck.ml has type `expr`

+ Pass: Check that expression `UConst` following file typecheck.ml has type `expr`

+ Pass: 
Check that the result of evaluating
   ```
   typeof (Concat (SConst "a", SRest (SConst "b"))) []
   ```
   matches the pattern `StringT`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unbound (Print (Const 3)) []
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval (Concat (SFirst (SConst "ab"), SRest (SConst "ab"))) []
   ```
   matches the pattern `StringR "ab"`.

   




+ Pass: Check that file "funval.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   eval (Apply(add1fun, Const 16)) []
   ```
   matches the pattern `IntR 17`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval (Apply(collatz_fun, Const 31)) []
   ```
   matches the pattern `IntR 94`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval (Apply(Apply(kdelta, Const 17), Const 3)) []
   ```
   matches the pattern `IntR 0`.

   




+ Pass: 
Check that the result of evaluating
   ```
   subst (Const 1) "x" (Name "x")
   ```
   matches the pattern `Const 1`.

   




+ Fail: 
Check that the result of evaluating
   ```
   inline (Let ("x", Const 1, Name "x"))
   ```
   matches the pattern `Const 1`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value inline
`


+ Fail: 
Check that the result of evaluating
   ```
   inline (Apply(Fun("x", Int, Name "x"), Const 1))
   ```
   matches the pattern `Const 1`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value inline
`


+ Fail: 
Check that the result of evaluating
   ```
   inline (Apply(Apply(kdelta, Const 3), Const 3))
   ```
   matches the pattern `If (Eq (Const 3, Const 3), Const 1, Const 0)`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value inline
`


+ Fail: 
Check that the result of evaluating
   ```
   inline (Apply(collatz_fun,Const 31))
   ```
   matches the pattern `If (Eq (Mul (Div (Const 31, Const 2), Const 2), Const 31), Div (Const 31, Const 2), Add (Mul (Const 3, Const 31), Const 1))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value inline
`


