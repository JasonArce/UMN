### Feedback for HW 2

Run on October 04, 11:40:40 AM.

+ Pass: Change into directory "hw2".

+ Pass: Check that file "boolExpr.ml" exists.

+ Pass: Check that file "formula.ml" exists.

+ Pass: Check that hw2 files compile without errors

+ Pass: 
Check that the result of evaluating
   ```
   token_of_string "and"
   ```
   matches the pattern `AND`.

   




+ Pass: 
Check that the result of evaluating
   ```
   token_of_string "or"
   ```
   matches the pattern `OR`.

   




+ Pass: 
Check that the result of evaluating
   ```
   token_of_string "not"
   ```
   matches the pattern `NOT`.

   




+ Pass: 
Check that the result of evaluating
   ```
   token_of_string "xor"
   ```
   matches the pattern `XOR`.

   




+ Pass: 
Check that the result of evaluating
   ```
   token_of_string "="
   ```
   matches the pattern `EQ`.

   




+ Pass: 
Check that the result of evaluating
   ```
   parse_bool_exp [OP; AND; OP; OR; CONST true; CONST false; CP; OP; NOT; CONST false; CP; CP]
   ```
   matches the pattern `And (Or (Const true, Const false), Not (Const false))`.

   




+ Pass: 
Check that the result of evaluating
   ```
   parse_bool_exp [OP; EQ; OP; XOR; VAR "x"; VAR "y"; CP; CONST false; CP]
   ```
   matches the pattern `Eq (Xor (Id "x", Id "y"), Const false)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "and T F")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and T F")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(or T F T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and or T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(not T))")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (Not (Const false)) []
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (Eq (Const false, Const true)) []
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (Xor (Const false, Const true)) []
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval_bool_exp (And (Const false, Or (Id "y", Const true))) []
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   subsets []
   ```
   matches the pattern `[[]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (subsets [1])
   ```
   matches the pattern `[[]; [1]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (subsets ["a"; "b"])
   ```
   matches the pattern `[[]; ["a"]; ["a"; "b"]; ["b"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   var_list (Id "avar")
   ```
   matches the pattern `["avar"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   var_list (Const true)
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   var_list (And (Id "avar", Id "avar"))
   ```
   matches the pattern `["avar"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (var_list (And (Id "var1", Or (Id "var2", Const false))))
   ```
   matches the pattern `["var1"; "var2"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   find_sat_set (Const false)
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   find_sat_set (Const true)
   ```
   matches the pattern `Some []`.

   




+ Pass: 
Check that the result of evaluating
   ```
   find_sat_set (Or (Id "x", Const false))
   ```
   matches the pattern `Some ["x"]`.

   




