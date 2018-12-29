## Assessment for Exercise Set 4

Run on October 05, 13:33:54 PM.

+ Pass: Change into directory "ex4".

### Part 1: Types and evaluation

+  _1_ / _1_ : Pass: Item 1 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 2 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 3 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 4 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 5 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 6 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 7 of list in types.md passes correct type on line 2, and line 3 not empty test

+  _1_ / _1_ : Pass: Item 8 of list in types.md passes correct type on line 2, and line 3 not empty test

#### Subtotal: _8_ / _8_

### Part 2: Functions and arguments

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   drop_until (fun _ -> true) []
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   drop_until (fun _ -> true) [1]
   ```
   matches the pattern `[1]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   drop_until (fun s -> s.[0]='a') ["boring"; "as"; "always"]
   ```
   matches the pattern `["as"; "always"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_while (fun _ -> true) [1; 2; 3]
   ```
   matches the pattern `[1; 2; 3]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_while ((=) "a") ["a"; "a"; "b"; "a"]
   ```
   matches the pattern `["a"; "a"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_while (fun _ -> false) ["say"; "anything"]
   ```
   matches the pattern `[]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until (fun _ -> false) [1; 2; 3]
   ```
   matches the pattern `[1; 2; 3]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until ((<>) "a") ["a"; "a"; "b"; "a"]
   ```
   matches the pattern `["a"; "a"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   take_until (fun _ -> true) ["say"; "anything"]
   ```
   matches the pattern `[]`.

   




#### Subtotal: _9_ / _9_

### Part 3: Sets as functions

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 3 (union empty empty)
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 3 (union (add 3 empty) (add 5 empty))
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 0 (intersect empty (add 0 empty))
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let s = (add 0 empty) in mem 0 (intersect s (add 1 s))
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 0 (rem 0 (add 0 empty))
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem "a" (rem "b" (add "a" empty))
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 0 (setminus empty (add 0 empty))
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 0 (setminus (add 0 empty) empty)
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 1 (setminus empty empty)
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   mem 1 (setminus (add 1 empty) (add 1 (add 0 empty)))
   ```
   matches the pattern `false`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   mem 4 (range 4 max_int)
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value range
Hint: Did you mean raise?
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   mem 3 (range 4 max_int)
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value range
Hint: Did you mean raise?
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   mem 0.5 (range 0. 1.)
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value range
Hint: Did you mean raise?
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   mem 2. (range 0. 1.)
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value range
Hint: Did you mean raise?
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   mem "aa" (range "a" "b")
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value range
Hint: Did you mean raise?
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   mem "aa" (range "b" "c")
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value range
Hint: Did you mean raise?
`


#### Subtotal: _10_ / _16_

