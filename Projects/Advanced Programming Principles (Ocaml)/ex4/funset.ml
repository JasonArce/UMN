(* funset.ml -- function representation of sets *)

(* an 'a set returns true if an element belongs to it *)
type 'a set = 'a -> bool

(* no element belongs to the empty set *)
let empty : 'a set = fun _ -> false

(* membership testing is straightforward *)
let mem x (s: 'a set) = s x

let rec getValue x s =
      if ( mem x (s) = true ) then x
      else (getValue (x+1) (s))

(* adding an element: test for x, otherwise return what s says *)
let add x (s: 'a set) : 'a set = fun y -> (y=x) || (s y)

let union (s1 : 'a set) (s2 : 'a set) =
  let (result: 'a set) =
    if (s1 == empty && s2 == empty) then empty
    else add (getValue 0 (s1)) (add (getValue 0 (s2)) empty)
  in result;;

let intersect (s1: 'a set) (s2: 'a set) =
  let (result: 'a set) =
    if ((s1 != empty && s2 != empty) && mem (getValue 0 s1) s2) then add (getValue 0 (s1)) empty
    else empty
  in result;;

let rem x (s: 'a set) : 'a set = fun y -> if(y=x) then false else (s y);;


let setminus (s1: 'a set) (s2: 'a set) =
  let (result: 'a set) =
    if(s1 == empty) then empty
      else if(s2 == empty) then add (getValue 0 (s1)) empty
        else if (mem (getValue 0 s1) s2) then empty
          else (add (getValue 0 s1) s2)
  in result;;
