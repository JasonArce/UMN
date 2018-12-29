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


(* Fix this: *)
let count_bindings (e : expr) =
	let rec tr_count_bindings (e : expr) lst =  match e with
	| Const c -> lst
	| BConst b -> lst
	| Add (e1, e2)
	| Mul (e1, e2)
	| Sub (e1, e2)
	| And (e1, e2)
	| Or (e1, e2)
	| Lt (e1, e2)
	| Eq (e1, e2)
	| Gt (e1, e2)
	| Div (e1, e2) -> (tr_count_bindings e1 lst) + (tr_count_bindings e2 lst)
	| Print e
	| Not e -> tr_count_bindings e lst
	| Name n -> lst
	| If (cond, thn, els) -> (tr_count_bindings cond lst) + (tr_count_bindings thn lst) + (tr_count_bindings els lst)
	| Let (_, vl, exp') -> (tr_count_bindings vl lst+1) + (tr_count_bindings exp' lst)
in tr_count_bindings e 0


(* And this: *)
let has_shadow_binding (e : expr) = match e with
| Const c -> false
| BConst b -> false
| Add (e1, e2) -> false
| Mul (e1, e2) -> false
| Sub (e1, e2) -> false
| And (e1, e2) -> false
| Or (e1, e2) -> false
| Lt (e1, e2) -> false
| Eq (e1, e2) -> false
| Gt (e1, e2) -> false
| Div (e1, e2) -> false
| Print e -> false
| Not e -> false
| Name n -> false
| If (cond, thn, els) -> false
| Let (a, b, c) -> if eval (e) [] = eval (b) [] then false else true
