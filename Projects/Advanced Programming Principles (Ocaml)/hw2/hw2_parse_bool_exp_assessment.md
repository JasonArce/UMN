## Assessment for HW2 parse_bool_exp

Run on October 08, 18:10:15 PM.

+ Pass: Change into directory "hw2".

## Feedback Tests (total possible value: 5)

+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   parse_bool_exp [OP; AND; OP; OR; CONST true; CONST false; CP; OP; NOT; CONST false; CP; CP]
   ```
   matches the pattern `And (Or (Const true, Const false), Not (Const false))`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   parse_bool_exp [OP; EQ; OP; XOR; VAR "x"; VAR "y"; CP; CONST false; CP]
   ```
   matches the pattern `Eq (Xor (Id "x", Id "y"), Const false)`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "and T F")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and T F")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(or T F T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and or T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(and T)")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+  _0.5555555555555556_ / _0.5555555555555556_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (bool_exp_of_s_exp "(not T))")) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




#### Subtotal: _4.999999999999999_ / _4.999999999999999_

+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; NAND;  OP; OR;  OP; AND;  CONST true;  OP; EQ;  VAR "h";   VAR "f";   CP; CP; OP; XOR;  OP; EQ;  CONST false;  OP; OR;  VAR "h";   VAR "v";   CP; CP; OP; XOR;  VAR "x";   OP; AND;  VAR "x";   VAR "e";   CP; CP; CP; CP; OP; NOT;  OP; AND;  CONST false;  CONST true;  CP; CP; CP;])
   ```
   matches the pattern ` ((Nand((Or((And((Const true),(Eq((Id "h"),(Id "f"))))),(Xor((Eq((Const false),(Or((Id "h"),(Id "v"))))),(Xor((Id "x"),(And((Id "x"),(Id "e"))))))))),(Not(And((Const false),(Const true)))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; OR;  CONST false;  CONST false;  CP;])
   ```
   matches the pattern ` ((Or((Const false),(Const false))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; XOR;  OP; NAND;  OP; NOT;  CONST false;  CP; OP; XOR;  OP; AND;  OP; OR;  VAR "y";   VAR "a";   CP; CONST true;  CP; CONST false;  CP; CP; OP; NAND;  OP; EQ;  OP; EQ;  OP; NOT;  VAR "y";   CP; CONST true;  CP; VAR "l";   CP; VAR "q";   CP; CP;])
   ```
   matches the pattern ` ((Xor((Nand((Not(Const false)),(Xor((And((Or((Id "y"),(Id "a"))),(Const true))),(Const false))))),(Nand((Eq((Eq((Not(Id "y")),(Const true))),(Id "l"))),(Id "q"))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [CONST false; ])
   ```
   matches the pattern ` ((Const false))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; EQ;  VAR "w";   OP; NOT;  OP; OR;  OP; OR;  VAR "g";   VAR "h";   CP; CONST false;  CP; CP; CP;])
   ```
   matches the pattern ` ((Eq((Id "w"),(Not(Or((Or((Id "g"),(Id "h"))),(Const false)))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; EQ;  OP; AND;  OP; OR;  OP; XOR;  VAR "k";   VAR "a";   CP; VAR "y";   CP; CONST false;  CP; OP; AND;  OP; NAND;  VAR "h";   VAR "k";   CP; CONST true;  CP; CP;])
   ```
   matches the pattern ` ((Eq((And((Or((Xor((Id "k"),(Id "a"))),(Id "y"))),(Const false))),(And((Nand((Id "h"),(Id "k"))),(Const true))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; NOT;  OP; XOR;  OP; EQ;  OP; AND;  VAR "q";   VAR "s";   CP; OP; NOT;  VAR "d";   CP; CP; OP; OR;  OP; EQ;  VAR "c";   VAR "b";   CP; OP; AND;  VAR "w";   VAR "z";   CP; CP; CP; CP;])
   ```
   matches the pattern ` ((Not(Xor((Eq((And((Id "q"),(Id "s"))),(Not(Id "d")))),(Or((Eq((Id "c"),(Id "b"))),(And((Id "w"),(Id "z")))))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [VAR "o";  ])
   ```
   matches the pattern ` ((Id "o"))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; EQ;  CONST true;  VAR "a";   CP;])
   ```
   matches the pattern ` ((Eq((Const true),(Id "a"))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; NOT;  OP; OR;  OP; AND;  CONST false;  OP; OR;  OP; OR;  VAR "q";   VAR "f";   CP; OP; XOR;  VAR "v";   VAR "j";   CP; CP; CP; VAR "a";   CP; CP;])
   ```
   matches the pattern ` ((Not(Or((And((Const false),(Or((Or((Id "q"),(Id "f"))),(Xor((Id "v"),(Id "j"))))))),(Id "a")))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [CONST false; ])
   ```
   matches the pattern ` ((Const false))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; NOT;  OP; AND;  CONST true;  OP; NAND;  CONST true;  OP; NAND;  VAR "e";   VAR "q";   CP; CP; CP; CP;])
   ```
   matches the pattern ` ((Not(And((Const true),(Nand((Const true),(Nand((Id "e"),(Id "q")))))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; XOR;  OP; NAND;  OP; AND;  OP; XOR;  OP; OR;  VAR "k";   VAR "u";   CP; CONST false;  CP; CONST false;  CP; OP; NOT;  VAR "l";   CP; CP; VAR "v";   CP;])
   ```
   matches the pattern ` ((Xor((Nand((And((Xor((Or((Id "k"),(Id "u"))),(Const false))),(Const false))),(Not(Id "l")))),(Id "v"))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [VAR "g";  ])
   ```
   matches the pattern ` ((Id "g"))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [CONST true; ])
   ```
   matches the pattern ` ((Const true))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; NOT;  OP; OR;  CONST false;  OP; AND;  OP; NOT;  VAR "z";   CP; VAR "v";   CP; CP; CP;])
   ```
   matches the pattern ` ((Not(Or((Const false),(And((Not(Id "z")),(Id "v")))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; XOR;  VAR "s";   OP; OR;  VAR "w";   OP; AND;  VAR "n";   VAR "q";   CP; CP; CP;])
   ```
   matches the pattern ` ((Xor((Id "s"),(Or((Id "w"),(And((Id "n"),(Id "q"))))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; NAND;  OP; AND;  OP; XOR;  OP; EQ;  OP; OR;  VAR "u";   VAR "x";   CP; OP; NAND;  VAR "u";   VAR "t";   CP; CP; OP; NOT;  OP; OR;  VAR "f";   VAR "k";   CP; CP; CP; CONST true;  CP; OP; EQ;  CONST true;  OP; NOT;  OP; OR;  VAR "w";   VAR "c";   CP; CP; CP; CP;])
   ```
   matches the pattern ` ((Nand((And((Xor((Eq((Or((Id "u"),(Id "x"))),(Nand((Id "u"),(Id "t"))))),(Not(Or((Id "f"),(Id "k")))))),(Const true))),(Eq((Const true),(Not(Or((Id "w"),(Id "c")))))))))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [VAR "h";  ])
   ```
   matches the pattern ` ((Id "h"))`.

   




+  _0.25_ / _0.25_ : Pass: 
Check that the result of evaluating
   ```
    (parse_bool_exp [OP; OR;  OP; NAND;  OP; AND;  OP; NAND;  OP; EQ;  VAR "v";   VAR "p";   CP; OP; OR;  VAR "h";   VAR "m";   CP; CP; OP; NOT;  OP; NAND;  VAR "g";   VAR "a";   CP; CP; CP; OP; NAND;  OP; NOT;  OP; OR;  VAR "r";   VAR "w";   CP; CP; CONST false;  CP; CP; CONST false;  CP;])
   ```
   matches the pattern ` ((Or((Nand((And((Nand((Eq((Id "v"),(Id "p"))),(Or((Id "h"),(Id "m"))))),(Not(Nand((Id "g"),(Id "a")))))),(Nand((Not(Or((Id "r"),(Id "w")))),(Const false))))),(Const false))))`.

   




#### Subtotal: _5.0_ / _5.0_

## Manual tests entered by TA: borne038

+  _5_ / _5_ : Pass: Overall grade for code quality (includes useful comments, appropriate task decomposition, efficient algorithm...)

    score: 5 (out of 5)


+ Pass: Other Stylistic Comments & Feedback

    Since you have essentially the same code repeated for several match cases, you could condense that into something that can be used commonly over several match cases to reduce repetition.

#### Subtotal: _5_ / _5_

