## Assessment for HW4 const_fold

Run on November 04, 16:40:18 PM.

+ Pass: Change into directory "hw4".

+ Pass: Check that hw4 files compile without errors

## Feedback Tests (total possible value: 5)

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   const_fold (While (Boolean false, Const 1))
   ```
   matches the pattern `Seq []`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   const_fold (If (Boolean true, Const 0, Const 1))
   ```
   matches the pattern `Const 0`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   const_fold (If (Boolean false, Const 0, Const 1))
   ```
   matches the pattern `Const 1`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   const_fold (Seq [Const 0; Const 1])
   ```
   matches the pattern `Const 1`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   const_fold (Let ("x", Const 0, Const 1))
   ```
   matches the pattern `Const 1`.

   




#### Subtotal: _5.0_ / _5.0_

## Additional automated tests

+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (const_fold (Let ("y", Const 0, Let ("x", Add (Const 1, Const 2),   While (Gt (Name "x", Const 0),    Seq     [         Set ("x", Sub (Name "x", Const 1));         If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Name "y", Name "x");         If (Eq (Mul (Const 1, Const 0), Sub (Const 2, Const 2)), Name "x", Name "y");         While (Gt (Name "y", Const 4), Print (Name "y"));         Let ("z", Readint, Name "z");         Seq [                 Set ("z",  If (Gt (Const 42, Const 4), Add (Const 2, Const 3), Lt (Const 1, Const 2)))             ]     ])))))
   ```
   matches the pattern ` (Let ("y", Const 0,     Let ("x", Const 3,          While (Gt (Name "x", Const 0),          Seq     [Set ("x", Sub (Name "x", Const 1)); Name "y"; Name "x";While (Gt (Name "y", Const 4), Print (Name "y"));      Let("z", Readint, Name "z"); Seq [Set ("z", Const 5)]]))))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
  - : Program.expr =
Let ("y", Const 0,
 Let ("x", Const 3,
  While (Gt (Name "x", Const 0),
   Seq
    [Set ("x", Sub (Name "x", Const 1)); Name "y"; Name "x";
     While (Gt (Name "y", Const 4), Print (Name "y"));
     Let ("z", Readint, Name "z"); Set ("z", Const 5)])))

   ```



+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (Let ("y", Mul (Const 1, Const 0), Let ("x", Sub (Const 451, Const 154),   If (Gt (Name "x", Const 134),    Seq     [         Set ("x", Sub (Name "x", Const 1));         If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Const 396, Name "x");         If (Eq (Mul (Const 1, Const 0), Sub (Const 2, Const 2)), Const 641, Name "y");         While (Gt (Name "y", Const 4), Print (Name "y"));         Let ("z", Readint, Name "z");     ],     Seq     [         Print (Name "y");         If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)),             Let ("z", Readint, Name "z"),             Add (Const 42, Const 17));     ])))))
   ```
   matches the pattern ` (Let ("y", Const 0,            Let ("x", Const 297,           If (Gt (Name "x", Const 134),       Seq     [Set ("x", Sub (Name "x", Const 1));While (Gt (Name "y", Const 4), Print (Name "y"));  Let ("z", Readint, Name "z")],    Seq[Print(Name "y"); Let ("z", Readint, Name "z")]))))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (Let ("y", Mul (Const 1, Const 0), Let ("x", Sub (Const 451, Const 154), Let ("z", Readint,   If ( Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)),    Seq     [         If (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))), Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))), Const 1, Print (Const 1));         If (Lt (Sub (Const 2, Add (Const 2, Mul (Const 2, Const 2))), Sub (Const 2, Add (Mul (Const 2, Const 2), Const 2))), Const 2, Print (Const 2));         If (Eq (Mul (Const 3, Sub (Const 3, Add (Const 3, Const 3))), Mul (Const 3, Sub (Add (Const 3, Const 3), Const 3))), Const 3, Print (Const 3));         If (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))), Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))), Const 4, Print (Const 4));         If (Lt (Mul (Const 5, Add (Const 5, Add (Const 5, Const 5))), Add (Const 5, Add (Add (Const 5, Const 5), Const 5))), Const 5, Print (Const 5));         If (Eq (Mul (Const 6, Mul (Const 6, Mul (Const 6, Const 6))), Sub (Const 6, Sub (Sub (Const 6, Const 6), Const 6))), Const 6, Print (Const 6));         If (Gt (Add (Const 7, Add (Const 7, Add (Const 7, Const 7))), Mul (Const 7, Mul (Mul (Const 7, Const 7), Const 7))), Const 7, Print (Const 7));         If (Lt (Mul (Const 8, Add (Const 8, Mul (Const 8, Const 8))), Mul (Const 8, Sub (Mul (Const 8, Const 8), Const 8))), Const 8, Print (Const 8));         If (Eq (Add (Const 9, Add (Const 9, Add (Const 9, Const 9))), Sub (Const 9, Add (Add (Const 9, Const 9), Const 9))), Const 9, Print (Const 9));     ],     Seq     [         Set ("x", Sub (Name "x", Const 1));         If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Const 396, Name "x");         If (Eq (Mul (Const 1, Const 0), Sub (Const 2, Const 2)), Const 641, Name "y");         While (Gt (Name "y", Const 4), Print (Name "y"));         Let ("z", Readint, Name "z");         Set ("x", Sub (Name "x", Const 1));         If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Const 396, Name "x");         If (Eq (Mul (Const 1, Const 0), Sub (Const 2, Const 2)), Const 641, Name "y");         While (Gt (Name "y", Const 4), Print (Name "y"));         Let ("z", Readint, Name "z");     ]))))))
   ```
   matches the pattern ` (Let ("y", Const 0,         Let ("x", Const 297,       Let ("z", Readint,        Seq     [Print (Const 1); Print (Const 2); Print (Const 3); Print (Const 4);Print (Const 5); Print (Const 6); Print (Const 7); Print (Const 8);      Print(Const 9)]))))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (While (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))), Sub (Const 6, Sub (Sub (Const 3, Const 1), Const 29))),     Seq      [          If (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))), Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))), Const 1, Print (Const 1));          If (Lt (Sub (Const 2, Add (Const 2, Mul (Const 2, Const 2))), Sub (Const 2, Add (Mul (Const 2, Const 2), Const 2))), Const 2, Print (Const 2));          If (Eq (Mul (Const 3, Sub (Const 3, Add (Const 3, Const 3))), Mul (Const 3, Sub (Add (Const 3, Const 3), Const 3))), Const 3, Print (Const 3));          If (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))), Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))), Const 4, Print (Const 4));          If (Lt (Mul (Const 5, Add (Const 5, Add (Const 5, Const 5))), Add (Const 5, Add (Add (Const 5, Const 5), Const 5))), Const 5, Print (Const 5));          If (Eq (Mul (Const 6, Mul (Const 6, Mul (Const 6, Const 6))), Sub (Const 6, Sub (Sub (Const 6, Const 6), Const 6))), Const 6, Print (Const 6));          If (Gt (Add (Const 7, Add (Const 7, Add (Const 7, Const 7))), Mul (Const 7, Mul (Mul (Const 7, Const 7), Const 7))), Const 7, Print (Const 7));          If (Lt (Mul (Const 8, Add (Const 8, Mul (Const 8, Const 8))), Mul (Const 8, Sub (Mul (Const 8, Const 8), Const 8))), Const 8, Print (Const 8));          If (Eq (Add (Const 9, Add (Const 9, Add (Const 9, Const 9))), Sub (Const 9, Add (Add (Const 9, Const 9), Const 9))), Const 9, Print (Const 9));      ])))
   ```
   matches the pattern ` (Seq [])`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (While (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))), Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1)))),     Seq      [          If (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))), Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))), Const 1, Print (Const 1));          If (Lt (Sub (Const 2, Add (Const 2, Mul (Const 2, Const 2))), Sub (Const 2, Add (Mul (Const 2, Const 2), Const 2))), Const 2, Print (Const 2));          If (Eq (Mul (Const 3, Sub (Const 3, Add (Const 3, Const 3))), Mul (Const 3, Sub (Add (Const 3, Const 3), Const 3))), Const 3, Print (Const 3));          If (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))), Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))), Const 4, Print (Const 4));          If (Lt (Mul (Const 5, Add (Const 5, Add (Const 5, Const 5))), Add (Const 5, Add (Add (Const 5, Const 5), Const 5))), Const 5, Print (Const 5));          If (Eq (Mul (Const 6, Mul (Const 6, Mul (Const 6, Const 6))), Sub (Const 6, Sub (Sub (Const 6, Const 6), Const 6))), Const 6, Print (Const 6));          If (Gt (Add (Const 7, Add (Const 7, Add (Const 7, Const 7))), Mul (Const 7, Mul (Mul (Const 7, Const 7), Const 7))), Const 7, Print (Const 7));          If (Lt (Mul (Const 8, Add (Const 8, Mul (Const 8, Const 8))), Mul (Const 8, Sub (Mul (Const 8, Const 8), Const 8))), Const 8, Print (Const 8));          If (Eq (Add (Const 9, Add (Const 9, Add (Const 9, Const 9))), Sub (Const 9, Add (Add (Const 9, Const 9), Const 9))), Const 9, Print (Const 9));      ])))
   ```
   matches the pattern ` (While (Boolean true,          Seq   [Print (Const 1); Print (Const 2); Print (Const 3); Print (Const 4);Print (Const 5); Print (Const 6); Print (Const 7); Print (Const 8);    Print(Const 9)]))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (While (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))), Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1)))), Let ("sum",     Fun ("a", Int,       Fun ("b", Int,         If (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)), Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))), Add (Name "a", Name "b"), Print (Const 9999)))) ,     Seq      [          Print (Apply (Apply (Name "sum", Const (1)), Const (2)));          Print (Apply (Apply (Name "sum", Const (3)), Const (4)));          Print (Apply (Apply (Name "sum", Const (5)), Const (6)));          Print (Apply (Apply (Name "sum", Const (7)), Const (8)));          Print (Apply (Apply (Name "sum", Const (9)), Const (10)))      ]) )))
   ```
   matches the pattern ` (While (Boolean true,                    Let ("sum", Fun ("a", Int, Fun ("b", Int, Add (Name "a", Name "b"))),         Seq    [Print (Apply (Apply (Name "sum", Const 1), Const 2));Print (Apply (Apply (Name "sum", Const 3), Const 4));  Print (Apply (Apply (Name "sum", Const 5), Const 6 )); Print(Apply(Apply (Name "sum", Const 7), Const 8));     Print(Apply(Apply(Name "sum", Const 9), Const 10))])))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (Let ("sum",     Fun ("a", Int,       Fun ("b", Int,         If (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)), Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))), Add (Name "a", Name "b"), Print (Const 9999)))) ,     While (Gt ((Apply (Apply (Name "sum", Const (9)), Const (10))), ((Apply (Apply (Name "sum", Const (1)), Const (2))))),         Print (Let ("z", Readint, Name "z"))     ))))
   ```
   matches the pattern ` (Let ("sum", Fun ("a", Int, Fun ("b", Int, Add (Name "a", Name "b"))),               While       (Gt (Apply (Apply (Name "sum", Const 9), Const 10),        Apply (Apply (Name "sum", Const 1), Const 2)),    Print (Let ("z", Readint, Name "z")))))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (Let ("y", Mul (Const 0, Const 0), Let ("z",   If (Lt (Name "y", Const 4),    Seq    [         Set ("y", Sub (Name "y", Const 1));         Const 1;    ], Const 0),(   Seq    [         Print (Name "y");         If (Gt (Add (Const 1, Const 0), Sub (Const 2, Const 1)),             Let ("z", Readint, Name "z"),             Add (Const 42, Const 17));     ])))))
   ```
   matches the pattern ` (Let ("y", Const 0,                   Let ("z",         If (Lt (Name "y", Const 4),    Seq [Set ("y", Sub (Name "y", Const 1)); Const 1], Const 0),Seq [Print (Name "y"); Const 59])))`.

   




+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (const_fold (If (Lt (Name "y", Const 4),         While (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))), Sub (Const 6, Sub (Sub (Const 3, Const 1), Const 29))),             Seq              [                  If (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))), Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))), Const 1, Print (Const 1));                  If (Lt (Sub (Const 2, Add (Const 2, Mul (Const 2, Const 2))), Sub (Const 2, Add (Mul (Const 2, Const 2), Const 2))), Const 2, Print (Const 2));                  If (Eq (Mul (Const 3, Sub (Const 3, Add (Const 3, Const 3))), Mul (Const 3, Sub (Add (Const 3, Const 3), Const 3))), Const 3, Print (Const 3));                  If (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))), Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))), Const 4, Print (Const 4));                  If (Lt (Mul (Const 5, Add (Const 5, Add (Const 5, Const 5))), Add (Const 5, Add (Add (Const 5, Const 5), Const 5))), Const 5, Print (Const 5));                  If (Eq (Mul (Const 6, Mul (Const 6, Mul (Const 6, Const 6))), Sub (Const 6, Sub (Sub (Const 6, Const 6), Const 6))), Const 6, Print (Const 6));                  If (Gt (Add (Const 7, Add (Const 7, Add (Const 7, Const 7))), Mul (Const 7, Mul (Mul (Const 7, Const 7), Const 7))), Const 7, Print (Const 7));                  If (Lt (Mul (Const 8, Add (Const 8, Mul (Const 8, Const 8))), Mul (Const 8, Sub (Mul (Const 8, Const 8), Const 8))), Const 8, Print (Const 8));                  If (Eq (Add (Const 9, Add (Const 9, Add (Const 9, Const 9))), Sub (Const 9, Add (Add (Const 9, Const 9), Const 9))), Const 9, Print (Const 9));              ]),   Seq    [         Let ("sum",             Fun ("a", Int,               Fun ("b", Int,                 If (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)), Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))), Add (Name "a", Name "b"), Print (Const 9999)))) ,             While (Gt ((Apply (Apply (Name "sum", Const (9)), Const (10))), ((Apply (Apply (Name "sum", Const (1)), Const (2))))),                 Print (Let ("z", Readint, Name "z"))             ))     ])))
   ```
   matches the pattern ` (If (Lt (Name "y", Const 4), Seq [],         Seq         [Let ("sum", Fun ("a", Int, Fun ("b", Int, Add (Name "a", Name "b"))),         While         (Gt (Apply (Apply (Name "sum", Const 9), Const 10),           Apply (Apply (Name "sum", Const 1), Const 2)),       Print (Let ("z", Readint, Name "z"))))]))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
        - : Program.expr =
If (Lt (Name "y", Const 4), Seq [],
 Let ("sum", Fun ("a", Int, Fun ("b", Int, Add (Name "a", Name "b"))),
  While
   (Gt (Apply (Apply (Name "sum", Const 9), Const 10),
     Apply (Apply (Name "sum", Const 1), Const 2)),
   Print (Let ("z", Readint, Name "z")))))

   ```



+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (const_fold (If (Eq (Const 3, Const 3),         While (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))), Sub (Const 6, Sub (Sub (Const 3, Const 1), Const 29))),             Seq              [                  If (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))), Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))), Const 1, Print (Const 1));                  If (Lt (Sub (Const 2, Add (Const 2, Mul (Const 2, Const 2))), Sub (Const 2, Add (Mul (Const 2, Const 2), Const 2))), Const 2, Print (Const 2));                  If (Eq (Mul (Const 3, Sub (Const 3, Add (Const 3, Const 3))), Mul (Const 3, Sub (Add (Const 3, Const 3), Const 3))), Const 3, Print (Const 3));                  If (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))), Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))), Const 4, Print (Const 4));                  If (Lt (Mul (Const 5, Add (Const 5, Add (Const 5, Const 5))), Add (Const 5, Add (Add (Const 5, Const 5), Const 5))), Const 5, Print (Const 5));                  If (Eq (Mul (Const 6, Mul (Const 6, Mul (Const 6, Const 6))), Sub (Const 6, Sub (Sub (Const 6, Const 6), Const 6))), Const 6, Print (Const 6));                  If (Gt (Add (Const 7, Add (Const 7, Add (Const 7, Const 7))), Mul (Const 7, Mul (Mul (Const 7, Const 7), Const 7))), Const 7, Print (Const 7));                  If (Lt (Mul (Const 8, Add (Const 8, Mul (Const 8, Const 8))), Mul (Const 8, Sub (Mul (Const 8, Const 8), Const 8))), Const 8, Print (Const 8));                  If (Eq (Add (Const 9, Add (Const 9, Add (Const 9, Const 9))), Sub (Const 9, Add (Add (Const 9, Const 9), Const 9))), Const 9, Print (Const 9));              ]),   Seq    [         Let ("sum",             Fun ("a", Int,               Fun ("b", Int,                 If (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)), Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))), Add (Name "a", Name "b"), Print (Const 9999)))) ,             While (Gt ((Apply (Apply (Name "sum", Const (9)), Const (10))), ((Apply (Apply (Name "sum", Const (1)), Const (2))))),                 Print (Let ("z", Readint, Name "z"))             ))     ])))
   ```
   matches the pattern ` (Seq [])`.

   




#### Subtotal: _8.0_ / _10.0_

## Manual tests entered by TA: goelx029

+  _4_ / _5.0_ : Pass: Exhaustive match statement (-.5 for each that is missing)

    score: 4 (out of 5.0)


+  _2_ / _2.0_ : Pass: Optimization removing while statements that will never be true

    score: 2 (out of 2.0)


+  _2_ / _2.0_ : Pass: Optimization removing if conditions that will always be true

    score: 2 (out of 2.0)


+  _2_ / _2.0_ : Pass: Optimization removing if conditions that will always be false

    score: 2 (out of 2.0)


+  _2_ / _2.0_ : Pass: Optimization removing all but the last constant expression in a sequence

    score: 2 (out of 2.0)


+  _2_ / _2.0_ : Pass: Optimization simplifying Let(s,v,b) to b

    score: 2 (out of 2.0)


+ Pass: Other Stylistic Comments & Feedback

    Use match statements inside your match statments for a better indentation and flow of your program

#### Subtotal: _14_ / _15.0_

