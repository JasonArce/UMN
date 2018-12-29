### Feedback for Exercise set 5

Run on October 08, 18:56:35 PM.

+ Pass: Change into directory "ex5".

+ Pass: Check that file "maps_and_filters.ml" exists.

+ Pass: You are not allowed to use recursion.

   



+ Pass: 
Check that the result of evaluating
   ```
   fixduck ["duck"; "duck"; "goose"]
   ```
   matches the pattern `["duck"; "duck"; "grey duck"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   fixduck ["purple"; "blue"; "duck"]
   ```
   matches the pattern `["purple duck"; "blue duck"; "duck"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   fixduck ["gooseduck"]
   ```
   matches the pattern `["gooseduck duck"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   hex_list [10]
   ```
   matches the pattern `["A"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   hex_list [19; 10; 31137]
   ```
   matches the pattern `["13"; "A"; "79A1"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   de_parenthesize ['('; 'c'; 'a'; 'r'; ' '; '('; 'c'; 'd'; 'r'; ' '; 'l'; ')'; ')']
   ```
   matches the pattern `['c'; 'a'; 'r'; ' '; 'c'; 'd'; 'r'; ' '; 'l']`.

   




+ Pass: 
Check that the result of evaluating
   ```
   de_parenthesize [':';'-'; ')']
   ```
   matches the pattern `[':'; '-']`.

   




+ Pass: 
Check that the result of evaluating
   ```
   p_hack [(0.04, "Red meat vs cancer"); (0.1, "Internet vs cancer")]
   ```
   matches the pattern `[(0.04, "Red meat vs cancer")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   p_hack [(0.2, "random study"); (0.3, "random study 2"); (0.25, "random study 3"); (0.049, "random study 4")]
   ```
   matches the pattern `[(0.049, "random study 4")]`.

   




+ Fail: 
Check that the result of evaluating
   ```
   make_assoc [["a"]]
   ```
   matches the pattern `[(1,1,"a")]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value make_assoc
`


+ Fail: 
Check that the result of evaluating
   ```
   make_assoc [["a";"b"];["c"]]
   ```
   matches the pattern `[(1, 1, "a"); (1, 2, "b"); (2, 1, "c")]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value make_assoc
`


+ Pass: Check that file "folds.ml" exists.

+ Pass: You are not allowed to use recursion.

   



+ Pass: 
Check that the result of evaluating
   ```
   rank 2 [1; 3]
   ```
   matches the pattern `1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   rank "a" []
   ```
   matches the pattern `0`.

   




+ Pass: 
Check that the result of evaluating
   ```
   rank 3.14 [0.; 1.; 2.71828; 6.022e23]
   ```
   matches the pattern `3`.

   




+ Pass: 
Check that the result of evaluating
   ```
   prefixes [1; 2]
   ```
   matches the pattern `[[1;2]; [1]; []]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   prefixes ["a";"b";"c"]
   ```
   matches the pattern `[["a"; "b"; "c"]; ["a";"b"]; ["a"]; []]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   suffixes [1; 2]
   ```
   matches the pattern `[[1;2]; [2]; []]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   suffixes ["a"]
   ```
   matches the pattern `[["a"]; []]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   delta_encode [32; 34; 29; 33]
   ```
   matches the pattern `[32; 2; -5; 4]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   delta_encode [32767; 31337; 32123; 32210]
   ```
   matches the pattern `[32767; -1430; 786; 87]`.

   




+ Pass: Check that file "types.md" exists.

+ Pass: Check that file "hoflist.ml" exists.

+ Pass: Item 1 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 2 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 3 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Item 4 of list in types.md passes correct type on line 2, and line 3 not empty test

+ Pass: Make sure you are only using recursion in functions red, acc2, exclude, any

   



+ Pass: function mem uses one of [red, acc2, exclude, any]

+ Pass: function implode uses one of [red, acc2, exclude, any]

+ Pass: function dot uses one of [red, acc2, exclude, any]

+ Pass: function onlySomes uses one of [red, acc2, exclude, any]

+ Pass: 
Check that the result of evaluating
   ```
   mem 2 [1;2]
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   mem "a" []
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   implode ['a'; ' '; 'f'; 'i'; 'n'; 'e'; ' '; 'm'; 'e'; 's'; 's']
   ```
   matches the pattern `"a fine mess"`.

   




+ Pass: 
Check that the result of evaluating
   ```
   dot [1.;2.;3.] [4.;5.;6.]
   ```
   matches the pattern `32.`.

   




+ Pass: 
Check that the result of evaluating
   ```
   onlySomes [Some 1; None]
   ```
   matches the pattern `[Some 1]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   onlySomes []
   ```
   matches the pattern `[]`.

   




