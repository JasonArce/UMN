### Feedback for HW 4

Run on November 07, 16:40:50 PM.

+ Pass: Change into directory "hw4".

+ Pass: Check that file "program.ml" exists.

+ Pass: Check that file "parser.ml" exists.

+ Pass: Check that file "parser.ml" exists.

+ Pass: Check that hw4 files compile without errors

+ Pass: Check that expression `Program.Readint` following file /dev/null has type `Program.expr`

+ Pass: Check that expression `Parser.READ` following file /dev/null has type `Parser.token`

+ Pass: 
Check that the result of evaluating
   ```
   tokenize_string "readint"
   ```
   matches the pattern `READ`.

   




+ Pass: 
Check that the result of evaluating
   ```
   parse_program [READ]
   ```
   matches the pattern `Readint`.

   




+ Pass: 
Check that the result of evaluating
   ```
   typeof Readint []
   ```
   matches the pattern `Int`.

   




+ Pass: 
Check that the result of evaluating
   ```
   eval Readint []
   ```
   matches the pattern `(IntResult 0, [])`.

   (with 0 on stdin)




+ Pass: 
Check that the result of evaluating
   ```
   const_fold (While (Boolean false, Const 1))
   ```
   matches the pattern `Seq []`.

   




+ Pass: 
Check that the result of evaluating
   ```
   const_fold (If (Boolean true, Const 0, Const 1))
   ```
   matches the pattern `Const 0`.

   




+ Pass: 
Check that the result of evaluating
   ```
   const_fold (If (Boolean false, Const 0, Const 1))
   ```
   matches the pattern `Const 1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   const_fold (Seq [Const 0; Const 1])
   ```
   matches the pattern `Const 1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   const_fold (Let ("x", Const 0, Const 1))
   ```
   matches the pattern `Const 1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", Const 1, Let("x", Const 2, Name "x")))
   ```
   matches the pattern `Let ("x", Const 2, Name "x")`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", Set ("y", Const 2), Name "y"))
   ```
   matches the pattern `Let ("x", Set ("y", Const 2), Name "y")`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x",Readint,Const 17))
   ```
   matches the pattern `Let ("x", Readint, Const 17)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", (Print (Const 1)), Const 0))
   ```
   matches the pattern `Let ("x", (Print (Const 1)), Const 0)`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", (Apply (Name "f", Seq [])), Seq []))
   ```
   matches the pattern `Let ("x", (Apply (Name "f", Seq [])), Seq [])`.

   




+ Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x",Fun ("s", Unit, Readint),Const 1))
   ```
   matches the pattern `Const 1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (raise (Unclosed 1)) with Unclosed _ -> 1 | _ -> 2
   ```
   matches the pattern `1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (raise (Unused 1)) with Unused _ -> 1 | _ -> 2
   ```
   matches the pattern `1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (raise (SyntaxError 1)) with SyntaxError _ -> 1 | _ -> 2
   ```
   matches the pattern `1`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try `No (parse_pos [OP; OP]) with (SyntaxError 1) -> `Yes
   ```
   matches the pattern ``Yes`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try `No (parse_pos [OP; PLUS; CONST 1; CONST 1; CP; CONST 1]) with (Unused 5) -> `Yes
   ```
   matches the pattern ``Yes`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try `No (parse_pos [OP; TIMES; OP; PLUS; CONST 0; CONST 1; CONST 2; CP; CONST 3; CP]) with (Unclosed 6) -> `Yes
   ```
   matches the pattern ``Yes`.

   




