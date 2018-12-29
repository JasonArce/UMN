### Feedback for HW 3

Run on October 17, 16:41:53 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that file "similar.ml" exists.

+ Pass: Check that file "findsim.ml" exists.

+ Pass: Check that hw3 files compile without errors

+ Pass: You are not allowed to use recursion.

   



+ Pass: 
Check that the result of evaluating
   ```
   filter_chars "abc123"
   ```
   matches the pattern `"abc   "`.

   




+ Pass: 
Check that the result of evaluating
   ```
   filter_chars "SAD!!!!!!!"
   ```
   matches the pattern `"SAD       "`.

   




+ Pass: 
Check that the result of evaluating
   ```
   words "I am *not* 42 letters long"
   ```
   matches the pattern `["I"; "am"; "not"; "letters"; "long"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   words "one_word"
   ```
   matches the pattern `["one"; "word"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   stemlist ["happiness"; "is"; "happy"]
   ```
   matches the pattern `["happi"; "is"; "happi"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (to_set ["a"; "b"; "a" ; "b"])
   ```
   matches the pattern `["a"; "b"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (to_set ["a"; "a"; "b"; "c"; "b"; "a"])
   ```
   matches the pattern `["a"; "b"; "c"]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   intersection_size ["a"; "b"] ["a"]
   ```
   matches the pattern `1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   union_size ["a"; "b"] ["a"]
   ```
   matches the pattern `2`.

   




+ Pass: 
Check that the result of evaluating
   ```
   similarity ["a"; "b"] ["a"]
   ```
   matches the pattern `0.5`.

   




+ Pass: 
Check that the result of evaluating
   ```
   find_max [0.;0.2;0.1] ["a";"b";"c"]
   ```
   matches the pattern `(0.2, "b")`.

   




