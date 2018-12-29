## Assessment for HW4 unused_def_elim

Run on November 06, 22:08:52 PM.

+ Pass: Change into directory "hw4".

+ Pass: Check that hw4 files compile without errors

## Feedback Tests (total possible value: 5)

+  _0.8333333333333334_ / _0.8333333333333334_ : Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", Const 1, Let("x", Const 2, Name "x")))
   ```
   matches the pattern `Let ("x", Const 2, Name "x")`.

   




+  _0.8333333333333334_ / _0.8333333333333334_ : Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", Set ("y", Const 2), Name "y"))
   ```
   matches the pattern `Let ("x", Set ("y", Const 2), Name "y")`.

   




+  _0.8333333333333334_ / _0.8333333333333334_ : Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x",Readint,Const 17))
   ```
   matches the pattern `Let ("x", Readint, Const 17)`.

   




+  _0.8333333333333334_ / _0.8333333333333334_ : Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", (Print (Const 1)), Const 0))
   ```
   matches the pattern `Let ("x", (Print (Const 1)), Const 0)`.

   




+  _0.8333333333333334_ / _0.8333333333333334_ : Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x", (Apply (Name "f", Seq [])), Seq []))
   ```
   matches the pattern `Let ("x", (Apply (Name "f", Seq [])), Seq [])`.

   




+  _0.8333333333333334_ / _0.8333333333333334_ : Pass: 
Check that the result of evaluating
   ```
   unused_def_elim (Let ("x",Fun ("s", Unit, Readint),Const 1))
   ```
   matches the pattern `Const 1`.

   




#### Subtotal: _5.0_ / _5.0_

## Additional automated tests

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let ("w", Const 1,
Let ("y", Readint,
Let ("x", Const 2,
Let ("z", Const 3,
  While (Gt (Name "y", Const 0),
   Seq
    [
        Let ("x", Sub (Name "y", Const 1),
        If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Name "y", Name "x"));
        If (Eq (Mul (Const 1, Const 0), Sub (Const 2, Const 2)), Add (Name "y", Name "y"), Mul (Name "y", Name "y"));
        While (Gt (Name "y", Const 4), Print (Name "y"));
        Let ("z", Const 4,
        Seq [
                Set ("z",  If (Gt (Const 42, Const 4), Add (Const 2, Const 3), Lt (Const 1, Const 2)));
            ]);
    ])))))))
   ```
   matches the pattern ` (Let ("y", Readint,
      While (Gt (Name "y", Const 0),
       Seq
       [
        Let ("x", Sub (Name "y", Const 1), If (Eq (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Name "y", Name "x"));If (Eq (Mul (Const 1, Const 0), Sub (Const 2, Const 2)), Add (Name "y", Name "y"), Mul (Name "y", Name "y"));
 While (Gt (Name "y", Const 4), Print (Name "y")); Let("z", Const 4, Seq
             [
            Set("z", If(Gt(Const 42, Const 4), Add(Const 2, Const 3), Lt(Const 1, Const 2)))
        ])
    ])))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let ("y", Mul (Const 1, Const 0),
        Let ("x", Sub (Const 451, Const 154),
            If (Gt (Const 431, Const 134),
                Let("y", Mul (Const 1, Const 0),
                    Let("x", Sub(Const 451, Const 154),
                        Seq
                            [
                                Let("x", Sub(Name "y", Const 1),
                                If(Eq(Add(Const 1, Const 0), Sub(Const 2, Const 1)), Name "y", Name "x"));
                                If(Eq(Mul(Const 1, Const 0), Sub(Const 2, Const 2)), Add(Name "y", Name "y"), Mul(Name "y", Name "y"));
                                While(Gt(Name "y", Const 4), Print(Name "y"));
                                Let ("z", Readint, Name "z");
                            ]
                        )
                    ),
                Let("y", Mul(Const 1, Const 0),
                    Let("x", Sub(Const 451, Const 154),
                        Seq
                            [
                                Print(Name "x");
                                If(Eq(Add(Const 1, Const 0), Sub(Const 2, Const 1)),
                                    Let("z", Readint, Name "z"),
                                    Add (Const 42, Const 17));
                            ]
                        )
                    )
                )
            )
        )
    ))
   ```
   matches the pattern ` (If(Gt(Const 431, Const 134),
    Let("y", Mul(Const 1, Const 0),
     Seq
     [
        Let("x", Sub(Name "y", Const 1), If(Eq(Add(Const 1, Const 0), Sub(Const 2, Const 1)), Name "y", Name "x"));
        If(Eq(Mul(Const 1, Const 0), Sub(Const 2, Const 2)), Add(Name "y", Name "y"), Mul(Name "y", Name "y"));
        While(Gt(Name "y", Const 4), Print(Name "y"));
        Let("z", Readint, Name "z")
]),
    Let("x", Sub(Const 451, Const 154),
     Seq
     [
        Print(Name "x");
        If(Eq(Add(Const 1, Const 0), Sub(Const 2, Const 1)),
            Let("z", Readint, Name "z"),
            Add(Const 42, Const 17))
])))`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("y", Mul(Const 1, Const 0),
Let("x", Sub(Const 451, Const 154),
Let("z", Div(Const 4, Const 2),
   Seq
    [
        If(Gt(Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1))), Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1))), Const 1, Print(Const 1));
        If(Lt(Sub(Const 2, Add(Const 2, Mul(Const 2, Const 2))), Sub(Const 2, Add(Mul(Const 2, Const 2), Const 2))), Const 2, Print(Const 2));
        If(Eq(Mul(Const 3, Sub(Const 3, Add(Const 3, Const 3))), Mul(Const 3, Sub(Add(Const 3, Const 3), Const 3))), Const 3, Print(Const 3));
        If(Gt(Add(Const 4, Add(Const 4, Add(Const 4, Const 4))), Mul(Const 4, Mul(Add(Const 4, Const 4), Const 4))), Const 4, Print(Const 4));
        If(Lt(Mul(Const 5, Add(Const 5, Add(Const 5, Const 5))), Add(Const 5, Add(Add(Const 5, Const 5), Const 5))), Const 5, Print(Const 5));
        If(Eq(Mul(Const 6, Mul(Const 6, Mul(Const 6, Const 6))), Sub(Const 6, Sub(Sub(Const 6, Const 6), Const 6))), Const 6, Print(Const 6));
        If(Gt(Add(Const 7, Add(Const 7, Add(Const 7, Const 7))), Mul(Const 7, Mul(Mul(Const 7, Const 7), Const 7))), Const 7, Print(Const 7));
        If(Lt(Mul(Const 8, Add(Const 8, Mul(Const 8, Const 8))), Mul(Const 8, Sub(Mul(Const 8, Const 8), Const 8))), Const 8, Print(Const 8));
        If (Eq (Add (Const 9, Add (Const 9, Add (Const 9, Const 9))), Sub (Const 9, Add (Add (Const 9, Const 9), Const 9))), Const 9, Print (Const 9)); ])))))
   ```
   matches the pattern ` (Seq
    [If
     (Gt(Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1))),
         Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1))),
      Const 1, Print(Const 1));
        If
        (Lt(Sub(Const 2, Add(Const 2, Mul(Const 2, Const 2))),
            Sub(Const 2, Add(Mul(Const 2, Const 2), Const 2))),
         Const 2, Print(Const 2));
     If(Eq(Mul(Const 3, Sub(Const 3, Add(Const 3, Const 3))),
           Mul(Const 3, Sub(Add(Const 3, Const 3), Const 3))),
         Const 3, Print(Const 3));
        If
        (Gt(Add(Const 4, Add(Const 4, Add(Const 4, Const 4))),
            Mul(Const 4, Mul(Add(Const 4, Const 4), Const 4))),
         Const 4, Print(Const 4));
        If
        (Lt(Mul(Const 5, Add(Const 5, Add(Const 5, Const 5))),
            Add(Const 5, Add(Add(Const 5, Const 5), Const 5))),
         Const 5, Print(Const 5));
        If
        (Eq(Mul(Const 6, Mul(Const 6, Mul(Const 6, Const 6))),
            Sub(Const 6, Sub(Sub(Const 6, Const 6), Const 6))),
         Const 6, Print(Const 6));
        If
        (Gt(Add(Const 7, Add(Const 7, Add(Const 7, Const 7))),
            Mul(Const 7, Mul(Mul(Const 7, Const 7), Const 7))),
         Const 7, Print(Const 7));
        If
        (Lt(Mul(Const 8, Add(Const 8, Mul(Const 8, Const 8))),
            Mul(Const 8, Sub(Mul(Const 8, Const 8), Const 8))),
         Const 8, Print(Const 8));
        If
        (Eq(Add(Const 9, Add(Const 9, Add(Const 9, Const 9))),
            Sub(Const 9, Add(Add(Const 9, Const 9), Const 9))),
         Const 9, Print(Const 9))])`.

   




+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("a", Mul(Const 1, Const 0),
Let("b", Sub(Const 451, Const 154),
While(Eq(Mul(Const 21, Mul(Const 13, Mul(Const 2, Const 1))), Mul(Const 21, Mul(Const 13, Mul(Const 2, Const 1)))),
Let("sum",
    Fun("a", Int,
      Fun("b", Int,
        If(Eq(Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1)), Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1)))), Add(Name "a", Name "b"), Print(Const 9999)))),
    Seq
     [
         Print(Const 1);
         Print(Const 2);
         Print(Const 3);
         Print(Const 4);
         Print (Const 5); ])
)))))
   ```
   matches the pattern ` (While(Eq(Mul(Const 21, Mul(Const 13, Mul(Const 2, Const 1))), Mul(Const 21, Mul(Const 13, Mul(Const 2, Const 1)))),
      Seq
      [
    Print(Const 1);
    Print(Const 2);
    Print(Const 3);
    Print(Const 4);
    Print(Const 5)
]))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;                            
- : Program.expr =
Let ("a", Mul (Const 1, Const 0),
 Let ("b", Sub (Const 451, Const 154),
  While
   (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))),
     Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1)))),
   Let ("sum",
    Fun ("a", Int,
     Fun ("b", Int,
      If
       (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)),
         Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))),
       Add (Name "a", Name "b"), Print (Const 9999)))),
    Seq
     [Print (Const 1); Print (Const 2); Print (Const 3); Print (Const 4);
      Print (Const 5)]))))

   ```



+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("fake_sum",
    Fun("a", Int,
        Fun("b", Int,
            If(Eq(Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1)), Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1)))), Print(Const 0000), Print(Const 9999)))),
    While(Gt((Apply(Apply(Name "sum", Const(9)), Const(10))), ((Apply(Apply(Name "fake_sum", Const(1)), Const(2))))),
          Print(Let("z", Readint, Name "z"))
          ))))
   ```
   matches the pattern ` (Let("fake_sum", Fun("a", Int,
Fun("b", Int,
    If
    (Eq(Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1)),
        Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1)))),
    Print(Const 0), Print(Const 9999)))),
    While
    (Gt(Apply(Apply(Name "sum", Const 9), Const 10),
        Apply(Apply(Name "fake_sum", Const 1), Const 2)),
     Print(Let("z", Readint, Name "z")))))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;            
- : Program.expr =
While
 (Gt (Apply (Apply (Name "sum", Const 9), Const 10),
   Apply (Apply (Name "fake_sum", Const 1), Const 2)),
 Print (Let ("z", Readint, Name "z")))

   ```



+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("y", Mul(Const 0, Const 0),
    Let("z", If(Lt(Name "y", Const 4), Const 1, Const 0),
        Let("z", Mul(Const 0, Const 0), (
            Seq
            [
                Print(Name "y");
                If(Gt(Add(Const 1, Const 0), Sub(Const 2, Const 1)),
                   Let("z", Readint, Name "z"),
                   Add(Const 42, Const 17))
            ]))))))
   ```
   matches the pattern ` (Let ("y", Mul (Const 0, Const 0), Seq [Print (Name "y"); If (Gt (Add (Const 1, Const 0), Sub (Const 2, Const 1)), Let ("z", Readint, Name "z"), Add (Const 42, Const 17))]))`.

   




+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("sum",
    Fun("a", Int,
        Fun("b", Int, Add(Name "a", Name "b"))),
    Let("y", Readint,
        Let("x", If(Lt(Name "y", Const 4), Const 1, Const 0),
            If(Lt(Readint, Const 4),
               While(Eq(Mul(Const 21, Mul(Const 13, Mul(Const 2, Const 1))), Sub(Const 6, Sub(Sub(Const 3, Const 1), Const 29))),
                     Seq
                     [
                   If(Gt(Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1))), Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1))), Const 1, Print(Const 1));
                   If(Gt(Add(Const 4, Add(Const 4, Add(Const 4, Const 4))), Mul(Const 4, Mul(Add(Const 4, Const 4), Const 4))), Const 4, Print(Const 4))
               ]),
               Seq
               [
                Let("sum",
                    Fun("a", Int,
                        Fun("b", Int,
                            If(Eq(Add(Const 1, Mul(Sub(Const 1, Const 1), Const 1)), Add(Const 1, Mul(Const 1, Sub(Const 1, Const 1)))), Add(Name "a", Name "b"), Print(Const 9999)))),
                    While(Gt((Apply(Apply(Name "sum", Const(9)), Const(10))), ((Apply(Apply(Name "sum", Const(1)), Const(2))))),
                          Print(Let("z", Readint, Name "z"))
                          ))
            ]))))))
   ```
   matches the pattern ` (Let ("y", Readint,                                                                                                                                                                         If (Lt (Readint, Const 4),
  While (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))), Sub (Const 6, Sub (Sub (Const 3, Const 1), Const 29))),
   Seq
    [If (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))), Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))), Const 1, Print (Const 1));
     If (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))), Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))), Const 4, Print (Const 4))]),
  Seq
   [Let ("sum",
     Fun ("a", Int,
      Fun ("b", Int, If (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)), Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))), Add (Name "a", Name "b"), Print (Const 9999)))),
     While (Gt (Apply (Apply (Name "sum", Const 9), Const 10), Apply (Apply (Name "sum", Const 1), Const 2)), Print (Let ("z", Readint, Name "z"))))])))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;                                          
- : Program.expr =
Let ("sum", Fun ("b", Int, Add (Name "a", Name "b")),
 Let ("y", Readint,
  If (Lt (Readint, Const 4),
   While
    (Eq (Mul (Const 21, Mul (Const 13, Mul (Const 2, Const 1))),
      Sub (Const 6, Sub (Sub (Const 3, Const 1), Const 29))),
    Seq
     [If
       (Gt (Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1))),
         Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1))),
       Const 1, Print (Const 1));
      If
       (Gt (Add (Const 4, Add (Const 4, Add (Const 4, Const 4))),
         Mul (Const 4, Mul (Add (Const 4, Const 4), Const 4))),
       Const 4, Print (Const 4))]),
   Seq
    [Let ("sum",
      Fun ("a", Int,
       Fun ("b", Int,
        If
         (Eq (Add (Const 1, Mul (Sub (Const 1, Const 1), Const 1)),
           Add (Const 1, Mul (Const 1, Sub (Const 1, Const 1)))),
         Add (Name "a", Name "b"), Print (Const 9999)))),
      While
       (Gt (Apply (Apply (Name "sum", Const 9), Const 10),
         Apply (Apply (Name "sum", Const 1), Const 2)),
       Print (Let ("z", Readint, Name "z"))))])))

   ```



+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("a", Fun("a", Int, Name "a"),
    Let("b", Fun("b", Int, Name "b"),
        Let("c", Fun("c", Int, Name "c"),
            Let("d", Fun("d", Int, Name "d"),
                Let("e", Fun("e", Int, Name "e"), Readint)))))))
   ```
   matches the pattern ` (Readint)`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;        
- : Program.expr =
Let ("a", Name "a",
 Let ("b", Name "b",
  Let ("c", Name "c", Let ("d", Name "d", Let ("e", Name "e", Readint)))))

   ```



+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("y", Sub(Const 0, Const 0),
    Let("z", If(Gt(Name "y", Const 4), Const 1, Const 0),
        Seq
        [Print(Name "y");
         If(Eq(Add(Const 1, Const 0), Sub(Const 2, Const 1)),
            Let("z", Readint, Name "z"), Add(Const 42, Const 17))]))))
   ```
   matches the pattern ` (Let("y", Sub(Const 0, Const 0),
    Seq
    [Print(Name "y");
     If(Eq(Add(Const 1, Const 0), Sub(Const 2, Const 1)),
         Let("z", Readint, Name "z"), Add(Const 42, Const 17))]))`.

   




+  _0_ / _1.0_ : Fail: 
Check that the result of evaluating
   ```
    (unused_def_elim (Let("a", Fun("a1", Int, Print(Name "a1")),
    Let("b", Fun("b1", Int, Name "b1"),
        Let("c", Fun("c1", Int, Name "c"),
            Let("d", Fun("d1", Int, Name "d"),
                Let("e", Fun("e1", Int, Name "e"),
                    Let("a", Fun("a2", Int, Print(Name "a2")),
                        Let("b", Fun("b2", Int, Name "b"),
                            Let("c", Fun("c2", Int, Name "c"),
                                Let("d", Fun("d2", Int, Name "d"),
                                    Let("e", Fun("e2", Int, Name "e"),
                                        Apply(Name "a", Readint)))))))))))))
   ```
   matches the pattern ` (Let("a", Fun("a2", Int, Print(Name "a2")), Apply(Name "a", Readint)))`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;                    
- : Program.expr =
Let ("a", Fun ("a1", Int, Print (Name "a1")),
 Let ("b", Name "b1",
  Let ("d", Fun ("d1", Int, Name "d"),
   Let ("e", Fun ("e1", Int, Name "e"),
    Let ("a", Fun ("a2", Int, Print (Name "a2")),
     Let ("b", Fun ("b2", Int, Name "b"),
      Let ("c", Fun ("c2", Int, Name "c"),
       Let ("d", Fun ("d2", Int, Name "d"),
        Let ("e", Fun ("e2", Int, Name "e"), Apply (Name "a", Readint))))))))))

   ```



#### Subtotal: _5.0_ / _10.0_

## Manual tests entered by TA: blowe012

+  _3_ / _3.0_ : Pass: Exhaustive match statement (-.25 for each that is missing)

    score: 3 (out of 3.0)


+  _1_ / _2.0_ : Pass: Are shadow bindings in the body handled correctly ?

    score: 1 (out of 2.0)


+  _1_ / _2.0_ : Pass: Are function bindings handled correctly ?

    score: 1 (out of 2.0)


+  _2_ / _2.0_ : Pass: Are Set statements in the definition handled correctly ?

    score: 2 (out of 2.0)


+  _2_ / _2.0_ : Pass: Are readint statements in the definition handled correctly

    score: 2 (out of 2.0)


+  _2_ / _2.0_ : Pass: Are print statements in the definition handled correctly ?

    score: 2 (out of 2.0)


+  _1_ / _2.0_ : Pass: Are function applications in the definition handled correctly ?

    score: 1 (out of 2.0)


+ Pass: Other Stylistic Comments & Feedback

    

#### Subtotal: _12_ / _15.0_

