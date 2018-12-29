# Lab 9: Reasoning about programs

*CSci 2041: Advanced Programming Principles, Fall 2017 (afternoons)*

**Due:** Thursday, November 9 at 11:59pm.

## Ground rules

You may choose to work alone or with a partner on this lab. If you choose to work in a group, follow these [group instructions](group-instructions.md) to set up a group repository, and use that repository to store your work in this lab.

Although labs are meant to be an open and collaborative environment, it is the
responsibility of all partners to contribute to learning the materials in every
lab. In particular, all partners are responsible for ensuring that submissions
are received by the due date.

As will be the case for all labs this semester, your work should appear in a directory called `lab9` of your personal or group repository.  The easiest way to accomplish this is to do a `git pull` in the public `labs2041-f17a` repository to get the lab files, then do a recursive copy to copy the entire `lab9` folder into the destination repository:

```
% cd ~/csci2041/labs2041-f17a
% git pull
% cd ..
% cp -R labs2041-f17a/lab9 repo-dest1234/
% cd repo-dest1234/
% git add lab9
```


# Introduction: Goals for this lab

+ Get some experience writing proofs about OCaml programs on integers

+ Get some experience writing proofs about structured natural numbers

## Answering the questions in this lab

In the  `lab9` directory in your team repository, add a file
named `lab9-sol.md`.  You should add your solutions
to each of the three following problems under the same headings as the
problems are given.

## Binomial Coefficients

Consider the following program to compute binomial coefficients
("choose"):

```
let rec choose n k =
  if (n=k) || (k = 0) then 1
  else ((choose (n-1) (k-1))*n)/k
  ```

Use induction on _n_ to prove that for all _n_  &in; &naturals; for all _k_  &in; &naturals;,

> _k_ <= _n_ &rArr; `choose n k` = n! / ((n-k)! * k!)

Your proof should:
1. State the precise property P( _n_ ) you're going prove.
2. Clearly state the base case and prove it's correct.
3. Clearly state the inductive case and inductive hypothesis, and
   formally prove the inductive hypothesis implies the inductive case.

When you are finished with your proof, check out the [example solution](choose.md).  How is your's different? Can you redo your solution in a better way now that you have seen the example? What problems do you have with the example?


## Structured Arithmetic

```
type nat = Zero | Succ of nat

let rec to_int n = match n with
| Zero -> 0
| Succ n -> 1 + (to_int n)

let rec minus_nat m n = match (m,n) with
| (_,Zero) -> m
| (Zero,_) -> invalid_arg "minus_nat not a natural number!"
| (Succ m1, Succ n1) -> minus_nat m1 n1
```

Use structured induction on the type `nat` to prove that for all `m` &in; `nat`, for all `n` &in; `nat`,

> `(to_int m) > (to_int n)` &rArr; `to_int (minus_nat m n) = (to_int m) - (to_int n)`

Your proof should have the same components as in the previous question.

## Structured Comparisons

```
let rec eq_nat n1 n2 = match (n1,n2) with
| (Zero,Zero) -> true
| (Zero,_) | (_, Zero) -> false
| (Succ n1', Succ n2') -> eq_nat n1' n2'
```

Use structured induction on the type `nat` to prove that for all `m` &in; `nat`, for all `n` &in; `nat`,

> `(to_int m) = (to_int n)` &hArr; `eq_nat m n`

Your proof should have the same components as in the previous questions.


# Commit and push so that everything is up on GitHub

Now you need to just turn in your work. Commit your `lab9-sol.md` file and push
it up to your central GitHub repository.

Verify that this worked, by using your browser to see the changes on
https://github.umn.edu.

If you do not properly push your changes to the repository we
cannot give you credit for the lab, so please remember to do this
step!

__This concludes lab 9.__

**Due:** Thursday, November 9 at 11:59pm.

Note that any required changes must exist in your repository on
github.umn.edu. Doing the work but failing to push those changes
to your central repository will mean that we cannot see your work
and hence can't grade it.
