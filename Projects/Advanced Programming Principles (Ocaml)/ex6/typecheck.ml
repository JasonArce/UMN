(* Data type for programs with primitive types - Ex6 part 2 *)

(* Typing rules for new types and operations:
+ UConst
=> UConst : Unit

+ Print
e : expr => Print e : Unit

+ SConst
=> SConst s : StringT

+ SFirst
e : expr => SFirst e : StringT

+ SRest
e : expr => SRest e : StringT

+ Concat
e1 : expr, e2 : expr => Concat (e1,e2) : StringT

*)

type expr =
  Add of expr * expr
  | Mul of expr * expr
  | Sub of expr * expr
  | Div of expr * expr
  | Const of int
  | Let of string * expr * expr
  | Name of string
  | If of expr * expr * expr
  | BConst of bool
  | And of expr * expr
  | Or of expr * expr
  | Not of expr
  | Eq of expr * expr
  | Lt of expr * expr
  | Gt of expr * expr
  | UConst
  | Print of expr
  | SConst of string
  | SFirst of expr
  | SRest of expr
  | Concat of expr * expr

type result = BoolR of bool | IntR of int | UnitR of unit | StringR of string

let rec eval expr env = match expr with
  | Add (e1,e2) -> evalInt (+) e1 e2 env
  | Mul (e1,e2) -> evalInt ( * ) e1 e2 env
  | Sub (e1,e2) -> evalInt (-) e1 e2 env
  | Div (e1, e2) -> evalInt (/) e1 e2 env
  | Const i -> IntR i
  | Let(n,v,b) -> let v1 = (eval v env) in (eval b ((n,v1)::env))
  | Name s -> List.assoc s env
  | UConst -> UnitR ()
  | Print e1 -> let presult = match (eval e1 env) with
    | BoolR b -> string_of_bool b
    | IntR b -> string_of_int b
    | UnitR u -> " "
  in UnitR (print_endline presult)
  | SConst e1 -> StringR e1
  | SFirst e1 -> let sresult = match (eval e1 env) with
      | StringR s -> s
      | BoolR b -> string_of_bool b
      | IntR i -> string_of_int i
      | UnitR u -> " "
  in StringR (if sresult = " " then "" else String.make 1 (String.get sresult 0))
  | SRest e1 -> let sresult = match (eval e1 env) with
      | StringR s -> s
      | BoolR b -> string_of_bool b
      | IntR i -> string_of_int i
      | UnitR u -> " "
  in StringR (if String.length sresult > 1 then (String.sub sresult 1 ((String.length sresult)-1)) else "")
  | Concat (e1,e2) -> let sresult1 = match (eval e1 env) with
    | StringR s -> s
    | BoolR b -> string_of_bool b
    | IntR i -> string_of_int i
    | UnitR u -> " "
  in let sresult2 = match (eval e2 env) with
    | StringR s -> s
    | BoolR b -> string_of_bool b
    | IntR i -> string_of_int i
    | UnitR u -> " "
  in StringR (sresult1^sresult2)
  | If(cnd,thn,els) ->
     let (BoolR c) = eval cnd env in
     if c then (eval thn env) else (eval els env)
  | BConst b -> BoolR b
  | And(e1,e2) -> evalBool (&&) e1 e2 env
  | Or(e1,e2) -> evalBool (||) e1 e2 env
  | Not(e) -> let (BoolR b) = (eval e env) in BoolR (not b)
  | Eq(e1,e2) -> BoolR ((eval e1 env) = (eval e2 env))
  | Lt(e1,e2) -> evalComp (<) e1 e2 env
  | Gt(e1,e2) -> evalComp (>) e1 e2 env
and evalInt f e1 e2 env =
  let (IntR i1, IntR i2) = (eval e1 env, eval e2 env) in
  IntR(f i1 i2)
and evalBool f e1 e2 env =
  let (BoolR b1, BoolR b2) = (eval e1 env, eval e2 env) in
  BoolR(f b1 b2)
and evalComp f e1 e2 env =
  let (IntR i1, IntR i2) = (eval e1 env, eval e2 env) in
  BoolR(f i1 i2)

let rec unbound exp bound = match exp with
  | Const _ | BConst _ | UConst _ | Print _ | SConst _ | SFirst _ | SRest _ | Concat _ -> []
  | Add(e1,e2)
  | Mul(e1,e2)
  | Sub(e1,e2)
  | Div(e1,e2)
  | And(e1,e2)
  | Or(e1,e2)
  | Eq(e1,e2)
  | Lt(e1,e2)
  | Gt(e1,e2) -> (unbound e1 bound) @ (unbound e2 bound)
  | Not e -> unbound e bound
  | If(e1,e2,e3) -> (unbound e1 bound) @ (unbound e2 bound) @ (unbound e3 bound)
  | Name n -> if (List.mem n bound) then [] else [n]
  | Let(n,v,b) -> (unbound v bound) @ (unbound b (n::bound))

type expType = Bool | Int | Unit | StringT
let rec typeof exp env = match exp with
  | Const _ -> Int
  | BConst _ -> Bool
  | UConst _ -> Unit
  | Print _ -> Unit
  | SConst _ -> StringT
  | SFirst _ -> StringT
  | SRest _ -> StringT
  | Concat _ -> StringT
  | Add (e1,e2)
  | Mul (e1,e2)
  | Div (e1,e2)
  | Sub (e1,e2) -> (arithCheck e1 e2 env)
  | And (e1,e2) | Or (e1,e2) -> (boolCheck e1 e2 env)
  | Not e -> if (typeof e env) = Bool then Bool
             else failwith "Not of non-boolean"
  | Lt (e1,e2)
  | Gt (e1,e2)
  | Eq (e1,e2) -> (compCheck e1 e2 env)
  | Name n -> List.assoc n env
  | Let(n,v,b) -> let vt = (typeof v env) in (typeof b ((n,vt)::env))
  | If(c,thn,els) -> if (typeof c env) <> Bool then failwith "if with non-boolean condition"
                     else ( match (typeof thn env, typeof els env) with
                            | (Int, Int) -> Int
                            | (Bool, Bool) -> Bool
                            | _ -> failwith "mismatched cases in if")
and arithCheck e1 e2 env = match (typeof e1 env,typeof e2 env) with
  | (Int,Int) -> Int
  | _ -> failwith "Integer operation on noninteger argument(s)"
and boolCheck e1 e2 env = match (typeof e1 env, typeof e2 env) with
  | (Bool,Bool) -> Bool
  | _ -> failwith "Boolean operaiton on non-boolean argument(s)"
and compCheck e1 e2 env = match (typeof e1 env, typeof e2 env) with
  | (Int, Int) -> Bool
  | _ -> failwith "Comparison between noninteger arguments"
