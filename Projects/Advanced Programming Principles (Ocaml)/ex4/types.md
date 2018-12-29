1. let x = 17 in let f () = x in let x = "nested" in f
type: unit -> int
When f is bound in the first nested let expression, x is bound to 17, which has type int.

2. let rec funny = fun x -> funny (x+1) in funny
type: int -> 'a
Funny is initially given type 'b -> 'a. Applying the addition symbol makes it 'b = int.

3. let (<<|) f g = fun x -> g (f x) in int_of_string <<| string_of_int
type: string -> string
The method takes in a string and then "pikes" that on to another string which is created by "string_of_int"

4. let s f g = fun x -> (f x) (g x) in s
type: ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c
The function f takes in a function inside of a function and a separate function and uses "fun x" to return a value( 'c).

5. let rec red f x y = match x with | [] -> y | x'::xs -> f x' (red f xs y) in red
type: ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
Red takes in a function that returns a function, a list of type 'a, and a 'b and returns a single 'b value.

6. let c f g = fun x -> if (f x) then true else (g x) in c ((=) 10)
type: (int -> bool) -> int -> bool
C has two arguments, the first takes in a function that requires an argument that is of type int and returns a boolean while the second argument is of type int. c then returns a bool.

7. let swap f x y = f y x in swap (^) "!"
type: string -> string
Swap takes in string (f) and concatenates it with an exclamation point. This string is then returned.

8. fun f g -> function [] -> [] | h::t -> (f h)::(g t)
type: ('a -> 'b) -> ('a list -> 'b list) -> 'a list -> 'b list
This takes in two functions, one that has an argument of 'a and another that has an argument of 'a list. This then returns a list that cons on the two functions ('a list). When the list is done, 'b list is returned.
