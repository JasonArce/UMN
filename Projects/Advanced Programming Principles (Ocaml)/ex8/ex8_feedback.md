### Feedback for Exercise set 8

Run on October 29, 19:58:10 PM.

+ Pass: Change into directory "ex8".

+ Pass: Check that file "lazy_eval.md" exists.

+ Pass: Item 1 of list in lazy_eval.md passes Normal Form with correct evaluation result test

+ Pass: Item 2 of list in lazy_eval.md passes Never with explanation test

+ Pass: Item 3 of list in lazy_eval.md passes Normal Form with correct evaluation result test

+ Pass: Item 4 of list in lazy_eval.md passes Never with explanation test

+ Pass: Item 5 of list in lazy_eval.md passes Never with explanation test

+ Pass: Item 6 of list in lazy_eval.md passes Normal Form with correct evaluation result test

+ Pass: Item 7 of list in lazy_eval.md passes Normal Form with correct evaluation result test

+ Pass: Check that file "streams.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   take_s 5 (map_s (fun n -> 2*n+1) (nats 0))
   ```
   matches the pattern `[1; 3; 5; 7; 9]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 2 (map_s String.uppercase (repeating "wow"))
   ```
   matches the pattern `["WOW"; "WOW"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 3 (odds_s factorials)
   ```
   matches the pattern `[2; 24; 720]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 4 (odds_s fibs)
   ```
   matches the pattern `[1; 2; 5; 13]`.

   




+ Fail: 
Check that the result of evaluating
   ```
   take_s 10 (natpairs (0,0))
   ```
   matches the pattern `[(0, 0); (0, 1); (1, 0); (0, 2); (1, 1); (2, 0); (0, 3); (1, 2); (2, 1); (3, 0)]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value natpairs
`


+ Fail: 
Check that the result of evaluating
   ```
   take_s 4 (natpairs (4,5))
   ```
   matches the pattern `[(4, 5); (5, 4); (6, 3); (7, 2)]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value natpairs
`


+ Pass: 
Check that the result of evaluating
   ```
   (pal_check "Abba") && (pal_check "dAD") && (pal_check "") && (pal_check "raceCar")
   ```
   matches the pattern `true`.

   




+ Pass: 
Check that the result of evaluating
   ```
   (pal_check "abc") || (pal_check "aB") || (pal_check "nomnomcookies")
   ```
   matches the pattern `false`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 3 (bstrings_s "a" "b")
   ```
   matches the pattern `[""; "a"; "b"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 7 (bstrings_s "foo" "bar")
   ```
   matches the pattern `[""; "foo"; "bar"; "foofoo"; "foobar"; "barfoo"; "barbar"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 3 (palindromes "Race" "Car")
   ```
   matches the pattern `[""; "RaceCar"; "RaceCarRaceCar"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   take_s 4 (palindromes "Mad" "Dame")
   ```
   matches the pattern `[""; "DameMad"; "DameMadDameMad"; "DameMadDameMadDameMad"]`.

   




+ Pass: Check that file "lazylist.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   lztake 4 (lzmap (fun n -> 3*n) (lznats 0))
   ```
   matches the pattern `[0;3;6;9]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   lztake 3 (lzmap (fun s -> s^"!") (lzrepeat "yass"))
   ```
   matches the pattern `["yass!"; "yass!"; "yass!"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   lztake 4 (lz_odds (lzmerge lzfibs lzfact))
   ```
   matches the pattern `[1; 2; 6; 24]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   lztake 3 (lz_odds (lznats 0))
   ```
   matches the pattern `[1; 3; 5]`.

   




+ Fail: 
Check that the result of evaluating
   ```
   lztake 3 (lz_natpairs (12,1))
   ```
   matches the pattern `[(12, 1); (13, 0); (0, 14)]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : 'a list = []
`


+ Fail: 
Check that the result of evaluating
   ```
   lztake 4 (lz_natpairs (100,99))
   ```
   matches the pattern `[(100,99); (101, 98); (102, 97); (103, 96)]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : 'a list = []
`


+ Pass: 
Check that the result of evaluating
   ```
   lztake 7 (lz_bstrings "0" "1")
   ```
   matches the pattern `[""; "0"; "1"; "00"; "01"; "10"; "11"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   lztake 6 (lz_bstrings "aa" "b")
   ```
   matches the pattern `["";"aa";"b";"aaaa";"aab";"baa"]`.

   




+ Fail: 
Check that the result of evaluating
   ```
   lztake 5 (lz_palindromes "dad" "dad")
   ```
   matches the pattern `[""; "dad"; "dad"; "daddad"; "daddad"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list =
[""; "daddad"; "daddaddaddad"; "daddaddaddaddaddad";
 "daddaddaddaddaddaddaddad"]

   ```



+ Fail: 
Check that the result of evaluating
   ```
   lztake 4 (lz_palindromes "o" "so")
   ```
   matches the pattern `[""; "o"; "oo"; "oso"]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : string list = [""; "oso"; "osooso"; "osoosooso"]
`


