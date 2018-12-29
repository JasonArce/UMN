## Assessment for HW4 readint (Changes in parser.ml and program1.interp)

Run on November 05, 21:48:56 PM.

+ Pass: Change into directory "hw4".

+ Pass: Check that hw4 files compile without errors

## Feedback Tests (total possible value: 5)

+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: Check that expression `Parser.READ` following file /dev/null has type `Parser.token`

+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   tokenize_string "readint"
   ```
   matches the pattern `READ`.

   




+  _1.6666666666666667_ / _1.6666666666666667_ : Pass: 
Check that the result of evaluating
   ```
   parse_program [READ]
   ```
   matches the pattern `Readint`.

   




#### Subtotal: _5.0_ / _5.0_

## Manual tests entered by TA: larum001

+  _1_ / _1.0_ : Pass:  Is Readint added to the list of token types ?

    score: 1 (out of 1.0)


+  _1_ / _1.0_ : Pass: Is Readint match added to the tokenize_string function ?

    score: 1 (out of 1.0)


+  _2_ / _2.0_ : Pass: Is Readint match added to the parse_program function ?

    score: 2 (out of 2.0)


+  _1_ / _1.0_ : Pass: Are the numbers in program1.interp changed to read_int ? 

    score: 1 (out of 1.0)


+ Pass: Other Stylistic Comments & Feedback

    Great job.

#### Subtotal: _5_ / _5.0_

