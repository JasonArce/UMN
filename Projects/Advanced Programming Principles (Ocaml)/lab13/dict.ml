(* dict.ml - dictionary implementations for lab 13 *)

(* eventually, you'll add the Dict signature for dictionaries here *)
module Dict = sig
    type ('k, 'v) t
    val empty : ('k, 'v) t
    val add : 'k -> 'v -> ('k, 'v) t -> ('k,'v) t
    val update : 'k -> 'v -> ('k, 'v) t -> ('k,'v) t
    val lookup : 'k -> 'd -> ('k, 'v) t
  end

(* Fill in the definition of dictionaries using functions, e.g. (f key) = val *)
module FunDict = struct
    type ('k,'v) t = 'k -> 'v 
    let empty = fun x -> raise Not_found
    let add k v d = fun x -> if (k = x) then v else (d x) 
    let update = add
    let lookup k d = (d k)
  end

(* You'll want to restrict this with a signature eventually: *)
module ListDict = struct
    type ('k,'v) t = ('k * 'v) list
    let empty = []
    let add k v d = (k,v)::d
    let lookup k d = List.assoc k d
    let rec update k v d = match d with
      | [] -> [(k,v)]
      | (key,_)::t when key=k -> (k,v)::t
      | kv::t -> kv::(update k v t)
    let rec fold f a d = List.fold_left f a d
  end


(* Uncommment and complete the functor definition below...
module DictTest(DT1: DICT)(DT2: DICT) = struct
    let test ins_list testlist =
  end
 *)


(* module FLTester = ...
 * let agree = ([] = (FLTester.test <list of key,value pairs> <list of keys>)) *)
