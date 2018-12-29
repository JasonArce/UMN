module type Elt = sig
  type k
  type v
  val eq : k -> k -> bool
end

module type Dict = sig
  type t
  type k
  type v
  val empty : t
  val add : k -> v -> t -> t
  val lookup : k -> t -> v
end

(* Add ListDict Functor here *)
module EqListDict (EQ : Elt) : Dict with
  type k = EQ.k and type v = EQ.v = struct

  type k = EQ.k
  type v = EQ.v
  type t = (k * v) list
  let eq = EQ.eq
  let empty = []
  let add key value lst = (key,value)::lst
  let rec lookup key lst = match lst with
  | [] -> raise Not_found
  | (a,b)::t -> if eq a key then b else lookup key t
   end

(* Add DefaultElt signature here *)
module type DefaultElt = sig
  type k
  type v
  val eq : k -> k -> bool
  val default : v
end


(* DefaultDict functor: *)
module DefaultDict (DF : DefaultElt ) : Dict  with
  type k = DF.k and type v = DF.v = struct

  type k = DF.k
  type v = DF.v
  type t = (k * v) list
  let df = DF.default
  let eq = DF.eq
  let empty = []
  let add key value lst = (key,value)::lst
  let rec lookup key lst = match lst with
  | [] -> df
  | (a,b)::t -> if eq a key then b else lookup key t
   end

(* DefaultDictFunctor: *)
module DefaultDictFunctor (E : DefaultElt)(D : Dict) : Dict with
  type k = E.k and type v = E.v = struct

  type k = E.k
  type v = E.v
  type t = (k * v) list
  let df = E.default
  let eq = E.eq
  let empty = []
  let add key value lst = (key,value)::lst
  let rec lookup key lst = match lst with
  | [] -> df
  | (a,b)::t -> if eq a key then b else lookup key t
  end
