type 'a ll = { mutable hd : 'a ; mutable tl : 'a mlist}
 and 'a mlist = List of 'a ll | Nil

let rec mlist_of_list ls = match ls with
|[] -> Nil
| h::t -> List {hd = h; tl = (mlist_of_list t)}

let find_em l =
  let rec t_find_em l acc = match l with
| Nil -> acc
| List a -> t_find_em a.tl ((a.hd)::acc)
in t_find_em l []


let rev_mlist l = mlist_of_list (find_em l)

let append_m l1 l2 = mlist_of_list ((List.rev (find_em l1))@(find_em l2))
