(* lab 9 examples to convert to CPS *)
let rec map f lst = match lst with
  | [] -> []
  | h::t -> (f h)::(map f t)

let rec append l1 l2 = match l1 with
  | [] -> l2
  | h::t -> h::(append t l2)

let rec assoc_update k v lst = match lst with
  | [] -> [(k,v)]
  | (k',_)::t when k'=k -> (k,v)::t
  | kv::t -> kv::(assoc_update k v t)

type 'a btree = Node of 'a * 'a btree * 'a btree | Empty

let rec treeMin t =
  match t with
  | Empty -> None
  | Node(v,l,r) ->
     match (treeMin l, treeMin r) with
     | (None,None) -> Some v
     | (None, Some v') | (Some v', None) ->  Some (min v v')
     | (Some vl, Some vr) -> Some (min (min v vl) vr)

(* some helper functions for testing *)
let rec long_assoc n acc = if (n=0) then acc else
  long_assoc (n-1) ((("v"^(string_of_int n)),n)::acc)

let rec tree_chain k t = if (k=0) then t else
  tree_chain (k-1) (Node(k,Empty,t))

(* CPS versions go here: *)
let map_k f lst =
  let rec kmap lst k = match lst with
    | [] -> k []
    | h::t -> kmap t (fun result -> k ((f h)::result)) in
  kmap lst (fun x -> x)

let append_k l1 l2 = 
  let rec app_k lst1 lst2 k = match lst1 with
  | [] -> k lst2
  | h::t -> app_k t lst2 (fun r -> k (h::r))
in app_k l1 l2 (fun x -> x)

let assoc_update_k k v lst =
  let rec au_k key value lst k = match lst with
  | [] -> k [(key,value)]
  | (k',_)::t when k'=key -> k ((key,value)::t)
  | kv::t -> au_k key value t (fun r -> k (kv::r))
in au_k k v lst (fun x -> x)

let treeMin_k t = 
  let rec treeMin t k = match t with
    | Empty -> k None
    | Node(v,l,r) ->
       match (treeMin l (fun r -> k r), treeMin r (fun r -> k r)) with
       | (None,None) -> k (Some v)
       | (None, Some v') | (Some v', None) ->  k (Some (min v v'))
       | (Some vl, Some vr) -> k (Some (min (min v vl) vr))
in treeMin t (fun x -> x)
