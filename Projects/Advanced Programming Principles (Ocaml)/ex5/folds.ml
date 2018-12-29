let rank num lst = match lst with
| [] -> 0
| x -> List.fold_left (fun acc s -> (if s < num then (acc+1) else acc)) 0 x

let prefixes lst = match lst with
| [] -> []
| x -> List.fold_left (fun (h::t) s -> (h@[s])::(h::t)) [[]] lst

let suffixes lst = match lst with
| [] -> []
| x -> List.fold_left (fun (h::t) s -> (s::h)::(h::t)) [[]] (List.rev lst)

let delta_encode lst = match (List.rev lst) with
| [] -> []
| x::y -> List.fold_left (fun (h::t) s -> t@[s - h]) (List.rev (y@[0])) (List.rev (x::y))
