# Lab 13: Modules and Functors

*CSci 2041: Advanced Programming Principles, Fall 2017 (afternoons)*

**Due:** Thursday, December 7 at 11:59pm.

## Ground rules

You may choose to work alone or with a partner on this lab. If you choose to work in a group, follow these [group instructions](group-instructions.md) to set up a group repository, and use that repository to store your work in this lab.

Although labs are meant to be an open and collaborative environment, it is the
responsibility of all partners to contribute to learning the materials in every
lab. In particular, all partners are responsible for ensuring that submissions
are received by the due date.

As will be the case for all labs this semester, your work should appear in a directory called `lab13` of your personal or group repository.  The easiest way to accomplish this is to do a `git pull` in the public `labs2041-f17a` repository to get the lab files, then do a recursive copy to copy the entire `lab13` folder into the destination repository:

```
% cd ~/csci2041/labs2041-f17a
% git pull
% cd ..
% cp -R labs2041-f17a/lab14 repo-dest1234/
% cd repo-dest1234/
% git add lab13
```



# Introduction: Goals for this lab

+ Work with module declarations

+ Work with module signatures

+ Work with functors

## Answering the questions in this lab

In the `lab13` directory of your personal or team repository you should now have a
`dict.ml` file; we'll work with the contents of this
file in the following sections.

## Dictionaries

A dictionary is a very common and important data structure in computer
science, maintaining a mapping between keys of type `'k` and values of
type `'v`.  In this class, we have used associative lists as
dictionaries several times, but of course this is not the only
possible implementation of a dictionary.  There are several
alternatives that could be faster or more memory-efficient, and
abstracting this detail would make it easier to replace associative
lists with another implementation.

The file `dict.ml` already contains definitions of a module that
implements dictionaries: `ListDict` is the familiar associative list
implementation.

## Function Dictionaries

Another method of implementing dictionaries is by functions, e.g. a
dictionary with keys of type `'k` and values of type `'v` is a
function `d : 'k -> 'v` such that looking up the binding for `key` is
accomplished by calling `(d key)`.  In this implememtation:

+ The empty dictionary is the function `empty = fun k -> raise Not_found`

+ Adding `(key,vl)` binding is accomplished by creating a new function
that tests whether its input `k` is `key` (and returns `vl` if so) and otherwise
calls the old dictionary with `k`. (i.e. if `d` is the old dictionary, adding `(key,vl)` to `d` should result in the function `fun k -> if (k=key) then vl else (d k)`)

+ Updating a binding is identical to adding the binding

At the top of `dict.ml`, fill in the definition of the `FunDict`
module, declaring the type of `('k,'v)` function dictionaries, and
implementing the `empty` function dictionary, and the functions `add : 'k -> 'v ->
('k,'v) t -> ('k,'v) t`, `update`, and `lookup : 'k -> ('k,'v) t ->
'v`.

## Abstraction

Of course, as the modules are implemented so far, the details of the
data structures are transparent.  In order to make the types abstract,
we'll need to restrict the `FunDict` and `ListDict`,
modules to a signature with abstract representation for the type
`('k,'v) t`.  Add a signature declaration for a `Dict` module
signature that has a type (`('k,'v) t`), the `empty` dictionary, the
`add` function, the `lookup` function, and the `update` function.
Restrict `FunDict` to this signature.

## Functors

The `dict.ml` file also contains the beginning of the declaration for
a functor, `DictTest`, that allows us to test whether two
dictionary modules have the same behavior for some input.  Uncomment
and complete the `DictTest` functor, so that the `DictTest.test`
function adds the list of bindings in `ins_list` to an empty `DT1.t`
and an empty `DT2.t`, then tests whether the two dictionaries give back
the same values when looking up each element in `test_list`.  `test` should return a list of any keys on which the two dictionaries differ.

## Test them out

Add a line declaring the `FLTester` module, which instantiates `DictTest` with the
`FunDict` module as `DT1` and the `ListDict` module as `DT2`.  Follow this line with a
let declaration that binds the name `agree` to the result of checking that `FLTester.test` on an appropriately-type input has output `[]`.

# Commit and push so that everything is up on GitHub

Now you need to just turn in your work. Commit your `dict.ml`
file and push it up to your central GitHub repository.

Verify that this worked, by using your browser to see the changes on
https://github.umn.edu.

If you do not properly push your changes to the repository we
cannot give you credit for the lab, so please remember to do this
step!

__This concludes lab 13.__

**Due:** Thursday, December 7 at 11:59pm.

Note that any required changes must exist in your repository on
github.umn.edu. Doing the work but failing to push those changes
to your central repository will mean that we cannot see your work
and hence can't grade it.
