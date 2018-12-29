type 'a btree = Node of 'a * 'a btree * 'a btree | Empty

let rec append_k lst1 lst2 k = match lst1 with
  | [] -> k lst2
  | h::t -> append_k t lst2 (fun s -> k (h::s))

let rec filter_k f lst k = match lst with
  | [] -> k []
  | h::t -> filter_k f t (fun s -> k (if f h then h::s else s))

let rec tree_sum_k t k = match t with
| Empty -> k 0
| Node (n,l,r) -> tree_sum_k l (fun s -> tree_sum_k r (fun z -> k (n+z+s)))

let rec tree_map_k k t q = match t with
|Empty -> q Empty
|Node (n,l,r) -> tree_map_k k l (fun a -> tree_map_k k r (fun b -> q (Node (k n,a,b))))
