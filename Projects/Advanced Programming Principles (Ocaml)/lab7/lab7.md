# Lab 7: Manipulating Programs as Data

*CSci 2041: Advanced Programming Principles, Fall 2017 (afternoons)*

**Due:** Thursday, October 26 at 11:59pm.

## Ground rules

You may choose to work alone or with a partner on this lab. If you choose to work in a group, follow these [group instructions](group-instructions.md) to set up a group repository, and use that repository to store your work in this lab.

Although labs are meant to be an open and collaborative environment, it is the
responsibility of both partners to contribute to learning the materials in every
lab. In particular, all partners are responsible for ensuring that submissions
are received by the due date.

As will be the case for all labs this semester, your work should appear in a directory called `lab7` of your personal or group repository.  The easiest way to accomplish this is to do a `git pull` in the public `labs2041-f17a` repository to get the lab files, then do a recursive copy to copy the entire `lab7` folder into the destination repository:

```
% cd ~/csci2041/labs2041-f17a
% git pull
% cd ..
% cp -R labs2041-f17a/lab7 repo-dest1234/
% cd repo-dest1234/
% git add lab7
```
## Ground rules

You may choose to work with a partner on this lab.  Although labs are meant to
be an open and collaborative environment, it is the responsibility of
both partners to contribute to learning the materials in every lab.
In particular, both partners are responsible for ensuring that submissions are
received by the due date, and for letting us know if one teammate does
not participate in a given lab.

# Introduction: Goals for this lab

+ Practice writing OCaml code using exceptions

+ Practice writing OCaml code in continuation-passing style

## Exceptions

The file `prog.ml` contains a datatype representing a small (but "Turing
complete" -- meaning capable of expressing any computation that can be expressed
in any other programming language) part of our fragment of a programming
language and an evaluation function for programs in this datatype.  It also
defines five values representing miserable failures of programs, literally:
evaluating any of these programs with an initially empty state will result in an
unhelpful exception.   Add exceptions to represent each of these situations
(including enough information to give a useful debugging message):

+ `UnboundName` that carries the name that caused the exception

+ `ArithTypeErr` (raised when the program tries to do arithmetic on at least one non-integer value) that carries the two arguments causing the error

+ `CondTypeErr` (raised when the condition for an if or while expression evaluates to a non-boolean value) that carries the value that caused the error

+ `CompTypeErr` (raised when the program attempts to compare at least one non-integer value) that carries the two arguments causing the error.

and modify `eval` so that it raises the appropriate exception in each of these cases.

Once you're done, modify the definition of the function `runProg :
expr -> unit` that runs its argument with an empty initial state and prints
out the result of the program evaluation.  If any exceptions are
raised by `eval`, `runProg` should handle the exception by printing a
useful error message.  (For example, the message printed for an unbound
name should include the name.)

## Continuations

The file `kfuncs.ml` includes four non-tail recursive functions, and a
continuation-passing version of the first, `map_k`.  Let's transform
the rest of these functions to continuation-passing style: add OCaml
definitions for the following functions:

+ `append_k : 'a list -> 'a list -> 'a list`: Just like in `map_k`,
  you can define an internal helper function that takes the
  continuation `k` as an argument; since `l2` is never modified you
  could leave it off to make your tail calls a bit simpler to read.

  `append_k` should have the same behavior as `@`, e.g. `append_k [1;3] [2;4]` should evaluate to `[1; 3; 2; 4]`, but should be able to handle long lists without a stack overflow.

+ `assoc_update_k: 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list`
  updates the binding associated with a key in an associative list, or
  adds the binding if none is found.  Using a local helper function
  will also help make the tail calls simpler here.  A few example evaluations:

    * `assoc_update_k "v1" 4 [("v2",3); ("v1", 6); ("v0", 9)]` should evaluate to `[("v2",3); ("v1",4); ("v0", 9)]`

    * `assoc_update_k "u" 1 [("v",0); ("x",0)]` should evaluate to `[("v",0); ("x",0); ("u",1)]`

    * Long lists should be handled without a stack overflow.

+ `treeMin_k : 'a btree -> 'a` finds the minimum value in a binary
  tree.  This one is a bit trickier to write cleanly.  You might
  consider writing a separate helper function for the continuation:
  `min_k : 'a -> ('a option -> 'b) -> 'a option -> 'b`, which handles
  the logic of matching the `'a option` computed recursively,
  computing the min, and passing it to a continuation.  Some example evaluations:

    * `treeMin_k (tree_chain 1000000 Empty)` should evaluate to `Some 1`

    * `treeMin_k (tree_chain 999999 (Node(-1,Empty,Empty)))` should evaluate to `Some (-1)`


# Commit and push so that everything is up on GitHub

Now you need to just turn in your work. Commit your changes and push
them up to your central GitHub repository.

Verify that this worked, by using your browser to see the changes on
https://github.umn.edu.

If you do not properly push your changes to the repository we
cannot give you credit for the lab, so please remember to do this
step!

__This concludes lab 7.__

**Due:** Thursday, October 26 at 11:59pm.

Note that any required changes must exist in your repository on
github.umn.edu. Doing the work but failing to push those changes
to your central repository will mean that we cannot see your work
and hence can't grade it.
