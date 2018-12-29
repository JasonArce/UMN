## Assessment for HW3 stemlist

Run on October 19, 19:19:15 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that hw3 files compile without errors

## Feedback Tests (total possible value: 1)

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   stemlist ["happiness"; "is"; "happy"]
   ```
   matches the pattern `["happi"; "is"; "happi"]`.

   




#### Subtotal: _1.0_ / _1.0_

## Additional automated tests

+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["stems"; "stemming"; "stemmed"])
   ```
   matches the pattern ` (["stem"; "stem"; "stem"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["fishing"; "fished"; "fisher"])
   ```
   matches the pattern ` (["fish"; "fish"; "fisher"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["argue"; "argued"; "argues"; "arguing"; "argus"])
   ```
   matches the pattern ` (["argu"; "argu"; "argu"; "argu"; "argu"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["running"; "runs"; "runned"; "runly"])
   ```
   matches the pattern ` (["run"; "run"; "run"; "runli"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["alumnus"; "alumni"; "alumna"])
   ```
   matches the pattern ` (["alumnu"; "alumni"; "alumna"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["In"; "linguistic"; "morphology"; "and"; "information"; "retrieval"; "stemming"; "is"; "the"; "process"; "of"; "reducing"; "inflected"; "or"; "sometimes"; "derived"; "words"; "to"; "their"; "word"; "stem"; "base"; "or"; "root"; "form"; "generally"; "a"; "written"; "word"; "form"])
   ```
   matches the pattern ` (["in"; "linguist"; "morphologi"; "and"; "inform"; "retriev"; "stem"; "is"; "the"; "process"; "of"; "reduc"; "inflect"; "or"; "sometim"; "deriv"; "word"; "to"; "their"; "word"; "stem"; "base"; "or"; "root"; "form"; "gener"; ""; "written"; "word"; "form"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["Peter"; "Piper"; "picked"; "a"; "peck"; "of"; "pickled"; "peppers"; "Did"; "Peter"; "Piper"; "pick"; "a"; "peck"; "of"; "pickled"; "peppers"; "If"; "Peter"; "Piper"; "picked"; "a"; "peck"; "of"; "pickled"; "peppers"; "where"; "s"; "the"; "peck"; "of"; "pickled"; "peppers"; "Peter"; "Piper"; "picked"])
   ```
   matches the pattern ` (["peter"; "piper"; "pick"; ""; "peck"; "of"; "pickl"; "pepper"; "did"; "peter"; "piper"; "pick"; ""; "peck"; "of"; "pickl"; "pepper"; "if"; "peter"; "piper"; "pick"; ""; "peck"; "of"; "pickl"; "pepper"; "where"; ""; "the"; "peck"; "of"; "pickl"; "pepper"; "peter"; "piper"; "pick"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["Can"; "you"; "can"; "a"; "can"; "as"; "a"; "canner"; "can"; "can"; "a"; "can"])
   ```
   matches the pattern ` (["can"; "you"; "can"; ""; "can"; "as"; ""; "canner"; "can"; "can"; ""; "can"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["burn"; "burnt"; "burned"])
   ```
   matches the pattern ` (["burn"; "burnt"; "burn"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (stemlist ["work"; "worked"; "working"])
   ```
   matches the pattern ` (["work"; "work"; "work"])`.

   




#### Subtotal: _1.9999999999999998_ / _1.9999999999999998_

## Manual tests entered by TA: goelx029

+  _1_ / _1_ : Pass: Useful comments and indentation

    score: 1 (out of 1)


+  _1_ / _1_ : Pass: Uses an appropriate style (including reuse of previous functions where appropriate) for implementation

    score: 1 (out of 1)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _2_ / _2_

