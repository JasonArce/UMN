### Feedback for Exercise set 4

Run on October 03, 16:40:44 PM.

+ Pass: Change into directory "ex4".

+ Pass: Check that file "types.md" exists.

+ Pass: Item 1 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 2 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 3 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 4 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 5 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 6 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 7 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 8 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Check that file "hof.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   drop_until (fun _ -> true) []
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   drop_until (fun _ -> true) [1]
   ```
   matches the pattern `[1]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   drop_until (fun s -> s.[0]='a') ["boring"; "as"; "always"]
   ```
   matches the pattern `["as"; "always"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_while (fun _ -> true) [1; 2; 3]
   ```
   matches the pattern `[1; 2; 3]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_while ((=) "a") ["a"; "a"; "b"; "a"]
   ```
   matches the pattern `["a"; "a"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_while (fun _ -> false) ["say"; "anything"]
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_until (fun _ -> false) [1; 2; 3]
   ```
   matches the pattern `[1; 2; 3]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_until ((<>) "a") ["a"; "a"; "b"; "a"]
   ```
   matches the pattern `["a"; "a"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_until (fun _ -> true) ["say"; "anything"]
   ```
   matches the pattern `[]`.

   




+ Pass: Check that file "funset.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   mem 3 (union empty empty)
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 3 (union (add 3 empty) (add 5 empty))
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 0 (intersect empty (add 0 empty))
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let s = (add 0 empty) in mem 0 (intersect s (add 1 s))
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 0 (rem 0 (add 0 empty))
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem "a" (rem "b" (add "a" empty))
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 0 (setminus empty (add 0 empty))
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 0 (setminus (add 0 empty) empty)
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 1 (setminus empty empty)
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem 1 (setminus (add 1 empty) (add 1 (add 0 empty)))
   ```
   matches the pattern `false`.

   




+ Fail: 
Check that the result of evaluating
   ```
   mem 4 (range 4 max_int)
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value range
Hint: Did you mean raise?
`


+ Fail: 
Check that the result of evaluating
   ```
   mem 3 (range 4 max_int)
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value range
Hint: Did you mean raise?
`


+ Fail: 
Check that the result of evaluating
   ```
   mem 0.5 (range 0. 1.)
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value range
Hint: Did you mean raise?
`


+ Fail: 
Check that the result of evaluating
   ```
   mem 2. (range 0. 1.)
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value range
Hint: Did you mean raise?
`


+ Fail: 
Check that the result of evaluating
   ```
   mem "aa" (range "a" "b")
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value range
Hint: Did you mean raise?
`


+ Fail: 
Check that the result of evaluating
   ```
   mem "aa" (range "b" "c")
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value range
Hint: Did you mean raise?
`


