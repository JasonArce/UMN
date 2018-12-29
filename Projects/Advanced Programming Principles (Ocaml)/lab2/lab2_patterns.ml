(* Pattern matching examples: try to predict what the result of each expression below will be.
   You can use utop to check. *)

(* tuples *)
let (a,b) = (3,4) in a*b
let c,d = 1,2

(*Prediction:
A) 12
B) It will return a tuple. Turns out it returns two ints.*)

(* list patterns *)
let (h::t) = [1;2;3]
(*let (x::y::z) = [1]*) (*Type matching failure*)
let (_::rest) = [1;2]

(*Prediction:
A) Returns the head (int 1) and the tail (int list [2;3])
B) Returns the head (int 1) and two empty lists. Turns out it was a match failure.
C) Returns int 1 and int list of 2. Instead it returned 2.*)

(* "as" patterns *)
let ((a1,b1) as c1) = (2,3)
let ((a2,b2) as c2, d2) = ((2,3),4)

(*Prediction:
A) Returns 2,3 as a tuple. But also 2 and 3 as ints.
B) Returns 2,3 as a tuple. But 2, 3, and 4 as ints.*)

(* OR patterns *)

(* This or pattern works... *)
let rec make_pairs = function
  | ([] | _::[]) -> []
  | a::b::t -> (a,b) :: make_pairs t

(*Predictions:
A) 'a list -> ('a * 'a) list*)

(* but this one doesn't.  Why?  Fix it.*)
let singleton_or_empty_list = function
  | [] -> true
  | h::[] -> true
  | _ -> false
(*
Predictions:
A) Error*)

(* This pattern won't work, due to the *linearity* restriction.  It can be
fixed with "pattern guards" as in Hickey, though that's overkill here. *)
let twins p = match p with
  | (s,t) when s=t -> true
  | (s,t) -> false
  ;;
