### Feedback for Exercise set 13

Run on December 05, 16:43:15 PM.

+ Pass: Change into directory "ex13".

+ Pass: Check that file "dllist.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 0; snoc x 1; list_of_dlist x
   ```
   matches the pattern `[0; 1]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 17; snoc x (-1); list_of_dlist x
   ```
   matches the pattern `[17; -1]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 0; snoc x 1; snoc x 2; remove 1 x; list_of_dlist x
   ```
   matches the pattern `[0;2]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 0; remove 1 x; list_of_dlist x
   ```
   matches the pattern `[0]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l 1; snoc l 2; snoc l 4; fold (+) 0 l
   ```
   matches the pattern `7`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "a"; snoc l "b"; snoc l "c"; fold (fun acc s -> s::acc) [] l
   ```
   matches the pattern `["c"; "b"; "a"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "a"; snoc l "good"; snoc l "day"; reduce (fun h r -> h::r) l []
   ```
   matches the pattern `["a"; "good"; "day"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l 2; snoc l 3; snoc l 5; reduce ( * ) l 1
   ```
   matches the pattern `30`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "a"; snoc l "b"; pop_front l; list_of_dlist l
   ```
   matches the pattern `["b"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l 0; pop_front l; l
   ```
   matches the pattern `empty ()`.

   




+ Fail: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "oh"; snoc l "no"; pop_rear l; list_of_dlist l
   ```
   matches the pattern `["oh"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : string list = ["oh"; "no"]
`


+ Pass: 
Check that the result of evaluating
   ```
   let l = empty () in pop_rear l; list_of_dlist l
   ```
   matches the pattern `[]`.

   




+ Pass: Check that file "module-interface.md" exists.

+ Pass: Item 1 of list in module-interface.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 2 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 3 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 4 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 5 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 6 of list in module-interface.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 7 of list in module-interface.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 8 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 9 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Check that file "modules.md" exists.

+ Pass: Item 1 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 2 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 3 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 4 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 5 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 6 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 7 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 8 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

