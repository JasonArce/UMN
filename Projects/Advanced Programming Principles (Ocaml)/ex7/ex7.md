# Exercise Set 7: Programs, Exceptions and Kontinuations

*CSci 2041: Advanced Programming Principles, Fall 2017 (Afternoons)*

**Due:** Monday, October 23 at 11:59am

## 1. Computing with program expressions

In the file `ex7/program.ml` in the public `ex2041-f17a` repo, you will find a data structure for representing programs similar to the one we worked on in Monday's lecture.  Copy the file to the `ex7` directory in your personal repo, and use it to answer these questions.

### `count_bindings`

The function `count_bindings` should count the number of places in an `expr` where a name is bound to a value.  So, for instance `count_bindings (Const 3)` should evaluate to `0`, `count_bindings (Let ("x", Const 4, Name "x"))` should evaluate to `1`, and `count_bindings (Let ("x", Const 4, Let ("y", Const 3, Add(Name "x", Name "y"))))` should evaluate to `2` (but so should `count_bindings (Let ("y", Const 3, Let ("y", BConst true, BConst false)))`, and `count_bindings (Let ("y",Let("y",Const 3, Const 4),Const 5)`).  Fill in the implementation of count_bindings.

### `has_shadow_binding`

A let binding is a *shadow binding* if it "covers" a previously bound name with a new value (such a binding casts a "shadow" over its body subexpression so that the previous definition is inaccessible, or can't be "seen").  Identifying shadow bindings can be an important step in many program manipulations (like renaming variables or trying to remove unused code).  Fill in the definition of the `has_shadow_binding` function so that it evaluates to `true` if its argument has at least one shadow binding and `false` otherwise.  Some example evaluations:

+ `has_shadow_binding (Const 1)` should evaluate to `false` (the expression doesn't even have a binding!)

+ `has_shadow_binding (Let ("x", Const 1, Let ("y", Const 2, Name "x")))` should evaluate to `false` since each name is bound only once in the expression.

+ `has_shadow_binding (Let ("x", Const 1, Let ("x", Const 2, Const 3)))` should evaluate to `true` since the inner let binding shadows the outer binding of `"x"`.

+ `has_shadow_binding (Let ("x", Let ("x", BConst true, Const 17), Name "x"))` shoudl evaluate to `false` because `"x"` isn't bound yet in the value subexpression of the outer let, and the body of the outer let expression is outside the scope of the inner let binding.

### Test cases

In order to receive full credit for this problem, your solution should agree with the example evaluations on at least 5/9 cases.

## 2. Exception types, type errors, and runtime exceptions

In the file `ex7/exntypes.md` you will find a skeleton for the solution to this problem.  In your terminal, copy this file to the `ex7` directory in your personal repository to record your answers to this problem.  Remember to run `git add exntypes.md` before you commit.

Each of the following expressions belongs to one of three distinct categories:

  (a) The expression contains a type error, and won't compile (Type Error)

  (b) The expression will compile without errors, but will result in a runtime exception, rather than a value, when evaluated. (Runtime Exception)

  (c) The expression will compile and can be evaluated without errors.

In your `exntypes.md` file, on the line following each expression, indicate which category it belongs to (`Type Error`, `Runtime Exception`, `Valid : `).   If the expression is valid, indicate the type of the expression on the same line.
On the next line, explain why the expression belongs to this category.  Assume there are no bindings preceding these expressions, that is, treat each expression as an independent OCaml program.

1. `raise`

2. ```
exception T of string;;
let strange x = raise (T x) in strange```

3. `Invalid_argument "Not OK?"`

4. `invalid_arg "OK?"`

5. ```
try String.sub "most unfortunate" (-1) 3 with
| Invalid_argument _ -> (-1)
| Failure _ -> (-2)```

6. ```
let rec list_mul = function
| [] -> 1 | 0::_ -> failwith "zero"
| h::t -> h * (list_mul t) in
try list_mul [2;0;5] with Failure "zero" -> 0```

7. `let guard_inv x = try (1/x) with  Division_by_zero -> infinity in guard_inv`

8. ```
exception F of int;;
F 7```

Your solution file should include each numbered expression, followed by the category (one of `Type Error`, `Runtime Exception`, or `Valid : `) (and possibly the type), followed by one or more lines of "reasoning", as follows:

```
1. `raise`
Valid : exn -> 'a
Raise takes a value of type `exn` and never returns, so its return type is `'a`.  If we had evaluated raise with an argument of the proper type, it would instead cause a runtime exception.

2. `exception T of string;; let strange x = raise (T x) in strange`

```

### Test cases
One for each expression above: the correct category label (and type for valid expressions) and one or more non-empty lines of explanation. (8 cases) In order to receive full credit, your solution should pass 6/8 cases.



## 3.  Continuations

In Friday's lecture, we saw that continuations can be used to make non-tail-recursive functions tail recursive (although a chain of continuations is still constructed in continuation-passing style, this chain doesn't reside on the system call stack).  Let's apply this technique to some familiar functions that aren't tail-recursive in the standard formulation. Copy the file `ex7/cps_functions.ml` from the public exercise repository to your personal repository and fill in these functions:

### `append_k`

The `append` function has type `'a list -> 'a list -> 'a list`, so the continuation-passing version, `append_k` will have type `'a list -> 'a list -> ('a list  -> 'b) -> 'b` (since the final argument is the continuation function).  When called with the initial continuation `(fun x->x)` it should have the typical behavior of `append`, for example:

+ `append_k [1;2;3] [4;5;6] (fun l -> l)` should evaluate to `[1;2;3;4;5;6]`

+ `append_k [] ["emptylist"; "example"] (fun l->l)` should evaluate to `["emptylist"; "example"]`

+ `append_k ['a'; 'b'] [] (fun l -> l)` should evaluate to `['a'; 'b']`.

Other initial continuations will naturally change the behavior, for instance:

+ `append_k ["deeply"] ["nested"] (fun l -> [[[l]]])` should evaluate to `[[[["deeply"; "nested"]]]]`

+ `append_k [1;2] [3;4;5] (fun l -> List.length l)` should evaluate to `5`.

### `filter_k`

Recall that the `filter` function takes a predicate and a list and returns all elements of the list that make the predicate return `true`.  So `filter` has type `('a -> bool) -> 'a list -> 'a list`.  The continuation-passing version, `filter_k`, will thus have an extra paramater (the continuation function) of type `'a list -> 'b`.  When called with the initial continuation `(fun l -> l)`, it should behave like `filter`, e.g.:

+ `filter_k (fun s -> s < "m") ["zoo"; "in"; "san"; "diego"] (fun l -> l)` should evaluate to `["in"; "diego"]`

+ `filter_k (fun i -> i mod 2 = 0) [1;2;4;5;7] (fun l -> l)` should evaluate to `[2;4]`.

And using other initial continuations will change this behavior, e.g.

+ `filter_k (fun _ -> true) [1;2;3] (fun l -> List.length l)` should evaluate to `3`

+ `filter_k (fun b -> b) [true; false; true; true] (fun _ -> "lolwut?")` should evaluate to `"lolwut?"`.

### `tree_sum`

`cps_functions.ml` already defines a `'a btree` type, that we'll use to write a tail-recursive, continuation-passing version of the function `tree_sum : int btree -> int`.  The trick in this case is that the continuation function itself will need to make a recursive call to `tree_sum_k` (on the second branch of the current node).  Example evaluations:

+ `tree_sum_k (Node(7, Node(3, Empty, Empty), Node(5, Node(1, Empty, Empty), Empty))) (fun s -> s)` should evaluate to `16`,

+ `tree_sum_k (Node(7, Node(3, Empty, Empty), Node(5, Node(1, Empty, Empty), Empty))) (fun s -> string_of_int s)` should evaluate to `"16"`, and

+ `tree_sum_k Empty (fun s -> s)` should evaluate to `0`

### `tree_map`

Like `map`, `tree_map` takes a function and a collection of elements to apply that function to, so it would have the type `tree_map : ('a -> 'b) -> 'a btree -> 'b btree`, and `tree_map_k` will have the type `tree_map_k : ('a -> 'b) -> 'a btree -> ('b btree -> 'c) -> 'c`.  Example evaluations:

+ `tree_map_k (string_of_int) (Node(7, Node(3, Empty, Empty), Node(5, Node(1, Empty, Empty), Empty))) (fun t -> t)` should evaluate to `Node ("7", Node ("3", Empty, Empty), Node ("5", Node ("1", Empty, Empty), Empty))`

+ `tree_map_k (fun x -> x/2) (Node(6, Empty, Empty)) (fun t->t)` should evaluate to `Node (3, Empty, Empty)`

+ `tree_map_k (fun s -> s^"!") Empty (fun t -> "ignored")` should evaluate to `"ignored"`.

### Test cases

One for each example evaluation given above.

Your solution must pass 8/15 test cases to get full credit for this problem.
