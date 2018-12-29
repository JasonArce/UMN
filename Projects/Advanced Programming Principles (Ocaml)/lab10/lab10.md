# Lab 10: More reasoning about programs

*CSci 2041: Advanced Programming Principles, Fall 2015*

**Due:** Thursday, November 16 at 11:59pm.

## Ground rules

You may choose to work alone or with a partner on this lab. If you choose to work in a group, follow these [group instructions](group-instructions.md) to set up a group repository, and use that repository to store your work in this lab.

Although labs are meant to be an open and collaborative environment, it is the
responsibility of all partners to contribute to learning the materials in every
lab. In particular, all partners are responsible for ensuring that submissions
are received by the due date.

As will be the case for all labs this semester, your work should appear in a directory called `lab9` of your personal or group repository.  The easiest way to accomplish this is to do a `git pull` in the public `labs2041-f17a` repository to get the lab files, then do a recursive copy to copy the entire `lab10` folder into the destination repository:

```
% cd ~/csci2041/labs2041-f17a
% git pull
% cd ..
% cp -R labs2041-f17a/lab10 repo-dest1234/
% cd repo-dest1234/
% git add lab10
```

# Introduction: Goals for this lab

+ Get some experience writing proofs about OCaml programs on
  structured types

## Answering the questions in this lab

Add your solutions to the file named `lab10-sol.md` in the `lab10` directory.
You should add your solutions to each of the two following problems under the
same headings as the problems are given.

## List induction
Using the following code to produce the element-wise sum of two lists:

```
let rec list_add l1 l2 = match (l1, l2) with
| ([], ls) | (ls, []) -> ls
| (a1::t1, a2::t2) -> (a1+a2)::(list_add t1 t2)
```

Prove that for all `l1` &in; `int list`, for all `l2` &in; `int list`,
>  `length (list_add l1 l2)` = `max (length l1) (length l2)`

You might find it convenient to consider this by cases, such as
when `length l1 <= length l2` and when `length l1 > length l2`.

Don't forget that your proof should clearly state the property you are
trying to prove, the base case, the inductive case, and what you get from
the inductive hypothesis.  Each step in your proof should include a
formal justification.

## Polynomials
Let's reason about the following code for symbolic representation of polynomials:

```
type polyExpr = Add of polyExpr * polyExpr
| Mul of polyExpr*polyExpr
| X
| Int of int

(* degree of a symbolic polynomial *)
let rec deg expr = match expr with
| Int _ -> 0
| X -> 1
| Add (e1,e2) -> max (deg e1) (deg e2)
| Mul (e1,e2) -> (deg e1) + (deg e2)

(* Simplify the constants in a symbolic polynomial *)
let rec simplify expr = match expr with
| Int i -> Int i
| X -> X
| Add (e1,e2) ->
  ( match (simplify e1, simplify e2) with
	| (Int i1, Int i2) -> Int (i1+i2)
	| (s1, s2) -> Add (s1,s2) )
| Mul (e1, e2) ->
 ( match (simplify e1, simplify e2) with
	| (Int i1, Int i2) -> Int (i1*i2)
	| (s1, s2) -> Mul (s1, s2) )
```

Prove that ``simplify`` preserves the degree of a polynomial in this
representation:

For all `p1` &in; `polyExpr`,
>  `deg p1` = `deg (simplify p1)`.

# Commit and push so that everything is up on GitHub

Now you need to just turn in your work. Commit your `lab10-sol.md` file and push
it up to your central GitHub repository.

Verify that this worked, by using your browser to see the changes on
https://github.umn.edu.

If you do not properly push your changes to the repository we
cannot give you credit for the lab, so please remember to do this
step!

__This concludes lab 10.__

**Due:** Thursday, November 16 at 11:59pm.

Note that any required changes must exist in your repository on
github.umn.edu. Doing the work but failing to push those changes
to your central repository will mean that we cannot see your work
and hence can't grade it.
