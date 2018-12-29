(* Written by Jason Arce - arcex012 *)

(* read std input to eof, return list of lines *)
let read_lines () : string list =
  let rec read_help acc =
    try read_help ((read_line ())::acc) with End_of_file -> List.rev acc
  in read_help []

  (* Removes an element in the list *)
	let remove_elt element lst =
 	 let rec tr_remove_elt lst acc = match lst with  (* tail recursion adds all elements but the one we do not want to the accumulator and returns it once the list has been iterated through *)
   	 | [] -> List.rev acc
   	 | h::t when element = h -> tr_remove_elt t acc
   	 | h::t -> tr_remove_elt t (h::acc)
  	in tr_remove_elt lst [];;

(* Removes duplicates in a list*)
	let remove_duplicates lst =
 	 let rec tr_remove_duplicates lst acc = match lst with  (* tail recursion adds one of each from the list to the accumulator and returns it once the list has been iterated through *)
 	   | [] -> List.rev acc
 	   | h :: t -> tr_remove_duplicates (remove_elt h t) (h::acc)
 	 in tr_remove_duplicates lst [];;

(* split a string at word boundaries and parens *)
let wordlist s : string list =
  let splitlist = Str.full_split (Str.regexp "\\b\\|(\\|)") s in
  let rec filter_splist lst = match lst with
    | [] -> []
    | (Str.Delim "(")::t -> "(" :: (filter_splist t)
    | (Str.Delim ")")::t -> ")" :: (filter_splist t)
    | (Str.Delim _) :: t -> filter_splist t
    | (Str.Text s) :: t -> let s' = String.trim s in
			   let t' = (filter_splist t) in
			   if not (s' = "") then s' :: t' else t'
  in filter_splist splitlist

(* is s a legal variable name? *)
let is_varname s =
  let rec checker i =
    if i = 0 then
      'a' <= s.[i] && s.[i] <= 'z'
    else
      (('a' <= s.[i] && s.[i] <= 'z') ||
  	   ('0' <= s.[i] && s.[i] <= '9')) && checker (i-1)
  in checker ((String.length s) - 1)

(* All of the tokens have been added to the type bexp_token *)
type bexp_token = OP | CP | NAND | CONST of bool | AND | OR | NOT | XOR | EQ | VAR of string

(* convert a string into a token *)
let token_of_string = function
  | "(" -> OP
  | ")" -> CP
  | "nand" -> NAND
  | "T" -> CONST true
  | "F" -> CONST false
  | "and" -> AND
  | "or" -> OR
  | "not" -> NOT
  | "xor" -> XOR
  | "=" -> EQ
  | s -> if (is_varname s) then (VAR s) else (invalid_arg ("Unknown Token: "^s))

(* convert a list of strings into a a list of tokens *)
let tokens wl : bexp_token list = List.map token_of_string wl

(* type representing a boolean expression, you need to add variants here *)
type boolExpr = Const of bool
| Id of string
| Not of boolExpr
| And of boolExpr * boolExpr
| Or of boolExpr * boolExpr
| Xor of boolExpr * boolExpr
| Eq of boolExpr * boolExpr
| Nand of boolExpr * boolExpr

(* attempt to turn a list of tokens into a boolean expression tree.
A token list representing a boolean expression is either
 + a CONST token :: <more tokens> or
 + a VAR token :: <more tokens> or
 + an OPEN PAREN token :: a NAND token :: <a token list representing a boolean expression> @
                                          <a token list representing a boolen expression> @ a CLOSE PAREN token :: <more tokens>
 any other list is syntactically incorrect. *)
let parse_bool_exp tok_list =
(* when possibly parsing a sub-expression, return the first legal expression read
   and the list of remaining tokens. Checks for all tokens that were added in and follows the format
   given in OP::NAND::t. Only NOT differs because it only takes one argument. *)
  let rec parser tlist = match tlist with
    | (CONST b)::t -> (Const b, t)
    | (VAR s)::t -> (Id s, t)
    | OP::NAND::t -> let (a1, t1) = parser t in
                    let (a2, t2) = parser t1 in
                    (match t2 with
                     | CP::t' -> ((Nand (a1,a2)), t')
		                 | _ -> invalid_arg "sexp: missing )")
    | OP::AND::t -> let (a1, t1) = parser t in
                    let (a2, t2) = parser t1 in
                    (match t2 with
                     | CP::t' -> ((And (a1,a2)), t')
		                 | _ -> invalid_arg "sexp: missing )")
    | OP::OR::t -> let (a1, t1) = parser t in
                    let (a2, t2) = parser t1 in
                    (match t2 with
                     | CP::t' -> ((Or (a1,a2)), t')
		                 | _ -> invalid_arg "sexp: missing )")
    | OP::EQ::t -> let (a1, t1) = parser t in
                    let (a2, t2) = parser t1 in
                    (match t2 with
                     | CP::t' -> ((Eq (a1,a2)), t')
		                 | _ -> invalid_arg "sexp: missing )")
    | OP::XOR::t -> let (a1, t1) = parser t in
                    let (a2, t2) = parser t1 in
                    (match t2 with
                     | CP::t' -> ((Xor (a1,a2)), t')
		                 | _ -> invalid_arg "sexp: missing )")
    | OP::NOT::t -> let (a1, t1) = parser t in
                    (match t1 with
                     | CP::t' -> ((Not (a1)), t')
		                 | _ -> invalid_arg "sexp: missing )")
    | _ -> invalid_arg "parse failed."
  in let bx, t = parser tok_list in
     match t with
     | [] -> bx
     | _ -> invalid_arg "parse failed: extra tokens in input."

(* pipeline from s-expression string to boolExpr *)
let bool_exp_of_s_exp s = s |> wordlist |> tokens |> parse_bool_exp

(* evaluate the boolean expression bexp, assuming the variable names
   in the list tru are true, and variables not in the list are false *)
let rec eval_bool_exp bexp tru =
  match bexp with
  | Const b -> b
  | Id s -> List.mem s tru
  | Nand (x1, x2) -> not ((eval_bool_exp x1 tru) && (eval_bool_exp x2 tru))
  | And (x1, x2) -> ((eval_bool_exp x1 tru) && (eval_bool_exp x2 tru))
  | Or (x1, x2) -> ((eval_bool_exp x1 tru) || (eval_bool_exp x2 tru))
  | Not (x1) -> not (eval_bool_exp x1 tru)
  | Eq (x1,x2) -> ((eval_bool_exp x1 tru) = (eval_bool_exp x2 tru))
  | Xor (x1,x2) -> (((eval_bool_exp x1 tru) && not (eval_bool_exp x2 tru)) || (not(eval_bool_exp x1 tru) && (eval_bool_exp x2 tru)))

(* list all the subsets of the list s *)
let rec subsets s = match s with (* Checks for empty list and returns a list of an empty list. *)
    | [] -> [[]]
    | h::t -> let inner = subsets t (* Instantiates a new method (inner) that recursively calls subsets
                                     with the next item in the list. This helps iterate through the list. *)
  in (List.map (fun x -> h::x) inner)@inner (* We map a function (fun x -> h::x) to each item in inner and append it to inner
                                                which is passed into inner. *)


(* var_list finds all the variable names in a boolExpr and calls remove_duplicates to remove any duplicates in the lsit *)
let var_list (bexp: boolExpr) =
  let rec tr_var_list bexp acc = match bexp with
  | Const b -> remove_duplicates(acc)
  | Id s -> remove_duplicates(s::acc)
  | Nand (x1, x2) -> remove_duplicates((tr_var_list x1 acc)@(tr_var_list x2 acc)@acc)
  | And (x1, x2) -> remove_duplicates((tr_var_list x1 acc)@(tr_var_list x2 acc)@acc)
  | Or (x1, x2) -> remove_duplicates((tr_var_list x1 acc)@(tr_var_list x2 acc)@acc)
  | Not (x1) -> remove_duplicates((tr_var_list x1 acc))
  | Eq (x1,x2) -> remove_duplicates((tr_var_list x1 acc)@(tr_var_list x2 acc)@acc)
  | Xor (x1,x2) -> remove_duplicates((tr_var_list x1 acc)@(tr_var_list x2 acc)@acc)
  in tr_var_list bexp []

(* find_sat_set finds a list of variables that when set to true make the expression true *)
  let find_sat_set bexp : string list option =
    let rec tr_find_sat_set alist = match alist with
      | [] -> None
      | h::t -> if (eval_bool_exp bexp h) then Some h (* if eval_bool_exp bexp h is true then return the value that makes it true *)
                else tr_find_sat_set t (* else iterate through the list *)
    in tr_find_sat_set (List.rev(subsets (var_list bexp))) (* In order to get proper results, the subsets list result must be reversed *)


(* sat_main is essentially a copy of main but forgoes svarlist and uses a match case with output because
    result returns a string option list. It returns "Not Satisfiable" if find_sat_set returns None, otherwise
    it returns Some value. *)
let sat_main true_vars_list =
  let sExpr = String.concat " " (read_lines()) in
  let bExpr = bool_exp_of_s_exp sExpr in
  let result = find_sat_set bExpr in
  let output = match result with
  | None -> "Not Satisfiable"
  | Some s -> "Satisfied when the variables {" ^ (String.concat ", " s) ^"} are set to true."
  in print_endline output

let main true_vars_list =
  let sExpr = String.concat " " (read_lines ()) in
  let bExpr = bool_exp_of_s_exp sExpr in
  let result = eval_bool_exp bExpr true_vars_list in
  let svarlist = " when the variables {" ^ (String.concat ", " true_vars_list) ^"} are set to true." in
  let output = (if result then "True" else "False")^svarlist in
  print_endline output
