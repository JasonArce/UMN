(* tailrec.ml - exercise set 2, CSci 2041a, Fall 2017 *)
(* Jason Arce *)

(* Fix this: it has bugs and must be tail recursive... *)
let rec msort ls =
  let split ls = 
    let rec tr_split lst (l1,l2) = match lst with
        | [] -> (l1, l2)
        | h::t -> tr_split t (l2,h::l1) 
    in tr_split ls ([], [])
  in
  let merge l1 l2 = 
    let rec tr_merge l1 l2 acc = match (l1,l2) with
        | ([], []) -> acc
        | ([], h::t) | (h::t,[]) -> tr_merge [] t (h :: acc)
        | h1 :: t1, h2 :: t2 -> if h1 < h2 then tr_merge t1 l2 (h1::acc) else tr_merge l1 t2 (h2::acc)
    in List.rev (tr_merge l1 l2 [])
  in
let rec sort ls tem =
    match ls with
    | [] -> tem [] 
    | [h] -> tem [h] 
    | lst -> let (l1,l2) = split lst in sort l1 (fun leftRightmost -> sort l2 (fun rightRightmost -> tem (merge leftRightmost rightRightmost)))
<<<<<<< HEAD
  in sort ls (fun x -> x)
=======
  in sort ls (fun x -> x);;
>>>>>>> 373d7c2af3912f825af1f6a1f38b820baba4d9e6

(* Fill in tail recursive range *)
let rec range m n =
	let rec _range m n res z = 
	if n<m then res
	else if n = z then res
	else  _range m (n-1) (n-1 :: res) z
	in _range m n [] m;;

(* *@ operator *)
let rec append l1 l2 = match l1 with
| [] -> l2
| h::t-> h::(append t l2)

let ( *@ ) : int -> 'a list -> 'a list =
      let rec helper acc n l = acc in fun n ls -> match ls with
	| h::t -> h::(append t ls)
	| h -> append h ls
	| _ -> []
	;;




