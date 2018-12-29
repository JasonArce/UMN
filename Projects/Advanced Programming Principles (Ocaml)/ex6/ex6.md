# Exercise Set 6: Programs as Data, Part I

*CSci 2041: Advanced Programming Principles, Fall 2017 (Afternoons)*

**Due:** Monday, October 16 at 11:59am

## 1. Syntax Trees

In the file `ex6/syntax.ml` in the public `ex2041-f17a` repo, you will find the data structure for representing programs we worked on in Monday's lecture.  Copy the file to an `ex6` directory in your personal repo, and use it to answer these questions.

### Encoding expressions as syntax trees

The following two OCaml programs can be represented by values of type `expr`.  Complete the let declarations in `syntax.ml` binding each OCaml name to the correct `expr` value:  (Note that we are looking for an expression that encodes the computation, not the result.  But a fair check would be to call eval on each and see if you get the same result as for evaluating the OCaml expression.)


#### `e_collatz`

```
let n = 31 in
let n2 = n/2 in
if n2*2 = n then n2 else 3*n+1
```

#### `e_ifchain`

```
let x = 42 - 17 in
if (x > 17) && true then (if (x < 31) || false then 1 else 0) else (-1)
```

#### `e_uclid`
```
let p1 = 2*3+1 in
let p2 = 5*(p1 - 1)+1 in 7*(p2-1)+1
```

Test cases: 1 for each `expr` value.

### Extending Syntax trees with new expression types

Let's extend the syntax tree types and eval function to handle two new variants of expressions, the `Mod` expression and the `BoolLet` expression.

#### `Mod`

A `Mod` value holds two subexpressions, and when evaluated, returns the value of its first expression modulo the value of its second expression.  (The modular reduction function in OCaml is `mod`).  Add a `Mod` constructor to the `expr` type and a corresponding pattern in `eval` to handle this new variant.  Test cases: the expression  `Mod (Const 8, Const 5)` should have type `expr` and compile without an error, and `eval (Mod (Const 17, Const 3)) []` should evaluate to `2`.  

#### `BLet`

A boolean let, or `BLet`, holds a string, a boolean subexpression, and a
subexpression, and when evaluated, it evaluates the boolean subexpression, and
binds the string name to the resulting boolean value and then evaluates the
regular subexpression with this binding.  Since regular environments map names
to integer values, adding `BLet` to `expr` will require extending both `eval`
and `beval` to take a third parameter, which is the "boolean environment" that
maps names (strings) to boolean values (`bool`). We'll also need a new
constructor for `boolExpr` values that reference names bound in `BLet`, `BName`.
Add a `BLet` constructor to `expr`, a `BName` constructor to `boolExpr`, and
modify `eval` and `beval` to evaluate expressions with boolean lets in them.
Some test cases: `BLet ("cnd", BConst true, If(BName "cnd", Const 1, Const
(-1)))` should have type `expr` and compile without an error, `And (BName
"bvar", BConst true)` should have type `boolExpr` and compile without an error;
`beval (BName "v") [] [("v", true)]` should evaluate to `true`, and `eval BLet
("c", BConst false, If (BName "c", Const 1, Const 17)) [] []` should evaluate to `17`.


### Test cases

In order to receive full credit for this problem, your solution should agree with the example evaluations on at least 5/9 cases.  Notice that solving the `BLet` portion will necessitate changing the second test case for `Mod`, since we'll be adding an argument to `eval`.  The feedback script will test both cases, but we'll only expect one to succeed.

## 2. Type Rules and Type Checking

In the file `ex6/typecheck.ml` in the public `ex2041-f17a` repo, you will find the data structure, evaluation, name-checking and type-checking functions for representing programs with primitive types we worked on in Wednesday's lecture.  Copy the file to the `ex6` directory in your personal repo, and use it to answer these questions.

### Typing Rules

The expressions we worked on in lecture could have type either `Int` or `Bool`, but in typical programs we would want several other data types and operations.  In this exercise, we'll add two types and four operations related to these types to the program.  Before we write the actual implementation of these types and operations, let's first work out the typing rules for them.  Remember that a typing rule has the general form "`e_1 : t_1`, `e_2 : t_2`, ... `=>` `e' : t'` ", which says that if each expression `e_i` has type `t_i` then the new expression `e'` (which is composed of the subexpressions `e_1`,...,) has type `t'`.  So for example, the typing rule for integer constants is "` => Const i : Int`" (because an integer constant doesn't have any subexpressions, and always has type `Int`) and the typing rule for `Add` expressions is `e1 : Int, e2 : Int => Add (e1,e2) : Int` (because the result of adding two expressions is only correctly typed if they both have type `Int`, in which case the sum will also have type `Int`.)

#### unit  

We will be adding the new type `Unit` to our expressions.  This will involve adding a new value constructor to `expr`, `UConst`, which doesn't hold any value.  In the comment at the top of `typecheck.ml`, add a line with the typing rule for the expression `UConst` under the bullet for `UConst`, so the comment will start with:
```
(* Typing rules for new types and operations:
+ UConst
<your typing rule here>
```

#### print

We'll add the `Print` expression to our language, which holds a subexpression `e`, such that when `Print e` is evaluated, we evaluate `e`, print the resulting integer, and return a value of type `Unit`.  Add the typing rule for `Print e` under the next bullet in the comment.  The gitbot is picky, so make sure you use `e` as the name of the subexpression.

#### string

We'll also add strings to our language, represented by the `expType` constructor `StringT`.  Strings in our language can be introduced as constants, `SConst s`; as the result of a `SFirst` expression, which holds a subexpression `e`, and when evaluated, evaluates `e` and returns the single character string from the start of `e` (or `""` if `e` evaluates to the empty string); as the result of a `SRest` expression, which holds a subexpression `e`, and when evaluated, evaluates `e` and returns the string after the first letter in `e` (or `""` if there are less than 2 letters in `e`); and as the result of a `Concat` expression, which holds two subexpressions, `e1` and `e2`, and when evaluated, evaluates `e1` and `e2` and concatenates the resulting strings.  Add typing rules for `SConst s`, `SFirst e`, `SRest e`, and `Concat (e1,e2)` in the appropriate spaces.

### Implementations

Now that you've worked out the typing rules, add the expression constructors `UConst`, `SConst`, `SFirst`, `SRest`, and `Concat` to the `expr` type declaration, add `UnitR` and `StringR` constructors to the `result` type declaration, and `Unit` and `StringT` constructors to the `expType` declaration.  Modify `eval`, `unbound`, and `typeof` to handle these new expressions. Some example evaluations:

+ `Print (Const 2)` should compile without errors and have type `expr`

+ `Eq (SConst "a", SFirst (SConst "ab"))` should compile without errors and have type `expr`

+ `Concat (SConst "a", SRest (SConst "b"))` should compile without errors and have type `expr`

+ `UConst` should compile without errors and have type `expr`

+ `typeof (Concat (SConst "a", SRest (SConst "b"))) []` should evaluate to `StringT`

+ `unbound (Print (Const 3)) []` should evaluate to `[]`

 + `eval (Concat (SFirst (SConst "ab"), SRest (SConst "ab"))) []` should evaluate to `StringR "ab"`.

### Test cases
In order to receive full credit, your solutions to this problem should agree on at least 7/13 of the example evaluations.


## 3. Functions and Substitutions

The file `ex6/funval.ml` extends the previous `typecheck.ml` to include functions and function applications.  We'll encode a few simple functions and then implement a program transformation on expressions in this file.

### Encoding Simple functions

The `funval.ml` file already has let declarations for three function values, that we should fill in.

#### `add1fun`

The name says it all: `add1fun` is a function that adds 1 to its argument.  Modify the let binding to the correct `expr` value representing this function. Example evaluation: `eval (Apply(add1fun, Const 16)) []` should evaluate to `IntR 17`

#### `collatz_fun`

The *Collatz Function* takes an integer `n`, and checks if `n` is odd. If it is not, the function returns `n/2`, and otherwise it return `3*n+1`.  We can test whether `n` is odd by checking whether `2*(n/2) = n`.  Modify the let binding to a correct expr value representing this function.  Example evaluation: `eval (Apply(collatz_fun, Const 31)) []` should evaluate to `IntR 94`.

#### `kdelta`

The *Kronecker delta function* takes two integers as arguments and returns 1 if they are the same, and 0 otherwise.  Modify the let binding to a correct expr value representing this function.  Example evaluation: `eval (Apply(Apply(kdelta, Const 17), Const 3)) []` should evaluation to `IntR 0`.

### `inline` and `subst`

We will also write a program transformation, `inline`, and its helper function `subst`.  The program transformation `inline : expr -> expr` finds all of the `Let` and `Apply` subexpressions in its argument, and "inlines" the computation by replacing every instance of the `Name` referring to the argument (of a function) or bound name (of a let) with the subexpression it represents.  This replacement is achieved by calling the `subst : expr -> string -> expr -> expr` function, which replaces every `Name` subexpression with label matching its second argument with the expression given as its first argument.  So:

+ `subst (Const 1) "x" (Name "x")` should evaluate to `Const 1`

+ `inline (Let ("x", Const 1, Name "x"))` should evaluate to `Const 1`

+ `inline (Apply(Fun("x", Int, Name "x"), Const 1))` should also evalute to `Const 1`.

And furthermore:

+ `inline (Apply(Apply(kdelta, Const 3), Const 3))` should evaluate to `If (Eq (Const 3, Const 3), Const 1, Const 0)`

+ `inline (Apply(collatz_fun,Const 31))` should evaluate to `If (Eq (Mul (Div (Const 31, Const 2), Const 2), Const 31), Div (Const 31, Const 2), Add (Mul (Const 3, Const 31), Const 1))`.

Fill in the definitions for these functions.

### Test cases

One for each example evaluation given above.

Your solution must pass 4/8 test cases to get full credit for this problem.
