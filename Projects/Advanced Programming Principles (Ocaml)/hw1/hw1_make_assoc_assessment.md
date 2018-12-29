## Assessment for HW1 make_assoc

Run on September 28, 14:58:12 PM.

+ Pass: Change into directory "hw1".

## Feedback Tests (total possible value: 6)

+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   make_assoc []
   ```
   matches the pattern `[]`.

   




+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   make_assoc [[]]
   ```
   matches the pattern `[]`.

   




+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   make_assoc [["a"]]
   ```
   matches the pattern `[(1,1,"a")]`.

   




+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare (make_assoc [["a";"b"];["c"]])
   ```
   matches the pattern `List.sort compare [(2,1,"c"); (1,2,"b"); (1,1,"a")]`.

   




#### Subtotal: _6.0_ / _6.0_

+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aam"; "aas"; "abd"; "abg"; "aaz"; "aa7"; "abn"]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aam"); (1,2,"aas"); (1,3,"abd"); (1,4,"abg"); (1,5,"aaz"); (1,6,"aa7"); (1,7,"abn"); (2,1,"aak"); (2,2,"abu"); (2,3,"aa3"); (2,4,"abf"); (2,5,"aag"); (2,6,"abo"); (3,1,"ab4"); (3,2,"abm"); (3,3,"aal"); (3,4,"aba"); (3,5,"aaj"); (3,6,"abr"); (4,1,"abn"); (4,2,"aab"); (4,3,"aas"); (4,4,"aap"); (4,5,"aaj"); (4,6,"abw"); (5,1,"aaf"); (5,2,"abz"); (5,3,"abd"); (5,4,"abj"); (5,5,"aa7"); (5,6,"aak"); (6,1,"abk"); (6,2,"aap"); (6,3,"abw"); (6,4,"aar"); (6,5,"abd"); (6,6,"abb"); (7,1,"abq"); (7,2,"aa3"); (7,3,"aae"); (7,4,"ab5"); (7,5,"aav"); (7,6,"abt"); (8,1,"aay"); (8,2,"aaf"); (8,3,"abv"); (8,4,"aap"); (8,5,"ab6"); (8,6,"abr"); (9,1,"abi"); (9,2,"aas"); (9,3,"aaf"); (9,4,"abk"); (9,5,"abl"); (9,6,"aad")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aam"; "aas"; "abd"; "abg"; "aaz"; "aa7"]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"; "abe"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aam"); (1,2,"aas"); (1,3,"abd"); (1,4,"abg"); (1,5,"aaz"); (1,6,"aa7"); (2,1,"aak"); (2,2,"abu"); (2,3,"aa3"); (2,4,"abf"); (2,5,"aag"); (2,6,"abo"); (2,7,"abo"); (3,1,"ab4"); (3,2,"abm"); (3,3,"aal"); (3,4,"aba"); (3,5,"aaj"); (3,6,"abr"); (3,7,"aah"); (4,1,"abn"); (4,2,"aab"); (4,3,"aas"); (4,4,"aap"); (4,5,"aaj"); (4,6,"abw"); (4,7,"aag"); (5,1,"aaf"); (5,2,"abz"); (5,3,"abd"); (5,4,"abj"); (5,5,"aa7"); (5,6,"aak"); (5,7,"abu"); (6,1,"abk"); (6,2,"aap"); (6,3,"abw"); (6,4,"aar"); (6,5,"abd"); (6,6,"abb"); (6,7,"aac"); (7,1,"abq"); (7,2,"aa3"); (7,3,"aae"); (7,4,"ab5"); (7,5,"aav"); (7,6,"abt"); (7,7,"aag"); (8,1,"aay"); (8,2,"aaf"); (8,3,"abv"); (8,4,"aap"); (8,5,"ab6"); (8,6,"abr"); (8,7,"aa4"); (9,1,"abi"); (9,2,"aas"); (9,3,"aaf"); (9,4,"abk"); (9,5,"abl"); (9,6,"aad"); (9,7,"abe")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [[]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"; "abe"]])
   ```
   matches the pattern `List.sort compare  ([(2,1,"aak"); (2,2,"abu"); (2,3,"aa3"); (2,4,"abf"); (2,5,"aag"); (2,6,"abo"); (2,7,"abo"); (3,1,"ab4"); (3,2,"abm"); (3,3,"aal"); (3,4,"aba"); (3,5,"aaj"); (3,6,"abr"); (3,7,"aah"); (4,1,"abn"); (4,2,"aab"); (4,3,"aas"); (4,4,"aap"); (4,5,"aaj"); (4,6,"abw"); (4,7,"aag"); (5,1,"aaf"); (5,2,"abz"); (5,3,"abd"); (5,4,"abj"); (5,5,"aa7"); (5,6,"aak"); (5,7,"abu"); (6,1,"abk"); (6,2,"aap"); (6,3,"abw"); (6,4,"aar"); (6,5,"abd"); (6,6,"abb"); (6,7,"aac"); (7,1,"abq"); (7,2,"aa3"); (7,3,"aae"); (7,4,"ab5"); (7,5,"aav"); (7,6,"abt"); (7,7,"aag"); (8,1,"aay"); (8,2,"aaf"); (8,3,"abv"); (8,4,"aap"); (8,5,"ab6"); (8,6,"abr"); (8,7,"aa4"); (9,1,"abi"); (9,2,"aas"); (9,3,"aaf"); (9,4,"abk"); (9,5,"abl"); (9,6,"aad"); (9,7,"abe")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abo"; "aaa"; "aby"; "aau"]; ["abx"; "aat"; "aby"; "ab7"; "abe"]; ["abo"; "aah"; "aab"; "abe"]; ["aaz"; "abt"; "aam"; "aar"]; ["aar"; "aau"; "abt"; "abs"]; ["abh"; "aax"; "aan"; "aaw"]; ["abs"; "aby"; "abo"; "abv"]; ["aa4"; "aba"; "aai"; "aa5"]; ["ab6"; "abb"; "abi"; "aau"]; ["abg"; "aai"; "aam"; "aav"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abo"); (1,2,"aaa"); (1,3,"aby"); (1,4,"aau"); (2,1,"abx"); (2,2,"aat"); (2,3,"aby"); (2,4,"ab7"); (2,5,"abe"); (3,1,"abo"); (3,2,"aah"); (3,3,"aab"); (3,4,"abe"); (4,1,"aaz"); (4,2,"abt"); (4,3,"aam"); (4,4,"aar"); (5,1,"aar"); (5,2,"aau"); (5,3,"abt"); (5,4,"abs"); (6,1,"abh"); (6,2,"aax"); (6,3,"aan"); (6,4,"aaw"); (7,1,"abs"); (7,2,"aby"); (7,3,"abo"); (7,4,"abv"); (8,1,"aa4"); (8,2,"aba"); (8,3,"aai"); (8,4,"aa5"); (9,1,"ab6"); (9,2,"abb"); (9,3,"abi"); (9,4,"aau"); (10,1,"abg"); (10,2,"aai"); (10,3,"aam"); (10,4,"aav")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abo"; "aaa"; "aby"; "aau"; "aae"]; ["abx"; "aat"; "aby"; "ab7"]; ["abo"; "aah"; "aab"; "abe"; "aag"]; ["aaz"; "abt"; "aam"; "aar"; "abs"]; ["aar"; "aau"; "abt"; "abs"; "ab4"]; ["abh"; "aax"; "aan"; "aaw"; "ab4"]; ["abs"; "aby"; "abo"; "abv"; "aao"]; ["aa4"; "aba"; "aai"; "aa5"; "aah"]; ["ab6"; "abb"; "abi"; "aau"; "aa5"]; ["abg"; "aai"; "aam"; "aav"; "aau"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abo"); (1,2,"aaa"); (1,3,"aby"); (1,4,"aau"); (1,5,"aae"); (2,1,"abx"); (2,2,"aat"); (2,3,"aby"); (2,4,"ab7"); (3,1,"abo"); (3,2,"aah"); (3,3,"aab"); (3,4,"abe"); (3,5,"aag"); (4,1,"aaz"); (4,2,"abt"); (4,3,"aam"); (4,4,"aar"); (4,5,"abs"); (5,1,"aar"); (5,2,"aau"); (5,3,"abt"); (5,4,"abs"); (5,5,"ab4"); (6,1,"abh"); (6,2,"aax"); (6,3,"aan"); (6,4,"aaw"); (6,5,"ab4"); (7,1,"abs"); (7,2,"aby"); (7,3,"abo"); (7,4,"abv"); (7,5,"aao"); (8,1,"aa4"); (8,2,"aba"); (8,3,"aai"); (8,4,"aa5"); (8,5,"aah"); (9,1,"ab6"); (9,2,"abb"); (9,3,"abi"); (9,4,"aau"); (9,5,"aa5"); (10,1,"abg"); (10,2,"aai"); (10,3,"aam"); (10,4,"aav"); (10,5,"aau")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abo"; "aaa"; "aby"; "aau"; "aae"]; []; ["abo"; "aah"; "aab"; "abe"; "aag"]; ["aaz"; "abt"; "aam"; "aar"; "abs"]; ["aar"; "aau"; "abt"; "abs"; "ab4"]; ["abh"; "aax"; "aan"; "aaw"; "ab4"]; ["abs"; "aby"; "abo"; "abv"; "aao"]; ["aa4"; "aba"; "aai"; "aa5"; "aah"]; ["ab6"; "abb"; "abi"; "aau"; "aa5"]; ["abg"; "aai"; "aam"; "aav"; "aau"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abo"); (1,2,"aaa"); (1,3,"aby"); (1,4,"aau"); (1,5,"aae"); (3,1,"abo"); (3,2,"aah"); (3,3,"aab"); (3,4,"abe"); (3,5,"aag"); (4,1,"aaz"); (4,2,"abt"); (4,3,"aam"); (4,4,"aar"); (4,5,"abs"); (5,1,"aar"); (5,2,"aau"); (5,3,"abt"); (5,4,"abs"); (5,5,"ab4"); (6,1,"abh"); (6,2,"aax"); (6,3,"aan"); (6,4,"aaw"); (6,5,"ab4"); (7,1,"abs"); (7,2,"aby"); (7,3,"abo"); (7,4,"abv"); (7,5,"aao"); (8,1,"aa4"); (8,2,"aba"); (8,3,"aai"); (8,4,"aa5"); (8,5,"aah"); (9,1,"ab6"); (9,2,"abb"); (9,3,"abi"); (9,4,"aau"); (9,5,"aa5"); (10,1,"abg"); (10,2,"aai"); (10,3,"aam"); (10,4,"aav"); (10,5,"aau")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aav"; "aa3"; "abv"]; ["aaz"; "ab3"; "abn"]; ["aap"; "abj"; "ab3"; "abi"]; ["aba"; "aa7"; "aat"]; ["aam"; "aah"; "ab3"]; ["aa4"; "aao"; "aar"]; ["abm"; "aas"; "aat"]; ["abh"; "aas"; "ab4"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aav"); (1,2,"aa3"); (1,3,"abv"); (2,1,"aaz"); (2,2,"ab3"); (2,3,"abn"); (3,1,"aap"); (3,2,"abj"); (3,3,"ab3"); (3,4,"abi"); (4,1,"aba"); (4,2,"aa7"); (4,3,"aat"); (5,1,"aam"); (5,2,"aah"); (5,3,"ab3"); (6,1,"aa4"); (6,2,"aao"); (6,3,"aar"); (7,1,"abm"); (7,2,"aas"); (7,3,"aat"); (8,1,"abh"); (8,2,"aas"); (8,3,"ab4")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aav"; "aa3"; "abv"; "abc"]; ["aaz"; "ab3"; "abn"; "aan"]; ["aap"; "abj"; "ab3"]; ["aba"; "aa7"; "aat"; "abs"]; ["aam"; "aah"; "ab3"; "abi"]; ["aa4"; "aao"; "aar"; "aa7"]; ["abm"; "aas"; "aat"; "abx"]; ["abh"; "aas"; "ab4"; "abn"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aav"); (1,2,"aa3"); (1,3,"abv"); (1,4,"abc"); (2,1,"aaz"); (2,2,"ab3"); (2,3,"abn"); (2,4,"aan"); (3,1,"aap"); (3,2,"abj"); (3,3,"ab3"); (4,1,"aba"); (4,2,"aa7"); (4,3,"aat"); (4,4,"abs"); (5,1,"aam"); (5,2,"aah"); (5,3,"ab3"); (5,4,"abi"); (6,1,"aa4"); (6,2,"aao"); (6,3,"aar"); (6,4,"aa7"); (7,1,"abm"); (7,2,"aas"); (7,3,"aat"); (7,4,"abx"); (8,1,"abh"); (8,2,"aas"); (8,3,"ab4"); (8,4,"abn")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aav"; "aa3"; "abv"; "abc"]; ["aaz"; "ab3"; "abn"; "aan"]; []; ["aba"; "aa7"; "aat"; "abs"]; ["aam"; "aah"; "ab3"; "abi"]; ["aa4"; "aao"; "aar"; "aa7"]; ["abm"; "aas"; "aat"; "abx"]; ["abh"; "aas"; "ab4"; "abn"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aav"); (1,2,"aa3"); (1,3,"abv"); (1,4,"abc"); (2,1,"aaz"); (2,2,"ab3"); (2,3,"abn"); (2,4,"aan"); (4,1,"aba"); (4,2,"aa7"); (4,3,"aat"); (4,4,"abs"); (5,1,"aam"); (5,2,"aah"); (5,3,"ab3"); (5,4,"abi"); (6,1,"aa4"); (6,2,"aao"); (6,3,"aar"); (6,4,"aa7"); (7,1,"abm"); (7,2,"aas"); (7,3,"aat"); (7,4,"abx"); (8,1,"abh"); (8,2,"aas"); (8,3,"ab4"); (8,4,"abn")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aai"; "abz"]; ["aaz"; "aan"]; ["abt"; "abn"]; ["aa5"; "abz"; "aau"]; ["abo"; "aad"]; ["abp"; "aag"]; ["aat"; "aar"]; ["abf"; "abz"]; ["abz"; "abk"]; ["aan"; "aa4"]; ["aad"; "aas"]; ["ab3"; "abx"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aai"); (1,2,"abz"); (2,1,"aaz"); (2,2,"aan"); (3,1,"abt"); (3,2,"abn"); (4,1,"aa5"); (4,2,"abz"); (4,3,"aau"); (5,1,"abo"); (5,2,"aad"); (6,1,"abp"); (6,2,"aag"); (7,1,"aat"); (7,2,"aar"); (8,1,"abf"); (8,2,"abz"); (9,1,"abz"); (9,2,"abk"); (10,1,"aan"); (10,2,"aa4"); (11,1,"aad"); (11,2,"aas"); (12,1,"ab3"); (12,2,"abx")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aai"; "abz"; "abn"]; ["aaz"; "aan"; "aaf"]; ["abt"; "abn"; "abn"]; ["aa5"; "abz"]; ["abo"; "aad"; "abv"]; ["abp"; "aag"; "aah"]; ["aat"; "aar"; "aap"]; ["abf"; "abz"; "aay"]; ["abz"; "abk"; "abp"]; ["aan"; "aa4"; "aab"]; ["aad"; "aas"; "aao"]; ["ab3"; "abx"; "aau"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aai"); (1,2,"abz"); (1,3,"abn"); (2,1,"aaz"); (2,2,"aan"); (2,3,"aaf"); (3,1,"abt"); (3,2,"abn"); (3,3,"abn"); (4,1,"aa5"); (4,2,"abz"); (5,1,"abo"); (5,2,"aad"); (5,3,"abv"); (6,1,"abp"); (6,2,"aag"); (6,3,"aah"); (7,1,"aat"); (7,2,"aar"); (7,3,"aap"); (8,1,"abf"); (8,2,"abz"); (8,3,"aay"); (9,1,"abz"); (9,2,"abk"); (9,3,"abp"); (10,1,"aan"); (10,2,"aa4"); (10,3,"aab"); (11,1,"aad"); (11,2,"aas"); (11,3,"aao"); (12,1,"ab3"); (12,2,"abx"); (12,3,"aau")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aai"; "abz"; "abn"]; ["aaz"; "aan"; "aaf"]; ["abt"; "abn"; "abn"]; []; ["abo"; "aad"; "abv"]; ["abp"; "aag"; "aah"]; ["aat"; "aar"; "aap"]; ["abf"; "abz"; "aay"]; ["abz"; "abk"; "abp"]; ["aan"; "aa4"; "aab"]; ["aad"; "aas"; "aao"]; ["ab3"; "abx"; "aau"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aai"); (1,2,"abz"); (1,3,"abn"); (2,1,"aaz"); (2,2,"aan"); (2,3,"aaf"); (3,1,"abt"); (3,2,"abn"); (3,3,"abn"); (5,1,"abo"); (5,2,"aad"); (5,3,"abv"); (6,1,"abp"); (6,2,"aag"); (6,3,"aah"); (7,1,"aat"); (7,2,"aar"); (7,3,"aap"); (8,1,"abf"); (8,2,"abz"); (8,3,"aay"); (9,1,"abz"); (9,2,"abk"); (9,3,"abp"); (10,1,"aan"); (10,2,"aa4"); (10,3,"aab"); (11,1,"aad"); (11,2,"aas"); (11,3,"aao"); (12,1,"ab3"); (12,2,"abx"); (12,3,"aau")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abk"; "abc"]; ["abt"; "aaq"]; ["ab7"; "aa5"]; ["abh"; "aae"]; ["aab"; "aay"; "abd"]; ["aah"; "aa4"]; ["abe"; "aa6"]; ["aaj"; "ab3"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abk"); (1,2,"abc"); (2,1,"abt"); (2,2,"aaq"); (3,1,"ab7"); (3,2,"aa5"); (4,1,"abh"); (4,2,"aae"); (5,1,"aab"); (5,2,"aay"); (5,3,"abd"); (6,1,"aah"); (6,2,"aa4"); (7,1,"abe"); (7,2,"aa6"); (8,1,"aaj"); (8,2,"ab3")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abk"; "abc"; "abb"]; ["abt"; "aaq"; "aaw"]; ["ab7"; "aa5"; "aay"]; ["abh"; "aae"; "abk"]; ["aab"; "aay"]; ["aah"; "aa4"; "aaa"]; ["abe"; "aa6"; "ab7"]; ["aaj"; "ab3"; "abq"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abk"); (1,2,"abc"); (1,3,"abb"); (2,1,"abt"); (2,2,"aaq"); (2,3,"aaw"); (3,1,"ab7"); (3,2,"aa5"); (3,3,"aay"); (4,1,"abh"); (4,2,"aae"); (4,3,"abk"); (5,1,"aab"); (5,2,"aay"); (6,1,"aah"); (6,2,"aa4"); (6,3,"aaa"); (7,1,"abe"); (7,2,"aa6"); (7,3,"ab7"); (8,1,"aaj"); (8,2,"ab3"); (8,3,"abq")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abk"; "abc"; "abb"]; ["abt"; "aaq"; "aaw"]; ["ab7"; "aa5"; "aay"]; ["abh"; "aae"; "abk"]; []; ["aah"; "aa4"; "aaa"]; ["abe"; "aa6"; "ab7"]; ["aaj"; "ab3"; "abq"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abk"); (1,2,"abc"); (1,3,"abb"); (2,1,"abt"); (2,2,"aaq"); (2,3,"aaw"); (3,1,"ab7"); (3,2,"aa5"); (3,3,"aay"); (4,1,"abh"); (4,2,"aae"); (4,3,"abk"); (6,1,"aah"); (6,2,"aa4"); (6,3,"aaa"); (7,1,"abe"); (7,2,"aa6"); (7,3,"ab7"); (8,1,"aaj"); (8,2,"ab3"); (8,3,"abq")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abc"; "aar"; "abi"; "abh"; "abq"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"]; ["aa7"; "abw"; "abg"; "abn"; "aak"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"]; ["abk"; "abx"; "aas"; "abj"; "aak"]; ["aaq"; "abk"; "aay"; "abv"; "abg"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "aa2"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"]; ["ab3"; "aba"; "abl"; "abw"; "aag"]; ["aaa"; "aa6"; "abp"; "aaj"; "abz"]; ["ab6"; "abb"; "aak"; "aan"; "abn"]; ["abv"; "abo"; "ab3"; "abd"; "aag"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abc"); (1,2,"aar"); (1,3,"abi"); (1,4,"abh"); (1,5,"abq"); (2,1,"aag"); (2,2,"aa6"); (2,3,"ab4"); (2,4,"aab"); (2,5,"abr"); (3,1,"aa7"); (3,2,"abw"); (3,3,"abg"); (3,4,"abn"); (3,5,"aak"); (4,1,"ab3"); (4,2,"aaj"); (4,3,"aae"); (4,4,"aai"); (4,5,"aav"); (5,1,"abk"); (5,2,"abx"); (5,3,"aas"); (5,4,"abj"); (5,5,"aak"); (6,1,"aaq"); (6,2,"abk"); (6,3,"aay"); (6,4,"abv"); (6,5,"abg"); (6,6,"abv"); (7,1,"ab3"); (7,2,"aad"); (7,3,"aaw"); (7,4,"aay"); (7,5,"aa2"); (8,1,"aak"); (8,2,"aa4"); (8,3,"abb"); (8,4,"aa7"); (8,5,"aar"); (9,1,"ab3"); (9,2,"aba"); (9,3,"abl"); (9,4,"abw"); (9,5,"aag"); (10,1,"aaa"); (10,2,"aa6"); (10,3,"abp"); (10,4,"aaj"); (10,5,"abz"); (11,1,"ab6"); (11,2,"abb"); (11,3,"aak"); (11,4,"aan"); (11,5,"abn"); (12,1,"abv"); (12,2,"abo"); (12,3,"ab3"); (12,4,"abd"); (12,5,"aag")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abc"; "aar"; "abi"; "abh"; "abq"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "aak"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "aak"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abg"]; ["ab3"; "aad"; "aaw"; "aay"; "aa2"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aag"; "aab"]; ["aaa"; "aa6"; "abp"; "aaj"; "abz"; "abi"]; ["ab6"; "abb"; "aak"; "aan"; "abn"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "aag"; "abl"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abc"); (1,2,"aar"); (1,3,"abi"); (1,4,"abh"); (1,5,"abq"); (1,6,"abb"); (2,1,"aag"); (2,2,"aa6"); (2,3,"ab4"); (2,4,"aab"); (2,5,"abr"); (2,6,"aao"); (3,1,"aa7"); (3,2,"abw"); (3,3,"abg"); (3,4,"abn"); (3,5,"aak"); (3,6,"abz"); (4,1,"ab3"); (4,2,"aaj"); (4,3,"aae"); (4,4,"aai"); (4,5,"aav"); (4,6,"abz"); (5,1,"abk"); (5,2,"abx"); (5,3,"aas"); (5,4,"abj"); (5,5,"aak"); (5,6,"abp"); (6,1,"aaq"); (6,2,"abk"); (6,3,"aay"); (6,4,"abv"); (6,5,"abg"); (7,1,"ab3"); (7,2,"aad"); (7,3,"aaw"); (7,4,"aay"); (7,5,"aa2"); (7,6,"abp"); (8,1,"aak"); (8,2,"aa4"); (8,3,"abb"); (8,4,"aa7"); (8,5,"aar"); (8,6,"aal"); (9,1,"ab3"); (9,2,"aba"); (9,3,"abl"); (9,4,"abw"); (9,5,"aag"); (9,6,"aab"); (10,1,"aaa"); (10,2,"aa6"); (10,3,"abp"); (10,4,"aaj"); (10,5,"abz"); (10,6,"abi"); (11,1,"ab6"); (11,2,"abb"); (11,3,"aak"); (11,4,"aan"); (11,5,"abn"); (11,6,"abu"); (12,1,"abv"); (12,2,"abo"); (12,3,"ab3"); (12,4,"abd"); (12,5,"aag"); (12,6,"abl")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abc"; "aar"; "abi"; "abh"; "abq"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "aak"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "aak"; "abp"]; []; ["ab3"; "aad"; "aaw"; "aay"; "aa2"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aag"; "aab"]; ["aaa"; "aa6"; "abp"; "aaj"; "abz"; "abi"]; ["ab6"; "abb"; "aak"; "aan"; "abn"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "aag"; "abl"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abc"); (1,2,"aar"); (1,3,"abi"); (1,4,"abh"); (1,5,"abq"); (1,6,"abb"); (2,1,"aag"); (2,2,"aa6"); (2,3,"ab4"); (2,4,"aab"); (2,5,"abr"); (2,6,"aao"); (3,1,"aa7"); (3,2,"abw"); (3,3,"abg"); (3,4,"abn"); (3,5,"aak"); (3,6,"abz"); (4,1,"ab3"); (4,2,"aaj"); (4,3,"aae"); (4,4,"aai"); (4,5,"aav"); (4,6,"abz"); (5,1,"abk"); (5,2,"abx"); (5,3,"aas"); (5,4,"abj"); (5,5,"aak"); (5,6,"abp"); (7,1,"ab3"); (7,2,"aad"); (7,3,"aaw"); (7,4,"aay"); (7,5,"aa2"); (7,6,"abp"); (8,1,"aak"); (8,2,"aa4"); (8,3,"abb"); (8,4,"aa7"); (8,5,"aar"); (8,6,"aal"); (9,1,"ab3"); (9,2,"aba"); (9,3,"abl"); (9,4,"abw"); (9,5,"aag"); (9,6,"aab"); (10,1,"aaa"); (10,2,"aa6"); (10,3,"abp"); (10,4,"aaj"); (10,5,"abz"); (10,6,"abi"); (11,1,"ab6"); (11,2,"abb"); (11,3,"aak"); (11,4,"aan"); (11,5,"abn"); (11,6,"abu"); (12,1,"abv"); (12,2,"abo"); (12,3,"ab3"); (12,4,"abd"); (12,5,"aag"); (12,6,"abl")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"]; ["aak"; "aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"]; ["abt"; "abf"; "aan"; "aak"; "aam"; "aaf"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abl"); (1,2,"aao"); (1,3,"aag"); (1,4,"aa2"); (1,5,"aa7"); (1,6,"abg"); (2,1,"abb"); (2,2,"aac"); (2,3,"abj"); (2,4,"abw"); (2,5,"aaz"); (2,6,"aa7"); (3,1,"ab3"); (3,2,"aaj"); (3,3,"abh"); (3,4,"aa3"); (3,5,"abc"); (3,6,"aa5"); (4,1,"aa2"); (4,2,"aas"); (4,3,"abf"); (4,4,"abb"); (4,5,"ab7"); (4,6,"ab3"); (5,1,"aao"); (5,2,"abq"); (5,3,"aao"); (5,4,"aa5"); (5,5,"aar"); (5,6,"abe"); (6,1,"ab6"); (6,2,"abg"); (6,3,"abn"); (6,4,"aae"); (6,5,"aaj"); (6,6,"aau"); (7,1,"aak"); (7,2,"aae"); (7,3,"aaw"); (7,4,"abz"); (7,5,"abg"); (7,6,"abh"); (7,7,"aax"); (8,1,"ab5"); (8,2,"abs"); (8,3,"abc"); (8,4,"abr"); (8,5,"aa4"); (8,6,"abd"); (9,1,"abt"); (9,2,"abf"); (9,3,"aan"); (9,4,"aak"); (9,5,"aam"); (9,6,"aaf"); (10,1,"abh"); (10,2,"aaz"); (10,3,"abq"); (10,4,"aby"); (10,5,"abq"); (10,6,"aao")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aak"; "aae"; "aaw"; "abz"; "abg"; "abh"]; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abt"; "abf"; "aan"; "aak"; "aam"; "aaf"; "aaw"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abl"); (1,2,"aao"); (1,3,"aag"); (1,4,"aa2"); (1,5,"aa7"); (1,6,"abg"); (1,7,"abx"); (2,1,"abb"); (2,2,"aac"); (2,3,"abj"); (2,4,"abw"); (2,5,"aaz"); (2,6,"aa7"); (2,7,"aav"); (3,1,"ab3"); (3,2,"aaj"); (3,3,"abh"); (3,4,"aa3"); (3,5,"abc"); (3,6,"aa5"); (3,7,"aab"); (4,1,"aa2"); (4,2,"aas"); (4,3,"abf"); (4,4,"abb"); (4,5,"ab7"); (4,6,"ab3"); (4,7,"abr"); (5,1,"aao"); (5,2,"abq"); (5,3,"aao"); (5,4,"aa5"); (5,5,"aar"); (5,6,"abe"); (5,7,"aby"); (6,1,"ab6"); (6,2,"abg"); (6,3,"abn"); (6,4,"aae"); (6,5,"aaj"); (6,6,"aau"); (6,7,"abz"); (7,1,"aak"); (7,2,"aae"); (7,3,"aaw"); (7,4,"abz"); (7,5,"abg"); (7,6,"abh"); (8,1,"ab5"); (8,2,"abs"); (8,3,"abc"); (8,4,"abr"); (8,5,"aa4"); (8,6,"abd"); (8,7,"aaj"); (9,1,"abt"); (9,2,"abf"); (9,3,"aan"); (9,4,"aak"); (9,5,"aam"); (9,6,"aaf"); (9,7,"aaw"); (10,1,"abh"); (10,2,"aaz"); (10,3,"abq"); (10,4,"aby"); (10,5,"abq"); (10,6,"aao"); (10,7,"abv")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; []; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abt"; "abf"; "aan"; "aak"; "aam"; "aaf"; "aaw"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abl"); (1,2,"aao"); (1,3,"aag"); (1,4,"aa2"); (1,5,"aa7"); (1,6,"abg"); (1,7,"abx"); (2,1,"abb"); (2,2,"aac"); (2,3,"abj"); (2,4,"abw"); (2,5,"aaz"); (2,6,"aa7"); (2,7,"aav"); (3,1,"ab3"); (3,2,"aaj"); (3,3,"abh"); (3,4,"aa3"); (3,5,"abc"); (3,6,"aa5"); (3,7,"aab"); (4,1,"aa2"); (4,2,"aas"); (4,3,"abf"); (4,4,"abb"); (4,5,"ab7"); (4,6,"ab3"); (4,7,"abr"); (5,1,"aao"); (5,2,"abq"); (5,3,"aao"); (5,4,"aa5"); (5,5,"aar"); (5,6,"abe"); (5,7,"aby"); (6,1,"ab6"); (6,2,"abg"); (6,3,"abn"); (6,4,"aae"); (6,5,"aaj"); (6,6,"aau"); (6,7,"abz"); (8,1,"ab5"); (8,2,"abs"); (8,3,"abc"); (8,4,"abr"); (8,5,"aa4"); (8,6,"abd"); (8,7,"aaj"); (9,1,"abt"); (9,2,"abf"); (9,3,"aan"); (9,4,"aak"); (9,5,"aam"); (9,6,"aaf"); (9,7,"aaw"); (10,1,"abh"); (10,2,"aaz"); (10,3,"abq"); (10,4,"aby"); (10,5,"abq"); (10,6,"aao"); (10,7,"abv")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abf"; "aar"; "abn"]; ["ab7"; "aa4"; "aao"]; ["aak"; "aal"; "abc"]; ["abw"; "aax"; "abb"]; ["aa4"; "abv"; "abf"]; ["ab6"; "aaz"; "aad"]; ["abj"; "abc"; "abl"]; ["aa5"; "aas"; "abd"; "aaa"]; ["abv"; "aad"; "abd"]; ["aby"; "aae"; "aak"]; ["aaq"; "aak"; "aan"]; ["aa2"; "ab4"; "aae"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abf"); (1,2,"aar"); (1,3,"abn"); (2,1,"ab7"); (2,2,"aa4"); (2,3,"aao"); (3,1,"aak"); (3,2,"aal"); (3,3,"abc"); (4,1,"abw"); (4,2,"aax"); (4,3,"abb"); (5,1,"aa4"); (5,2,"abv"); (5,3,"abf"); (6,1,"ab6"); (6,2,"aaz"); (6,3,"aad"); (7,1,"abj"); (7,2,"abc"); (7,3,"abl"); (8,1,"aa5"); (8,2,"aas"); (8,3,"abd"); (8,4,"aaa"); (9,1,"abv"); (9,2,"aad"); (9,3,"abd"); (10,1,"aby"); (10,2,"aae"); (10,3,"aak"); (11,1,"aaq"); (11,2,"aak"); (11,3,"aan"); (12,1,"aa2"); (12,2,"ab4"); (12,3,"aae")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abf"; "aar"; "abn"; "abc"]; ["ab7"; "aa4"; "aao"; "ab2"]; ["aak"; "aal"; "abc"; "ab3"]; ["abw"; "aax"; "abb"; "aaz"]; ["aa4"; "abv"; "abf"; "aaa"]; ["ab6"; "aaz"; "aad"; "abp"]; ["abj"; "abc"; "abl"; "aal"]; ["aa5"; "aas"; "abd"]; ["abv"; "aad"; "abd"; "aa7"]; ["aby"; "aae"; "aak"; "ab7"]; ["aaq"; "aak"; "aan"; "aa7"]; ["aa2"; "ab4"; "aae"; "abo"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abf"); (1,2,"aar"); (1,3,"abn"); (1,4,"abc"); (2,1,"ab7"); (2,2,"aa4"); (2,3,"aao"); (2,4,"ab2"); (3,1,"aak"); (3,2,"aal"); (3,3,"abc"); (3,4,"ab3"); (4,1,"abw"); (4,2,"aax"); (4,3,"abb"); (4,4,"aaz"); (5,1,"aa4"); (5,2,"abv"); (5,3,"abf"); (5,4,"aaa"); (6,1,"ab6"); (6,2,"aaz"); (6,3,"aad"); (6,4,"abp"); (7,1,"abj"); (7,2,"abc"); (7,3,"abl"); (7,4,"aal"); (8,1,"aa5"); (8,2,"aas"); (8,3,"abd"); (9,1,"abv"); (9,2,"aad"); (9,3,"abd"); (9,4,"aa7"); (10,1,"aby"); (10,2,"aae"); (10,3,"aak"); (10,4,"ab7"); (11,1,"aaq"); (11,2,"aak"); (11,3,"aan"); (11,4,"aa7"); (12,1,"aa2"); (12,2,"ab4"); (12,3,"aae"); (12,4,"abo")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abf"; "aar"; "abn"; "abc"]; ["ab7"; "aa4"; "aao"; "ab2"]; ["aak"; "aal"; "abc"; "ab3"]; ["abw"; "aax"; "abb"; "aaz"]; ["aa4"; "abv"; "abf"; "aaa"]; ["ab6"; "aaz"; "aad"; "abp"]; ["abj"; "abc"; "abl"; "aal"]; []; ["abv"; "aad"; "abd"; "aa7"]; ["aby"; "aae"; "aak"; "ab7"]; ["aaq"; "aak"; "aan"; "aa7"]; ["aa2"; "ab4"; "aae"; "abo"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abf"); (1,2,"aar"); (1,3,"abn"); (1,4,"abc"); (2,1,"ab7"); (2,2,"aa4"); (2,3,"aao"); (2,4,"ab2"); (3,1,"aak"); (3,2,"aal"); (3,3,"abc"); (3,4,"ab3"); (4,1,"abw"); (4,2,"aax"); (4,3,"abb"); (4,4,"aaz"); (5,1,"aa4"); (5,2,"abv"); (5,3,"abf"); (5,4,"aaa"); (6,1,"ab6"); (6,2,"aaz"); (6,3,"aad"); (6,4,"abp"); (7,1,"abj"); (7,2,"abc"); (7,3,"abl"); (7,4,"aal"); (9,1,"abv"); (9,2,"aad"); (9,3,"abd"); (9,4,"aa7"); (10,1,"aby"); (10,2,"aae"); (10,3,"aak"); (10,4,"ab7"); (11,1,"aaq"); (11,2,"aak"); (11,3,"aan"); (11,4,"aa7"); (12,1,"aa2"); (12,2,"ab4"); (12,3,"aae"); (12,4,"abo")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aba"; "abm"; "abz"; "aai"; "abx"; "aax"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"]; ["aaa"; "aaf"; "aa4"; "aax"; "aas"; "abd"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"]; ["abq"; "aaa"; "aba"; "abl"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aba"); (1,2,"abm"); (1,3,"abz"); (1,4,"aai"); (1,5,"abx"); (1,6,"aax"); (2,1,"aaj"); (2,2,"aaa"); (2,3,"aaf"); (2,4,"aas"); (2,5,"abl"); (2,6,"abl"); (3,1,"aaa"); (3,2,"aaf"); (3,3,"aa4"); (3,4,"aax"); (3,5,"aas"); (3,6,"abd"); (4,1,"aau"); (4,2,"abx"); (4,3,"aar"); (4,4,"abt"); (4,5,"aao"); (4,6,"ab7"); (5,1,"ab4"); (5,2,"abt"); (5,3,"abz"); (5,4,"abz"); (5,5,"abj"); (5,6,"aam"); (6,1,"abf"); (6,2,"aar"); (6,3,"abp"); (6,4,"abj"); (6,5,"abp"); (6,6,"abn"); (7,1,"ab6"); (7,2,"aag"); (7,3,"abi"); (7,4,"aam"); (7,5,"abo"); (7,6,"aav"); (8,1,"abr"); (8,2,"abg"); (8,3,"aaw"); (8,4,"aah"); (8,5,"abq"); (8,6,"abv"); (9,1,"abq"); (9,2,"aaa"); (9,3,"aba"); (9,4,"abl"); (9,5,"abb"); (9,6,"aay"); (9,7,"aag"); (10,1,"abh"); (10,2,"abu"); (10,3,"aaz"); (10,4,"ab6"); (10,5,"abi"); (10,6,"aau")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aba"; "abm"; "abz"; "aai"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"; "aa3"]; ["aaa"; "aaf"; "aa4"; "aax"; "aas"; "abd"; "aaj"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abl"; "abb"; "aay"]; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"; "aal"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aba"); (1,2,"abm"); (1,3,"abz"); (1,4,"aai"); (1,5,"abx"); (1,6,"aax"); (1,7,"aap"); (2,1,"aaj"); (2,2,"aaa"); (2,3,"aaf"); (2,4,"aas"); (2,5,"abl"); (2,6,"abl"); (2,7,"aa3"); (3,1,"aaa"); (3,2,"aaf"); (3,3,"aa4"); (3,4,"aax"); (3,5,"aas"); (3,6,"abd"); (3,7,"aaj"); (4,1,"aau"); (4,2,"abx"); (4,3,"aar"); (4,4,"abt"); (4,5,"aao"); (4,6,"ab7"); (4,7,"abv"); (5,1,"ab4"); (5,2,"abt"); (5,3,"abz"); (5,4,"abz"); (5,5,"abj"); (5,6,"aam"); (5,7,"abz"); (6,1,"abf"); (6,2,"aar"); (6,3,"abp"); (6,4,"abj"); (6,5,"abp"); (6,6,"abn"); (6,7,"abw"); (7,1,"ab6"); (7,2,"aag"); (7,3,"abi"); (7,4,"aam"); (7,5,"abo"); (7,6,"aav"); (7,7,"aak"); (8,1,"abr"); (8,2,"abg"); (8,3,"aaw"); (8,4,"aah"); (8,5,"abq"); (8,6,"abv"); (8,7,"aab"); (9,1,"abq"); (9,2,"aaa"); (9,3,"aba"); (9,4,"abl"); (9,5,"abb"); (9,6,"aay"); (10,1,"abh"); (10,2,"abu"); (10,3,"aaz"); (10,4,"ab6"); (10,5,"abi"); (10,6,"aau"); (10,7,"aal")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["aba"; "abm"; "abz"; "aai"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"; "aa3"]; ["aaa"; "aaf"; "aa4"; "aax"; "aas"; "abd"; "aaj"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"; "aab"]; []; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"; "aal"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"aba"); (1,2,"abm"); (1,3,"abz"); (1,4,"aai"); (1,5,"abx"); (1,6,"aax"); (1,7,"aap"); (2,1,"aaj"); (2,2,"aaa"); (2,3,"aaf"); (2,4,"aas"); (2,5,"abl"); (2,6,"abl"); (2,7,"aa3"); (3,1,"aaa"); (3,2,"aaf"); (3,3,"aa4"); (3,4,"aax"); (3,5,"aas"); (3,6,"abd"); (3,7,"aaj"); (4,1,"aau"); (4,2,"abx"); (4,3,"aar"); (4,4,"abt"); (4,5,"aao"); (4,6,"ab7"); (4,7,"abv"); (5,1,"ab4"); (5,2,"abt"); (5,3,"abz"); (5,4,"abz"); (5,5,"abj"); (5,6,"aam"); (5,7,"abz"); (6,1,"abf"); (6,2,"aar"); (6,3,"abp"); (6,4,"abj"); (6,5,"abp"); (6,6,"abn"); (6,7,"abw"); (7,1,"ab6"); (7,2,"aag"); (7,3,"abi"); (7,4,"aam"); (7,5,"abo"); (7,6,"aav"); (7,7,"aak"); (8,1,"abr"); (8,2,"abg"); (8,3,"aaw"); (8,4,"aah"); (8,5,"abq"); (8,6,"abv"); (8,7,"aab"); (10,1,"abh"); (10,2,"abu"); (10,3,"aaz"); (10,4,"ab6"); (10,5,"abi"); (10,6,"aau"); (10,7,"aal")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abt"; "aac"]; ["aat"; "abm"]; ["aat"; "abx"]; ["abp"; "abr"]; ["abw"; "aaa"]; ["abl"; "aac"]; ["aby"; "abl"]; ["aau"; "aak"]; ["aav"; "aa4"]; ["ab4"; "aam"; "abs"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abt"); (1,2,"aac"); (2,1,"aat"); (2,2,"abm"); (3,1,"aat"); (3,2,"abx"); (4,1,"abp"); (4,2,"abr"); (5,1,"abw"); (5,2,"aaa"); (6,1,"abl"); (6,2,"aac"); (7,1,"aby"); (7,2,"abl"); (8,1,"aau"); (8,2,"aak"); (9,1,"aav"); (9,2,"aa4"); (10,1,"ab4"); (10,2,"aam"); (10,3,"abs")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abt"; "aac"; "aar"]; ["aat"; "abm"; "ab7"]; ["aat"; "abx"; "ab5"]; ["abp"; "abr"; "aav"]; ["abw"; "aaa"; "aa7"]; ["abl"; "aac"; "aa4"]; ["aby"; "abl"; "abm"]; ["aau"; "aak"; "abm"]; ["aav"; "aa4"; "aae"]; ["ab4"; "aam"]])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abt"); (1,2,"aac"); (1,3,"aar"); (2,1,"aat"); (2,2,"abm"); (2,3,"ab7"); (3,1,"aat"); (3,2,"abx"); (3,3,"ab5"); (4,1,"abp"); (4,2,"abr"); (4,3,"aav"); (5,1,"abw"); (5,2,"aaa"); (5,3,"aa7"); (6,1,"abl"); (6,2,"aac"); (6,3,"aa4"); (7,1,"aby"); (7,2,"abl"); (7,3,"abm"); (8,1,"aau"); (8,2,"aak"); (8,3,"abm"); (9,1,"aav"); (9,2,"aa4"); (9,3,"aae"); (10,1,"ab4"); (10,2,"aam")])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
   List.sort compare  (make_assoc [["abt"; "aac"; "aar"]; ["aat"; "abm"; "ab7"]; ["aat"; "abx"; "ab5"]; ["abp"; "abr"; "aav"]; ["abw"; "aaa"; "aa7"]; ["abl"; "aac"; "aa4"]; ["aby"; "abl"; "abm"]; ["aau"; "aak"; "abm"]; ["aav"; "aa4"; "aae"]; []])
   ```
   matches the pattern `List.sort compare  ([(1,1,"abt"); (1,2,"aac"); (1,3,"aar"); (2,1,"aat"); (2,2,"abm"); (2,3,"ab7"); (3,1,"aat"); (3,2,"abx"); (3,3,"ab5"); (4,1,"abp"); (4,2,"abr"); (4,3,"aav"); (5,1,"abw"); (5,2,"aaa"); (5,3,"aa7"); (6,1,"abl"); (6,2,"aac"); (6,3,"aa4"); (7,1,"aby"); (7,2,"abl"); (7,3,"abm"); (8,1,"aau"); (8,2,"aak"); (8,3,"abm"); (9,1,"aav"); (9,2,"aa4"); (9,3,"aae")])`.

   




#### Subtotal: _6.000000000000003_ / _6.000000000000003_

## Manual tests entered by TA: blowe012

+  _2.2857142857142856_ / _2.2857142857142856_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _2.2857142857142856_ / _2.2857142857142856_ : Pass: Appropriate task decomposition into helper functions

    score: 2 (out of 2)


+  _2.2857142857142856_ / _2.2857142857142856_ : Pass: Uses an appropriate/efficient algorithm

    score: 2 (out of 2)


+  _1.1428571428571428_ / _1.1428571428571428_ : Pass: Correct tail recursion

    score: 1 (out of 1)


+ Pass: Other Stylistic Comments & Feedback

    Good job. Try to make comments more concise. Generally try to keep less than 100 or so characters per line. If you need more description make a new line.

#### Subtotal: _8.0_ / _8.0_

