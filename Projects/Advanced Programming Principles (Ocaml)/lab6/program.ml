type expr =
  Const of int | BConst of bool
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
  | If of expr * expr * expr
  | Let of string * expr * expr
  | Name of string
  | And of expr * expr
  | Or of expr * expr
  | Not of expr
  | Lt of expr * expr
  | Eq of expr * expr
  | Gt of expr * expr
  | Print of expr

type expType = Int | Bool | Unit

(* Type to represent a lexical environment of the program, e.g. the current stack of variables and the values they are bound to *)
type envType = (string * result) list
 (* Type to represent a value in the program *)
 and result = IntR of int | BoolR of bool | UnitR

(* evaluate an expression in a lexical environment *)
let rec eval exp env = match exp with
  | Const n -> IntR n
  | BConst b -> BoolR b
  | Add (e1,e2) -> evalInt (+) e1 e2 env
  | Mul (e1,e2) -> evalInt ( * ) e1 e2 env
  | Sub (e1,e2) -> evalInt (-) e1 e2 env
  | Div (e1,e2) -> evalInt (/) e1 e2 env
  | If (cond,thn,els) -> evalIf cond thn els env
  | Let (nm,vl,exp') -> evalLet nm vl exp' env
  | Name nm -> List.assoc nm env
  | And (e1,e2) -> evalBool (&&) e1 e2 env
  | Or (e1,e2) -> evalBool (||) e1 e2 env
  | Not e -> let (BoolR b) = eval e env in BoolR (not b)
  | Lt (e1, e2) -> evalComp (<) e1 e2 env
  | Eq (e1, e2) -> evalComp (=) e1 e2 env
  | Gt (e1, e2) -> evalComp (>) e1 e2 env
  | Print e -> let () = match eval e env with
		 | UnitR -> print_string "()"
		 | IntR i -> print_int i
		 | BoolR b -> if b then print_string "True" else print_string "False" in
	       let () = print_string "\n" in
	       let () = flush stdout in UnitR
and evalInt f e1 e2 env =
  let (IntR i1) = eval e1 env in
  let (IntR i2) = eval e2 env in
  IntR (f i1 i2)
and evalIf cond thn els env =
  let (BoolR b) = eval cond env in
  if b then eval thn env else eval els env
and evalLet name vl exp env =
  let r = eval vl env in
  eval exp ((name,r)::env)
and evalBool f e1 e2 env =
  let (BoolR b1) = eval e1 env in
  let (BoolR b2) = eval e2 env in
  BoolR (f b1 b2)
and evalComp cmp e1 e2 env =
  let (IntR i1) = eval e1 env in
  let (IntR i2) = eval e2 env in
  BoolR (cmp i1 i2)

(* Type checking/inference: Figure out type for an expression.  Fail if the expression is not well-typed.*)
let rec typeof exp env = match exp with
  | Const _ -> Int
  | BConst _ -> Bool
  | Add (e1,e2) | Sub (e1,e2) | Mul (e1,e2)
  | Div (e1,e2) ->
     ( match (typeof e1 env, typeof e2 env) with
       | (Int,Int) -> Int
       | _ -> failwith "Arithmetic on non-integer argument(s)")
  | And (e1,e2)
  | Or (e1,e2) ->
     ( match (typeof e1 env, typeof e2 env) with
       | (Bool,Bool) -> Bool
       | _ -> failwith "BConst operation on non-Bool argument(s)")
  | Not e -> if (typeof e env) = Bool then Bool else failwith "Not of non-BConst"
  | Lt (e1,e2)
  | Gt (e1,e2) ->
     ( match (typeof e1 env, typeof e2 env) with
       | (Int,Int) -> Bool
       | _ -> failwith "Comparison of non-integer values" )
  | Eq (e1,e2) ->
     ( match (typeof e1 env, typeof e2 env) with
       | (Int,Int) | (Bool,Bool) | (Unit,Unit) -> Bool
       | _ -> failwith "Equality test on incompatible values" )
  | If (cond,thn,els) ->
     if not ((typeof cond env) = Bool) then failwith "If on non-BConst condition" else
       let (t1,t2) = (typeof thn env, typeof els env) in
       if (t1 = t2) then t1 else failwith "Different types for then/else branches"
  | Name name -> (try List.assoc name env with Not_found -> failwith ("Unbound variable "^name))
  | Let (name,vl,e) ->
     let t = typeof vl env in
     typeof e ((name,t)::env)
  | Print e -> let _ = typeof e env in Unit

let e1 = Let("x",Const 3,
	     Let("y", Const 7,
		 If(Gt(Name "y", Name "x"),Print (BConst true),Print (BConst false))))

(* Add two well-typed programs below *)
let prog1 = Let ("dog", Const 4, If(Eq(Name "dog", Const 4), BConst true, BConst false))

let prog2 = Let ("not dog", Const 8, If(Eq(Name "not dog", Const 4), BConst true, BConst false))

let badtype1 = Let("x", Mul(Const 7, BConst true),
		   If (Const 1, Const 3, Print(BConst false)))

(* Add two programs that will fail to type-check below *)
let err1 = Gt(Name "dog", Name "cat")
let err2 = Or(BConst true, Const 10)

(* here's where you define find_constants *)
let find_constants (e : expr) =
	let rec find_constants_rec (e : expr) lst =  match e with
	| Const c -> Const c::lst
	| BConst b -> BConst b::lst
	| Add (e1, e2)
	| Mul (e1, e2)
	| Sub (e1, e2)
	| And (e1, e2)
	| Or (e1, e2)
	| Lt (e1, e2)
	| Eq (e1, e2)
	| Gt (e1, e2)
	| Div (e1, e2) -> (find_constants_rec e1 lst) @ (find_constants_rec e2 lst)
	| Print e
	| Not e -> find_constants_rec e lst
	| Name n -> []
	| If (cond, thn, els) -> (find_constants_rec cond lst) @ (find_constants_rec thn lst) @ (find_constants_rec els lst)
	| Let (_, vl, exp') -> (find_constants_rec vl lst) @ (find_constants_rec exp' lst)
in find_constants_rec e []

(* here's where you define rm_vars *)
let rm_vars (e : expr) =
	let rec _rm_vars e env= match e with
	| Name n -> List.assoc n env
	| Const c -> Const c
	| BConst b -> BConst b
	| Add (e1, e2) -> Add (_rm_vars e1 env, _rm_vars e2 env)
	| Mul (e1, e2) -> Mul (_rm_vars e1 env, _rm_vars e2 env)
	| Sub (e1, e2) -> Sub (_rm_vars e1 env, _rm_vars e2 env)
	| Div (e1, e2) -> Div (_rm_vars e1 env, _rm_vars e2 env)
	| And (e1, e2) -> And (_rm_vars e1 env, _rm_vars e2 env)
	| Or (e1, e2) -> Or (_rm_vars e1 env, _rm_vars e2 env)
	| Lt (e1, e2) -> Lt (_rm_vars e1 env, _rm_vars e2 env)
	| Gt (e1, e2) -> Gt (_rm_vars e1 env, _rm_vars e2 env)
	| Eq (e1, e2) -> Eq (_rm_vars e1 env, _rm_vars e2 env)
	| Not e -> Not (_rm_vars e env)
	| Let (a, b, c) -> Let (a, _rm_vars b env, _rm_vars c (if (typeof b []) = Bool then (a, BConst false)::env else (a, Const 0)::env))
	| If (a, b, c) -> If (_rm_vars a env, _rm_vars b env, _rm_vars c env)
	| Print e -> Print (_rm_vars e env) in

_rm_vars e []












