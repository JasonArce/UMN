# Exercise Set 9: Induction on Natural Numbers

*CSci 2041: Advanced Programming Principles, Fall 2017 (Afternoons)*

**Due:** Monday, November 6 at 11:59am

## 1.  Types and Evaluations (review)

Copy the file `ex9/types.md` from the public `ex2041-f17a` repository to an `ex9` directory in your own repo.  Using this file as a template, fill in for each of the following expressions whether it will result in a compile-time type error (`Type: Error`) or, if it is well-typed, the type of the expression (e.g. `Type: float`).  On the following line, explain your answer.

1. `raise 3`

2. `try float_of_int (3/0) with _ -> infinity`

3. `let rec any p = function [] -> [] | h::t -> (p h) || (any p t) in any`

4. `let rec flip x y = flip y x in (flip 2)`

5. `let rec mop b f = function [] -> [] | h::t -> if b then ((f h)::(mop false f t)) else (mop true f t) in mop`

6. `let rec pam f = function [] -> [] | h::t -> (pam f t)::(f h) in pam`

7. `let rec dlof f = function [] -> f None None | h::t -> f (Some h) (Some (dlof f t)) in dlof`

8. `try (Invalid_argument "3") with _ -> Not_found`

### Test cases

In order to receive full credit for this problem, your solution should have the correct type and some explanation for at least 6/8 questions.

## 2.  Buggy Induction Proofs
Some problems in this section involve the "structured natural numbers" from Friday's lecture.  For reference we define them here:

```
type nat = Zero | Succ of nat
let rec to_int (n:nat) = match n with
| Zero -> 0
| Succ m -> 1 + (to_int m)

let rec plus_nat m n =  match m with
| Zero -> n
| Succ m' -> Succ (plus_nat m' n)

let rec mul_nat m n = match m with
| Zero -> Zero
| Succ m' -> plus_nat n (mul_nat m' n)
```

In each of the sections below we will give a (false) proof by induction about
a program behavior.  Your job is to identify the line number on which the proof
goes wrong, and explain why that line is incorrect.  

### `tr_fact`
Consider the following definition:

```
let fact n =
  let rec tr_fact i acc =
    if i = 0 then acc
    else tr_fact (i-1) (acc*i)
  in tr_fact n 1
```

Find the error in the following "proof" that &forall; `n` > 0 &in; &naturals;. &forall; _acc_.  `tr_fact` `n` _acc_ = `n` * _acc_:

1. Base Case: &forall; _acc_,
2. `tr_fact` `1` _acc_  = `tr_fact` `0` `1 *`_acc_  **[ by evaluation of `tr_fact` ]**
3.  = `1 * `_acc_, **[eval of `tr_fact`]**, &check;

4. Inductive Case: &forall; `n`, P(`n`) &rArr; P(`n+1`)
5. IH: P(`n`) &equiv; &forall; _acc_ . `tr_fact` `n` _acc_ = `n * ` _acc_
6. Assuming IH. we need to prove P(`n+1`) &equiv; &forall; _acc_ . `tr_fact (n+1) `_acc_ = `(n+1) * `_acc_
7. We have:
8. `tr_fact ` `(n+1)` _acc_ = `tr_fact` `((n+1)-1)` `((n+1) * `_acc_`)` **[eval of `tr_fact`]**
9. = `tr_fact` `n` `((n+1) * `_acc_`)` **[simplification]**
10. =  `(n+1) *`_acc_ **[by IH]**, &check;

### `rfact`
Here's another definition:
```
let rec rfact n = if n < 2 then n else n*(rfact (n-1))
```

Find and explain the bug in the following "proof" that &forall; n &in; &naturals; . `rfact n` = 0:

1. Base Case: `rfact 0`= 0 **[eval of `rfact`]**, &check;

2. Inductive Case: &forall; i. P(i) &rArr; P(i+1)

3. IH: P(`n`) &equiv; `rfact n` = 0
4. Assuming IH, we need to prove that P(`n`+1), e.g. `rfact (n+1)` = 0.  We have:
5. `rfact n+1` = `(n+1)*(rfact n)` **[eval of `rfact`]**
6. = `(n+1) * `0 **[by IH]**
7. = 0, &check;

### `tr_nat`
Using this definition:

```
let tr_nat n m = match m with
| Zero -> n
| Succ m -> tr_nat (n+1) m
```

Here's a "proof" that &forall; `m` &in; `nat`. &forall; n &in; &naturals;. `tr_nat` n `m` = `to_int m`.  Where's the bug?

1. Base Case: n = 0, `m` = `Zero`:
2. `tr_nat ` 0 `Zero` = 0 **[eval of `tr_nat`]**
3. = `to_int Zero` **[eval of `to_int`]** &check;

4. Inductive case: &forall; `m`. P(`m`) &rArr; P(`Succ m`):

5. IH: &forall; m. &forall; n. `tr_nat ` n `m` = `to_int m`
6. Assuming IH, need to show that &forall; n. `tr_nat` n `Succ m` = `to_int (Succ m)`:
7. `tr_nat` n `Succ m` = `to_int (Succ m)` **[by IH, &forall; m . P(m)]** &check;

### `pow2_nat`
Using these definitions:
```
let rec pow2_nat = function
| Zero -> 1
| Succ n -> 2 * (pow2_nat n)

let rec pow2 n acc =
  if n = 0 then acc
  else pow2 (n-1) 2*acc
```
What's wrong with the following proof that &forall; `n` &in; `nat`. &forall; _a_. `pow2_nat n` = `pow2 (to_int n)` _a_?

1. Property P(`n`): &forall; _a_ . `pow2_nat n` = `pow2 (to_int n) ` _a_.
2. Base Case: P(`Zero`) &equiv; &forall; _a_. `pow2_nat Zero` = `pow2 (to_int n)` _a_.
3. `pow2_nat Zero` = 1 **[eval of `pow2_nat`]**
4. `pow2 (to_int Zero) `_a_ = `pow2 0 ` _a_ **[eval of `to_int`]**
5. `pow2 0 ` _a_ = _a_ **[eval of `pow2`]**
6. Thus, P(`Zero`) is true when  _a_ = 1, &check;

7. Inductive case: &forall; `n`. P(`n`) &rArr; P(`Succ n`):

8. IH: &forall; _a_ . `pow2_nat n` = `pow2 (to_int n) `_a_.
9. Assuming IH, we need to show that `pow2_nat (Succ n)` = `pow2 (to_int (Succ n))`_a_.
10. `pow2_nat (Succ n)` = `2 * (pow2_nat n)` **[eval of `pow2_nat`]**
11. `2*(pow2_nat n)` = `2*(pow2 (to_int n) ` _a_ ` )` **[by IH]**
12. = `pow2 (to_int n) 2*`_a_ **[lemma: by induction]**
13. = `pow2 (1 + (to_int n)) `_a_ **[reverse eval of `pow2`]**
14. = `pow2 (to_int (Succ n)) `_a_ **[reverse eval of `to_int`]** &check;

15. We need the lemma that says &forall; n, &forall; _a_, `2*(pow2 n  `_a_` )` = `pow2 n (2 * `_a_`)`.
16. Base case: `2*(pow2 0 `_a_`)`  = `2*`_a_ = `pow2 0 (2*`_a_`)`.
17. IH: &forall; _a_, `2*(pow2 n `_a_`)`  = `pow2 n (2 * `_a_`)`
18. then `2*(pow2 (n+1) `_a_`)` = `2*(pow2 n (2*`_a_`))` **[evaluation]**
19. = `(pow2 n (2*(2*`_a_`)))` **[IH]**
20. = `(pow2 (n+1) 2*`_a_`)` **[reverse eval]** &check;

### Answer format and test cases

Your solutions for this section should go in the file `ex9/bugs.md` following the format in the copy of this file appearing in the public `ex2041-f17a` repo, and follow the format in that file. Try to complete 3 of the 4 questions in this section.

## 3.  Induction Proofs (without bugs)

Now let's prove true versions of the false theorems above:

### `tr_fact`

Using the definition of `tr_fact` above, prove that &forall; _n_ &in; &naturals;. &forall; _a_ . `tr_fact `_n_  _a_ = _n_! `*` _a_.

### `tr_nat`

Using the definition of `tr_nat` above, prove that &forall; `m` &in; `nat` . &forall; _n_ &in; &naturals; . `tr_nat ` _n_ ` m` = _n_  + `(to_int m)`.

### `pow2_nat`

Using the definitions of `pow2_nat` and `pow2` above, prove that &forall; `n` &in; `nat` . &forall; _a_ &in; &naturals; . _a_ `* (pow2_nat n)` = `(pow2 (to_int n)  `_a_`)`.

### Test cases
Put your solution in a file named `proofs.md`  Each proof should have a "level 1 heading" with the problem name, a "level 3 heading" with the name "Property" under which is stated the property P(_n_) being proven for all _n_, a level 3 heading with the name "Base Case", under which the base case is proven, a level 3 heading with the name "Inductive Case" under which the inductive case is stated, a level 4 heading which states the inductive hypothesis, and the proof, for example:

```
# `rfact`

### Property
P(_n_): `rfact `_n_ = 0

### Base Case
P(0): `rfact 0` = 0 **[eval of `rfact`]**, &check;

### Inductive Case
&forall; _n_ . `rfact `_n_ = 0 &rArr; `rfact (`_n_` + 1)` = 0

#### IH: `rfact `_n_ = 0.
We need to prove that `rfact (`_n_` + 1)` = 0.  We have:
`rfact (`_n_` + 1)` = `(`_n_`+1) * (rfact `_n_`)` **[eval of `rfact`]**
= `(`_n_` + 1) * ` 0 **[by IH]**
= 0, &check;
```

Unfortunately, performing automated grading of induction proofs without teaching a separate class on automated theorem-proving tools is not feasible. Thus the gitbot will only check that your solutions have the required components.  You should attempt at least 2 proofs in this section.
