# Exercise Set 2: More Introductory OCaml

*CSci 2041: Advanced Programming Principles, Fall 2017 (Afternoons)*

**Due:** Monday, September 18 at 11:59am

## 1. Functions, recursion, tuples, lists, and patterns

The file `ex2/functions.ml` contains some syntax to get you started on this problem.  Copy it to an `ex2` directory in your personal repository (remember to `git add` the directory and the file before you commit!) and read on:

### `++`

*Saturating Arithmetic* is an alternative approach to dealing with
overflows in machine integers.  When the result of an operation is
too large (or too negative) to represent in a machine integer,
saturating arithmetic operations return the largest (or most
negative) representable value, rather than "wrapping around" as in
two's complement.  Implement saturating addition as an OCaml infix
operator, `(++) : int -> int -> int`, assuming 16-bit machine integers.  (So the maximum
value is 32767 and the most negative value is -32768).  Some sample
evaluations:

+ `32765 ++ 5` evaluates to `32767`
+ `(-32000) ++ (-1024)` evaluates to `-32768`
+ `0 ++ 0` evaluates to `0`

You may assume that values that do not fit into 16 bits will not be
used as arguments.

### `vec_add`
We can use OCaml's tuples to represent two-dimensional vectors as
pairs of `float`s.  Write the OCaml definition for the function
`vec_add : (float * float) -> (float * float) -> (float*float)` that
adds two vectors together.  Some sample evaluations:

+ `vec_add (1.0,2.5) (3.0,-1.0)` evaluates to `(4., 1.5)`
+ `vec_add (0.0,1.0) (2.0,2.0)` evaluates to `(2., 3.)`

### `dot`
Recall that the dot-product or inner product of two vectors is the sum of the
component-wise products, e.g. in "math" the dot product of (a,b) and (c,d) is
`a*c+b*d`.  Write the OCaml definition for the function `dot : (float*float) ->
(float * float) -> float` to compute the dot product of two 2-dimensional
vectors.  Some sample evaluations:

+ `dot (0.0,2.0) (1.0,3.14)` evaluates to `6.28`
+ `dot (1.0,-1.0) (3.0,4.0)` evaluates to `-1.`

### `perp`
Two vectors are perpendicular or orthogonal if their inner product
is 0.  Write the OCaml definition for the function `perp : float*float
-> float*float -> bool` that returns true if its arguments are
perpendicular and false otherwise.  Sample evaluations:

+ `perp (0.,1.) (-1.,0.)` evaluates to `true`
+ `perp (1.,2.) (-1.,1.)` evaluates to `false`

For implementation simplicity, assume that the 0-vector `(0.,0.)` is
perpendicular to any vector, including itself.

### `range`

Students who have coded in python will likely be familiar with the function `range`, which can be used as a way to iterate through a list of integers via the idiom `for i in range(m,n): ...`.  Write the equivalent ocaml function:
```
range : int -> int -> int list
```
that takes two integers as parameters, and returns a list of all integers that are at least its first argument, and less than its second argument, that is:

+ `range 1 10` evaluates to `[1; 2; 3; 4; 5; 6; 7; 8; 9]`
+ `range 2 3` evaluates to `[2]`
+ `range 10 1` evaluates to `[]` (because there are no integers that are greater than or equal to `10` and less than `1`)

### `sum_positive`

The function `sum_positive : int list -> int` should take a list of integers as a parameter and return the sum of all of the positive integers in the list.  Some example evaluations:

+ `sum_positive []` evaluates to `0` because the sum of no integers is `0`.
+ `sum_positive [-1]` evaluates to `0`.
+ `sum_positive [1;-1;17]` evaluates to `18`

### `take`

The `functions.ml` file contains an a buggy implementation of the function `take :
int -> 'a list -> 'a list`.  The intended behavior is that `take n lst` returns
the first `n` elements of `lst`, or all of `lst` if it has fewer than `n`
elements.  Some example evaluations:

+ `take 1 []` evaluates to `[]`
+ `take 2 [ "a"; "b"; "c" ]` evaluates to `["a"; "b"]`
+ `take 0 [ 1; 2; 3 ]` evaluates to `[]`

Fix the implementation in the file to match this behavior.

### Test cases

Your solution must compile and agree on 12/18 example evaluations given above to get full credit for this question.

## 2. More types and evaluation

In your terminal, change directory to the ex2 directory within your personal class repository, and create a file with the name `evaluations.md` to record your answers to
this problem.  Remember to run `git add evaluations.md` before you commit.

For each of the following expressions, indicate whether OCaml will consider the
expression legal or not.  If it is not a legal expression, explain what the
problem is; otherwise, present its type and value.  Assume there are no bindings
preceding these expressions, that is, treat each expression as an independent
OCaml program.

1. `fun s -> match s with (x,[]) -> x | (_,h::t) -> h`

2. `let rec drip n x = match (n,x) with (0,_) -> [] | (h,t) -> drip (h-1,t) in drip`

3. `match [3] with h::t -> t::5`

4. `[1; 17; [1;3]]`

5. `[[]; ["hi"]; [":)"; ":("; "(o:)3"]]`

6. `let rec odds ls = match ls with [] -> [] | h::[] -> [h] | h::_::t -> h::(odds t) in odds [1;2;4;8]`

Your solution file should include each numbered expression, followed by the Legal/Not legal decision, followed by one or more lines of "answer", as follows:

```
1. `3 - 2 + 4`
Legal
type: int
value: 5

2. `3.14 * 6 * 6`
Not legal
The * operator has type int -> int -> int but 3.14 has type float
```

### Test cases
+ One for each expression above: correct Legal/Not legal label and one or more non-empty lines of explanation. (6 cases)

Your solution must pass 4/6 test cases to get full credit for this problem.


## 3. Tail Recursion and nested functions

The file `ex2/tailrec.ml` contains some syntax to get you started on this problem.  Copy it to an `ex2` directory in your personal repository (remember to `git add` the directory and the file before you commit!) and read on:

### `msort`

The `tailrec.ml` file contains an incomplete implementation of merge sort, a
sorting algorithm that works by splitting a list into two halves, recursively
sorting each half, and then merging the sorted results.  `msort` has a few
problems: first, the body is missing some base cases (it will recurse infinitely
as written), and second, the `merge` helper function is not tail recursive, so
the function will overflow the call stack when sorting a sufficiently large
list.  

Fix the helper function (it will need an accumulator parameter) so that it only
uses a fixed number of stack frames regardless of the size of the input list,
and complete the body of the definition.  You might find the functions
`List.rev` and `List.rev_append` useful here, since they are tail recursive.

Some example evaluations:
+ `msort []` evaluates to `[]`
+ `msort [0; 17; -32]` evaluates to `[-32; 0 ; 17]`
+ `msort ["not"; "me"; "string"; "list"]` evaluates to `["list"; "me"; "not"; "string"]`

### `range` again

Most likely your implementation of `range` from part 1 was not tail recursive.  Rework it here to use a tail-recursive helper function so that it uses at most a fixed number of stack frames regardless of the input parameters.

### `*@` operator

Another way to build lists in python is with the `*` operation: `n*lst` is `n` copies of the list `lst`, so for example `3*[1,2]` is the list `[1,2,1,2,1,2]`.  Let's implement the operator `( *@ ) : int -> 'a list -> 'a list` in OCaml to have the same behavior, and use tail recursion to use a fixed number of stack frames regardless of the input parameters.  Some example evaluations:

+ `3 *@ [1;2]` evaluates to `[1;2;1;2;1;2]`
+ `0 *@ [3.14159; 2.71828]` evaluates to `[]` (the same for any negative number of copies)
+ `17 *@ []` evaluates to `[]`

### Additional test cases
+ `range 1 1` evaluates to `[]`
+ `range 13 17` evaluates to `[13; 14; 15; 16]`
+ `msort (range 0 1000000)` does not fail with `Stack_overflow` (it might take noticeable time to evaluate in an interactive REPL like `utop`, though)
+ `range 0 1000000` does not fail with `Stack_overflow`
+ `1000000 *@ [1;2]` does not fail with `Stack_overflow`

Your solution must pass at least 7/11 test cases to get full credit for this problem.
