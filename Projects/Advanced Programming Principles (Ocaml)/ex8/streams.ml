(* data type to represent an infinite data object in a "lazy" fashion *)
type 'a stream = Cons of 'a * (unit -> 'a stream) | End

(* Some utility functions for streams *)
let hd (Cons(h,t)) = h
let tl (Cons(h,t)) = t ()

let rec take_s n s = match (n,s) with
| (0,_) | (_,End) -> []
| (_,Cons(h,t)) -> h::(take_s (n-1) (t ()))

let rec merge s1 s2 = match (s1,s2) with
| (End, _) -> s2
| (_, End) -> s1
| _ -> Cons(hd s1, fun () -> Cons(hd s2, fun () -> merge (tl s1) (tl s2)))

let rec filter_s p = function
| End -> End
| Cons(h,t) -> if (p h) then Cons(h, fun () -> filter_s p (t ()))
  else filter_s p (t ())

let double s = merge s s

(* Some streams we have seen in lecture *)
let rec snats n = Cons(n, fun () -> snats (n))
let rec nats n = Cons(n, fun () -> nats (n+1))
let fibs = let rec fib_help f0 f1 = Cons(f0, fun () -> fib_help f1 (f0+f1))
	in fib_help 0 1
let factorials = let rec fact_help n a = Cons(n*a, fun () -> fact_help (n+1) (n*a))
	in fact_help 1 1

let rec repeating s = Cons(s, fun () -> repeating s)
(* Your solutions go here: *)

let rec map_s (f : 'a -> 'b) (s : 'a stream) = match s with
|End -> End
|Cons(h,t) -> Cons (f h, fun () -> map_s f (t ()))

let rec odds_s (s : 'a stream) =
  let rec tr_odds_s s b = match (s,b) with
    |(End, _) -> End
    |(Cons(h,t), false) -> tr_odds_s (t()) true
    |(Cons(h,t), true) -> Cons (h, fun () -> tr_odds_s (t()) false)
  in tr_odds_s s false

(*let rec natpairs ((m,n) : int * int) = match (m,n) with
  | End -> End
  | *)

let rec make_lst a = match a with
  | "" -> []
  | ch -> (String.get ch 0 ) :: (make_lst (String.sub ch 1 ( (String.length ch)-1) ))

let rec pal_check (s : string) = if (List.rev (make_lst (String.lowercase s)) = make_lst (String.lowercase s)) then true else false;;

let rec bstrings_s (s1 : string) (s2 : string) =
  let rec tr_bstrings_s s1 s2 b = match b with
  | 1 -> Cons("", fun() -> tr_bstrings_s s1 s2 2)
  | _ -> Cons(s1, fun() -> Cons(s2, fun() -> Cons(s1^s1, fun() -> Cons(s1^s2, fun() -> tr_bstrings_s (s2^s1) (s2^s2) (2)))))
  in tr_bstrings_s s1 s2 1

let rec palindromes (s1 : string) (s2 : string) = match pal_check (s1^s2) with
| true -> let rec rt_palindromes s b temp = match b with
          | 0 -> Cons("", fun() -> rt_palindromes s 1 temp)
          | _ -> Cons(s, fun() -> rt_palindromes (s^(List.nth temp 0)) 1 temp)
          in rt_palindromes (s1^s2) 0 ([s1^s2])
| _ -> match pal_check (s2^s1) with
      | true -> let rec rt_palindromes2 s b temp = match b with
                | 0 -> Cons("", fun() -> rt_palindromes2 s 1 temp)
                | _ -> Cons(s, fun() -> rt_palindromes2 (s^(List.nth temp 0)) 1 temp)
                in rt_palindromes2 (s2^s1) 0 [s2^s1]
      | _ -> failwith "You suck"
