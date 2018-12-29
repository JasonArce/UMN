(* rewrite each of these function definitions as higher-order functions using the rules in lab4.md *)

let rec append l1 l2 = match l1 with
  | [] -> l2
  | (h::t) -> h::(append t l2)


(* uncomment and fill in:  *)
(* 
let rec append_hof = fun l1 -> fun l2 ->
  match l1 with
  | [] -> l2
  | (h::t) -> h::(append_hof t l2)

let rec append_hof = fun l1 ->
  match l1 with
  | [] -> fun l2 -> l2
  | (h::t) -> fun l2 -> h::(append_hof t l2)

let rec append_hof = fun l1 ->
  match l1 with
  | [] -> fun l2 -> l2
  | (h::t) -> fun l2 -> h::(let append_hof1 = (append_hof t) in append_hof1 l2)
 *)

let rec append_hof = fun l1 ->
  match l1 with
  | [] -> fun l2 -> l2
  | (h::t) -> let append_hof1 = (append_hof t) in fun l2 -> h::append_hof1 l2



let rec take_until lst s = match lst with
  | [] -> []
  | (h::t) -> if h = s then [] else h::(take_until t s)

(* 
let rec take_until_hof = fun lst -> fun s ->
  match lst with
  | [] -> []
  | (h::t) -> if h = s then [] else h::(take_until t s)


let rec take_until_hof = fun lst ->
  match lst with
  | [] -> fun s -> []
  | (h::t) -> fun s -> if h = s then [] else h::(take_until t s)

let rec take_until_hof = fun lst ->
  match lst with
  | [] -> fun s -> []
  | (h::t) -> fun s -> if h = s then [] else h::(let take_until_hof1 = (take_until_hof t) in 	
   take_until_hof1 s)
*)


let rec take_until_hof = fun lst ->
  match lst with
  | [] -> fun s -> []
  | (h::t) -> fun s -> if h = s then [] else (let take_until_hof1 = (take_until_hof t) in 
   h::(take_until_hof1 s))

