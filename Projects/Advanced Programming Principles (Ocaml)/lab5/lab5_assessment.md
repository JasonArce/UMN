## Assessment for Lab 5

Run on October 16, 21:40:40 PM.

+ Pass: Change into directory "lab5".

+  _2_ / _2_ : Pass: Check that an OCaml file "lab5.ml" has no syntax or type errors.

    OCaml file "lab5.ml" has no syntax or type errors.



+  _2_ / _2_ : Pass: Make sure you are only using recursion in functions fold, map, reduce

   



+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append [1;2] [3;4]
   ```
   matches the pattern `[1;2;3;4]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   filter ((=) 2) [1;2;3]
   ```
   matches the pattern `[2]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   list_cat ["a"; "long"; "string"; "list"]
   ```
   matches the pattern `"alongstringlist"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   list_fst [(0,true); (1,false)]
   ```
   matches the pattern `[0;1]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 5 [1;3]
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 1 [1;3]
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   count_intersection [1;2;4] [1;2;3]
   ```
   matches the pattern `2`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   check_set [1;2;4]
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24m[1;31mError[0m: This expression has type int but an expression was expected of type
         'a list

   ```



+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   check_set [2;1;2;4]
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24m[1;31mError[0m: This expression has type int but an expression was expected of type
         'a list

   ```



+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   assoc_max [("a",3);("b",0)]
   ```
   matches the pattern `Some "a"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   assoc_max []
   ```
   matches the pattern `None`.

   




#### Total score: _13_ / _15_

