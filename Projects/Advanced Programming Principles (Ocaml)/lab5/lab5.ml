let rec map f lst =
  match lst with
  | [] -> []
  | h::t -> (f h)::(map f t)

(* fold_left in Ocaml *)
let rec fold f acc lst =
  match lst with
  | [] -> acc
  | h::t -> fold f (f acc h) t

(* fold_right in Ocaml *)
let rec reduce f lst init =
  match lst with
  | [] -> init
  | h::t -> f h (reduce f t init)

(* list functions from map,fold, and reduce *)

let append l1 l2 = reduce (fun x acc -> x::acc) l1 l2

let filter pred lst = reduce (fun x acc -> if (pred x) then x::acc else acc) lst []

let list_cat = fold (fun x acc -> x^acc) ""

let list_fst = map (fun (a, b) -> a)

let mem x lst = reduce (fun x acm -> (x || acm)) (map (fun x1 -> (x1=x)) lst) false

let count_intersection lst1 lst2 = fold (fun acc x -> if(mem x lst1) then (acc+1) else acc) 0 lst2

let check_set lst = fold(fun acc (h::t) -> (not (mem h t)) && acc) true lst

let assoc_max ls = match ls with
| [] -> None
| h::t -> match (fold (fun (h1, h2) (x1, x2) -> if (x2 > h2) then (x1, x2) else (h1, h2)) h t) with
          | (a, b) -> Some a
          | _ -> None

