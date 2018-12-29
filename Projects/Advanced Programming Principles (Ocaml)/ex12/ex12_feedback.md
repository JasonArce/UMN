### Feedback for Exercise set 12

Run on November 26, 17:46:29 PM.

+ Pass: Change into directory "ex12".

+ Pass: Check that file "refeval.md" exists.

+ Pass: Item 1 of list in refeval.md passes correct type and value test

+ Pass: Item 2 of list in refeval.md passes correct type and value test

+ Pass: Item 3 of list in refeval.md passes correct type and value test

+ Pass: Item 4 of list in refeval.md passes correct type and value test

+ Pass: Item 5 of list in refeval.md passes correct type and value test

+ Pass: Item 6 of list in refeval.md passes correct type and value test

+ Pass: Item 7 of list in refeval.md passes correct type and value test

+ Pass: Check that file "mutable_eval.md" exists.

+ Pass: Item 1 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 2 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 3 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 4 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 5 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 6 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 7 of list in mutable_eval.md passes correct type and value test

+ Pass: Item 8 of list in mutable_eval.md passes correct type and value test

+ Pass: Check that file "list_arr.ml" exists.

+ Pass: Check that file "mlist.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   let a = [|1; 2; 3 |] in rev_array a; a
   ```
   matches the pattern `[|3; 2; 1|]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let b = [||] in rev_array b; b
   ```
   matches the pattern `[||]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let c = [|"sweet"; "potatoes"|] in rev_array c; c
   ```
   matches the pattern `[|"potatoes"; "sweet"|]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   zip_array [|1;2|] [|"a";"b"|]
   ```
   matches the pattern `[|(1, "a"); (2, "b")|]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   zip_array [|true; false; true|] [|0;1;1|]
   ```
   matches the pattern `[|(true, 0); (false, 1); (true,1)|]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mlist_of_list []
   ```
   matches the pattern `Nil`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mlist_of_list [1;2;3]
   ```
   matches the pattern `List {hd = 1; tl = List {hd = 2; tl = List {hd = 3; tl = Nil}}}`.

   




+ Pass: 
Check that the result of evaluating
   ```
   rev_mlist Nil
   ```
   matches the pattern `Nil`.

   




+ Pass: 
Check that the result of evaluating
   ```
   rev_mlist (List {hd = 1; tl = List {hd = 2; tl = Nil}})
   ```
   matches the pattern `List {hd = 2; tl = List {hd = 1; tl = Nil}}`.

   




+ Pass: 
Check that the result of evaluating
   ```
   append_m (List {hd = "mashed"; tl = List {hd = "potatoes"; tl = Nil}}) (List {hd = "gravy"; tl = Nil})
   ```
   matches the pattern `List {hd = "mashed"; tl = List {hd = "potatoes"; tl = List {hd = "gravy"; tl= Nil}}}`.

   




+ Fail: 
Check that the result of evaluating
   ```
   let l1 = List {hd = 1; tl = Nil} in let l2 = append_m l1 (List {hd = 2; tl = Nil}) in l1 = l2
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : bool = false
`


