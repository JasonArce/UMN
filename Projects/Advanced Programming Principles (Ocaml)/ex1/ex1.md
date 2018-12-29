# Exercise Set 1: Git and Beginning OCaml

*CSci 2041: Advanced Programming Principles, Fall 2017 (Afternoons)*

**Due:** Sunday, September 10 at 11:59pm

## 1. Git "Cheat Sheet"

Modified from Professor Van Wyk's Homework 1, Fall 2014*

### Introduction

Using Git and GitHub can be confusing at first.  There are several Git
commands to learn.  We covered many in lab 0.

In this problem, you will learn one more command (git add) and create
a cheat-sheet that you can refer to in the future when you have
questions about using Git.

### Using git add

In your CSE Labs account, go to the directory with your individual
repository.  Something like the following:


```
% cd csci2041/repo-user0123/ex1
```

Create a file with the name *cheat-sheet.md*.  The "md" extension
indicates that this file a a Markdown file.  This is the file format
used on GitHub for many documentation files.

Edit this file and add the following line:
>  # Git Cheat Sheet

Exit your editor and check the status of your repository with the
following command:
```
% git status
```
This will tell you that your newly created file is "Untracked."  It
even suggests using the "git add" command to tell Git to track this
file.  

There may be files that are temporary, such as generated executable
file, that you don't want Git to track and we thus would not *add*
those files.

Try the following:
```
% git pull
% git commit -a -m "Adding my Git cheat sheet"
% git push
```

The *git pull* is the make sure you have any changes on the server
copied down to your local repository.

Now go to https://github.umn.edu and see what is in your newly
committed and pushed file.

It should be an empty file with just a title.  You can now click the
"Edit" button and edit this file.

The file is to be written using the Markdown language, a easy to use
language for formatting documentation.  Take a look at the
documentation for writing basic Markdown files:

https://help.github.com/articles/markdown-basics

Below the editing window you will see a place to enter commit comments
and a button for committing your changes directly to the repository on
the central server.  In general, however, it is best to edit files in a
local copy of your repository, then commit and push them to the central
server.  Many text editors (such as `gedit`, `atom`, or `emacs`) support
syntax highlighting for Markdown, and if you edit in your local copy, your
"submission" process can be uniform for both markdown and OCaml files.

### Your assignment

So far we've covered several *Git* commands:
+ config
+ clone
+ remote
+ status
+ commit
+ push
+ pull
+ add

For each of these, write a short description (perhaps just 2 or 3 sentences)
of what the command does and when or how often this command is to be used.
You might order this list of command descriptions so that the most useful ones are
towards the beginning.  Give each command its own section, e.g. the description
for the "config" command should start with `## config` on its own line.

### Test cases

+ The file `ex1/cheat-sheet.md` exists
+ The first line is `# Git Cheat Sheet`
+ The file contains `## config` on a single line
+ The file contains `## clone` on a single line
+ The file contains `## remote` on a single line
+ The file contains `## status` on a single line
+ The file contains `## commit` on a single line
+ The file contains `## push` on a single line
+ The file contains `## pull` on a single line
+ The file contains `## add` on a single line

Your solution must pass 10/10 test cases to get full credit for this question.

## 2. Evaluating expressions

In your terminal, change directory to the ex1 directory within your personal class repository, something like:

```
% cd csci2041/repo-user0123/ex1
```
And create a file with the name `evaluations.md` to record your answers to
this problem.  Remember to run `git add evaluations.md` before you commit.

For each of the following expressions, indicate
whether OCaml will consider the expression legal or not.  If it is not
a legal expression, explain what the problem is; otherwise, present
its type and value.  Assume there are no bindings preceding these
expressions, that is, treat each expression as an independent OCaml
program.

1. `3 - 2 + 4`

2. `3.14 * 6 * 6`

3. `if 1 then 3 else 4`

4. `if 1 > 0 then 1 else "no"`

5. `let x = 42 in 42 + y`

6. `let circ d = 3.14 *. d in circ 4`

7. `let circ d = 3.14 *. d in circ, 4.0`

8. `let x = 2 in let y = x + 3 in let x = y + x in x`

9. `let z z = z ^ "z" in z "cheez"`

10.  `let x = "one" in let y = 1,x in let x = 2 in y+x`

Your solution file should include each numbered expression, followed by the Legal/Not legal decision, followed by one or more lines of "answer", as follows:

```
1. 3 - 2 + 4
Legal
type: int
value: 5

2. 3.14 * 6 * 6
Not legal
The * operator has type int -> int -> int but 3.14 has type float
```

### Test cases
+ One for each expression above: correct Legal/Not legal label and one or more non-empty lines of explanation. (10 cases)

Your solution must pass 6/10 test cases to get full credit for this problem.


## 3. Compile-time and run-time errors

Within the `ex2041-f17/ex1` directory, the file `wreckit1.ml` contains a short OCaml program that can be compiled and run from the command line.  Copy and add this file to the `ex1` directory in your repository.  You can compile this file using `ocamlc` (or `ocamlopt`) on the command line from a CSELabs machine as follows:

```
% cd csci2041/repo-user0123/ex1
% ocamlc -o wreckit1 wreckit1.ml
```

Here, the `-o <NAME>` option tells the compiler what to name the executable file it will build.
You can run the resulting executable (`wreckit1`) on the command line with arguments of your choice to see the output, e.g.:

```
% ./wreckit1 3.14 Pi
```

In this exercise, we're going to "wreck" this OCaml program to produce both compile-time and run-time errors.

### Type errors in the right place

In your repository, make a copy of the `wreckit1.ml` file named `wreckit_unit.ml`.  Make a small change to line 14 (the last line of the program) so that compiling produces a type error:

```
% ocamlc wreckit_unit.ml
File "wreckit_unit.ml", line 14, characters XX-YY:
Error: This expression has type unit but an expression was expected of type
         string
```

Note how in this case, the type error is telling you that something has gone wrong on line 14; and this is in fact the place where we introduced an error.

Make sure you add and commit the file `wreckit_unit.ml` to your repository in the `ex1` directory.

### Type errors in the wrong place

Next, make another copy of the `wreckit1.ml` file named `wreckit_funtype.ml`.  Make a small change **to line 8** of this file so that compiling produces a type error like the following:

```
% ocamlc wreckit_funtype.ml
File "wreckit_funtype.ml", line 10, characters 41-57:
Error: This expression has type string -> string
       but an expression was expected of type string
```

Notice that in this case, the compiler notices a problem in a slightly different place than our mistake is, telling us that we've either made a mistake in the definition of `make_great` or we're using it incorrectly.  

Make sure you add and commit the file `wreckit_funtype.ml` to your repository in the `ex1` directory.

### A runtime error

Finally, let's introduce two run-time bugs into the program.  Make a third copy of the `wreckit1.ml` file named `wreckit_runtime.ml`.  In this file, make a small change to line 5, and another small change to line 10, so that the program still compiles, but will sometimes have run-time errors.  In particular, we should see the following:

```
% ocamlc -o wreckit_runtime wreckit_runtime.ml
% ./wreckit_runtime
Fatal error: exception Invalid_argument("index out of bounds")
% ./wreckit_runtime 0 ZeroIndexing
We're #0! #MakeZeroIndexingGreatAgain
% ./wreckit_runtime 1 America
Fatal error: exception Stack_overflow
```

### Test cases

+ `ex1/wreckit_unit.ml` exists
+ `ex1/wreckit_unit.ml` modifies line 14 and fails to compile with type error on line 14
+ `ex1/wreckit_funtype.ml` exists
+ `ex1/wreckit_funtype.ml` modifies line 8 and fails to compile with type error on line 10
+ `ex1/wreckit_runtime.ml` exists, with differences on lines 5 and 10
+ `ex1/wreckit_runtime.ml` compiles
+ `ex1/wreckit_runtime.ml` fails with Invalid_argument on no command-line arguments
+ `Wreckit_runtime.make_great` fails with `Stack_overflow` on input `"America"`

Your solution must pass 5/8 test cases to get full credit for this problem.
