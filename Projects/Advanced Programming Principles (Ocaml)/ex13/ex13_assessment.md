## Assessment for Exercise Set 13

Run on December 04, 19:52:12 PM.

+ Pass: Change into directory "ex13".

### Part 1: Doubly-linked lists

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 0; snoc x 1; list_of_dlist x
   ```
   matches the pattern `[0; 1]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 17; snoc x (-1); list_of_dlist x
   ```
   matches the pattern `[17; -1]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 0; snoc x 1; snoc x 2; remove 1 x; list_of_dlist x
   ```
   matches the pattern `[0;2]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let x = empty () in snoc x 0; remove 1 x; list_of_dlist x
   ```
   matches the pattern `[0]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l 1; snoc l 2; snoc l 4; fold (+) 0 l
   ```
   matches the pattern `7`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "a"; snoc l "b"; snoc l "c"; fold (fun acc s -> s::acc) [] l
   ```
   matches the pattern `["c"; "b"; "a"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "a"; snoc l "good"; snoc l "day"; reduce (fun h r -> h::r) l []
   ```
   matches the pattern `["a"; "good"; "day"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l 2; snoc l 3; snoc l 5; reduce ( * ) l 1
   ```
   matches the pattern `30`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "a"; snoc l "b"; pop_front l; list_of_dlist l
   ```
   matches the pattern `["b"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l 0; pop_front l; l
   ```
   matches the pattern `empty ()`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   let l = empty () in snoc l "oh"; snoc l "no"; pop_rear l; list_of_dlist l
   ```
   matches the pattern `["oh"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : string list = ["oh"; "no"]
`


+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   let l = empty () in pop_rear l; list_of_dlist l
   ```
   matches the pattern `[]`.

   




#### Subtotal: _11_ / _12_

### Part 2: Modules and Interfaces

+  _1_ / _1_ : Pass: Item 1 of list in module-interface.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 2 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 3 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 4 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 5 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 6 of list in module-interface.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 7 of list in module-interface.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 8 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 9 of list in module-interface.md passes  line 2 is "Not legal" and line 3 is not empty test

#### Subtotal: _9_ / _9_

### Part 3: Structs, Signatures, and Sharing

+  _1_ / _1_ : Pass: Item 1 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 2 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 3 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 4 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 5 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 6 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

+  _1_ / _1_ : Pass: Item 7 of list in modules.md passes  line 2 is "Legal" and line 3 is not empty  test

+  _1_ / _1_ : Pass: Item 8 of list in modules.md passes  line 2 is "Not legal" and line 3 is not empty test

#### Subtotal: _8_ / _8_

