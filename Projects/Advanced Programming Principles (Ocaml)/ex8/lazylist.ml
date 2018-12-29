type 'a lazylist = LzCons of 'a * 'a lazylist lazy_t | EmptyLL
let (@@) h t = LzCons(h,t)

let rec lztake n ll = match (n,ll) with
| (0,_) | (_,EmptyLL) -> []
| (_,LzCons(h,t)) -> h::(lztake (n-1) (Lazy.force t))

let rec eq_ll l1 l2 = match (l1,l2) with
| (EmptyLL,EmptyLL) -> true
| (_,EmptyLL) | (EmptyLL,_) -> false
| (LzCons(h1,t1), LzCons(h2,t2)) -> (h1=h2) && (eq_ll (Lazy.force t1) (Lazy.force t2))

let rec lzmerge lst1 lst2 = match (lst1,lst2) with
| (EmptyLL,ll) | (ll,EmptyLL) -> ll
| (LzCons(h1,t1), LzCons(h2,t2)) -> h1 @@ lazy(h2 @@ lazy(lzmerge (Lazy.force t1) (Lazy.force t2)))

let rec lzfilter f = function
| EmptyLL -> EmptyLL
| LzCons(h,lazy(t)) -> if (f h) then h @@ lazy(lzfilter f t)
  else lzfilter f t

let rec lzdouble s = lzmerge s s

let rec lznats n = n @@ lazy(lznats (n+1))

let lzfibs = let rec fibhelp f0 f1 = f0 @@ lazy(fibhelp f1 (f0+f1))
  in fibhelp 0 1

let lzfact = let rec fact_h n a = (n*a) @@ lazy(fact_h (n+1) (n*a))
  in fact_h 1 1

let rec lzrepeat s = s @@ lazy(lzrepeat s)
(* put your lazylist functions right here: *)

let rec lzmap (f : 'a -> 'b) (ll : 'a lazylist) = match ll with
|EmptyLL -> EmptyLL
|LzCons(h,lazy(t)) -> f h @@ lazy(lzmap f t)

let lz_odds (ll : 'a lazylist) =
  let rec tr_lz_odds ll b = match (ll, b) with
  |(EmptyLL, _) -> EmptyLL
  |(LzCons(h,lazy(t)), false) -> tr_lz_odds t true
  |(LzCons(h,lazy(t)), true) -> h @@ lazy(tr_lz_odds t false)
  in tr_lz_odds ll false

let lz_natpairs ((m,n) : int * int) = EmptyLL
let rec make_lst a = match a with
  | "" -> []
  | ch -> (String.get ch 0 ) :: (make_lst (String.sub ch 1 ( (String.length ch)-1) ))
let pal_check (s : string) = if (List.rev (make_lst (String.lowercase s)) = make_lst (String.lowercase s)) then true else false;;

let lz_bstrings (s1 : string) (s2 : string) =
let rec tr_bstrings_s s1 s2 b = match b with
| 1 -> "" @@ lazy(tr_bstrings_s s1 s2 2)
| _ -> s1 @@ lazy(s2 @@ lazy((s1^s1) @@ lazy((s1^s2) @@ lazy(tr_bstrings_s (s2^s1) (s2^s2) (2)))))
in tr_bstrings_s s1 s2 1

let lz_palindromes (s1: string) (s2: string) = match pal_check (s1^s2) with
| true -> let rec lz_rt_palindromes s b temp = match b with
          | 0 -> "" @@ lazy(lz_rt_palindromes s 1 temp)
          | _ -> s @@ lazy(lz_rt_palindromes (s^(List.nth temp 0)) 1 temp)
          in lz_rt_palindromes (s1^s2) 0 [s1^s2]
| _ -> match pal_check (s2^s1) with
      | true -> let rec lz_rt_palindromes2 s b temp = match b with
                | 0 -> "" @@ lazy(lz_rt_palindromes2 s 1 temp)
                | _ -> s @@ lazy(lz_rt_palindromes2 (s^(List.nth temp 0)) 1 temp)
                in lz_rt_palindromes2 (s2^s1) 0 [s2^s1]
      | _ -> failwith "You suck"
