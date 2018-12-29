(* Type inference examples.  These functions are "not polymorphic enough"  *)
(* Don't add or remove lines from this file, it will break gitbot *)

(* Intended type of pairwith: 'a -> 'b list -> ('a * 'b) list
   Actual type: 'a -> 'b list -> ('a * 'b) list
   Explanation: 
 *)
let rec pairwith x lst =
  match lst with
  | [] -> []
  | (h::t) -> (x,h) :: pairwith x t


(* Intended type of has_any: 'a -> 'a list -> boolean
   Actual type: Type Error
   Explanation: There wasn't a second argument in has_any
 *)
let rec has_any x lst =
  match lst with
  | [] -> false
  | (h::t) -> x=h || has_any x t

(* Intended type of lookup:'a -> ('a * bytes) list -> bytes = <fun>
   Actual type:'a -> ('a * bytes) list -> bytes = <fun>
   Explanation: 
 *)
let rec lookup key lst =
  match lst with
  | [] -> "No  matches"
  | (k,v)::t -> if k=key then v else lookup key t


(* Intended type of reverse :'_a list -> '_a list = <fun>    
   Actual type: Type Error
   Explanation: The recursive fucntion didn't have "rec"
 *)
let reverse lst = 
let rec tail_rev acc ls =
  match ls with
  | [] -> acc
  | (h::t) -> tail_rev (h::acc) t
in tail_rev [] lst 
