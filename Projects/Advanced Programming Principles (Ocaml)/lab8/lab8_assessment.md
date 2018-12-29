## Assessment for Lab 8

Run on November 04, 21:48:54 PM.

+ Pass: Change into directory "lab8".

+  _1_ / _1_ : Pass: Item 1 of list in lazylabval.md passes Normal Form with correct evaluation result test

+  _1_ / _1_ : Pass: Item 2 of list in lazylabval.md passes Normal Form with correct evaluation result test

+  _1_ / _1_ : Pass: Item 3 of list in lazylabval.md passes Never with explanation test

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_s 3 (ustring_s "yo")
   ```
   matches the pattern `[""; "yo"; "yoyo"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_s 4 (ustring_s "boo")
   ```
   matches the pattern `[""; "boo"; "booboo"; "boobooboo"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until_s (ustring_s "a") (fun s -> String.length s = 4)
   ```
   matches the pattern `["";"a";"aa";"aaa"]`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   lztake 3 (lz_ustring "ho")
   ```
   matches the pattern `["";"ho";"hoho"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24mError: This expression has type string but an expression was expected of type
         unit

   ```



+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   lz_take_until (lz_ustring "om") (fun s -> s = "omom")
   ```
   matches the pattern `[""; "om"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value lz_take_until
Did you mean lztake_until?
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   lz_take_until End (fun s -> false)
   ```
   matches the pattern `[]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value lz_take_until
Did you mean lztake_until?
`


#### Total score: _6_ / _9_

