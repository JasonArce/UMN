## Assessment for Lab 4

Run on October 06, 22:25:37 PM.

+ Pass: Change into directory "lab4".

+  _2_ / _2_ : Pass: Check that an OCaml file "hof_rewrite.ml" has no syntax or type errors.

    OCaml file "hof_rewrite.ml" has no syntax or type errors.



+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_hof [] [1;2;3;4]
   ```
   matches the pattern `append [] [1;2;3;4]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_hof ["a"] ["b";"c"]
   ```
   matches the pattern `append ["a"] ["b";"c"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_hof [17; 31] []
   ```
   matches the pattern `append [17; 31] []`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until_hof [] 1
   ```
   matches the pattern `take_until [] 1`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until_hof [2;1] 2
   ```
   matches the pattern `take_until [2;1] 2`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until_hof [1;2;3] 4
   ```
   matches the pattern `take_until [1;2;3] 4`.

   




+  _5_ / _5_ : Pass: Check that an OCaml file "maps_r_us.ml" has no syntax or type errors.

    OCaml file "maps_r_us.ml" has no syntax or type errors.



+  _3_ / _3_ : Pass: You are not allowed to use recursion.

   



+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   to_meters [(6,0); (5,8)]
   ```
   matches the pattern `[1.82; 1.72]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   rot13 "a happy string"
   ```
   matches the pattern `"n unccl fgevat"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   rot13 "pizza"
   ```
   matches the pattern `"cvmmn"`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   wite_out ["your"; "my"; "bad"] 0
   ```
   matches the pattern `["    "; "my"; "bad"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : string list = [" "; "my"; "bad"]
`


+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   wite_out ["win"; "1"; "10"] 1
   ```
   matches the pattern `["win"; " "; "10"]`.

   




#### Total score: _20_ / _21_

