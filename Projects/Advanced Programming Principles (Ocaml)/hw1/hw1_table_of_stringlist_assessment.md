## Assessment for HW1 table_of_stringlist

Run on September 28, 14:52:21 PM.

+ Pass: Change into directory "hw1".

## Feedback Tests (total possible value: 5)

+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   table_of_stringlist "," ["a"]
   ```
   matches the pattern `[["a"]]`.

   




+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   table_of_stringlist "," ["a,b"]
   ```
   matches the pattern `[["a"; "b"]]`.

   




+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   table_of_stringlist "|" ["a|b|c"; "d"]
   ```
   matches the pattern `[["a";"b";"c"]; ["d"]]`.

   




#### Subtotal: _5.0_ / _5.0_

+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["aam,aas,abd,abg,aaz,aa7,abn";"aak,abu,aa3,abf,aag,abo,abo";"ab4,abm,aal,aba,aaj,abr,aah";"abn,aab,aas,aap,aaj,abw,aag";"aaf,abz,abd,abj,aa7,aak,abu";"abk,aap,abw,aar,abd,abb,aac";"abq,aa3,aae,ab5,aav,abt,aag";"aay,aaf,abv,aap,ab6,abr,aa4";"abi,aas,aaf,abk,abl,aad,abe"])
   ```
   matches the pattern ` ([["aam"; "aas"; "abd"; "abg"; "aaz"; "aa7"; "abn"]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"; "abe"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["aam|aas|abd|abg|aaz|aa7|abn";"aak|abu|aa3|abf|aag|abo|abo";"ab4|abm|aal|aba|aaj|abr|aah";"abn|aab|aas|aap|aaj|abw|aag";"aaf|abz|abd|abj|aa7|aak|abu";"abk|aap|abw|aar|abd|abb|aac";"abq|aa3|aae|ab5|aav|abt|aag";"aay|aaf|abv|aap|ab6|abr|aa4";"abi|aas|aaf|abk|abl|aad|abe"])
   ```
   matches the pattern ` ([["aam"; "aas"; "abd"; "abg"; "aaz"; "aa7"; "abn"]; ["aak"; "abu"; "aa3"; "abf"; "aag"; "abo"; "abo"]; ["ab4"; "abm"; "aal"; "aba"; "aaj"; "abr"; "aah"]; ["abn"; "aab"; "aas"; "aap"; "aaj"; "abw"; "aag"]; ["aaf"; "abz"; "abd"; "abj"; "aa7"; "aak"; "abu"]; ["abk"; "aap"; "abw"; "aar"; "abd"; "abb"; "aac"]; ["abq"; "aa3"; "aae"; "ab5"; "aav"; "abt"; "aag"]; ["aay"; "aaf"; "abv"; "aap"; "ab6"; "abr"; "aa4"]; ["abi"; "aas"; "aaf"; "abk"; "abl"; "aad"; "abe"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["abo,aaa,aby,aau,aae";"abx,aat,aby,ab7,abe";"abo,aah,aab,abe,aag";"aaz,abt,aam,aar,abs";"aar,aau,abt,abs,ab4";"abh,aax,aan,aaw,ab4";"abs,aby,abo,abv,aao";"aa4,aba,aai,aa5,aah";"ab6,abb,abi,aau,aa5";"abg,aai,aam,aav,aau"])
   ```
   matches the pattern ` ([["abo"; "aaa"; "aby"; "aau"; "aae"]; ["abx"; "aat"; "aby"; "ab7"; "abe"]; ["abo"; "aah"; "aab"; "abe"; "aag"]; ["aaz"; "abt"; "aam"; "aar"; "abs"]; ["aar"; "aau"; "abt"; "abs"; "ab4"]; ["abh"; "aax"; "aan"; "aaw"; "ab4"]; ["abs"; "aby"; "abo"; "abv"; "aao"]; ["aa4"; "aba"; "aai"; "aa5"; "aah"]; ["ab6"; "abb"; "abi"; "aau"; "aa5"]; ["abg"; "aai"; "aam"; "aav"; "aau"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["abo|aaa|aby|aau|aae";"abx|aat|aby|ab7|abe";"abo|aah|aab|abe|aag";"aaz|abt|aam|aar|abs";"aar|aau|abt|abs|ab4";"abh|aax|aan|aaw|ab4";"abs|aby|abo|abv|aao";"aa4|aba|aai|aa5|aah";"ab6|abb|abi|aau|aa5";"abg|aai|aam|aav|aau"])
   ```
   matches the pattern ` ([["abo"; "aaa"; "aby"; "aau"; "aae"]; ["abx"; "aat"; "aby"; "ab7"; "abe"]; ["abo"; "aah"; "aab"; "abe"; "aag"]; ["aaz"; "abt"; "aam"; "aar"; "abs"]; ["aar"; "aau"; "abt"; "abs"; "ab4"]; ["abh"; "aax"; "aan"; "aaw"; "ab4"]; ["abs"; "aby"; "abo"; "abv"; "aao"]; ["aa4"; "aba"; "aai"; "aa5"; "aah"]; ["ab6"; "abb"; "abi"; "aau"; "aa5"]; ["abg"; "aai"; "aam"; "aav"; "aau"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["aav,aa3,abv,abc";"aaz,ab3,abn,aan";"aap,abj,ab3,abi";"aba,aa7,aat,abs";"aam,aah,ab3,abi";"aa4,aao,aar,aa7";"abm,aas,aat,abx";"abh,aas,ab4,abn"])
   ```
   matches the pattern ` ([["aav"; "aa3"; "abv"; "abc"]; ["aaz"; "ab3"; "abn"; "aan"]; ["aap"; "abj"; "ab3"; "abi"]; ["aba"; "aa7"; "aat"; "abs"]; ["aam"; "aah"; "ab3"; "abi"]; ["aa4"; "aao"; "aar"; "aa7"]; ["abm"; "aas"; "aat"; "abx"]; ["abh"; "aas"; "ab4"; "abn"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["aav|aa3|abv|abc";"aaz|ab3|abn|aan";"aap|abj|ab3|abi";"aba|aa7|aat|abs";"aam|aah|ab3|abi";"aa4|aao|aar|aa7";"abm|aas|aat|abx";"abh|aas|ab4|abn"])
   ```
   matches the pattern ` ([["aav"; "aa3"; "abv"; "abc"]; ["aaz"; "ab3"; "abn"; "aan"]; ["aap"; "abj"; "ab3"; "abi"]; ["aba"; "aa7"; "aat"; "abs"]; ["aam"; "aah"; "ab3"; "abi"]; ["aa4"; "aao"; "aar"; "aa7"]; ["abm"; "aas"; "aat"; "abx"]; ["abh"; "aas"; "ab4"; "abn"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["aai,abz,abn";"aaz,aan,aaf";"abt,abn,abn";"aa5,abz,aau";"abo,aad,abv";"abp,aag,aah";"aat,aar,aap";"abf,abz,aay";"abz,abk,abp";"aan,aa4,aab";"aad,aas,aao";"ab3,abx,aau"])
   ```
   matches the pattern ` ([["aai"; "abz"; "abn"]; ["aaz"; "aan"; "aaf"]; ["abt"; "abn"; "abn"]; ["aa5"; "abz"; "aau"]; ["abo"; "aad"; "abv"]; ["abp"; "aag"; "aah"]; ["aat"; "aar"; "aap"]; ["abf"; "abz"; "aay"]; ["abz"; "abk"; "abp"]; ["aan"; "aa4"; "aab"]; ["aad"; "aas"; "aao"]; ["ab3"; "abx"; "aau"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["aai|abz|abn";"aaz|aan|aaf";"abt|abn|abn";"aa5|abz|aau";"abo|aad|abv";"abp|aag|aah";"aat|aar|aap";"abf|abz|aay";"abz|abk|abp";"aan|aa4|aab";"aad|aas|aao";"ab3|abx|aau"])
   ```
   matches the pattern ` ([["aai"; "abz"; "abn"]; ["aaz"; "aan"; "aaf"]; ["abt"; "abn"; "abn"]; ["aa5"; "abz"; "aau"]; ["abo"; "aad"; "abv"]; ["abp"; "aag"; "aah"]; ["aat"; "aar"; "aap"]; ["abf"; "abz"; "aay"]; ["abz"; "abk"; "abp"]; ["aan"; "aa4"; "aab"]; ["aad"; "aas"; "aao"]; ["ab3"; "abx"; "aau"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["abk,abc,abb";"abt,aaq,aaw";"ab7,aa5,aay";"abh,aae,abk";"aab,aay,abd";"aah,aa4,aaa";"abe,aa6,ab7";"aaj,ab3,abq"])
   ```
   matches the pattern ` ([["abk"; "abc"; "abb"]; ["abt"; "aaq"; "aaw"]; ["ab7"; "aa5"; "aay"]; ["abh"; "aae"; "abk"]; ["aab"; "aay"; "abd"]; ["aah"; "aa4"; "aaa"]; ["abe"; "aa6"; "ab7"]; ["aaj"; "ab3"; "abq"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["abk|abc|abb";"abt|aaq|aaw";"ab7|aa5|aay";"abh|aae|abk";"aab|aay|abd";"aah|aa4|aaa";"abe|aa6|ab7";"aaj|ab3|abq"])
   ```
   matches the pattern ` ([["abk"; "abc"; "abb"]; ["abt"; "aaq"; "aaw"]; ["ab7"; "aa5"; "aay"]; ["abh"; "aae"; "abk"]; ["aab"; "aay"; "abd"]; ["aah"; "aa4"; "aaa"]; ["abe"; "aa6"; "ab7"]; ["aaj"; "ab3"; "abq"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["abc,aar,abi,abh,abq,abb";"aag,aa6,ab4,aab,abr,aao";"aa7,abw,abg,abn,aak,abz";"ab3,aaj,aae,aai,aav,abz";"abk,abx,aas,abj,aak,abp";"aaq,abk,aay,abv,abg,abv";"ab3,aad,aaw,aay,aa2,abp";"aak,aa4,abb,aa7,aar,aal";"ab3,aba,abl,abw,aag,aab";"aaa,aa6,abp,aaj,abz,abi";"ab6,abb,aak,aan,abn,abu";"abv,abo,ab3,abd,aag,abl"])
   ```
   matches the pattern ` ([["abc"; "aar"; "abi"; "abh"; "abq"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "aak"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "aak"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abg"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "aa2"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aag"; "aab"]; ["aaa"; "aa6"; "abp"; "aaj"; "abz"; "abi"]; ["ab6"; "abb"; "aak"; "aan"; "abn"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "aag"; "abl"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["abc|aar|abi|abh|abq|abb";"aag|aa6|ab4|aab|abr|aao";"aa7|abw|abg|abn|aak|abz";"ab3|aaj|aae|aai|aav|abz";"abk|abx|aas|abj|aak|abp";"aaq|abk|aay|abv|abg|abv";"ab3|aad|aaw|aay|aa2|abp";"aak|aa4|abb|aa7|aar|aal";"ab3|aba|abl|abw|aag|aab";"aaa|aa6|abp|aaj|abz|abi";"ab6|abb|aak|aan|abn|abu";"abv|abo|ab3|abd|aag|abl"])
   ```
   matches the pattern ` ([["abc"; "aar"; "abi"; "abh"; "abq"; "abb"]; ["aag"; "aa6"; "ab4"; "aab"; "abr"; "aao"]; ["aa7"; "abw"; "abg"; "abn"; "aak"; "abz"]; ["ab3"; "aaj"; "aae"; "aai"; "aav"; "abz"]; ["abk"; "abx"; "aas"; "abj"; "aak"; "abp"]; ["aaq"; "abk"; "aay"; "abv"; "abg"; "abv"]; ["ab3"; "aad"; "aaw"; "aay"; "aa2"; "abp"]; ["aak"; "aa4"; "abb"; "aa7"; "aar"; "aal"]; ["ab3"; "aba"; "abl"; "abw"; "aag"; "aab"]; ["aaa"; "aa6"; "abp"; "aaj"; "abz"; "abi"]; ["ab6"; "abb"; "aak"; "aan"; "abn"; "abu"]; ["abv"; "abo"; "ab3"; "abd"; "aag"; "abl"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["abl,aao,aag,aa2,aa7,abg,abx";"abb,aac,abj,abw,aaz,aa7,aav";"ab3,aaj,abh,aa3,abc,aa5,aab";"aa2,aas,abf,abb,ab7,ab3,abr";"aao,abq,aao,aa5,aar,abe,aby";"ab6,abg,abn,aae,aaj,aau,abz";"aak,aae,aaw,abz,abg,abh,aax";"ab5,abs,abc,abr,aa4,abd,aaj";"abt,abf,aan,aak,aam,aaf,aaw";"abh,aaz,abq,aby,abq,aao,abv"])
   ```
   matches the pattern ` ([["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aak"; "aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abt"; "abf"; "aan"; "aak"; "aam"; "aaf"; "aaw"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["abl|aao|aag|aa2|aa7|abg|abx";"abb|aac|abj|abw|aaz|aa7|aav";"ab3|aaj|abh|aa3|abc|aa5|aab";"aa2|aas|abf|abb|ab7|ab3|abr";"aao|abq|aao|aa5|aar|abe|aby";"ab6|abg|abn|aae|aaj|aau|abz";"aak|aae|aaw|abz|abg|abh|aax";"ab5|abs|abc|abr|aa4|abd|aaj";"abt|abf|aan|aak|aam|aaf|aaw";"abh|aaz|abq|aby|abq|aao|abv"])
   ```
   matches the pattern ` ([["abl"; "aao"; "aag"; "aa2"; "aa7"; "abg"; "abx"]; ["abb"; "aac"; "abj"; "abw"; "aaz"; "aa7"; "aav"]; ["ab3"; "aaj"; "abh"; "aa3"; "abc"; "aa5"; "aab"]; ["aa2"; "aas"; "abf"; "abb"; "ab7"; "ab3"; "abr"]; ["aao"; "abq"; "aao"; "aa5"; "aar"; "abe"; "aby"]; ["ab6"; "abg"; "abn"; "aae"; "aaj"; "aau"; "abz"]; ["aak"; "aae"; "aaw"; "abz"; "abg"; "abh"; "aax"]; ["ab5"; "abs"; "abc"; "abr"; "aa4"; "abd"; "aaj"]; ["abt"; "abf"; "aan"; "aak"; "aam"; "aaf"; "aaw"]; ["abh"; "aaz"; "abq"; "aby"; "abq"; "aao"; "abv"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["abf,aar,abn,abc";"ab7,aa4,aao,ab2";"aak,aal,abc,ab3";"abw,aax,abb,aaz";"aa4,abv,abf,aaa";"ab6,aaz,aad,abp";"abj,abc,abl,aal";"aa5,aas,abd,aaa";"abv,aad,abd,aa7";"aby,aae,aak,ab7";"aaq,aak,aan,aa7";"aa2,ab4,aae,abo"])
   ```
   matches the pattern ` ([["abf"; "aar"; "abn"; "abc"]; ["ab7"; "aa4"; "aao"; "ab2"]; ["aak"; "aal"; "abc"; "ab3"]; ["abw"; "aax"; "abb"; "aaz"]; ["aa4"; "abv"; "abf"; "aaa"]; ["ab6"; "aaz"; "aad"; "abp"]; ["abj"; "abc"; "abl"; "aal"]; ["aa5"; "aas"; "abd"; "aaa"]; ["abv"; "aad"; "abd"; "aa7"]; ["aby"; "aae"; "aak"; "ab7"]; ["aaq"; "aak"; "aan"; "aa7"]; ["aa2"; "ab4"; "aae"; "abo"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["abf|aar|abn|abc";"ab7|aa4|aao|ab2";"aak|aal|abc|ab3";"abw|aax|abb|aaz";"aa4|abv|abf|aaa";"ab6|aaz|aad|abp";"abj|abc|abl|aal";"aa5|aas|abd|aaa";"abv|aad|abd|aa7";"aby|aae|aak|ab7";"aaq|aak|aan|aa7";"aa2|ab4|aae|abo"])
   ```
   matches the pattern ` ([["abf"; "aar"; "abn"; "abc"]; ["ab7"; "aa4"; "aao"; "ab2"]; ["aak"; "aal"; "abc"; "ab3"]; ["abw"; "aax"; "abb"; "aaz"]; ["aa4"; "abv"; "abf"; "aaa"]; ["ab6"; "aaz"; "aad"; "abp"]; ["abj"; "abc"; "abl"; "aal"]; ["aa5"; "aas"; "abd"; "aaa"]; ["abv"; "aad"; "abd"; "aa7"]; ["aby"; "aae"; "aak"; "ab7"]; ["aaq"; "aak"; "aan"; "aa7"]; ["aa2"; "ab4"; "aae"; "abo"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["aba,abm,abz,aai,abx,aax,aap";"aaj,aaa,aaf,aas,abl,abl,aa3";"aaa,aaf,aa4,aax,aas,abd,aaj";"aau,abx,aar,abt,aao,ab7,abv";"ab4,abt,abz,abz,abj,aam,abz";"abf,aar,abp,abj,abp,abn,abw";"ab6,aag,abi,aam,abo,aav,aak";"abr,abg,aaw,aah,abq,abv,aab";"abq,aaa,aba,abl,abb,aay,aag";"abh,abu,aaz,ab6,abi,aau,aal"])
   ```
   matches the pattern ` ([["aba"; "abm"; "abz"; "aai"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"; "aa3"]; ["aaa"; "aaf"; "aa4"; "aax"; "aas"; "abd"; "aaj"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abl"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"; "aal"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["aba|abm|abz|aai|abx|aax|aap";"aaj|aaa|aaf|aas|abl|abl|aa3";"aaa|aaf|aa4|aax|aas|abd|aaj";"aau|abx|aar|abt|aao|ab7|abv";"ab4|abt|abz|abz|abj|aam|abz";"abf|aar|abp|abj|abp|abn|abw";"ab6|aag|abi|aam|abo|aav|aak";"abr|abg|aaw|aah|abq|abv|aab";"abq|aaa|aba|abl|abb|aay|aag";"abh|abu|aaz|ab6|abi|aau|aal"])
   ```
   matches the pattern ` ([["aba"; "abm"; "abz"; "aai"; "abx"; "aax"; "aap"]; ["aaj"; "aaa"; "aaf"; "aas"; "abl"; "abl"; "aa3"]; ["aaa"; "aaf"; "aa4"; "aax"; "aas"; "abd"; "aaj"]; ["aau"; "abx"; "aar"; "abt"; "aao"; "ab7"; "abv"]; ["ab4"; "abt"; "abz"; "abz"; "abj"; "aam"; "abz"]; ["abf"; "aar"; "abp"; "abj"; "abp"; "abn"; "abw"]; ["ab6"; "aag"; "abi"; "aam"; "abo"; "aav"; "aak"]; ["abr"; "abg"; "aaw"; "aah"; "abq"; "abv"; "aab"]; ["abq"; "aaa"; "aba"; "abl"; "abb"; "aay"; "aag"]; ["abh"; "abu"; "aaz"; "ab6"; "abi"; "aau"; "aal"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "," ["abt,aac,aar";"aat,abm,ab7";"aat,abx,ab5";"abp,abr,aav";"abw,aaa,aa7";"abl,aac,aa4";"aby,abl,abm";"aau,aak,abm";"aav,aa4,aae";"ab4,aam,abs"])
   ```
   matches the pattern ` ([["abt"; "aac"; "aar"]; ["aat"; "abm"; "ab7"]; ["aat"; "abx"; "ab5"]; ["abp"; "abr"; "aav"]; ["abw"; "aaa"; "aa7"]; ["abl"; "aac"; "aa4"]; ["aby"; "abl"; "abm"]; ["aau"; "aak"; "abm"]; ["aav"; "aa4"; "aae"]; ["ab4"; "aam"; "abs"]])`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (table_of_stringlist "|" ["abt|aac|aar";"aat|abm|ab7";"aat|abx|ab5";"abp|abr|aav";"abw|aaa|aa7";"abl|aac|aa4";"aby|abl|abm";"aau|aak|abm";"aav|aa4|aae";"ab4|aam|abs"])
   ```
   matches the pattern ` ([["abt"; "aac"; "aar"]; ["aat"; "abm"; "ab7"]; ["aat"; "abx"; "ab5"]; ["abp"; "abr"; "aav"]; ["abw"; "aaa"; "aa7"]; ["abl"; "aac"; "aa4"]; ["aby"; "abl"; "abm"]; ["aau"; "aak"; "abm"]; ["aav"; "aa4"; "aae"]; ["ab4"; "aam"; "abs"]])`.

   




#### Subtotal: _5.0_ / _5.0_

## Manual tests entered by TA: larum001

+  _1.4285714285714286_ / _1.4285714285714286_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _1.4285714285714286_ / _1.4285714285714286_ : Pass: Appropriate task decomposition into helper functions

    score: 2 (out of 2)


+  _1.4285714285714286_ / _1.4285714285714286_ : Pass: Uses an appropriate/efficient algorithm

    score: 2 (out of 2)


+  _0.7142857142857143_ / _0.7142857142857143_ : Pass: Correct tail recursion

    score: 1 (out of 1)


+ Pass: Other Stylistic Comments & Feedback

    Great job!

#### Subtotal: _5.0_ / _5.0_

