open Program

(* small example programs:
   Because we're keeping type inference simple, we'll require functions to have a single argument,
   and declare the type of that argument after a colon.
   To simplify parsing function applications, we'll have explicit "app" expressions, so to apply function f to argument x,
   the program will say (app f x).  A multiple argument function will need to be applied to each argument in turn, so the equivalent to the
   Ocaml expression (f x y) will be (app (app f x) y).
*)

let example1 =
  "(let f (fun g : int -> int  (app g 0))
          (print (app f (fun x : int (+ x 2)))))"

let example2 =
  "(let gcd (fun a : int (fun b : int
            (let q (/ a b)
            (let r (- a (* q b))
                   (seq (while (not (= r 0))
                               (seq (set a b)
                                    (set b r)
                                    (set q (/ a b))
                                    (set r (- a (* q b)))))
                         b)))))
            (print (app (app gcd 217) 527)))"

let example3 =
"(let y 0
    (let x (+ 1 2)
        (while (> x 0)
            (seq
                (set x (- x 1))
                (if (> 1 0) x y)
                (if (< 1 0) x y)
                (while (> 1 0) (print y))
                (+ 1 2)
                (seq (let z (+ 2 3) (< 1 2)))
            )
        )
    )
)"

(* the first let z cannot be eliminated here because its definition contains a side effect *)
let example4 =
"(let y (* 0 0)
  (let z (if (> y 4)
           (seq (set y (- y 1)) 1)
           0)
    (seq (print y)
         (if (= (+ 1 0) (- 2 1))
             (let z readint z)
             (+ 42 17)))
  )
)"

(* notice the second z "inner_fs" the first, so the first let z can be eliminated here *)
(* the second cannot, because of the side effect in the definition and its use of z in the body *)
let example5 =
"(let y (- 0 0)
  (let z (if (> y 4) 1 0)
    (seq (print y)
         (if (= (+ 1 0) (- 2 1))
             (let z readint z)
             (+ 42 17)))
  )
)"

(* exceptions that were used in part 4 of the homework *)
exception SyntaxError of int
exception Unused of int
exception Unclosed of int

(* all of the lexical tokens we might encounter in a program *)
type token = OP | CP | AND | OR | NOT | PLUS | MINUS | TIMES | DIV | LET | ID of string | CONST of int | BCONST of bool | LT | GT | EQ | IF |
	     SET | SEQ | WHILE | PRINT |
	     APP | FUN | COLON | ARROW | INT | BOOL | UNIT | READ

(* Split a string into a list of words, delimited by spaces, parens, colons, and -> *)
(* never mind the magic regexp *)
let wordlist s =
  let splitlist = Str.full_split (Str.regexp "\\b\\|(\\|)\\|:\\|\\(->\\)") s in
  let rec filter_splist lst = match lst with
    | [] -> []
    | (Str.Delim "(")::t -> "(" :: (filter_splist t)
    | (Str.Delim ")")::t -> ")" :: (filter_splist t)
    | (Str.Delim "->")::t -> "->" :: (filter_splist t)
    | (Str.Delim ":")::t -> ":"::(filter_splist t)
    | (Str.Delim _) :: t -> filter_splist t
    | (Str.Text s) :: t -> let s' = String.trim s in
                           let t' = (filter_splist t) in
                           if not (s' = "") then s' :: t' else t'
  in filter_splist splitlist

(* turn a word into a token *)
let tokenize_string = function
  | "(" -> OP
  | ")" -> CP
  | "and" -> AND
  | "or" -> OR
  | "not" -> NOT
  | "+" -> PLUS
  | "*" -> TIMES
  | "-" -> MINUS
  | "/" -> DIV
  | "let" -> LET
  | ">" -> GT
  | "<" -> LT
  | "=" -> EQ
  | "if" -> IF
  | "set" -> SET
  | "seq" -> SEQ
  | "while" -> WHILE
  | "app" -> APP
  | "fun" -> FUN
  | ":" -> COLON
  | "->" -> ARROW
  | "int" -> INT
  | "bool" -> BOOL
  | "unit" -> UNIT
  | "print" -> PRINT
  | "true" -> BCONST true
  | "false" -> BCONST false
  | "readint" -> READ
  | s -> if Str.string_match (Str.regexp "[0-9]+") s 0 then (CONST (int_of_string s))
	 else if Str.string_match (Str.regexp "[a-z]+") s 0 then (ID s) else failwith ("invalid token:"^s)

(* and a list of words into a list of tokens *)
let tokens wl = List.map tokenize_string wl

(* Parse a type expression in a function definition.
   Return the type and the list of unused tokens for further parsing.
   A type expression is either: INT, BOOL, UNIT or  (typeExpr)  or typeExpr -> typeExpr  *)
let rec parse_type_expr tlist =
  let (ty1, tl) =
    match tlist with
    | INT::t -> (Int,t)
    | BOOL::t -> (Bool,t)
    | UNIT::t -> (Unit,t)
    | OP::t -> (* Read up until we find a close paren: covers types like "(int->bool) -> int" *)
       let (ty,t) = parse_type_expr t in
       ( match t with
	 | CP::t' -> (ty,t')
	 | _ -> failwith "imbalanced parentheses in type expression" )
    | _ -> failwith "unexpected token in type expression."
  in match tl with (* peek at tail: is there an arrow (so more type expr to read)? *)
     | ARROW::t1 ->
	let (ty2, t2) = parse_type_expr t1 in (FunType(ty1,ty2),t2)
     | _ -> (ty1,tl) (* No, we're done here. *)

let parse_program tlist =
  (* parse an expression from a list of tokens, returning the expression and the list of unused tokens *)
  let rec parser tlist = match tlist with
    | [] -> failwith "Ran out of tokens without closing parenthesis"
    | (BCONST b)::t -> (Boolean b,t)
    | (CONST i)::t -> (Const i, t)
    | (ID s)::t -> (Name s, t)
    | OP::PLUS::t -> let (e1,e2,t') = parse_two t in (Add (e1,e2), t')
    | OP::MINUS::t -> let (e1,e2,t') = parse_two t in (Sub (e1,e2), t')
    | OP::TIMES::t -> let (e1,e2,t') = parse_two t in (Mul (e1,e2), t')
    | OP::DIV::t -> let (e1,e2,t') = parse_two t in (Div (e1,e2), t')
    | OP::AND::t -> let (e1,e2,t') = parse_two t in (And (e1,e2), t')
    | OP::OR::t -> let (e1,e2,t') = parse_two t in (Or (e1,e2), t')
    | OP::EQ::t -> let (e1,e2,t') = parse_two t in (Eq (e1,e2), t')
    | OP::GT::t -> let (e1,e2,t') = parse_two t in (Gt (e1,e2), t')
    | OP::LT::t -> let (e1,e2,t') = parse_two t in (Lt (e1,e2), t')
    | OP::WHILE::t -> let (e1,e2,t') = parse_two t in (While (e1,e2), t')
    | OP::APP::t -> let (e1,e2,t') = parse_two t in (Apply (e1,e2), t')
    | OP::FUN::(ID s)::COLON::t ->
       let (tExp, t') = parse_type_expr t in
       let (bExp,t'') = parse_single t' in (Fun (s,tExp,bExp),t'')
    | OP::LET::(ID s)::t -> let (v,e,t') = parse_two t in (Let (s,v,e), t')
    | OP::SET::(ID s)::t -> let (e,t') = parse_single t in (Set (s,e), t')
    | OP::IF::t ->
       let (c,t1) = parser t in
       let (thn,els,t2) = parse_two t1 in (If (c,thn,els), t2)
    | OP::NOT::t -> let (e,t') = parse_single t in (Not(e),t')
    | OP::PRINT::t -> let (e,t') = parse_single t in (Print(e), t')
    | OP::SEQ::t -> let (l,t') = parse_list t in (Seq(l),t')
    | READ::t -> (Readint, t)
    | _ -> failwith "Unexpected token: unbalanced parentheses or keyword out of call position"

  and parse_single t = let (e,t') = parser t in  (* parse a single expression and "eat" the following close paren *)
    ( match t' with
      | CP::t'' -> (e,t'')
      | _ -> failwith "parser: missing closing paren.")

  and parse_two t = (* "eat" the close paren after two expressions *)
    let (e1,t1) = parser t in
    let (e2,t2) = parser t1 in
    ( match t2 with
      | CP::t' -> (e1,e2,t')
      | _ -> failwith "parser: missing closing paren.")

  and parse_list t = (* parse a list of expressions, consuming the final closing paren *)
    ( match t with
      | CP::t' -> ([],t')
      | [] -> failwith "unfinished expression sequence: missing close paren(s)."
      | _ -> let (e,t1) = parser t in
	     let (el,t2) = parse_list t1 in (e::el, t2)
    )
  in
  let (e,t) = parser tlist in
  match t with
  | [] -> e
  | _ -> failwith "parse failed: extra tokens in input."

let thetypeof exp = match exp with (* matches the exp with type const, boolean, or fun(_,_,_) *)
  | Const _ -> Int
  | Boolean _ -> Bool
  | Fun (_,_,_) -> Other (* This exp type was added in program *)
  | _ -> Unit (* If it matched none, then a Unit was returned. This was just put in as a wild card match. *)



let rec const_fold (e : expr) =
  let rec tr_const_fold e = match e with
| Const n -> Const n
| Boolean b -> Boolean b
| Add (e1,e2) -> let addIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* Adds two consts or will dig deeper in the expression input for two consts *)
                  |(Const e1, Const e2) -> Const (e1+e2)
                  | _ -> Add(tr_const_fold e1, tr_const_fold e2)
                  in addIt e1 e2
| Mul (e1,e2) -> let mulIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* Multiplies two consts or will dig deeper in the expression input for two consts *)
                  |(Const e1, Const e2) -> Const (e1*e2)
                  | _ -> Mul(tr_const_fold e1, tr_const_fold e2)
                  in mulIt e1 e2
| Sub (e1,e2) -> let subIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* Subtracts two consts or will dig deeper in the expression input for two consts *)
                  |(Const e1, Const e2) -> Const (e1-e2)
                  | _ -> Sub(tr_const_fold e1, tr_const_fold e2)
                  in subIt e1 e2
| Div (e1,e2) -> let divIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* Divides two consts or will dig deeper in the expression input for two consts *)
                  |(Const e1, Const e2) -> Const (e1/e2)
                  | _ -> Div(tr_const_fold e1, tr_const_fold e2)
                  in divIt e1 e2
| If (cond,thn,els) -> let ifIt c t e = match (tr_const_fold c) with (* If case that checks if the condition is true or false*)
                        | Boolean true  -> tr_const_fold t (* if true evaluate t *)
                        | Boolean false -> tr_const_fold e (* if false evaluate e *)
                        | _ -> If(cond, tr_const_fold t, tr_const_fold e) (* if an expression, evaluate t and e *)
                      in ifIt cond thn els
| Let (nm,vl,exp') -> if (thetypeof (tr_const_fold vl) = Int || thetypeof (tr_const_fold vl) = Bool) && (thetypeof (tr_const_fold exp') = Int || thetypeof (tr_const_fold exp') = Bool)
                      then tr_const_fold exp' else Let(nm, tr_const_fold vl, tr_const_fold exp') (* if the type of vl or exp' is a const then apply a recursive call to exp'
                                                                                                    else use a recursive call for vl and exp' in the Let statement *)
| Name nm -> Name nm
| And (e1,e2) -> let andIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* checks if either e1 or e2 is false, if so the expression is false *)
                  |(Boolean false, _) ->  Boolean false
                  |(_, Boolean false) -> Boolean false
                  | _ -> And (tr_const_fold e1, tr_const_fold e2) (* Otherwise recursively call e1 and e2 and go deeper in the input expression *)
                  in andIt e1 e2
| Or (e1,e2) -> let orIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* checks if either e1 or e2 is true, if so the expression is true *)
                  |(Boolean true, _) ->  Boolean true
                  |(_, Boolean true) -> Boolean true
                  | _ -> Or (tr_const_fold e1, tr_const_fold e2) (* Otherwise recursively call e1 and e2 and go deeper in the input expression *)
                  in orIt e1 e2
| Not e -> Not(tr_const_fold e) (* go deeper in the input by calling tr_const_fold on the expression *)
| Lt (e1, e2) -> let lessThanIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* checks to see if e1 is less than e2 *)
                  |(Const e1, Const e2) -> if e1 < e2 then Boolean true else Boolean false (* if so, then return true, else return false *)
                  | _ -> Lt(tr_const_fold e1, tr_const_fold e2) (* If they aren't both Const then apply tr_const_fold to e1 and e2 *)
                  in lessThanIt e1 e2
| Eq (e1, e2) -> let equalToIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* checks to see if e1 is equal to e2 *)
                  |(Const e1, Const e2) -> if e1 = e2 then Boolean true else Boolean false (* if so, then return true, else return false *)
                  | _ -> Eq(tr_const_fold e1, tr_const_fold e2) (* If they aren't both Const then apply tr_const_fold to e1 and e2 *)
                  in equalToIt e1 e2
| Gt (e1, e2) -> let greaterThanIt e1 e2 = match (tr_const_fold e1,tr_const_fold e2) with (* checks to see if e1 is greater than e2 *)
                  |(Const e1, Const e2) -> if e1 > e2 then (Boolean true) else (Boolean false) (* if so, then return true, else return false *)
                  | _ -> Gt(tr_const_fold e1, tr_const_fold e2) (* If they aren't both Const then apply tr_const_fold to e1 and e2 *)
                  in greaterThanIt e1 e2
| Seq elist -> helpSeq  (elist) (* calls a helper function 'helpSeq' to evaluate  *)
| While(cond,body) -> if (tr_const_fold cond) = Boolean false then Seq [] else While (tr_const_fold cond,tr_const_fold body) (* Matches what is expected for while on the hw4.md file *)
| Set (name, e) -> Set(name, tr_const_fold e) (* go deeper in the input by calling tr_const_fold on e *)
| Fun (argname, a ,body) -> Fun(argname, a, tr_const_fold body) (* go deeper in the input by calling tr_const_fold on the body *)
| Apply (f,e) -> Apply(tr_const_fold f, tr_const_fold e) (* go deeper in the input by calling tr_const_fold on the two expressions *)
| Print e -> Print(tr_const_fold e) (* go deeper in the input by calling tr_const_fold on the expression *)
| Readint -> Readint
and filterHelp = function (* Checks if the expression is a boolean or a const *)
|Boolean b -> false
|Const n -> false
| _ -> true
and helpSeq clist = match (List.rev clist) with (* helper function to evaluate seq in const_fold. Start by reversing the list so we can evaluate the
                                                  last expression regardless if it's a const *)
| [] -> Seq[] (* empty list returns an empty Seq list *)
| h::t -> match t with
              | [] -> tr_const_fold h (* empty list means there's only one thing in the whole thing, it will now be evaluated. *)
              | _ -> if(List.length (List.rev ((tr_const_fold h)::(List.filter (filterHelp) (List.map tr_const_fold (t))))) > 1)
              then (Seq(List.rev((tr_const_fold h)::(List.filter (filterHelp) (List.map (tr_const_fold) (t)))))) (* checks to see if the length is greater than one. If it is not, then only the tail is
                                                                                                                    returned after the recursive call to tr_const_fold is applied. *)
              else tr_const_fold h                                                                                        (* If the length is greater than 1 then
                                                                                                                  add on the evaluated head (which began as the end) and filter
                                                                                                                  using filterHelp and map a recursive call to the tail of each
                                                                                                                  expression in the list. Then reverse the list again so its back to normal *)
in tr_const_fold e

let rec uses a b = match b with (* function sees if shadow binding is being used for the name a *)
                  | Let(x,y,z) -> if a = x then false else uses a y || uses a z (* if a matches, shadowbinding is false. Otherwise send y and z back through *)
                  | Fun(x,y,z) -> if a = x then true else uses a z (* if a matches, shadowbinding is true. Otherwise send z back through *)
                  | Seq elist ->  if (List.exists (uses a) elist) = true then true else false (* Sees if the predicate a is renamed in the seq list *)
                  | Name nm -> if a = nm then true else false (* if a matches the nm then it is true, otherwise false is returned to indicate no match *)
                  | Set(x,y) -> if a = x then true else uses a y (* if a matches then shadowbinding is true. Otherwise send a back through. *)
                  | While(cond,body) -> uses a cond || uses a body (* Each call underneath re-enters uses until a false or true is hit *)
                  | If(x,y,z) ->  uses a y || uses a z
                  | Apply(f,e) -> uses a f || uses a e
                  | Not e -> uses a e
                  | Print e -> uses a e
                  | And(e1,e2) -> uses a e1 || uses a e2
                  | Or(e1,e2) -> uses a e1 || uses a e2
                  | Add(e1,e2) -> uses a e1 || uses a e2
                  | Sub(e1,e2) -> uses a e1 || uses a e2
                  | Div(e1,e2) -> uses a e1 || uses a e2
                  | Mul(e1,e2) -> uses a e1 || uses a e2
                  | Lt (e1,e2) -> uses a e1 || uses a e2
                  | Eq (e1,e2) -> uses a e1 || uses a e2
                  | Gt (e1,e2) -> uses a e1 || uses a e2
                  | Const c -> false (* All constants will be false *)
                  | Boolean b -> false
                  | Readint -> false
                  | _ -> failwith "uses Error" (* just in case, a failwith was made *)

let rec has_side_effect b = match b with (* sees if the function has a side effect on the expression *)
                          | Set _ -> true (* These cases are explictly said to be true *)
                          | Print _ -> true
                          | Apply _ -> true
                          | Readint -> true
                          | Let(x,y,z) -> has_side_effect y || has_side_effect z (* Each call underneath re-enters uses until a false or true is hit *)
                          | Fun(x,y,z) -> has_side_effect z
                          | Seq elist -> List.exists (has_side_effect) elist
                          | Set(x,y) -> has_side_effect y
                          | While(cond, body) -> has_side_effect cond || has_side_effect body
                          | If(x,y,z) -> has_side_effect y || has_side_effect z
                          | Not e -> has_side_effect e
                          | And(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Or(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Add(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Sub(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Div(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Mul(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Lt(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Eq(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Gt(e1,e2) -> has_side_effect e1 || has_side_effect e2
                          | Name nm -> false (* Name will be false *)
                          | Const c -> false (* all constants will be false *)
                          | Boolean b -> false
                          | _ -> failwith "has_side_effect Error" (* just in case, a failwith was made *)

let unused_def_elim (e: expr) =
  let rec inner_f e env = match e with
  | Const c -> Const c
  | Boolean b -> Boolean b
  | Name nm -> Name nm
  | Not e -> Not(inner_f e env) (* From Not to If, a recursive call is applied to each expression *)
  | Print e -> Print(inner_f e env)
  | Add (e1,e2) -> Add(inner_f e1 env, inner_f e2 env)
  | Sub (e1,e2) -> Sub(inner_f e1 env, inner_f e2 env)
  | Mul (e1, e2) -> Mul(inner_f e1 env, inner_f e2 env)
  | Div (e1, e2) -> Div(inner_f e1 env, inner_f e2 env)
  | And (e1, e2) -> And (inner_f e1 env, inner_f e2 env)
  | Or (e1, e2) -> Or (inner_f e1 env, inner_f e2 env)
  | Lt (e1,e2) -> Lt (inner_f e1 env, inner_f e2 env)
  | Eq (e1, e2) -> Eq (inner_f e1 env, inner_f e2 env)
  | Gt (e1,e2) -> Gt (inner_f e1 env, inner_f e2 env)
  | If (c,thn,els) -> If(c, inner_f thn env, inner_f els env)
  | Let (nm, v, b) -> (match v with
                     | Fun (x,y,z) -> if (uses x z) = false then b else Let(nm, inner_f v env, inner_f b env) (* calls uses to see if x isn't used in Fun *)
                     | _ -> if (uses nm  b) = false && (has_side_effect v) = false then inner_f b env else Let(nm, inner_f v env, inner_f b env)) (* if uses and has_side_effect are both false
                                                                                                                                                    then evaluate b, otherwise return the Let Statement
                                                                                                                                                    but applying a recursive call to v and b
                                                                                                                                                    *)
  | Seq elist -> Seq(List.map (fun x -> inner_f x []) elist) (* we map a recursive call to each expression in the elist *)
  | While(cond,body) -> While (inner_f cond env, inner_f body env) (* While and Set have inner_f applied to their expressions *)
  | Set (name, e) -> Set(name, inner_f e env)
  | Fun (argname, a ,body) -> if (uses argname body) = true && (has_side_effect body) = false then body else Fun(argname, a, (inner_f body env))
  | Apply (f,e) -> Apply(inner_f f env, inner_f e env)
  | Print e -> Print(inner_f e env)
  | Readint -> Readint
  | _ -> failwith "Error!"
in inner_f e []


  let parse_pos input = (* Essentially copied parse_program *)
    let rec parser_pos tlist count = match tlist with (* count keeps track of how many tokens have been parsed *)
      | [] -> raise (Unclosed (count))
      | (BCONST b)::t -> (Boolean b,t)
      | (CONST i)::t -> (Const i, t)
      | (ID s)::t -> (Name s, t)
      | OP::PLUS::t -> let (e1,e2,t') = parse_two t (count + 1) in (Add (e1,e2), t')
      | OP::MINUS::t -> let (e1,e2,t') = parse_two t (count + 2) in (Sub (e1,e2), t')
      | OP::TIMES::t -> let (e1,e2,t') = parse_two t (count + 2) in (Mul (e1,e2), t')
      | OP::DIV::t -> let (e1,e2,t') = parse_two t (count + 2) in (Div (e1,e2), t')
      | OP::AND::t -> let (e1,e2,t') = parse_two t (count + 2) in (And (e1,e2), t')
      | OP::OR::t -> let (e1,e2,t') = parse_two t (count + 2) in (Or (e1,e2), t')
      | OP::EQ::t -> let (e1,e2,t') = parse_two t (count + 2) in (Eq (e1,e2), t')
      | OP::GT::t -> let (e1,e2,t') = parse_two t (count + 2) in (Gt (e1,e2), t')
      | OP::LT::t -> let (e1,e2,t') = parse_two t (count + 2) in (Lt (e1,e2), t')
      | OP::WHILE::t -> let (e1,e2,t') = parse_two t (count + 2) in (While (e1,e2), t')
      | OP::APP::t -> let (e1,e2,t') = parse_two t (count + 2) in (Apply (e1,e2), t')
      | OP::FUN::(ID s)::COLON::t ->
         let (tExp, t') = parse_type_expr (t) in
         let (bExp,t'') = parse_single t' (count + 1) in (Fun (s,tExp,bExp),t'')
      | OP::LET::(ID s)::t -> let (v,e,t') = parse_two t (count + 2) in (Let (s,v,e), t')
      | OP::SET::(ID s)::t -> let (e,t') = parse_single t (count + 1) in (Set (s,e), t')
      | OP::IF::t ->
         let (c,t1) = parser_pos t (count + 1) in
         let (thn,els,t2) = parse_two t1 (count + 2) in (If (c,thn,els), t2)
      | OP::NOT::t -> let (e,t') = parse_single t (count + 1) in (Not(e),t')
      | OP::PRINT::t -> let (e,t') = parse_single t (count + 1) in (Print(e), t')
      | OP::SEQ::t -> let (l,t') = parse_list t (count + (List.length t)) in (Seq(l),t')
      | READ::t -> (Readint, t)
      | _ -> raise (SyntaxError (count)) (* Anything else should be treated as a Syntax error *)

    and parse_single t count= let (e,t') = parser_pos t (count) in  (* parse a single expression and "eat" the following close paren *)
      ( match t' with
        | CP::t'' -> (e,t'')
        | _ -> raise (Unclosed (count+1))) (* Anything else should be treated as an Unclosed error *)

    and parse_two t count = (* "eat" the close paren after two expressions *)
      let (e1,t1) = parser_pos t (count+1) in
      let (e2,t2) = parser_pos t1 (count) in
      ( match t2 with
        | CP::t' -> (e1,e2,t')
        | [] -> raise (Unclosed (count+2)) (* This is if there is no closing brackets on the end *)
        | _ -> raise (Unclosed (count+1))) (* Anything else should be treated as an Unclosed error *)

    and parse_list t count = (* parse a list of expressions, consuming the final closing paren *)
      ( match t with
        | CP::t' -> ([],t')
        | [] -> raise (Unclosed (count)) (* an empty bracket in this case is due to an Unclosed error *)
        | _ -> let (e,t1) = parser_pos t (count + (List.length t)) in
         let (el,t2) = parse_list t1 count in (e::el, t2)
      )
    in
    let (e,t) = parser_pos input 1 in (* count starts at 1 because the earliest an error can occur is index 1 *)
    match t with
    | [] -> e
    | _ -> raise (Unused ((List.length input)-(List.length t))) (* This is the total length - the amount of leftover tokens *)
