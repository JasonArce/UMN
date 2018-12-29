type 'a stream = Cons of 'a * (unit -> 'a stream)
type 'a lazylist = End | Lz of 'a * 'a lazylist lazy_t
				
let rec take_s n s = match (n,s) with
  | (0,_) -> []
  | (_,Cons(h,t)) -> h::(take_s (n-1) (t ()))

let rec lztake n ll = match(n,ll) with
  | (0,_) | (_,End) -> []
  | (_,Lz(h,t)) -> h::(lztake (n-1) (Lazy.force t))
	  
(* your definition of ustrings goes here: *)
let ustring_s s =
  let rec _ustring_s st =
    Cons(st, fun () -> _ustring_s (s^st)) in
  _ustring_s ""

(* Add definitions for drop_while_s and take_until_s here: *)
let take_until_s s f =
  let rec _take_until_s s f = match s with
  | Cons(h,t) -> if (f h) then [] else h::(_take_until_s (t ()) f)
  | _ -> failwith "dogs" in
_take_until_s s f

(* now add lz_ustring and lztake_until here: *)
let lz_ustring () = ()

let lztake_until () () = ()
