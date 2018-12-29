## Assessment for Lab 3

Run on September 30, 19:50:23 PM.

+ Pass: Change into directory "lab3".

+  _6_ / _6_ : Pass: Check that an OCaml file "number.ml" has no syntax or type errors.

    OCaml file "number.ml" has no syntax or type errors.



+  _1_ / _1_ : Pass: Check that expression (z1,z2,r1,r2) in file number.ml has type number*number*number*number

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   to_int z1
   ```
   matches the pattern `Some (int_of_float (float_of_number z1))`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   (to_float z2)
   ```
   matches the pattern `None`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   (to_int r2)
   ```
   matches the pattern `None`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   to_float r1
   ```
   matches the pattern `Some (float_of_number r1)`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   float_of_number (r1 +? r2)
   ```
   matches the pattern `(float_of_number r1) +. (float_of_number r2)`.

   




+  _5_ / _5_ : Pass: Check that an OCaml file "arithExp.ml" has no syntax or type errors.

    OCaml file "arithExp.ml" has no syntax or type errors.



+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   e1
   ```
   matches the pattern `AddExpr (ConstExpr 1.414, MultExpr (ConstExpr 3.14, ConstExpr 2.))`.

   




+  _1_ / _1_ : Pass: Check that expression e2 in file arithExp.ml has type arithExpr

+  _1_ / _1_ : Pass: Check that expression DIV in file arithExp.ml has type arithToken

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   token_list "/"
   ```
   matches the pattern `[DIV]`.

   




+  _1_ / _1_ : Pass: Check that expression DivExpr (ConstExpr 1., ConstExpr 1.) in file arithExp.ml has type arithExpr

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   rpnParse [CONST 1.; CONST 2.; DIV]
   ```
   matches the pattern `DivExpr (ConstExpr 1., ConstExpr 2.)`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   arithExpEval (DivExpr (ConstExpr 1., ConstExpr 2.))
   ```
   matches the pattern `0.5`.

   




#### Total score: _24_ / _24_

