### Feedback for Exercise set 14

Run on December 10, 16:53:37 PM.

+ Pass: Change into directory "ex14".

+ Pass: Check that file "legalfunctor.md" exists.

+ Pass: Item 1 of list in legalfunctor.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 2 of list in legalfunctor.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 3 of list in legalfunctor.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 4 of list in legalfunctor.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Item 5 of list in legalfunctor.md passes  line 2 is "Legal" and line 3 is not empty  test

+ Pass: Item 6 of list in legalfunctor.md passes  line 2 is "Not legal" and line 3 is not empty test

+ Pass: Check that file "functor-values.md" exists.

+ Pass: Item 1 of list in functor-values.md passes correct type and value test

+ Fail: Item 2 of list in functor-values.md 

+ Pass: Item 3 of list in functor-values.md passes correct type and value test

+ Pass: Item 4 of list in functor-values.md passes correct type and value test

+ Pass: Item 5 of list in functor-values.md passes correct type and value test

+ Pass: Check that file "dict.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   let module DII = EqListDict(struct type k = int type v = int let eq = (=) end) in let d1 = DII.empty in let d2 = DII.add 2 17 d1 in DII.lookup 2 d2
   ```
   matches the pattern `17`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module DSLI = EqListDict(struct type k = string type v = int let eq s1 s2 = String.length s1 = String.length s2 end) in let d = DSLI.add "aa" 42 DSLI.empty in DSLI.lookup "bb" d
   ```
   matches the pattern `42`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (let module NeverDict = EqListDict(struct type k = int type v = int let eq k1 k2 = false end) in let d = NeverDict.add 1 1 NeverDict.empty in NeverDict.lookup 1 d) with Not_found -> (-1)
   ```
   matches the pattern `-1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module M = DefaultDict(struct type k = int type v = int let default = -1 let eq = (=) end) in M.lookup 1 M.empty
   ```
   matches the pattern `(-1)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module M = DefaultDict(struct type k = int type v = string let default = "" let eq = (=) end) in M.lookup 2 (M.add 2 "a" M.empty)
   ```
   matches the pattern `"a"`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module M = DefaultDict(struct type k = int type v = string let default = "" let eq = (=) end) in M.lookup 3 (M.add 2 "a" M.empty)
   ```
   matches the pattern `""`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module E = struct type k = int type v = int let default = (-1) let eq = (=) end in let module D = EqListDict(E) in let module DD = DefaultDictFunctor(E)(D) in DD.lookup 1 DD.empty
   ```
   matches the pattern `(-1)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module E = struct type k = int type v = int let default = (-1) let eq _ _ = false end in let module D = EqListDict(E) in let module DD = DefaultDictFunctor(E)(D) in DD.lookup 1 (DD.add 1 3 DD.empty)
   ```
   matches the pattern `-1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   let module E = struct type k = string type v = string let default = "" let eq s1 s2 = String.lowercase s1 = String.lowercase s2 end in let module D = EqListDict(E) in let module DD = DefaultDictFunctor(E)(D) in DD.lookup "A" (DD.add "a" "yo" DD.empty)
   ```
   matches the pattern `"yo"`.

   




