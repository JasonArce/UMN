### Feedback for Lab 2

Run on September 21, 09:18:06 AM.

+ Pass: Change into directory "lab2".

+ Pass: file lab2_types.ml changed on lines {4, 5, 6}

+ Pass: file lab2_types.ml changed on lines {16, 14, 15}

+ Pass: file lab2_types.ml changed on lines {24, 25, 23}

+ Pass: file lab2_types.ml changed on lines {33, 34, 35}

+ Pass: file lab2_types.ml changed on lines {29}

+ Pass: Check that an OCaml file "lab2_types.ml" has no syntax or type errors.

    OCaml file "lab2_types.ml" has no syntax or type errors.



+ Pass: Check that name reverse in file lab2_types.ml has type 'a . 'a list -> 'a list

+ Pass: Check that an OCaml file "lab2_patterns.ml" has no syntax or type errors.

    OCaml file "lab2_patterns.ml" has no syntax or type errors.



+ Pass: 
Check that the result of evaluating
   ```
   singleton_or_empty_list [1]
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   singleton_or_empty_list [1;2]
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   twins (0,1)
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   twins ("a","a")
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unzip [("a",100); ("b",99)]
   ```
   matches the pattern `(["a";"b"],[100;99])`.

   




+ Pass: 
Check that the result of evaluating
   ```
   list_cat ["what"; "is"; "this"; "I"; "dont"; "even"]
   ```
   matches the pattern `"whatisthisIdonteven"`.

   




+ Fail: 
Check that the result of evaluating
   ```
   list_deriv [0;8;6]
   ```
   matches the pattern `[8;-2]`.

   


   Test failed. The following errors were reported:
` ;;
Exception: Match_failure ("lab2_recursion.ml", 16, 63).
`

