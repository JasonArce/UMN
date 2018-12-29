(* functions.ml - exercise set 2, CSci 2041a, Fall 2017 *)
(* Jason Arce *)

(* Complete this *)
let (++) (x:int) (y:int) = if x+y > 32767 then 32767 else if x+y < -32768 then -32768 else x+y;;

(* 2d real vectors *)

let get_first_of_u u = match u with 
  | (u1, u2) -> u1;;
let get_second_of_u u = match u with 
  | (u1, u2) -> u2;;
let first_of_v v = match v with
  | (v1,v2) -> v1;;
let second_of_v v = match v with 
  | (v1,v2) -> v2;;
let vec_add (u:float*float) (v:float*float) = (((get_first_of_u u) +. (first_of_v v)) , ((get_second_of_u u)) +. (second_of_v v));; 

let dot (u:float*float) (v:float*float) = ((get_first_of_u u) *. (first_of_v v)) +. ((get_second_of_u u) *. (second_of_v v));;

let perp u v : bool = if (dot u v) = 0. then true else false;;

(* some functions on int lists *)

let rec range (m:int) (n:int) = if m>n then [] else if m = n then [] else match n with
  | _ -> m::(range (m+1) (n));;

let rec sum_positive (ls: int list) = match ls with 
  | [] -> 0
  | x::xs -> if x<0 then (sum_positive xs) else x + (sum_positive xs);;


(* Fix this definition *)
let rec take m lst = match (m,lst) with
| (0,_) -> []
| (n,h::t) -> h::(take (n-1) t)
| (_,[]) -> []
