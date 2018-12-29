# Homework 7:  Modules and Functors

*CSci 2041: Advanced Programming Principles, Fall 2017 (afternoon)*

**Due:** Wednesday, December 13 at 11:59pm

## Bloom Filters

A _Bloom Filter_ is a probabilistic data structure that stores a set of elements
`e1, e2, ..., en` (which may be quite large) by hashing each element `ei` to a
set of k short integers `s1,...,sk` (using `k` different hash functions) and
storing the union of these sets of short integers, `S`.  To test whether an
arbitrary element `x` is in the bloom filter, we hash `x` to get `k` short integers
`t1,...,tk` and then test whether all k of these values are present in `S`.  (So an
element that was added to the filter will always succeed in testing, but some
elements not added to the filter might also appear to be present)  Bloom filters
are used to improve cache performance in [several widely deployed
systems](https://en.wikipedia.org/wiki/Bloom_filter#Examples).

Here's a toy example: let `k=2` and let the hash functions be `h1(x) = x mod
7` and `h2(x) = x mod 11`.  Then to build a bloom filter representing the `n`-element
set `[1372; 2047; 2481]`, (so here `n=3`) we compute the `k*n=6` hashes: `h1(1372) = 0`,
`h2(1372) = 8`, `h1(2047)=3`, `h2(2047)=1`, `h1(2481)=3`, `h2(2481)=6` and store the set
`S=[0;1;3;6;8]`.  The to test whether some arbitrary element, say `1976` is in the filter,
we compute `h1(1976)=2`, and `h2(1976)=7`.  Since neither element is in `S`, `1976` is
not in the filter.   On the other hand, `h1(1977)=3` and `h2(1977)=8`, so `1977` is a
"false positive", an element that appears as present even though it was not added to the
filter initially.

In this problem, we will write a functor that implements bloom
filters, parameterized by a set representation and a list of hash
functions.  Your solution should go in the file `bloom.ml`, which
contains a skeleton, with several helper functions already
implemented.

#### `hashparam` signature

The `bloom.ml` file contains a module signature,  `memset`, for
modules that define a set type and operations.  Add a signature
immediately below this named `hashparam` for modules that provide an
element type `t` and a function `hashes : t -> int list`.  (We'll
provide modules that implement this signature later)

####	`SparseSet` module

The `Set` module in the OCaml standard library provides the functor
`Set.Make` which, given a module providing an element type `t` and a
comparison function `compare` (such as the built-in
`Pervasives.compare`) creates a module that implements all of the
functionality of the `memset` signature *except* the function
`from_list`.  Define a module, `SparseSet`, which uses inclusion and
Set.Make to implement the `memset` interface with elements of type
`int`.  (The entire definition should use approximately four lines of
code: you can implement from_list quite succinctly with fold)

#### `BoolSet` module

When a bloom filter has only a few elements, explicitly representing
the elements with a `SparseSet` will be time- and space-efficient, but
a bloom filter with many elements typically represents a set as a bit
sequence using a random access data structure like an array, or string.
We'll use the type `bool array` to represent such sets.   
To decide if the integer `i` belongs to the set, we access the boolean bit
at index `i` of the data structure, and if it is true then `i` is in the
set, and otherwise it is not.

This representation is space-efficient when the sets are large and
also allows for efficient logical operations on sets (e.g. the union
of two sets is the element-wise boolean or (`||`) of their arrays;
the intersection is the element-wise boolean and (`&&`)).
`bloom.ml` has an incomplete implementation of some of the helper
functions needed to create the `BoolSet` module.  You'll need to complete the
definition so that a BitSet implements the `memset` signature with
exposed `elt` type:

+ Change the module declaration to impose the `memset` signature and
correctly expose the type of `elt`.

+ Add a (local) helper function to `BoolSet` implementing `(&@)` (the
elementwise boolean and of two `bool array`s).

+ Add a (local) helper function `make_arr_t : int -> bool array` to `BoolSet` so
that `make_arr_t i` returns a `bool array` representing the singleton set `{ i }`.  

+ Provide definitions for the `memset` signature, e.g. `empty,
  is_empty, mem, add, union, inter, from_list`.

#### `BloomFilter` functor

At this point we're ready to fill in the definition of the
`BloomFilter` functor: `bloom.ml` already provides the basic syntax
for the functor definition.  However, you'll need to:

+ modify the declaration slightly with sharing constaints in order to
  make the code compile and allow creation of `BloomFilter`s with
  accessible (non-abstract) elements.

+ provide definitions for the functions in the memset signature, by
  storing an element `e` as the list of hash function values output by `(H.hashes
  e)` in a set implemented by the module `S`, and checking for
  membership of `x` by checking that elements of `(H.hashes x)` are
  all present in the underlying set.  These should all be fairly
  simple calls to functions provided by the module S or H, possibly in
  combination with folds and maps as needed.

#### `IntHash`

The `bloom.ml` file already contains one definition of a module
satisfying the `hashparam` interface, the `StringHash` module.  Below
this, add a definition for a second module satisfying `hashparam`, the
`IntHash` module.  The type `t` in `IntHash` will be `int`, and
`hashes n` should evaluate to the list `[(h1 n) ; (h2 n); (h3 n)]`,
where `h1(n) = (795*n + 962) mod 1031`,  `h2(n) = (386*n + 517) mod
1031`, and `h3(n) = (937*n + 693) mod 1031`.

#### Testing driver

Now let's write a "driver" program to test out our BloomFilter
implementations.  Add a separate file named `bloomtest.ml` to the
`hw6` directory in your repo.  This file should contain a complete
OCaml program that does the following:

+ Instantiate a `BloomFilter` module, `BloomSparseInt`, using `SparseSet`
and `IntHash`
+ Instantiate a `BloomFilter` module, `BloomBoolInt`, using `BoolSet`
  and `IntHash`.
+ Create a list `insert_ilist` of 200 random integers between 0 and 2<sup>30</sup>-1
 using the function `Random.int`.
+ Create a `BloomSparseInt.t` from `insert_ilist`; time how long this
  creation takes using `Sys.time ()`
+ Create a `BloomBoolInt.t` from `insert_ilist`; time how long this
creation takes using `Sys.time ()`
+ Create a list `test_ilist` of 1 million random integers between 0 and
2<sup>30</sup>-1.
+ Time how long it takes to test for each of these integers using
  `BloomSparseInt.mem` and count the number of false positives
  (you don't need to check whether a member of `test_ilist` was actually
  in `insert_ilist`; we'll just assume all elements that test out as
  true are false positives)
+ Time how long it takes to test for each element of `test_ilist` using
`BloomBoolInt.mem`, while also counting false positives.  (The false
positive count should be the same regardless of the underlying set
implementation.)
+ Instantiate another BloomFilter module, `BloomSparseString`, using
`SparseSet` and `StringHash`.
+ Instantiate another BloomFilter module, `BloomBoolString`, using
`BoolSet` and `StringHash`.
+ Read the list of the 2048 most-visited websites from the file
`top-2k.txt` into a list of strings, `insert_slist`.  (See homework 1
or homework 3 for examples of functions that can return a list of the
strings in a file given the file name)
+ Read the list of the top 1 million - 2048 most-visited websites from
the file `top-1m.txt` into a list of strings, `test_slist`.
+ Time how long it takes to create at `BloomSparseString.t` from
`insert_slist`.
+ Time how long it takes to create a `BloomBoolString.t` from
`insert_slist`.
+ Time how long it takes to test for each string in `test_slist` using
`BloomSparseString.mem`, counting the number of false positives.
+ Time how long it takes to test for each string in `test_slist` using
`BloomBoolString.mem`, counting the number of false positives.
(If you've noticed a pattern and would like to save yourself some
typing, feel free to encapsulate the core of this routine in a Functor)
+ Finally, print out a formatted report as follows:
```
% ocamlopt -o bloomtest str.cmxa bloom.ml bloomtest.ml
% ./bloomtest
SparseInt      : build time =   0.0003s test time =   0.7590s false positives = 200350
BoolInt        : build time =   0.0077s test time =   0.1134s false positives = 200350
SparseString   : build time =   0.0043s test time =   1.2131s false positives = 13658
BoolString     : build time =   7.2067s test time =   0.1595s false positives = 13658
```

Warning: we are explicitly *not* giving you many test cases in the gitbot *feedback* for this assignment. Building and testing these pieces are up to you - the gitbot will only test that your repo has the right files, that the files compile, and that they define the appropriate modules and variables.  However, the *grading* will certainly test your code for correctness.

## All done!

Don't forget to commit all of your changes to the various files edited
for this homework, and push them to (the `hw7` directory in) your individual class repository
on UMN github:

+ `bloom.ml`
+ `bloomtest.ml`

You can always check that your changes have pushed
correctly by visiting the repository page on github.umn.edu.
