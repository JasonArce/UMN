## Assessment for Lab 2

Run on September 23, 20:37:23 PM.

+ Pass: Change into directory "lab2".

+  _2_ / _2_ : Pass: file lab2_types.ml changed on lines {4, 5, 6}

+  _2_ / _2_ : Pass: file lab2_types.ml changed on lines {16, 14, 15}

+  _2_ / _2_ : Pass: file lab2_types.ml changed on lines {24, 25, 23}

+  _2_ / _2_ : Pass: file lab2_types.ml changed on lines {33, 34, 35}

+  _2_ / _2_ : Pass: file lab2_types.ml changed on lines {29}

+  _2_ / _2_ : Pass: Check that an OCaml file "lab2_types.ml" has no syntax or type errors.

    OCaml file "lab2_types.ml" has no syntax or type errors.



+  _2_ / _2_ : Pass: Check that name reverse in file lab2_types.ml has type 'a . 'a list -> 'a list

+  _6_ / _6_ : Pass: Check that an OCaml file "lab2_patterns.ml" has no syntax or type errors.

    OCaml file "lab2_patterns.ml" has no syntax or type errors.



+  _2_ / _2_ : Pass: 
Check that the result of evaluating
   ```
   singleton_or_empty_list [1]
   ```
   matches the pattern `true`.

   




+  _2_ / _2_ : Pass: 
Check that the result of evaluating
   ```
   singleton_or_empty_list [1;2]
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   twins (0,1)
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   twins ("a","a")
   ```
   matches the pattern `true`.

   




+  _3_ / _3_ : Pass: 
Check that the result of evaluating
   ```
   unzip [("a",100); ("b",99)]
   ```
   matches the pattern `(["a";"b"],[100;99])`.

   




+  _3_ / _3_ : Pass: 
Check that the result of evaluating
   ```
   list_cat ["what"; "is"; "this"; "I"; "dont"; "even"]
   ```
   matches the pattern `"whatisthisIdonteven"`.

   




+  _0_ / _3_ : Fail: 
Check that the result of evaluating
   ```
   list_deriv [0;8;6]
   ```
   matches the pattern `[8;-2]`.

   


   Test failed. The following errors were reported:
` ;;
Exception: Match_failure ("lab2_recursion.ml", 16, 63).
`

#### Total score: _32_ / _35_

