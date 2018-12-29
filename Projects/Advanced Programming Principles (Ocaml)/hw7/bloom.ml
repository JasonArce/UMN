(* Bloom Filter implementation.  This file will not compile as is. *)
module type memset = sig
    type elt (* type of values stored in the set *)
    type t (* abstract type used to represent a set *)
    val mem : elt -> t -> bool
    val empty : t
    val is_empty : t -> bool
    val add : elt -> t -> t
    val from_list : elt list -> t
    val union : t -> t -> t
    val inter : t -> t -> t
  end

(* Define the hashparam signature here *)
module type hashparam = sig
    type t
    val hashes : t -> int list
  end

(* Define SparseSet module here, using the Set.Make functor *)
(*module SparseSet = Set.Make(struct
  type t = int
  let compare = compare
  end) *)

(* Fill in the implementation of the memset signature here.  You'll need to expose the elt type *)
module BoolSet (BS : memset) : memset with
  type elt = BS.elt = struct
    (* element-wise or of two arrays: *)
    type t = bool array
    type elt = BS.elt
    let rec ( &@ ) s1 s2 = let (short,long) =
      if (Array.length s1 < Array.length s2) then (s1,s2) else (s2,s1) in
      Array.mapi (fun i li -> if i < (Array.length short) then li && short.(i) else li) long

    let rec (|@) s1 s2 = let (short,long) =
      if (Array.length s1 < Array.length s2) then (s1,s2) else (s2,s1) in
      Array.mapi (fun i li -> if i < (Array.length short) then li || short.(i) else li) long

    let make_arr_t i = let dec_to_bin_helper = function 1->true | 0->false in
                          let dec_to_bin x =
                              let rec d2b y lst = match y with 0 -> lst
                              | _ -> d2b (y/2) ((dec_to_bin_helper (y mod 2))::lst)
                              in
                              d2b x []
                          in dec_to_bin i

    let empty = BS.empty

    let mem elt a = match a with
    | empty -> false
    | _ -> BS.mem elt a

    let is_empty a = match a with
    | empty -> false
    | _ -> true

    let add elt t = Array.of_list (List.sort (fun x y -> if x > y then 1 else 0) (Array.to_list (Array.append [|elt|] t)))
    let from_list elst = Array.of_list elst
    let rec union a1 a2 = match Array.to_list a1 with
    | [] -> Array.of_list (List.sort (fun x y -> if x > y then 1 else 0) (Array.to_list a2))
    | h::t -> if Array.mem h a2 = false then union (Array.of_list t) (Array.append [|h|] a2) else union (Array.of_list t) a2
    let rec inter a1 a2 = match Array.to_list a1 with
    | [] -> a2
    | h::t -> if Array.mem h a2 then [|h|] else inter (Array.of_list t) a2
  end

(* Fill in the implementation of a BloomFilter, matching the memset signature, here. *)
(* You will need to add some sharing constraints to the signature below. *)
module BloomFilter(S : memset)(H : hashparam) : memset = struct
    include SparseSet
    type elt = H.t
    type t = S.t
    (* Implement the memset signature: *)
  end

(* A hashparam module for strings... *)
module StringHash = struct
    type t = string (* I hash values of type string *)
    let hlen = 15
    let mask = (1 lsl hlen) - 1
    let hashes s =
      let rec hlist n h = if n = 0 then [] else (h land mask)::(hlist (n-1) (h lsr hlen)) in
      hlist 4 (Hashtbl.hash s)
  end

(* Add the IntHash module here *)
