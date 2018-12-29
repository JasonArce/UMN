## Assessment for HW1 table_of_assoc

Run on September 25, 17:23:38 PM.

+ Pass: Change into directory "hw1".

## Feedback Tests (total possible value: 6)

+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a")]
   ```
   matches the pattern `[["a"]]`.

   




+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a"); (2,1,"b")]
   ```
   matches the pattern `[["a"]; ["b"]]`.

   




+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a"); (1,2,"b")]
   ```
   matches the pattern `[["a"; "b"]]`.

   




+  _1.5_ / _1.5_ : Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a"); (1,3,"b"); (3,1,"c"); (3,3,"d")]
   ```
   matches the pattern `[["a"; "b"]; ["c"; "d"]]`.

   




#### Subtotal: _6.0_ / _6.0_

+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(9,1,"abi"); (4,3,"aas"); (2,7,"abo"); (1,4,"abg"); (7,1,"abq"); (1,3,"abd"); (5,6,"aak"); (2,2,"abu"); (8,5,"ab6"); (6,2,"aap"); (6,1,"abk"); (2,3,"aa3"); (8,1,"aay"); (7,7,"aag"); (3,6,"abr"); (3,5,"aaj"); (3,3,"aal"); (2,5,"aag"); (7,3,"aae"); (5,3,"abd"); (3,2,"abm"); (4,2,"aab"); (5,4,"abj"); (7,5,"aav"); (8,3,"abv"); (1,2,"aas"); (8,6,"abr"); (5,7,"abu"); (9,6,"aad"); (7,6,"abt"); (9,5,"abl"); (4,7,"aag"); (6,7,"aac"); (3,4,"aba"); (6,5,"abd"); (5,2,"abz"); (9,3,"aaf"); (4,4,"aap"); (5,5,"aa7"); (7,2,"aa3"); (8,2,"aaf"); (6,3,"abw"); (8,7,"aa4"); (8,4,"aap"); (3,1,"ab4"); (1,7,"abn"); (2,1,"aak"); (3,7,"aah"); (1,1,"aam"); (4,6,"abw"); (2,4,"abf"); (6,6,"abb"); (1,6,"aa7"); (5,1,"aaf"); (1,5,"aaz"); (9,2,"aas"); (6,4,"aar"); (4,1,"abn"); (9,4,"abk"); (4,5,"aaj"); (2,6,"abo"); (7,4,"ab5"); (9,7,"abe")])
   ```
   matches the pattern ` ([["aam"; "aas"; "abd"; "abg"; "aaz"; "aa7"; "abn"]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"; "abe"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa7"; "aam"; "aas"; "aaz"; "abd"; "abg"; "abn"];
 ["aa3"; "aag"; "aak"; "abf"; "abo"; "abu"];
 ["aah"; "aaj"; "aal"; "ab4"; "aba"; "abm"; "abr"];
 ["aab"; "aag"; "aaj"; "aap"; "aas"; "abn"; "abw"];
 ["aa7"; "aaf"; "aak"; "abd"; "abj"; "abu"; "abz"];
 ["aac"; "aap"; "aar"; "abb"; "abd"; "abk"; "abw"];
 ["aa3"; "aae"; "aag"; "aav"; "ab5"; "abq"; "abt"];
 ["aa4"; "aaf"; "aap"; "aay"; "ab6"; "abr"; "abv"];
 ["aad"; "aaf"; "aas"; "abe"; "abi"; "abk"; "abl"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(3,4,"abe"); (1,4,"aau"); (6,1,"abh"); (2,3,"aby"); (3,2,"aah"); (6,3,"aan"); (1,3,"aby"); (3,5,"aag"); (4,1,"aaz"); (10,2,"aai"); (2,2,"aat"); (5,4,"abs"); (9,2,"abb"); (5,1,"aar"); (9,5,"aa5"); (5,5,"ab4"); (10,4,"aav"); (10,3,"aam"); (8,2,"aba"); (10,5,"aau"); (7,3,"abo"); (7,4,"abv"); (5,2,"aau"); (6,5,"ab4"); (3,3,"aab"); (2,4,"ab7"); (9,3,"abi"); (6,4,"aaw"); (8,1,"aa4"); (4,3,"aam"); (7,1,"abs"); (5,3,"abt"); (9,4,"aau"); (9,1,"ab6"); (3,1,"abo"); (1,2,"aaa"); (1,5,"aae"); (7,5,"aao"); (10,1,"abg"); (2,1,"abx"); (6,2,"aax"); (8,3,"aai"); (8,4,"aa5"); (4,2,"abt"); (4,4,"aar"); (7,2,"aby"); (4,5,"abs"); (8,5,"aah"); (1,1,"abo"); (2,5,"abe")])
   ```
   matches the pattern ` ([["abo"; "aaa"; "aby"; "aau"; "aae"]; ["abx"; "aat"; "aby"; "ab7"; "abe"]; ["abo"; "aah"; "aab"; "abe"; "aag"]; ["aaz"; "abt"; "aam"; "aar"; "abs"]; ["aar"; "aau"; "abt"; "abs"; "ab4"]; ["abh"; "aax"; "aan"; "aaw"; "ab4"]; ["abs"; "aby"; "abo"; "abv"; "aao"]; ["aa4"; "aba"; "aai"; "aa5"; "aah"]; ["ab6"; "abb"; "abi"; "aau"; "aa5"]; ["abg"; "aai"; "aam"; "aav"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aaa"; "aae"; "aau"; "abo"; "aby"]; ["aat"; "ab7"; "abe"; "abx"; "aby"];
 ["aab"; "aag"; "aah"; "abe"; "abo"]; ["aam"; "aar"; "aaz"; "abs"; "abt"];
 ["aar"; "aau"; "ab4"; "abs"; "abt"]; ["aan"; "aaw"; "aax"; "ab4"; "abh"];
 ["aao"; "abo"; "abs"; "abv"; "aby"]; ["aa4"; "aa5"; "aah"; "aai"; "aba"];
 ["aa5"; "aau"; "ab6"; "abb"; "abi"]; ["aai"; "aam"; "aau"; "aav"; "abg"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(4,2,"aa7"); (2,2,"ab3"); (3,3,"ab3"); (7,4,"abx"); (5,4,"abi"); (4,4,"abs"); (6,2,"aao"); (2,4,"aan"); (1,1,"aav"); (5,1,"aam"); (8,2,"aas"); (5,3,"ab3"); (8,4,"abn"); (7,1,"abm"); (8,3,"ab4"); (2,1,"aaz"); (6,1,"aa4"); (1,4,"abc"); (1,3,"abv"); (8,1,"abh"); (1,2,"aa3"); (3,2,"abj"); (7,2,"aas"); (3,4,"abi"); (6,4,"aa7"); (5,2,"aah"); (4,1,"aba"); (7,3,"aat"); (6,3,"aar"); (3,1,"aap"); (2,3,"abn"); (4,3,"aat")])
   ```
   matches the pattern ` ([["aav"; "aa3"; "abv"; "abc"]; ["aaz"; "ab3"; "abn"; "aan"]; ["aap"; "abj"; "ab3"; "abi"]; ["aba"; "aa7"; "aat"; "abs"]; ["aam"; "aah"; "ab3"; "abi"]; ["aa4"; "aao"; "aar"; "aa7"]; ["abm"; "aas"; "aat"; "abx"]; ["abh"; "aas"; "ab4"; "abn"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aa3"; "aav"; "abc"; "abv"]; ["aan"; "aaz"; "ab3"; "abn"];
 ["aap"; "ab3"; "abi"; "abj"]; ["aa7"; "aat"; "aba"; "abs"];
 ["aah"; "aam"; "ab3"; "abi"]; ["aa4"; "aa7"; "aao"; "aar"];
 ["aas"; "aat"; "abm"; "abx"]; ["aas"; "ab4"; "abh"; "abn"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(1,1,"aai"); (8,3,"aay"); (9,1,"abz"); (2,1,"aaz"); (10,1,"aan"); (11,3,"aao"); (3,1,"abt"); (10,2,"aa4"); (1,2,"abz"); (10,3,"aab"); (2,3,"aaf"); (4,3,"aau"); (8,1,"abf"); (11,2,"aas"); (9,3,"abp"); (3,3,"abn"); (11,1,"aad"); (9,2,"abk"); (6,3,"aah"); (8,2,"abz"); (2,2,"aan"); (4,2,"abz"); (6,1,"abp"); (6,2,"aag"); (5,3,"abv"); (5,2,"aad"); (7,3,"aap"); (3,2,"abn"); (7,1,"aat"); (7,2,"aar"); (1,3,"abn"); (5,1,"abo"); (12,1,"ab3"); (12,2,"abx"); (4,1,"aa5"); (12,3,"aau")])
   ```
   matches the pattern ` ([["aai"; "abz"; "abn"]; ["aaz"; "aan"; "aaf"]; ["abt"; "abn"; "abn"]; ["aa5"; "abz"; "aau"]; ["abo"; "aad"; "abv"]; ["abp"; "aag"; "aah"]; ["aat"; "aar"; "aap"]; ["abf"; "abz"; "aay"]; ["abz"; "abk"; "abp"]; ["aan"; "aa4"; "aab"]; ["aad"; "aas"; "aao"]; ["ab3"; "abx"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aai"; "abn"; "abz"]; ["aaf"; "aan"; "aaz"]; ["abn"; "abt"];
 ["aa5"; "aau"; "abz"]; ["aad"; "abo"; "abv"]; ["aag"; "aah"; "abp"];
 ["aap"; "aar"; "aat"]; ["aay"; "abf"; "abz"]; ["abk"; "abp"; "abz"];
 ["aa4"; "aab"; "aan"]; ["aad"; "aao"; "aas"]; ["aau"; "ab3"; "abx"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(6,1,"aah"); (3,3,"aay"); (6,2,"aa4"); (8,1,"aaj"); (2,3,"aaw"); (1,2,"abc"); (1,3,"abb"); (7,1,"abe"); (8,2,"ab3"); (6,3,"aaa"); (2,2,"aaq"); (5,3,"abd"); (5,1,"aab"); (4,3,"abk"); (3,2,"aa5"); (8,3,"abq"); (4,2,"aae"); (7,2,"aa6"); (7,3,"ab7"); (2,1,"abt"); (3,1,"ab7"); (5,2,"aay"); (1,1,"abk"); (4,1,"abh")])
   ```
   matches the pattern ` ([["abk"; "abc"; "abb"]; ["abt"; "aaq"; "aaw"]; ["ab7"; "aa5"; "aay"]; ["abh"; "aae"; "abk"]; ["aab"; "aay"; "abd"]; ["aah"; "aa4"; "aaa"]; ["abe"; "aa6"; "ab7"]; ["aaj"; "ab3"; "abq"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["abb"; "abc"; "abk"]; ["aaq"; "aaw"; "abt"]; ["aa5"; "aay"; "ab7"];
 ["aae"; "abh"; "abk"]; ["aab"; "aay"; "abd"]; ["aa4"; "aaa"; "aah"];
 ["aa6"; "ab7"; "abe"]; ["aaj"; "ab3"; "abq"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(10,5,"abz"); (12,1,"abv"); (12,5,"aag"); (7,6,"abp"); (6,1,"aaq"); (12,6,"abl"); (7,5,"aa2"); (7,3,"aaw"); (5,6,"abp"); (3,5,"aak"); (2,2,"aa6"); (4,5,"aav"); (11,5,"abn"); (5,3,"aas"); (3,4,"abn"); (10,4,"aaj"); (11,4,"aan"); (8,6,"aal"); (11,2,"abb"); (3,3,"abg"); (7,4,"aay"); (1,6,"abb"); (1,3,"abi"); (6,2,"abk"); (9,2,"aba"); (4,2,"aaj"); (4,6,"abz"); (1,4,"abh"); (1,1,"abc"); (9,5,"aag"); (10,1,"aaa"); (4,3,"aae"); (12,3,"ab3"); (2,5,"abr"); (6,5,"abg"); (5,2,"abx"); (11,1,"ab6"); (5,4,"abj"); (5,1,"abk"); (9,3,"abl"); (8,4,"aa7"); (11,3,"aak"); (8,1,"aak"); (5,5,"aak"); (12,2,"abo"); (9,6,"aab"); (6,6,"abv"); (12,4,"abd"); (9,4,"abw"); (11,6,"abu"); (2,6,"aao"); (7,2,"aad"); (10,2,"aa6"); (1,2,"aar"); (2,1,"aag"); (10,3,"abp"); (10,6,"abi"); (2,3,"ab4"); (9,1,"ab3"); (2,4,"aab"); (4,4,"aai"); (3,2,"abw"); (6,3,"aay"); (3,6,"abz"); (4,1,"ab3"); (7,1,"ab3"); (8,3,"abb"); (8,2,"aa4"); (8,5,"aar"); (3,1,"aa7"); (6,4,"abv"); (1,5,"abq")])
   ```
   matches the pattern ` ([["abc"; "aar"; "abi"; "abh"; "abq"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "aak"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "aak"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abg"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "aa2"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aag"; "aab"]; ["aaa"; "aa6"; "abp"; "aaj"; "abz"; "abi"]; ["ab6"; "abb"; "aak"; "aan"; "abn"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "aag"; "abl"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aar"; "abb"; "abc"; "abh"; "abi"; "abq"];
 ["aa6"; "aab"; "aag"; "aao"; "ab4"; "abr"];
 ["aa7"; "aak"; "abg"; "abn"; "abw"; "abz"];
 ["aae"; "aai"; "aaj"; "aav"; "ab3"; "abz"];
 ["aak"; "aas"; "abj"; "abk"; "abp"; "abx"];
 ["aaq"; "aay"; "abg"; "abk"; "abv"];
 ["aa2"; "aad"; "aaw"; "aay"; "ab3"; "abp"];
 ["aa4"; "aa7"; "aak"; "aal"; "aar"; "abb"];
 ["aab"; "aag"; "ab3"; "aba"; "abl"; "abw"];
 ["aa6"; "aaa"; "aaj"; "abi"; "abp"; "abz"];
 ["aak"; "aan"; "ab6"; "abb"; "abn"; "abu"];
 ["aag"; "ab3"; "abd"; "abl"; "abo"; "abv"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,6,"abe"); (10,7,"abv"); (6,6,"aau"); (4,2,"aas"); (2,4,"abw"); (1,4,"aa2"); (3,6,"aa5"); (6,3,"abn"); (7,5,"abg"); (1,5,"aa7"); (2,6,"aa7"); (10,3,"abq"); (6,4,"aae"); (2,5,"aaz"); (3,1,"ab3"); (2,1,"abb"); (4,4,"abb"); (10,5,"abq"); (4,6,"ab3"); (8,4,"abr"); (10,4,"aby"); (4,1,"aa2"); (8,1,"ab5"); (6,2,"abg"); (10,6,"aao"); (2,3,"abj"); (5,3,"aao"); (8,2,"abs"); (3,7,"aab"); (5,1,"aao"); (5,2,"abq"); (4,3,"abf"); (7,1,"aak"); (1,7,"abx"); (1,6,"abg"); (3,4,"aa3"); (8,7,"aaj"); (3,2,"aaj"); (5,4,"aa5"); (4,5,"ab7"); (8,5,"aa4"); (9,3,"aan"); (9,2,"abf"); (2,7,"aav"); (10,1,"abh"); (9,5,"aam"); (1,2,"aao"); (7,6,"abh"); (7,3,"aaw"); (1,1,"abl"); (1,3,"aag"); (6,7,"abz"); (9,7,"aaw"); (3,3,"abh"); (7,7,"aax"); (3,5,"abc"); (6,5,"aaj"); (6,1,"ab6"); (7,4,"abz"); (4,7,"abr"); (9,6,"aaf"); (2,2,"aac"); (9,4,"aak"); (8,6,"abd"); (9,1,"abt"); (8,3,"abc"); (5,5,"aar"); (5,7,"aby"); (7,2,"aae"); (10,2,"aaz")])
   ```
   matches the pattern ` ([["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aak"; "aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abt"; "abf"; "aan"; "aak"; "aam"; "aaf"; "aaw"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa2"; "aa7"; "aag"; "aao"; "abg"; "abl"; "abx"];
 ["aa7"; "aac"; "aav"; "aaz"; "abb"; "abj"; "abw"];
 ["aa3"; "aa5"; "aab"; "aaj"; "ab3"; "abc"; "abh"];
 ["aa2"; "aas"; "ab3"; "ab7"; "abb"; "abf"; "abr"];
 ["aa5"; "aao"; "aar"; "abe"; "abq"; "aby"];
 ["aae"; "aaj"; "aau"; "ab6"; "abg"; "abn"; "abz"];
 ["aae"; "aak"; "aaw"; "aax"; "abg"; "abh"; "abz"];
 ["aa4"; "aaj"; "ab5"; "abc"; "abd"; "abr"; "abs"];
 ["aaf"; "aak"; "aam"; "aan"; "aaw"; "abf"; "abt"];
 ["aao"; "aaz"; "abh"; "abq"; "abv"; "aby"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(8,1,"aa5"); (11,3,"aan"); (9,4,"aa7"); (4,4,"aaz"); (1,2,"aar"); (8,4,"aaa"); (10,2,"aae"); (5,4,"aaa"); (11,1,"aaq"); (6,2,"aaz"); (6,3,"aad"); (12,4,"abo"); (3,3,"abc"); (4,3,"abb"); (8,2,"aas"); (4,2,"aax"); (1,4,"abc"); (2,1,"ab7"); (1,3,"abn"); (4,1,"abw"); (3,4,"ab3"); (5,3,"abf"); (7,4,"aal"); (2,3,"aao"); (7,2,"abc"); (6,4,"abp"); (3,2,"aal"); (6,1,"ab6"); (5,2,"abv"); (2,2,"aa4"); (11,2,"aak"); (9,3,"abd"); (11,4,"aa7"); (2,4,"ab2"); (7,3,"abl"); (3,1,"aak"); (8,3,"abd"); (9,1,"abv"); (12,1,"aa2"); (10,1,"aby"); (10,3,"aak"); (12,3,"aae"); (1,1,"abf"); (12,2,"ab4"); (9,2,"aad"); (7,1,"abj"); (10,4,"ab7"); (5,1,"aa4")])
   ```
   matches the pattern ` ([["abf"; "aar"; "abn"; "abc"]; ["ab7"; "aa4"; "aao"; "ab2"]; ["aak"; "aal"; "abc"; "ab3"]; ["abw"; "aax"; "abb"; "aaz"]; ["aa4"; "abv"; "abf"; "aaa"]; ["ab6"; "aaz"; "aad"; "abp"]; ["abj"; "abc"; "abl"; "aal"]; ["aa5"; "aas"; "abd"; "aaa"]; ["abv"; "aad"; "abd"; "aa7"]; ["aby"; "aae"; "aak"; "ab7"]; ["aaq"; "aak"; "aan"; "aa7"]; ["aa2"; "ab4"; "aae"; "abo"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aar"; "abc"; "abf"; "abn"]; ["aa4"; "aao"; "ab2"; "ab7"];
 ["aak"; "aal"; "ab3"; "abc"]; ["aax"; "aaz"; "abb"; "abw"];
 ["aa4"; "aaa"; "abf"; "abv"]; ["aad"; "aaz"; "ab6"; "abp"];
 ["aal"; "abc"; "abj"; "abl"]; ["aa5"; "aaa"; "aas"; "abd"];
 ["aa7"; "aad"; "abd"; "abv"]; ["aae"; "aak"; "ab7"; "aby"];
 ["aa7"; "aak"; "aan"; "aaq"]; ["aa2"; "aae"; "ab4"; "abo"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(6,3,"abp"); (2,1,"aaj"); (2,3,"aaf"); (3,1,"aaa"); (9,7,"aag"); (6,4,"abj"); (3,6,"abd"); (10,1,"abh"); (1,6,"aax"); (3,3,"aa4"); (2,4,"aas"); (3,4,"aax"); (6,6,"abn"); (1,7,"aap"); (5,7,"abz"); (5,2,"abt"); (9,5,"abb"); (8,2,"abg"); (7,1,"ab6"); (7,4,"aam"); (4,7,"abv"); (2,2,"aaa"); (4,4,"abt"); (5,3,"abz"); (10,7,"aal"); (10,3,"aaz"); (9,2,"aaa"); (10,5,"abi"); (8,7,"aab"); (4,1,"aau"); (4,6,"ab7"); (4,2,"abx"); (1,2,"abm"); (6,2,"aar"); (7,7,"aak"); (5,4,"abz"); (6,7,"abw"); (8,1,"abr"); (3,5,"aas"); (9,3,"aba"); (2,6,"abl"); (9,1,"abq"); (1,1,"aba"); (7,2,"aag"); (4,3,"aar"); (1,5,"abx"); (7,5,"abo"); (10,6,"aau"); (5,5,"abj"); (9,6,"aay"); (5,6,"aam"); (3,7,"aaj"); (8,4,"aah"); (1,3,"abz"); (5,1,"ab4"); (1,4,"aai"); (3,2,"aaf"); (6,5,"abp"); (2,7,"aa3"); (4,5,"aao"); (2,5,"abl"); (8,6,"abv"); (8,3,"aaw"); (7,3,"abi"); (8,5,"abq"); (10,2,"abu"); (7,6,"aav"); (6,1,"abf"); (9,4,"abl"); (10,4,"ab6")])
   ```
   matches the pattern ` ([["aba"; "abm"; "abz"; "aai"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"; "aa3"]; ["aaa"; "aaf"; "aa4"; "aax"; "aas"; "abd"; "aaj"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abl"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"; "aal"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aai"; "aap"; "aax"; "aba"; "abm"; "abx"; "abz"];
 ["aa3"; "aaa"; "aaf"; "aaj"; "aas"; "abl"];
 ["aa4"; "aaa"; "aaf"; "aaj"; "aas"; "aax"; "abd"];
 ["aao"; "aar"; "aau"; "ab7"; "abt"; "abv"; "abx"];
 ["aam"; "ab4"; "abj"; "abt"; "abz"];
 ["aar"; "abf"; "abj"; "abn"; "abp"; "abw"];
 ["aag"; "aak"; "aam"; "aav"; "ab6"; "abi"; "abo"];
 ["aab"; "aah"; "aaw"; "abg"; "abq"; "abr"; "abv"];
 ["aaa"; "aag"; "aay"; "aba"; "abb"; "abl"; "abq"];
 ["aal"; "aau"; "aaz"; "ab6"; "abh"; "abi"; "abu"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,2,"aaa"); (10,2,"aam"); (2,1,"aat"); (1,1,"abt"); (8,3,"abm"); (8,2,"aak"); (6,1,"abl"); (2,2,"abm"); (2,3,"ab7"); (5,1,"abw"); (6,2,"aac"); (9,1,"aav"); (10,3,"abs"); (9,3,"aae"); (10,1,"ab4"); (7,2,"abl"); (4,3,"aav"); (4,1,"abp"); (1,2,"aac"); (3,2,"abx"); (7,3,"abm"); (3,1,"aat"); (8,1,"aau"); (7,1,"aby"); (1,3,"aar"); (5,3,"aa7"); (9,2,"aa4"); (3,3,"ab5"); (6,3,"aa4"); (4,2,"abr")])
   ```
   matches the pattern ` ([["abt"; "aac"; "aar"]; ["aat"; "abm"; "ab7"]; ["aat"; "abx"; "ab5"]; ["abp"; "abr"; "aav"]; ["abw"; "aaa"; "aa7"]; ["abl"; "aac"; "aa4"]; ["aby"; "abl"; "abm"]; ["aau"; "aak"; "abm"]; ["aav"; "aa4"; "aae"]; ["ab4"; "aam"; "abs"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aac"; "aar"; "abt"]; ["aat"; "ab7"; "abm"]; ["aat"; "ab5"; "abx"];
 ["aav"; "abp"; "abr"]; ["aa7"; "aaa"; "abw"]; ["aa4"; "aac"; "abl"];
 ["abl"; "abm"; "aby"]; ["aak"; "aau"; "abm"]; ["aa4"; "aae"; "aav"];
 ["aam"; "ab4"; "abs"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(9,1,"abi"); (4,3,"aas"); (2,7,"abo"); (1,4,"abg"); (7,1,"abq"); (1,3,"abd"); (2,2,"abu"); (8,5,"ab6"); (6,2,"aap"); (6,1,"abk"); (2,3,"aa3"); (8,1,"aay"); (7,7,"aag"); (3,5,"aaj"); (3,3,"aal"); (2,5,"aag"); (7,3,"aae"); (5,3,"abd"); (3,2,"abm"); (4,2,"aab"); (5,4,"abj"); (7,5,"aav"); (8,3,"abv"); (1,2,"aas"); (5,7,"abu"); (9,5,"abl"); (4,7,"aag"); (6,7,"aac"); (3,4,"aba"); (6,5,"abd"); (5,2,"abz"); (9,3,"aaf"); (4,4,"aap"); (5,5,"aa7"); (7,2,"aa3"); (8,2,"aaf"); (6,3,"abw"); (8,7,"aa4"); (8,4,"aap"); (3,1,"ab4"); (1,7,"abn"); (2,1,"aak"); (3,7,"aah"); (1,1,"aam"); (2,4,"abf"); (5,1,"aaf"); (1,5,"aaz"); (9,2,"aas"); (6,4,"aar"); (4,1,"abn"); (9,4,"abk"); (4,5,"aaj"); (7,4,"ab5"); (9,7,"abe")])
   ```
   matches the pattern ` ([["aam"; "aas"; "abd"; "abg"; "aaz"; "abn"]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "abe"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aam"; "aas"; "aaz"; "abd"; "abg"; "abn"];
 ["aa3"; "aag"; "aak"; "abf"; "abo"; "abu"];
 ["aah"; "aaj"; "aal"; "ab4"; "aba"; "abm"];
 ["aab"; "aag"; "aaj"; "aap"; "aas"; "abn"];
 ["aa7"; "aaf"; "abd"; "abj"; "abu"; "abz"];
 ["aac"; "aap"; "aar"; "abd"; "abk"; "abw"];
 ["aa3"; "aae"; "aag"; "aav"; "ab5"; "abq"];
 ["aa4"; "aaf"; "aap"; "aay"; "ab6"; "abv"];
 ["aaf"; "aas"; "abe"; "abi"; "abk"; "abl"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(3,4,"abe"); (1,4,"aau"); (6,1,"abh"); (3,2,"aah"); (3,5,"aag"); (4,1,"aaz"); (10,2,"aai"); (2,2,"aat"); (5,4,"abs"); (9,2,"abb"); (5,1,"aar"); (9,5,"aa5"); (5,5,"ab4"); (10,4,"aav"); (8,2,"aba"); (10,5,"aau"); (7,4,"abv"); (5,2,"aau"); (6,5,"ab4"); (2,4,"ab7"); (6,4,"aaw"); (8,1,"aa4"); (7,1,"abs"); (9,4,"aau"); (9,1,"ab6"); (3,1,"abo"); (1,2,"aaa"); (1,5,"aae"); (7,5,"aao"); (10,1,"abg"); (2,1,"abx"); (6,2,"aax"); (8,4,"aa5"); (4,2,"abt"); (4,4,"aar"); (7,2,"aby"); (4,5,"abs"); (8,5,"aah"); (1,1,"abo"); (2,5,"abe")])
   ```
   matches the pattern ` ([["abo"; "aaa"; "aau"; "aae"]; ["abx"; "aat"; "ab7"; "abe"]; ["abo"; "aah"; "abe"; "aag"]; ["aaz"; "abt"; "aar"; "abs"]; ["aar"; "aau"; "abs"; "ab4"]; ["abh"; "aax"; "aaw"; "ab4"]; ["abs"; "aby"; "abv"; "aao"]; ["aa4"; "aba"; "aa5"; "aah"]; ["ab6"; "abb"; "aau"; "aa5"]; ["abg"; "aai"; "aav"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aaa"; "aae"; "aau"; "abo"]; ["aat"; "ab7"; "abe"; "abx"];
 ["aag"; "aah"; "abe"; "abo"]; ["aar"; "aaz"; "abs"; "abt"];
 ["aar"; "aau"; "ab4"; "abs"]; ["aaw"; "aax"; "ab4"; "abh"];
 ["aao"; "abs"; "abv"; "aby"]; ["aa4"; "aa5"; "aah"; "aba"];
 ["aa5"; "aau"; "ab6"; "abb"]; ["aai"; "aau"; "aav"; "abg"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(4,2,"aa7"); (2,2,"ab3"); (7,4,"abx"); (5,4,"abi"); (4,4,"abs"); (6,2,"aao"); (2,4,"aan"); (1,1,"aav"); (5,1,"aam"); (8,2,"aas"); (8,4,"abn"); (7,1,"abm"); (2,1,"aaz"); (6,1,"aa4"); (1,4,"abc"); (8,1,"abh"); (1,2,"aa3"); (3,2,"abj"); (7,2,"aas"); (3,4,"abi"); (6,4,"aa7"); (5,2,"aah"); (4,1,"aba"); (3,1,"aap")])
   ```
   matches the pattern ` ([["aav"; "aa3"; "abc"]; ["aaz"; "ab3"; "aan"]; ["aap"; "abj"; "abi"]; ["aba"; "aa7"; "abs"]; ["aam"; "aah"; "abi"]; ["aa4"; "aao"; "aa7"]; ["abm"; "aas"; "abx"]; ["abh"; "aas"; "abn"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aa3"; "aav"; "abc"]; ["aan"; "aaz"; "ab3"]; ["aap"; "abi"; "abj"];
 ["aa7"; "aba"; "abs"]; ["aah"; "aam"; "abi"]; ["aa4"; "aa7"; "aao"];
 ["aas"; "abm"; "abx"]; ["aas"; "abh"; "abn"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(1,1,"aai"); (8,3,"aay"); (9,1,"abz"); (2,1,"aaz"); (10,1,"aan"); (11,3,"aao"); (3,1,"abt"); (10,3,"aab"); (2,3,"aaf"); (4,3,"aau"); (8,1,"abf"); (9,3,"abp"); (3,3,"abn"); (11,1,"aad"); (6,3,"aah"); (6,1,"abp"); (5,3,"abv"); (7,3,"aap"); (7,1,"aat"); (1,3,"abn"); (5,1,"abo"); (12,1,"ab3"); (4,1,"aa5"); (12,3,"aau")])
   ```
   matches the pattern ` ([["aai"; "abn"]; ["aaz"; "aaf"]; ["abt"; "abn"]; ["aa5"; "aau"]; ["abo"; "abv"]; ["abp"; "aah"]; ["aat"; "aap"]; ["abf"; "aay"]; ["abz"; "abp"]; ["aan"; "aab"]; ["aad"; "aao"]; ["ab3"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aai"; "abn"]; ["aaf"; "aaz"]; ["abn"; "abt"]; ["aa5"; "aau"];
 ["abo"; "abv"]; ["aah"; "abp"]; ["aap"; "aat"]; ["aay"; "abf"];
 ["abp"; "abz"]; ["aab"; "aan"]; ["aad"; "aao"]; ["aau"; "ab3"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(3,3,"aay"); (6,2,"aa4"); (2,3,"aaw"); (1,2,"abc"); (1,3,"abb"); (8,2,"ab3"); (6,3,"aaa"); (2,2,"aaq"); (5,3,"abd"); (4,3,"abk"); (3,2,"aa5"); (8,3,"abq"); (4,2,"aae"); (7,2,"aa6"); (7,3,"ab7"); (5,2,"aay")])
   ```
   matches the pattern ` ([["abc"; "abb"]; ["aaq"; "aaw"]; ["aa5"; "aay"]; ["aae"; "abk"]; ["aay"; "abd"]; ["aa4"; "aaa"]; ["aa6"; "ab7"]; ["ab3"; "abq"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["abb"; "abc"]; ["aaq"; "aaw"]; ["aa5"; "aay"]; ["aae"; "abk"];
 ["aay"; "abd"]; ["aa4"; "aaa"]; ["aa6"; "ab7"]; ["ab3"; "abq"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(12,1,"abv"); (7,6,"abp"); (6,1,"aaq"); (12,6,"abl"); (7,3,"aaw"); (5,6,"abp"); (2,2,"aa6"); (5,3,"aas"); (3,4,"abn"); (10,4,"aaj"); (11,4,"aan"); (8,6,"aal"); (11,2,"abb"); (3,3,"abg"); (7,4,"aay"); (1,6,"abb"); (1,3,"abi"); (6,2,"abk"); (9,2,"aba"); (4,2,"aaj"); (4,6,"abz"); (1,4,"abh"); (1,1,"abc"); (10,1,"aaa"); (4,3,"aae"); (12,3,"ab3"); (5,2,"abx"); (11,1,"ab6"); (5,4,"abj"); (5,1,"abk"); (9,3,"abl"); (8,4,"aa7"); (11,3,"aak"); (8,1,"aak"); (12,2,"abo"); (9,6,"aab"); (6,6,"abv"); (12,4,"abd"); (9,4,"abw"); (11,6,"abu"); (2,6,"aao"); (7,2,"aad"); (10,2,"aa6"); (1,2,"aar"); (2,1,"aag"); (10,3,"abp"); (10,6,"abi"); (2,3,"ab4"); (9,1,"ab3"); (2,4,"aab"); (4,4,"aai"); (3,2,"abw"); (6,3,"aay"); (3,6,"abz"); (4,1,"ab3"); (7,1,"ab3"); (8,3,"abb"); (8,2,"aa4"); (3,1,"aa7"); (6,4,"abv")])
   ```
   matches the pattern ` ([["abc"; "aar"; "abi"; "abh"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aab"]; ["aaa"; "aa6"; "abp"; "aaj"; "abi"]; ["ab6"; "abb"; "aak"; "aan"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "abl"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aar"; "abb"; "abc"; "abh"; "abi"]; ["aa6"; "aab"; "aag"; "aao"; "ab4"];
 ["aa7"; "abg"; "abn"; "abw"; "abz"]; ["aae"; "aai"; "aaj"; "ab3"; "abz"];
 ["aas"; "abj"; "abk"; "abp"; "abx"]; ["aaq"; "aay"; "abk"; "abv"];
 ["aad"; "aaw"; "aay"; "ab3"; "abp"]; ["aa4"; "aa7"; "aak"; "aal"; "abb"];
 ["aab"; "ab3"; "aba"; "abl"; "abw"]; ["aa6"; "aaa"; "aaj"; "abi"; "abp"];
 ["aak"; "aan"; "ab6"; "abb"; "abu"]; ["ab3"; "abd"; "abl"; "abo"; "abv"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,6,"abe"); (10,7,"abv"); (6,6,"aau"); (4,2,"aas"); (2,4,"abw"); (1,4,"aa2"); (3,6,"aa5"); (6,3,"abn"); (7,5,"abg"); (1,5,"aa7"); (2,6,"aa7"); (10,3,"abq"); (6,4,"aae"); (2,5,"aaz"); (4,4,"abb"); (10,5,"abq"); (4,6,"ab3"); (8,4,"abr"); (10,4,"aby"); (6,2,"abg"); (10,6,"aao"); (2,3,"abj"); (5,3,"aao"); (8,2,"abs"); (3,7,"aab"); (5,2,"abq"); (4,3,"abf"); (1,7,"abx"); (1,6,"abg"); (3,4,"aa3"); (8,7,"aaj"); (3,2,"aaj"); (5,4,"aa5"); (4,5,"ab7"); (8,5,"aa4"); (9,3,"aan"); (9,2,"abf"); (2,7,"aav"); (9,5,"aam"); (1,2,"aao"); (7,6,"abh"); (7,3,"aaw"); (1,3,"aag"); (6,7,"abz"); (9,7,"aaw"); (3,3,"abh"); (7,7,"aax"); (3,5,"abc"); (6,5,"aaj"); (7,4,"abz"); (4,7,"abr"); (9,6,"aaf"); (2,2,"aac"); (9,4,"aak"); (8,6,"abd"); (8,3,"abc"); (5,5,"aar"); (5,7,"aby"); (7,2,"aae"); (10,2,"aaz")])
   ```
   matches the pattern ` ([["aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abf"; "aan"; "aak"; "aam"; "aaf"; "aaw"]; ["aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa2"; "aa7"; "aag"; "aao"; "abg"; "abx"];
 ["aa7"; "aac"; "aav"; "aaz"; "abj"; "abw"];
 ["aa3"; "aa5"; "aab"; "aaj"; "abc"; "abh"];
 ["aas"; "ab3"; "ab7"; "abb"; "abf"; "abr"];
 ["aa5"; "aao"; "aar"; "abe"; "abq"; "aby"];
 ["aae"; "aaj"; "aau"; "abg"; "abn"; "abz"];
 ["aae"; "aaw"; "aax"; "abg"; "abh"; "abz"];
 ["aa4"; "aaj"; "abc"; "abd"; "abr"; "abs"];
 ["aaf"; "aak"; "aam"; "aan"; "aaw"; "abf"];
 ["aao"; "aaz"; "abq"; "abv"; "aby"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(8,1,"aa5"); (11,3,"aan"); (9,4,"aa7"); (4,4,"aaz"); (8,4,"aaa"); (5,4,"aaa"); (11,1,"aaq"); (6,3,"aad"); (12,4,"abo"); (3,3,"abc"); (4,3,"abb"); (1,4,"abc"); (2,1,"ab7"); (1,3,"abn"); (4,1,"abw"); (3,4,"ab3"); (5,3,"abf"); (7,4,"aal"); (2,3,"aao"); (6,4,"abp"); (6,1,"ab6"); (9,3,"abd"); (11,4,"aa7"); (2,4,"ab2"); (7,3,"abl"); (3,1,"aak"); (8,3,"abd"); (9,1,"abv"); (12,1,"aa2"); (10,1,"aby"); (10,3,"aak"); (12,3,"aae"); (1,1,"abf"); (7,1,"abj"); (10,4,"ab7"); (5,1,"aa4")])
   ```
   matches the pattern ` ([["abf"; "abn"; "abc"]; ["ab7"; "aao"; "ab2"]; ["aak"; "abc"; "ab3"]; ["abw"; "abb"; "aaz"]; ["aa4"; "abf"; "aaa"]; ["ab6"; "aad"; "abp"]; ["abj"; "abl"; "aal"]; ["aa5"; "abd"; "aaa"]; ["abv"; "abd"; "aa7"]; ["aby"; "aak"; "ab7"]; ["aaq"; "aan"; "aa7"]; ["aa2"; "aae"; "abo"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["abc"; "abf"; "abn"]; ["aao"; "ab2"; "ab7"]; ["aak"; "ab3"; "abc"];
 ["aaz"; "abb"; "abw"]; ["aa4"; "aaa"; "abf"]; ["aad"; "ab6"; "abp"];
 ["aal"; "abj"; "abl"]; ["aa5"; "aaa"; "abd"]; ["aa7"; "abd"; "abv"];
 ["aak"; "ab7"; "aby"]; ["aa7"; "aan"; "aaq"]; ["aa2"; "aae"; "abo"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(6,3,"abp"); (2,1,"aaj"); (2,3,"aaf"); (3,1,"aaa"); (9,7,"aag"); (3,6,"abd"); (10,1,"abh"); (1,6,"aax"); (3,3,"aa4"); (6,6,"abn"); (1,7,"aap"); (5,7,"abz"); (5,2,"abt"); (9,5,"abb"); (8,2,"abg"); (7,1,"ab6"); (4,7,"abv"); (2,2,"aaa"); (5,3,"abz"); (10,7,"aal"); (10,3,"aaz"); (9,2,"aaa"); (10,5,"abi"); (8,7,"aab"); (4,1,"aau"); (4,6,"ab7"); (4,2,"abx"); (1,2,"abm"); (6,2,"aar"); (7,7,"aak"); (6,7,"abw"); (8,1,"abr"); (3,5,"aas"); (9,3,"aba"); (2,6,"abl"); (9,1,"abq"); (1,1,"aba"); (7,2,"aag"); (4,3,"aar"); (1,5,"abx"); (7,5,"abo"); (10,6,"aau"); (5,5,"abj"); (9,6,"aay"); (5,6,"aam"); (3,7,"aaj"); (1,3,"abz"); (5,1,"ab4"); (3,2,"aaf"); (6,5,"abp"); (2,7,"aa3"); (4,5,"aao"); (2,5,"abl"); (8,6,"abv"); (8,3,"aaw"); (7,3,"abi"); (8,5,"abq"); (10,2,"abu"); (7,6,"aav"); (6,1,"abf")])
   ```
   matches the pattern ` ([["aba"; "abm"; "abz"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "abl"; "abl"; "aa3"]; ["aaa"; "aaf"; "aa4"; "aas"; "abd"; "aaj"]; ["aau"; "abx"; "aar"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "abi"; "aau"; "aal"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aap"; "aax"; "aba"; "abm"; "abx"; "abz"];
 ["aa3"; "aaa"; "aaf"; "aaj"; "abl"];
 ["aa4"; "aaa"; "aaf"; "aaj"; "aas"; "abd"];
 ["aao"; "aar"; "aau"; "ab7"; "abv"; "abx"];
 ["aam"; "ab4"; "abj"; "abt"; "abz"]; ["aar"; "abf"; "abn"; "abp"; "abw"];
 ["aag"; "aak"; "aav"; "ab6"; "abi"; "abo"];
 ["aab"; "aaw"; "abg"; "abq"; "abr"; "abv"];
 ["aaa"; "aag"; "aay"; "aba"; "abb"; "abq"];
 ["aal"; "aau"; "aaz"; "abh"; "abi"; "abu"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,2,"aaa"); (10,2,"aam"); (8,3,"abm"); (8,2,"aak"); (2,2,"abm"); (2,3,"ab7"); (6,2,"aac"); (10,3,"abs"); (9,3,"aae"); (7,2,"abl"); (4,3,"aav"); (1,2,"aac"); (3,2,"abx"); (7,3,"abm"); (1,3,"aar"); (5,3,"aa7"); (9,2,"aa4"); (3,3,"ab5"); (6,3,"aa4"); (4,2,"abr")])
   ```
   matches the pattern ` ([["aac"; "aar"]; ["abm"; "ab7"]; ["abx"; "ab5"]; ["abr"; "aav"]; ["aaa"; "aa7"]; ["aac"; "aa4"]; ["abl"; "abm"]; ["aak"; "abm"]; ["aa4"; "aae"]; ["aam"; "abs"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aac"; "aar"]; ["ab7"; "abm"]; ["ab5"; "abx"]; ["aav"; "abr"];
 ["aa7"; "aaa"]; ["aa4"; "aac"]; ["abl"; "abm"]; ["aak"; "abm"];
 ["aa4"; "aae"]; ["aam"; "abs"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(9,1,"abi"); (4,3,"aas"); (2,7,"abo"); (7,1,"abq"); (5,6,"aak"); (2,2,"abu"); (8,5,"ab6"); (6,2,"aap"); (6,1,"abk"); (2,3,"aa3"); (8,1,"aay"); (7,7,"aag"); (3,6,"abr"); (3,5,"aaj"); (3,3,"aal"); (2,5,"aag"); (7,3,"aae"); (5,3,"abd"); (3,2,"abm"); (4,2,"aab"); (5,4,"abj"); (7,5,"aav"); (8,3,"abv"); (8,6,"abr"); (5,7,"abu"); (9,6,"aad"); (7,6,"abt"); (9,5,"abl"); (4,7,"aag"); (6,7,"aac"); (3,4,"aba"); (6,5,"abd"); (5,2,"abz"); (9,3,"aaf"); (4,4,"aap"); (5,5,"aa7"); (7,2,"aa3"); (8,2,"aaf"); (6,3,"abw"); (8,7,"aa4"); (8,4,"aap"); (3,1,"ab4"); (2,1,"aak"); (3,7,"aah"); (4,6,"abw"); (2,4,"abf"); (6,6,"abb"); (5,1,"aaf"); (9,2,"aas"); (6,4,"aar"); (4,1,"abn"); (9,4,"abk"); (4,5,"aaj"); (2,6,"abo"); (7,4,"ab5"); (9,7,"abe")])
   ```
   matches the pattern ` ([["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"; "abe"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa3"; "aag"; "abf"; "abo"; "abu"];
 ["aah"; "aaj"; "aal"; "ab4"; "aba"; "abm"; "abr"];
 ["aab"; "aag"; "aaj"; "aap"; "aas"; "abn"; "abw"];
 ["aa7"; "aaf"; "aak"; "abd"; "abj"; "abu"; "abz"];
 ["aac"; "aap"; "aar"; "abb"; "abd"; "abk"; "abw"];
 ["aa3"; "aae"; "aag"; "aav"; "ab5"; "abq"; "abt"];
 ["aa4"; "aaf"; "aap"; "aay"; "ab6"; "abr"; "abv"];
 ["aad"; "aaf"; "aas"; "abe"; "abi"; "abk"; "abl"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(3,4,"abe"); (1,4,"aau"); (6,1,"abh"); (2,3,"aby"); (3,2,"aah"); (6,3,"aan"); (1,3,"aby"); (3,5,"aag"); (4,1,"aaz"); (10,2,"aai"); (2,2,"aat"); (5,4,"abs"); (5,1,"aar"); (5,5,"ab4"); (10,4,"aav"); (10,3,"aam"); (8,2,"aba"); (10,5,"aau"); (7,3,"abo"); (7,4,"abv"); (5,2,"aau"); (6,5,"ab4"); (3,3,"aab"); (2,4,"ab7"); (6,4,"aaw"); (8,1,"aa4"); (4,3,"aam"); (7,1,"abs"); (5,3,"abt"); (3,1,"abo"); (1,2,"aaa"); (1,5,"aae"); (7,5,"aao"); (10,1,"abg"); (2,1,"abx"); (6,2,"aax"); (8,3,"aai"); (8,4,"aa5"); (4,2,"abt"); (4,4,"aar"); (7,2,"aby"); (4,5,"abs"); (8,5,"aah"); (1,1,"abo"); (2,5,"abe")])
   ```
   matches the pattern ` ([["abo"; "aaa"; "aby"; "aau"; "aae"]; ["abx"; "aat"; "aby"; "ab7"; "abe"]; ["abo"; "aah"; "aab"; "abe"; "aag"]; ["aaz"; "abt"; "aam"; "aar"; "abs"]; ["aar"; "aau"; "abt"; "abs"; "ab4"]; ["abh"; "aax"; "aan"; "aaw"; "ab4"]; ["abs"; "aby"; "abo"; "abv"; "aao"]; ["aa4"; "aba"; "aai"; "aa5"; "aah"]; ["abg"; "aai"; "aam"; "aav"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aaa"; "aae"; "aau"; "abo"; "aby"]; ["aat"; "ab7"; "abe"; "abx"; "aby"];
 ["aab"; "aag"; "aah"; "abe"; "abo"]; ["aam"; "aar"; "aaz"; "abs"; "abt"];
 ["aar"; "aau"; "ab4"; "abs"; "abt"]; ["aan"; "aaw"; "aax"; "ab4"; "abh"];
 ["aao"; "abo"; "abs"; "abv"; "aby"]; ["aa4"; "aa5"; "aah"; "aai"; "aba"];
 ["aai"; "aam"; "aau"; "aav"; "abg"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(4,2,"aa7"); (2,2,"ab3"); (3,3,"ab3"); (7,4,"abx"); (4,4,"abs"); (6,2,"aao"); (2,4,"aan"); (1,1,"aav"); (8,2,"aas"); (8,4,"abn"); (7,1,"abm"); (8,3,"ab4"); (2,1,"aaz"); (6,1,"aa4"); (1,4,"abc"); (1,3,"abv"); (8,1,"abh"); (1,2,"aa3"); (3,2,"abj"); (7,2,"aas"); (3,4,"abi"); (6,4,"aa7"); (4,1,"aba"); (7,3,"aat"); (6,3,"aar"); (3,1,"aap"); (2,3,"abn"); (4,3,"aat")])
   ```
   matches the pattern ` ([["aav"; "aa3"; "abv"; "abc"]; ["aaz"; "ab3"; "abn"; "aan"]; ["aap"; "abj"; "ab3"; "abi"]; ["aba"; "aa7"; "aat"; "abs"]; ["aa4"; "aao"; "aar"; "aa7"]; ["abm"; "aas"; "aat"; "abx"]; ["abh"; "aas"; "ab4"; "abn"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aa3"; "aav"; "abc"; "abv"]; ["aan"; "aaz"; "ab3"; "abn"];
 ["aap"; "ab3"; "abi"; "abj"]; ["aa7"; "aat"; "aba"; "abs"];
 ["aa4"; "aa7"; "aao"; "aar"]; ["aas"; "aat"; "abm"; "abx"];
 ["aas"; "ab4"; "abh"; "abn"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(1,1,"aai"); (8,3,"aay"); (9,1,"abz"); (2,1,"aaz"); (11,3,"aao"); (3,1,"abt"); (1,2,"abz"); (2,3,"aaf"); (4,3,"aau"); (8,1,"abf"); (11,2,"aas"); (9,3,"abp"); (3,3,"abn"); (11,1,"aad"); (9,2,"abk"); (6,3,"aah"); (8,2,"abz"); (2,2,"aan"); (4,2,"abz"); (6,1,"abp"); (6,2,"aag"); (5,3,"abv"); (5,2,"aad"); (7,3,"aap"); (3,2,"abn"); (7,1,"aat"); (7,2,"aar"); (1,3,"abn"); (5,1,"abo"); (12,1,"ab3"); (12,2,"abx"); (4,1,"aa5"); (12,3,"aau")])
   ```
   matches the pattern ` ([["aai"; "abz"; "abn"]; ["aaz"; "aan"; "aaf"]; ["abt"; "abn"; "abn"]; ["aa5"; "abz"; "aau"]; ["abo"; "aad"; "abv"]; ["abp"; "aag"; "aah"]; ["aat"; "aar"; "aap"]; ["abf"; "abz"; "aay"]; ["abz"; "abk"; "abp"]; ["aad"; "aas"; "aao"]; ["ab3"; "abx"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aai"; "abn"; "abz"]; ["aaf"; "aan"; "aaz"]; ["abn"; "abt"];
 ["aa5"; "aau"; "abz"]; ["aad"; "abo"; "abv"]; ["aag"; "aah"; "abp"];
 ["aap"; "aar"; "aat"]; ["aay"; "abf"; "abz"]; ["abk"; "abp"; "abz"];
 ["aad"; "aao"; "aas"]; ["aau"; "ab3"; "abx"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(6,1,"aah"); (3,3,"aay"); (6,2,"aa4"); (8,1,"aaj"); (2,3,"aaw"); (1,2,"abc"); (1,3,"abb"); (7,1,"abe"); (8,2,"ab3"); (6,3,"aaa"); (2,2,"aaq"); (5,3,"abd"); (5,1,"aab"); (3,2,"aa5"); (8,3,"abq"); (7,2,"aa6"); (7,3,"ab7"); (2,1,"abt"); (3,1,"ab7"); (5,2,"aay"); (1,1,"abk")])
   ```
   matches the pattern ` ([["abk"; "abc"; "abb"]; ["abt"; "aaq"; "aaw"]; ["ab7"; "aa5"; "aay"]; ["aab"; "aay"; "abd"]; ["aah"; "aa4"; "aaa"]; ["abe"; "aa6"; "ab7"]; ["aaj"; "ab3"; "abq"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["abb"; "abc"; "abk"]; ["aaq"; "aaw"; "abt"]; ["aa5"; "aay"; "ab7"];
 ["aab"; "aay"; "abd"]; ["aa4"; "aaa"; "aah"]; ["aa6"; "ab7"; "abe"];
 ["aaj"; "ab3"; "abq"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(12,1,"abv"); (12,5,"aag"); (7,6,"abp"); (6,1,"aaq"); (12,6,"abl"); (7,5,"aa2"); (7,3,"aaw"); (5,6,"abp"); (3,5,"aak"); (2,2,"aa6"); (4,5,"aav"); (11,5,"abn"); (5,3,"aas"); (3,4,"abn"); (11,4,"aan"); (8,6,"aal"); (11,2,"abb"); (3,3,"abg"); (7,4,"aay"); (1,6,"abb"); (1,3,"abi"); (6,2,"abk"); (9,2,"aba"); (4,2,"aaj"); (4,6,"abz"); (1,4,"abh"); (1,1,"abc"); (9,5,"aag"); (4,3,"aae"); (12,3,"ab3"); (2,5,"abr"); (6,5,"abg"); (5,2,"abx"); (11,1,"ab6"); (5,4,"abj"); (5,1,"abk"); (9,3,"abl"); (8,4,"aa7"); (11,3,"aak"); (8,1,"aak"); (5,5,"aak"); (12,2,"abo"); (9,6,"aab"); (6,6,"abv"); (12,4,"abd"); (9,4,"abw"); (11,6,"abu"); (2,6,"aao"); (7,2,"aad"); (1,2,"aar"); (2,1,"aag"); (2,3,"ab4"); (9,1,"ab3"); (2,4,"aab"); (4,4,"aai"); (3,2,"abw"); (6,3,"aay"); (3,6,"abz"); (4,1,"ab3"); (7,1,"ab3"); (8,3,"abb"); (8,2,"aa4"); (8,5,"aar"); (3,1,"aa7"); (6,4,"abv"); (1,5,"abq")])
   ```
   matches the pattern ` ([["abc"; "aar"; "abi"; "abh"; "abq"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "aak"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "aak"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abg"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "aa2"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aag"; "aab"]; ["ab6"; "abb"; "aak"; "aan"; "abn"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "aag"; "abl"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aar"; "abb"; "abc"; "abh"; "abi"; "abq"];
 ["aa6"; "aab"; "aag"; "aao"; "ab4"; "abr"];
 ["aa7"; "aak"; "abg"; "abn"; "abw"; "abz"];
 ["aae"; "aai"; "aaj"; "aav"; "ab3"; "abz"];
 ["aak"; "aas"; "abj"; "abk"; "abp"; "abx"];
 ["aaq"; "aay"; "abg"; "abk"; "abv"];
 ["aa2"; "aad"; "aaw"; "aay"; "ab3"; "abp"];
 ["aa4"; "aa7"; "aak"; "aal"; "aar"; "abb"];
 ["aab"; "aag"; "ab3"; "aba"; "abl"; "abw"];
 ["aak"; "aan"; "ab6"; "abb"; "abn"; "abu"];
 ["aag"; "ab3"; "abd"; "abl"; "abo"; "abv"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,6,"abe"); (10,7,"abv"); (6,6,"aau"); (4,2,"aas"); (2,4,"abw"); (1,4,"aa2"); (3,6,"aa5"); (6,3,"abn"); (7,5,"abg"); (1,5,"aa7"); (2,6,"aa7"); (10,3,"abq"); (6,4,"aae"); (2,5,"aaz"); (3,1,"ab3"); (2,1,"abb"); (4,4,"abb"); (10,5,"abq"); (4,6,"ab3"); (8,4,"abr"); (10,4,"aby"); (4,1,"aa2"); (8,1,"ab5"); (6,2,"abg"); (10,6,"aao"); (2,3,"abj"); (5,3,"aao"); (8,2,"abs"); (3,7,"aab"); (5,1,"aao"); (5,2,"abq"); (4,3,"abf"); (7,1,"aak"); (1,7,"abx"); (1,6,"abg"); (3,4,"aa3"); (8,7,"aaj"); (3,2,"aaj"); (5,4,"aa5"); (4,5,"ab7"); (8,5,"aa4"); (2,7,"aav"); (10,1,"abh"); (1,2,"aao"); (7,6,"abh"); (7,3,"aaw"); (1,1,"abl"); (1,3,"aag"); (6,7,"abz"); (3,3,"abh"); (7,7,"aax"); (3,5,"abc"); (6,5,"aaj"); (6,1,"ab6"); (7,4,"abz"); (4,7,"abr"); (2,2,"aac"); (8,6,"abd"); (8,3,"abc"); (5,5,"aar"); (5,7,"aby"); (7,2,"aae"); (10,2,"aaz")])
   ```
   matches the pattern ` ([["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aak"; "aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa2"; "aa7"; "aag"; "aao"; "abg"; "abl"; "abx"];
 ["aa7"; "aac"; "aav"; "aaz"; "abb"; "abj"; "abw"];
 ["aa3"; "aa5"; "aab"; "aaj"; "ab3"; "abc"; "abh"];
 ["aa2"; "aas"; "ab3"; "ab7"; "abb"; "abf"; "abr"];
 ["aa5"; "aao"; "aar"; "abe"; "abq"; "aby"];
 ["aae"; "aaj"; "aau"; "ab6"; "abg"; "abn"; "abz"];
 ["aae"; "aak"; "aaw"; "aax"; "abg"; "abh"; "abz"];
 ["aa4"; "aaj"; "ab5"; "abc"; "abd"; "abr"; "abs"];
 ["aao"; "aaz"; "abh"; "abq"; "abv"; "aby"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(8,1,"aa5"); (9,4,"aa7"); (4,4,"aaz"); (1,2,"aar"); (8,4,"aaa"); (10,2,"aae"); (5,4,"aaa"); (6,2,"aaz"); (6,3,"aad"); (12,4,"abo"); (3,3,"abc"); (4,3,"abb"); (8,2,"aas"); (4,2,"aax"); (1,4,"abc"); (2,1,"ab7"); (1,3,"abn"); (4,1,"abw"); (3,4,"ab3"); (5,3,"abf"); (7,4,"aal"); (2,3,"aao"); (7,2,"abc"); (6,4,"abp"); (3,2,"aal"); (6,1,"ab6"); (5,2,"abv"); (2,2,"aa4"); (9,3,"abd"); (2,4,"ab2"); (7,3,"abl"); (3,1,"aak"); (8,3,"abd"); (9,1,"abv"); (12,1,"aa2"); (10,1,"aby"); (10,3,"aak"); (12,3,"aae"); (1,1,"abf"); (12,2,"ab4"); (9,2,"aad"); (7,1,"abj"); (10,4,"ab7"); (5,1,"aa4")])
   ```
   matches the pattern ` ([["abf"; "aar"; "abn"; "abc"]; ["ab7"; "aa4"; "aao"; "ab2"]; ["aak"; "aal"; "abc"; "ab3"]; ["abw"; "aax"; "abb"; "aaz"]; ["aa4"; "abv"; "abf"; "aaa"]; ["ab6"; "aaz"; "aad"; "abp"]; ["abj"; "abc"; "abl"; "aal"]; ["aa5"; "aas"; "abd"; "aaa"]; ["abv"; "aad"; "abd"; "aa7"]; ["aby"; "aae"; "aak"; "ab7"]; ["aa2"; "ab4"; "aae"; "abo"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aar"; "abc"; "abf"; "abn"]; ["aa4"; "aao"; "ab2"; "ab7"];
 ["aak"; "aal"; "ab3"; "abc"]; ["aax"; "aaz"; "abb"; "abw"];
 ["aa4"; "aaa"; "abf"; "abv"]; ["aad"; "aaz"; "ab6"; "abp"];
 ["aal"; "abc"; "abj"; "abl"]; ["aa5"; "aaa"; "aas"; "abd"];
 ["aa7"; "aad"; "abd"; "abv"]; ["aae"; "aak"; "ab7"; "aby"];
 ["aa2"; "aae"; "ab4"; "abo"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(6,3,"abp"); (2,1,"aaj"); (2,3,"aaf"); (9,7,"aag"); (6,4,"abj"); (10,1,"abh"); (1,6,"aax"); (2,4,"aas"); (6,6,"abn"); (1,7,"aap"); (5,7,"abz"); (5,2,"abt"); (9,5,"abb"); (8,2,"abg"); (7,1,"ab6"); (7,4,"aam"); (4,7,"abv"); (2,2,"aaa"); (4,4,"abt"); (5,3,"abz"); (10,7,"aal"); (10,3,"aaz"); (9,2,"aaa"); (10,5,"abi"); (8,7,"aab"); (4,1,"aau"); (4,6,"ab7"); (4,2,"abx"); (1,2,"abm"); (6,2,"aar"); (7,7,"aak"); (5,4,"abz"); (6,7,"abw"); (8,1,"abr"); (9,3,"aba"); (2,6,"abl"); (9,1,"abq"); (1,1,"aba"); (7,2,"aag"); (4,3,"aar"); (1,5,"abx"); (7,5,"abo"); (10,6,"aau"); (5,5,"abj"); (9,6,"aay"); (5,6,"aam"); (8,4,"aah"); (1,3,"abz"); (5,1,"ab4"); (1,4,"aai"); (6,5,"abp"); (2,7,"aa3"); (4,5,"aao"); (2,5,"abl"); (8,6,"abv"); (8,3,"aaw"); (7,3,"abi"); (8,5,"abq"); (10,2,"abu"); (7,6,"aav"); (6,1,"abf"); (9,4,"abl"); (10,4,"ab6")])
   ```
   matches the pattern ` ([["aba"; "abm"; "abz"; "aai"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"; "aa3"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abl"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"; "aal"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aai"; "aap"; "aax"; "aba"; "abm"; "abx"; "abz"];
 ["aa3"; "aaa"; "aaf"; "aaj"; "aas"; "abl"];
 ["aao"; "aar"; "aau"; "ab7"; "abt"; "abv"; "abx"];
 ["aam"; "ab4"; "abj"; "abt"; "abz"];
 ["aar"; "abf"; "abj"; "abn"; "abp"; "abw"];
 ["aag"; "aak"; "aam"; "aav"; "ab6"; "abi"; "abo"];
 ["aab"; "aah"; "aaw"; "abg"; "abq"; "abr"; "abv"];
 ["aaa"; "aag"; "aay"; "aba"; "abb"; "abl"; "abq"];
 ["aal"; "aau"; "aaz"; "ab6"; "abh"; "abi"; "abu"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,2,"aaa"); (10,2,"aam"); (2,1,"aat"); (1,1,"abt"); (8,3,"abm"); (8,2,"aak"); (6,1,"abl"); (2,2,"abm"); (2,3,"ab7"); (5,1,"abw"); (6,2,"aac"); (9,1,"aav"); (10,3,"abs"); (9,3,"aae"); (10,1,"ab4"); (7,2,"abl"); (1,2,"aac"); (3,2,"abx"); (7,3,"abm"); (3,1,"aat"); (8,1,"aau"); (7,1,"aby"); (1,3,"aar"); (5,3,"aa7"); (9,2,"aa4"); (3,3,"ab5"); (6,3,"aa4")])
   ```
   matches the pattern ` ([["abt"; "aac"; "aar"]; ["aat"; "abm"; "ab7"]; ["aat"; "abx"; "ab5"]; ["abw"; "aaa"; "aa7"]; ["abl"; "aac"; "aa4"]; ["aby"; "abl"; "abm"]; ["aau"; "aak"; "abm"]; ["aav"; "aa4"; "aae"]; ["ab4"; "aam"; "abs"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aac"; "aar"; "abt"]; ["aat"; "ab7"; "abm"]; ["aat"; "ab5"; "abx"];
 ["aa7"; "aaa"; "abw"]; ["aa4"; "aac"; "abl"]; ["abl"; "abm"; "aby"];
 ["aak"; "aau"; "abm"]; ["aa4"; "aae"; "aav"]; ["aam"; "ab4"; "abs"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(9,1,"abi"); (4,3,"aas"); (2,7,"abo"); (7,1,"abq"); (2,2,"abu"); (8,5,"ab6"); (6,2,"aap"); (6,1,"abk"); (2,3,"aa3"); (8,1,"aay"); (7,7,"aag"); (3,5,"aaj"); (3,3,"aal"); (2,5,"aag"); (7,3,"aae"); (5,3,"abd"); (3,2,"abm"); (4,2,"aab"); (5,4,"abj"); (7,5,"aav"); (8,3,"abv"); (5,7,"abu"); (9,5,"abl"); (4,7,"aag"); (6,7,"aac"); (3,4,"aba"); (6,5,"abd"); (5,2,"abz"); (9,3,"aaf"); (4,4,"aap"); (5,5,"aa7"); (7,2,"aa3"); (8,2,"aaf"); (6,3,"abw"); (8,7,"aa4"); (8,4,"aap"); (3,1,"ab4"); (2,1,"aak"); (3,7,"aah"); (2,4,"abf"); (5,1,"aaf"); (9,2,"aas"); (6,4,"aar"); (4,1,"abn"); (9,4,"abk"); (4,5,"aaj"); (7,4,"ab5"); (9,7,"abe")])
   ```
   matches the pattern ` ([["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "abe"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa3"; "aag"; "abf"; "abo"; "abu"];
 ["aah"; "aaj"; "aal"; "ab4"; "aba"; "abm"];
 ["aab"; "aag"; "aaj"; "aap"; "aas"; "abn"];
 ["aa7"; "aaf"; "abd"; "abj"; "abu"; "abz"];
 ["aac"; "aap"; "aar"; "abd"; "abk"; "abw"];
 ["aa3"; "aae"; "aag"; "aav"; "ab5"; "abq"];
 ["aa4"; "aaf"; "aap"; "aay"; "ab6"; "abv"];
 ["aaf"; "aas"; "abe"; "abi"; "abk"; "abl"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(3,4,"abe"); (1,4,"aau"); (6,1,"abh"); (3,2,"aah"); (3,5,"aag"); (4,1,"aaz"); (10,2,"aai"); (2,2,"aat"); (5,4,"abs"); (5,1,"aar"); (5,5,"ab4"); (10,4,"aav"); (8,2,"aba"); (10,5,"aau"); (7,4,"abv"); (5,2,"aau"); (6,5,"ab4"); (2,4,"ab7"); (6,4,"aaw"); (8,1,"aa4"); (7,1,"abs"); (3,1,"abo"); (1,2,"aaa"); (1,5,"aae"); (7,5,"aao"); (10,1,"abg"); (2,1,"abx"); (6,2,"aax"); (8,4,"aa5"); (4,2,"abt"); (4,4,"aar"); (7,2,"aby"); (4,5,"abs"); (8,5,"aah"); (1,1,"abo"); (2,5,"abe")])
   ```
   matches the pattern ` ([["abo"; "aaa"; "aau"; "aae"]; ["abx"; "aat"; "ab7"; "abe"]; ["abo"; "aah"; "abe"; "aag"]; ["aaz"; "abt"; "aar"; "abs"]; ["aar"; "aau"; "abs"; "ab4"]; ["abh"; "aax"; "aaw"; "ab4"]; ["abs"; "aby"; "abv"; "aao"]; ["aa4"; "aba"; "aa5"; "aah"]; ["abg"; "aai"; "aav"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aaa"; "aae"; "aau"; "abo"]; ["aat"; "ab7"; "abe"; "abx"];
 ["aag"; "aah"; "abe"; "abo"]; ["aar"; "aaz"; "abs"; "abt"];
 ["aar"; "aau"; "ab4"; "abs"]; ["aaw"; "aax"; "ab4"; "abh"];
 ["aao"; "abs"; "abv"; "aby"]; ["aa4"; "aa5"; "aah"; "aba"];
 ["aai"; "aau"; "aav"; "abg"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(4,2,"aa7"); (2,2,"ab3"); (7,4,"abx"); (4,4,"abs"); (6,2,"aao"); (2,4,"aan"); (1,1,"aav"); (8,2,"aas"); (8,4,"abn"); (7,1,"abm"); (2,1,"aaz"); (6,1,"aa4"); (1,4,"abc"); (8,1,"abh"); (1,2,"aa3"); (3,2,"abj"); (7,2,"aas"); (3,4,"abi"); (6,4,"aa7"); (4,1,"aba"); (3,1,"aap")])
   ```
   matches the pattern ` ([["aav"; "aa3"; "abc"]; ["aaz"; "ab3"; "aan"]; ["aap"; "abj"; "abi"]; ["aba"; "aa7"; "abs"]; ["aa4"; "aao"; "aa7"]; ["abm"; "aas"; "abx"]; ["abh"; "aas"; "abn"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aa3"; "aav"; "abc"]; ["aan"; "aaz"; "ab3"]; ["aap"; "abi"; "abj"];
 ["aa7"; "aba"; "abs"]; ["aa4"; "aa7"; "aao"]; ["aas"; "abm"; "abx"];
 ["aas"; "abh"; "abn"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(1,1,"aai"); (8,3,"aay"); (9,1,"abz"); (2,1,"aaz"); (11,3,"aao"); (3,1,"abt"); (2,3,"aaf"); (4,3,"aau"); (8,1,"abf"); (9,3,"abp"); (3,3,"abn"); (11,1,"aad"); (6,3,"aah"); (6,1,"abp"); (5,3,"abv"); (7,3,"aap"); (7,1,"aat"); (1,3,"abn"); (5,1,"abo"); (12,1,"ab3"); (4,1,"aa5"); (12,3,"aau")])
   ```
   matches the pattern ` ([["aai"; "abn"]; ["aaz"; "aaf"]; ["abt"; "abn"]; ["aa5"; "aau"]; ["abo"; "abv"]; ["abp"; "aah"]; ["aat"; "aap"]; ["abf"; "aay"]; ["abz"; "abp"]; ["aad"; "aao"]; ["ab3"; "aau"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aai"; "abn"]; ["aaf"; "aaz"]; ["abn"; "abt"]; ["aa5"; "aau"];
 ["abo"; "abv"]; ["aah"; "abp"]; ["aap"; "aat"]; ["aay"; "abf"];
 ["abp"; "abz"]; ["aad"; "aao"]; ["aau"; "ab3"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(3,3,"aay"); (6,2,"aa4"); (2,3,"aaw"); (1,2,"abc"); (1,3,"abb"); (8,2,"ab3"); (6,3,"aaa"); (2,2,"aaq"); (5,3,"abd"); (3,2,"aa5"); (8,3,"abq"); (7,2,"aa6"); (7,3,"ab7"); (5,2,"aay")])
   ```
   matches the pattern ` ([["abc"; "abb"]; ["aaq"; "aaw"]; ["aa5"; "aay"]; ["aay"; "abd"]; ["aa4"; "aaa"]; ["aa6"; "ab7"]; ["ab3"; "abq"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["abb"; "abc"]; ["aaq"; "aaw"]; ["aa5"; "aay"]; ["aay"; "abd"];
 ["aa4"; "aaa"]; ["aa6"; "ab7"]; ["ab3"; "abq"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(12,1,"abv"); (7,6,"abp"); (6,1,"aaq"); (12,6,"abl"); (7,3,"aaw"); (5,6,"abp"); (2,2,"aa6"); (5,3,"aas"); (3,4,"abn"); (11,4,"aan"); (8,6,"aal"); (11,2,"abb"); (3,3,"abg"); (7,4,"aay"); (1,6,"abb"); (1,3,"abi"); (6,2,"abk"); (9,2,"aba"); (4,2,"aaj"); (4,6,"abz"); (1,4,"abh"); (1,1,"abc"); (4,3,"aae"); (12,3,"ab3"); (5,2,"abx"); (11,1,"ab6"); (5,4,"abj"); (5,1,"abk"); (9,3,"abl"); (8,4,"aa7"); (11,3,"aak"); (8,1,"aak"); (12,2,"abo"); (9,6,"aab"); (6,6,"abv"); (12,4,"abd"); (9,4,"abw"); (11,6,"abu"); (2,6,"aao"); (7,2,"aad"); (1,2,"aar"); (2,1,"aag"); (2,3,"ab4"); (9,1,"ab3"); (2,4,"aab"); (4,4,"aai"); (3,2,"abw"); (6,3,"aay"); (3,6,"abz"); (4,1,"ab3"); (7,1,"ab3"); (8,3,"abb"); (8,2,"aa4"); (3,1,"aa7"); (6,4,"abv")])
   ```
   matches the pattern ` ([["abc"; "aar"; "abi"; "abh"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aab"]; ["ab6"; "abb"; "aak"; "aan"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "abl"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aar"; "abb"; "abc"; "abh"; "abi"]; ["aa6"; "aab"; "aag"; "aao"; "ab4"];
 ["aa7"; "abg"; "abn"; "abw"; "abz"]; ["aae"; "aai"; "aaj"; "ab3"; "abz"];
 ["aas"; "abj"; "abk"; "abp"; "abx"]; ["aaq"; "aay"; "abk"; "abv"];
 ["aad"; "aaw"; "aay"; "ab3"; "abp"]; ["aa4"; "aa7"; "aak"; "aal"; "abb"];
 ["aab"; "ab3"; "aba"; "abl"; "abw"]; ["aak"; "aan"; "ab6"; "abb"; "abu"];
 ["ab3"; "abd"; "abl"; "abo"; "abv"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,6,"abe"); (10,7,"abv"); (6,6,"aau"); (4,2,"aas"); (2,4,"abw"); (1,4,"aa2"); (3,6,"aa5"); (6,3,"abn"); (7,5,"abg"); (1,5,"aa7"); (2,6,"aa7"); (10,3,"abq"); (6,4,"aae"); (2,5,"aaz"); (4,4,"abb"); (10,5,"abq"); (4,6,"ab3"); (8,4,"abr"); (10,4,"aby"); (6,2,"abg"); (10,6,"aao"); (2,3,"abj"); (5,3,"aao"); (8,2,"abs"); (3,7,"aab"); (5,2,"abq"); (4,3,"abf"); (1,7,"abx"); (1,6,"abg"); (3,4,"aa3"); (8,7,"aaj"); (3,2,"aaj"); (5,4,"aa5"); (4,5,"ab7"); (8,5,"aa4"); (2,7,"aav"); (1,2,"aao"); (7,6,"abh"); (7,3,"aaw"); (1,3,"aag"); (6,7,"abz"); (3,3,"abh"); (7,7,"aax"); (3,5,"abc"); (6,5,"aaj"); (7,4,"abz"); (4,7,"abr"); (2,2,"aac"); (8,6,"abd"); (8,3,"abc"); (5,5,"aar"); (5,7,"aby"); (7,2,"aae"); (10,2,"aaz")])
   ```
   matches the pattern ` ([["aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aa2"; "aa7"; "aag"; "aao"; "abg"; "abx"];
 ["aa7"; "aac"; "aav"; "aaz"; "abj"; "abw"];
 ["aa3"; "aa5"; "aab"; "aaj"; "abc"; "abh"];
 ["aas"; "ab3"; "ab7"; "abb"; "abf"; "abr"];
 ["aa5"; "aao"; "aar"; "abe"; "abq"; "aby"];
 ["aae"; "aaj"; "aau"; "abg"; "abn"; "abz"];
 ["aae"; "aaw"; "aax"; "abg"; "abh"; "abz"];
 ["aa4"; "aaj"; "abc"; "abd"; "abr"; "abs"];
 ["aao"; "aaz"; "abq"; "abv"; "aby"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(8,1,"aa5"); (9,4,"aa7"); (4,4,"aaz"); (8,4,"aaa"); (5,4,"aaa"); (6,3,"aad"); (12,4,"abo"); (3,3,"abc"); (4,3,"abb"); (1,4,"abc"); (2,1,"ab7"); (1,3,"abn"); (4,1,"abw"); (3,4,"ab3"); (5,3,"abf"); (7,4,"aal"); (2,3,"aao"); (6,4,"abp"); (6,1,"ab6"); (9,3,"abd"); (2,4,"ab2"); (7,3,"abl"); (3,1,"aak"); (8,3,"abd"); (9,1,"abv"); (12,1,"aa2"); (10,1,"aby"); (10,3,"aak"); (12,3,"aae"); (1,1,"abf"); (7,1,"abj"); (10,4,"ab7"); (5,1,"aa4")])
   ```
   matches the pattern ` ([["abf"; "abn"; "abc"]; ["ab7"; "aao"; "ab2"]; ["aak"; "abc"; "ab3"]; ["abw"; "abb"; "aaz"]; ["aa4"; "abf"; "aaa"]; ["ab6"; "aad"; "abp"]; ["abj"; "abl"; "aal"]; ["aa5"; "abd"; "aaa"]; ["abv"; "abd"; "aa7"]; ["aby"; "aak"; "ab7"]; ["aa2"; "aae"; "abo"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["abc"; "abf"; "abn"]; ["aao"; "ab2"; "ab7"]; ["aak"; "ab3"; "abc"];
 ["aaz"; "abb"; "abw"]; ["aa4"; "aaa"; "abf"]; ["aad"; "ab6"; "abp"];
 ["aal"; "abj"; "abl"]; ["aa5"; "aaa"; "abd"]; ["aa7"; "abd"; "abv"];
 ["aak"; "ab7"; "aby"]; ["aa2"; "aae"; "abo"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(6,3,"abp"); (2,1,"aaj"); (2,3,"aaf"); (9,7,"aag"); (10,1,"abh"); (1,6,"aax"); (6,6,"abn"); (1,7,"aap"); (5,7,"abz"); (5,2,"abt"); (9,5,"abb"); (8,2,"abg"); (7,1,"ab6"); (4,7,"abv"); (2,2,"aaa"); (5,3,"abz"); (10,7,"aal"); (10,3,"aaz"); (9,2,"aaa"); (10,5,"abi"); (8,7,"aab"); (4,1,"aau"); (4,6,"ab7"); (4,2,"abx"); (1,2,"abm"); (6,2,"aar"); (7,7,"aak"); (6,7,"abw"); (8,1,"abr"); (9,3,"aba"); (2,6,"abl"); (9,1,"abq"); (1,1,"aba"); (7,2,"aag"); (4,3,"aar"); (1,5,"abx"); (7,5,"abo"); (10,6,"aau"); (5,5,"abj"); (9,6,"aay"); (5,6,"aam"); (1,3,"abz"); (5,1,"ab4"); (6,5,"abp"); (2,7,"aa3"); (4,5,"aao"); (2,5,"abl"); (8,6,"abv"); (8,3,"aaw"); (7,3,"abi"); (8,5,"abq"); (10,2,"abu"); (7,6,"aav"); (6,1,"abf")])
   ```
   matches the pattern ` ([["aba"; "abm"; "abz"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "abl"; "abl"; "aa3"]; ["aau"; "abx"; "aar"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "abi"; "aau"; "aal"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : string list list =
[["aap"; "aax"; "aba"; "abm"; "abx"; "abz"];
 ["aa3"; "aaa"; "aaf"; "aaj"; "abl"];
 ["aao"; "aar"; "aau"; "ab7"; "abv"; "abx"];
 ["aam"; "ab4"; "abj"; "abt"; "abz"]; ["aar"; "abf"; "abn"; "abp"; "abw"];
 ["aag"; "aak"; "aav"; "ab6"; "abi"; "abo"];
 ["aab"; "aaw"; "abg"; "abq"; "abr"; "abv"];
 ["aaa"; "aag"; "aay"; "aba"; "abb"; "abq"];
 ["aal"; "aau"; "aaz"; "abh"; "abi"; "abu"]]

   ```



+  _0_ / _0.15_ : Fail: 
Check that the result of evaluating
   ```
    (table_of_assoc [(5,2,"aaa"); (10,2,"aam"); (8,3,"abm"); (8,2,"aak"); (2,2,"abm"); (2,3,"ab7"); (6,2,"aac"); (10,3,"abs"); (9,3,"aae"); (7,2,"abl"); (1,2,"aac"); (3,2,"abx"); (7,3,"abm"); (1,3,"aar"); (5,3,"aa7"); (9,2,"aa4"); (3,3,"ab5"); (6,3,"aa4")])
   ```
   matches the pattern ` ([["aac"; "aar"]; ["abm"; "ab7"]; ["abx"; "ab5"]; ["aaa"; "aa7"]; ["aac"; "aa4"]; ["abl"; "abm"]; ["aak"; "abm"]; ["aa4"; "aae"]; ["aam"; "abs"]])`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
- : string list list =
[["aac"; "aar"]; ["ab7"; "abm"]; ["ab5"; "abx"]; ["aa7"; "aaa"];
 ["aa4"; "aac"]; ["abl"; "abm"]; ["aak"; "abm"]; ["aa4"; "aae"];
 ["aam"; "abs"]]

   ```



#### Subtotal: _0_ / _6.0000000000000036_

## Manual tests entered by TA: goelx029

+  _2.2857142857142856_ / _2.2857142857142856_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _2.2857142857142856_ / _2.2857142857142856_ : Pass: Appropriate task decomposition into helper functions

    score: 2 (out of 2)


+  _2.2857142857142856_ / _2.2857142857142856_ : Pass: Uses an appropriate/efficient algorithm

    score: 2 (out of 2)


+  _1.1428571428571428_ / _1.1428571428571428_ : Pass: Correct tail recursion

    score: 1 (out of 1)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _8.0_ / _8.0_

