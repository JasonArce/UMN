(* Recursion, tail recursion, nested functions.  Your definitions of unzip, list_product, and list_deriv go here. *)

let unzip lst =
let rec tail_unzip ls (a1, a2) = match ls with
|[] -> (List.rev a1, List.rev a2)
|(x,y)::t -> tail_unzip t (x::a1, y::a2)
in tail_unzip lst ([], [])

let list_cat lst = 
let rec list_cat_rec (ls : string list) (acc : string) = match ls with
|[] -> acc
|h::t -> list_cat_rec t acc^h
in list_cat_rec (List.rev lst) ""

let list_deriv lst = 
let rec list_deriv_rec (xs : int list) (acc : int list) prev = match xs with
|[] -> acc
in list_deriv_rec (List.rev lst) [] 0
