type result = IntR of int | BoolR of bool | UnitR

exception UnboundName of string
exception ArithTypeErr of result*result
exception CondTypeErr of result
exception CompTypeErr of result*result

type expr =
  Int of int | Bool of bool
  | Add of expr * expr
  | Seq of expr list
  | If of expr * expr * expr
  | Gt of expr * expr
  | Set of string * expr
  | Name of string
  | While of expr * expr

let string_of_result = function
| IntR i -> string_of_int i
| BoolR b -> string_of_bool b
| UnitR -> "()"

let rec assign n v st = match st with
  | [] -> [(n,v)]
  | (nm,_)::t when nm=n -> (n,v)::t
  | nv::t -> nv::(assign n v t)

let rec eval expr st = match expr with
  | Int i -> (IntR i, st)
  | Bool b -> (BoolR b, st)
  | Add(e1,e2) -> evalAdd e1 e2 st
  | Seq el -> evalSeq el st
  | If(c,thn,els) -> evalIf c thn els st
  | Gt(e1,e2) -> evalGt e1 e2 st
  | Set(nm,vexp) -> let (v,s') = eval vexp st in (UnitR, assign nm v s')
  | Name nm -> (try (List.assoc nm st, st) with Not_found -> raise (UnboundName nm))
  | While(c,b) -> evalWhile c b st
and evalAdd e1 e2 st =
  let (v1,st1) = eval e1 st in
  let (v2,st2) = eval e2 st1 in
   try (match (v1,v2) with
  | (IntR i1, IntR i2) -> (IntR (i1+i2), st2)) with Match_failure _ -> raise (ArithTypeErr (v1, v2))
and evalSeq el st = match el with
  | [] -> (UnitR, st)
  | [e] -> eval e st
  | e1::el1 -> let (_,st1) = eval e1 st in evalSeq el1 st1
and evalIf c thn els st =
	let x = eval c st in 
		try (match x with
		  | (BoolR true, st') -> eval thn st' 
  		  | (BoolR false, st') -> eval els st') with Match_failure _ -> 
		match x with
		(a, _) -> raise (CondTypeErr (a)) | _ -> failwith "o"
and evalGt e1 e2 st =
  let (v1,st1) = eval e1 st in
  let (v2,st2) = eval e2 st1 in
  try (match (v1,v2) with
  | (IntR i1, IntR i2) -> (BoolR (i1 > i2), st2)) with Match_failure _ -> raise (CompTypeErr (v1,v2))
and evalWhile c b st = 	let x = eval c st in 
		try (match x with
		  | (BoolR false, st') -> (UnitR, st')
		  | (BoolR true, st') -> let (_,st2) = eval b st' in evalWhile c b st2) 
		with Match_failure _ -> match x with
		(a, _) -> raise (CondTypeErr (a)) | _ -> failwith "o"

let p0 = Seq [ Set ("y", Seq []);
	       While (Gt (Name "x", Name"y"),
		      Seq [ Set("y", Add (Name "x", Int (-1)));
			    Set("x", Add (Name "y", Int 1))]) ;
	       Name "y"]

let p1 = Set ("x", Add (Seq [], Bool true))

let p2 = While (If (Int 1, Bool false, Bool true),
		Seq [ Set ("x", Gt (Name "x", Name "x"));
		      Set ("y", If(Name "x", Name "y", Bool false)) ])

let p3 = Seq [ Set ("x", Int 0);
	       While (Gt (Name "x", Bool false), Set ("x", Add (Name "x", Int (-1)))) ;
	       If (Int 1, Name "y", Seq []) ]

let p4 = While(Int 1,
	       If (Gt(Name "x", Name"y"),
		   Set ("x", Add(Name "x", Int(-1))),
		   Set ("y", Add(Name "y", Int(-1)))))

let runProg e = try (eval e []) with 
|UnboundName nm -> let () = print_endline ("Unbound name error: " ^ nm) in (eval e [])
|ArithTypeErr (r1, r2)-> let () = print_endline ("ArithType error: " ^ (string_of_result r1) ^ " " ^ (string_of_result r2)) in (eval e [])
|CondTypeErr r-> let () = print_endline ("Condition type error: " ^ (string_of_result r))  in (eval e [])
|CompTypeErr (r1, r2) -> let () = print_endline ("Comparison type error: " ^ (string_of_result r1) ^ " " ^ (string_of_result r2)) in (eval e [])


 
