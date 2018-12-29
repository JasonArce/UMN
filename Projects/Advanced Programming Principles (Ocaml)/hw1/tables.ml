(* tables.ml - CSci 2041 HW 1 table slicer and dicer *)
(* Jason Arce *)

(* Free functions, don't question! *)
(* read std input to eof, return list of lines *)
let read_lines () : string list =
  let rec read_help acc =
    try read_help ((read_line ())::acc) with End_of_file -> List.rev acc
  in read_help []

(* separate a string by delim into a list, trimming surrounding whitespace *)
let make_row delim str =
  let rec trim_strings ls acc = match ls with
  | [] -> List.rev acc
  | h::t -> trim_strings t ((String.trim h)::acc) in
  trim_strings (Str.split (Str.regexp delim) str) []

(* print a list of strings to std output, separated by delim string *)
(* avoids nasty quadratic concatenation behavior *)
let rec write_row r delim = match r with
| [] -> ()
| h::[] -> print_endline h
| h::t -> let () = print_string h in
          let () = print_string delim in write_row t delim

(* Output table using write_row, note let () = ... idiom *)
let rec output_table od t = match t with
| [] -> ()
| r::rs -> let () = write_row r od in output_table od rs

(* Gets the column in the list *)
let get_col lst = match lst with
  | (x,y,z) -> y;;

(* Increments the column by 1 *)
let increment_col lst = match lst with
  | (x,y,z) -> (x,y+1,z);;

(* Increments the column by 2 *)
let increment2_col lst = match lst with
  | (x,y,z) -> (x,y+2,z);;

(* Sets the column to 1 *)
let set_col1 lst = match lst with
  | (x,y,z) -> (x,1,z);;

(* Increments the row by 1 *)
let increment_row lst = match lst with
  | (x,y,z) -> (x+1,y,z);;

(* Increments the row by 2 *)
let increment_row2 lst = match lst with
  | (x,y,z) -> (x+2,y,z);;

(* Sets the row to 1 *)
let set_row1 lst = match lst with
  | (x,y,z) -> (1,y,z);;

(* Get First triple *)
let get_first x = match x with
| [(x,y,z);_] -> (x,y,z)

(* Get First int *)
let get_first_int x = match x with
| h::t -> h

(* Gets the row in the list *)
let get_row lst = match lst with
  | (x,y,z) -> x;;

(* Gets character in triple *)
let get_character a = match a with
| x,y,z -> z;;

(* Sets the column to a number num *)
let set_col lst num = match lst with
| (x,y,z) -> (x,num,z);;

(* Sets the row to a number num *)
let set_row lst num = match lst with
| (x,y,z) -> (num,y,z);;

(* swap_row_col swaps the row and column of the list *)
	let swap_row_col lst = match lst with
 		 | (x,y,z) -> (y,x,z)


(* Removes an element in the list *)
	let remove_elt element lst =
 	 let rec tr_remove_elt lst acc = match lst with  (* tail recursion adds all elements but the one we do not want to the accumulator and returns it once the list has been iterated through *)
   	 | [] -> List.rev acc
   	 | h::t when element = h -> tr_remove_elt t acc
   	 | h::t -> tr_remove_elt t (h::acc)
  	in tr_remove_elt lst []

(* Removes duplicates in a list*)
	let remove_duplicates lst =
 	 let rec tr_remove_duplicates lst acc = match lst with  (* tail recursion adds one of each from the list to the accumulator and returns it once the list has been iterated through *)
 	   | [] -> List.rev acc
 	   | h :: t -> tr_remove_duplicates (remove_elt h t) (h::acc)
 	 in tr_remove_duplicates lst []





(* Now your turn. *)

(* translate a list of rows in string form into a list of *)
(* lists of string entries *)
let make_row delim str =
  let rec trim_strings ls acc = match ls with		(* function uses the make_row method provided earlier *)
  | [] -> List.rev acc
  | h::t -> trim_strings t ((String.trim h)::acc) in
  trim_strings (Str.split (Str.regexp delim) str) [];;

let rec table_of_stringlist delim rlist = match rlist with (* we use the make_row method with the given delimiter and list and the make_row will split them into separator lists if the delimiter is found *)
	| [] -> []
        | h::t -> (make_row delim h)::(table_of_stringlist delim t);;


(* translate a string list list into associative form, i.e. *)
(* a list of (row, column, entry) triples *)

let rec rt_make_inner a b res lst = match (a,b,res, lst) with (* rt_make_inner builds the columns for each pair list and adds them to an accumulator *)
	| (_,_,_,[]) -> res
	|(a,b,_,h1::t1) -> rt_make_inner a (b+1) ((a,b,h1)::res) t1
let rec make_assoc rc_lst =						(* make_assoc builds the rows for each pair lists and then recursively creates the columns through rt_make_inner. Finally 									   it adds the final products to a larger list accumulator called res after rt_make_inner is called. *)
	let rec rt_make_assoc a b res lst = match (a,b,res, lst) with
	| (_,_,_,[]) -> res
	| (a,b,_,h2::t2) -> rt_make_assoc (a+1) b ((rt_make_inner a b [] h2)@res) t2
	in rt_make_assoc 1 1 [] rc_lst;;


(* remap the columns of the associative form so that the first column number in clst *)
(* is column 1, the second column 2, ..., and any column not in clst doesn't appear *)


 let rec loop header alst index =
	let rec rt_loop header alst index res = match alst with (* rt_loop takes in the first value in clst, along with alst which it iterates through and ups these value for the index number (the number 									of times loop has been called) if it matches the triple’s col. Then it adds any values that match to the accumulator and returns it. *)
		| [] -> (res)
		| h::t -> if header = (get_col h) then (rt_loop header t index ((set_col h index)::res) ) else (rt_loop header t index res)
	in rt_loop header alst index [];;

let rec remap_columns clst alst =
	let rec rt_remap_columns clst alst index acc = match clst with (* rt_remap_columns takes in two lists and ups the index each time rt_remap_columns is recursively called. Then it calls loop and 										adds any matching values and their subsequent new values to the accumulator. *)
		| [] -> List.rev acc
		| h::t ->  rt_remap_columns t alst (index+1) ((loop (h) alst (index))@acc)
	in rt_remap_columns clst alst 1 [];;

		


(* remap the rows of the associative form so that the first row number in rlst *)
(* is row 1, the second is row 2, ..., and any row not in rlist doesn't appear *)



 let rec loopr header alst index =
	let rec rt_loopr header alst index res = match alst with (* rt_loopr takes in the first value in clst, along with alst which it iterates through and ups these value for the index number (the 									number 	of times loop has been called) if it matches the triple’s row. Then it adds any values that match to the accumulator and returns 									it. *)
		| [] -> res
		| h::t -> if header = (get_row h) then (rt_loopr header t index ((set_row h index)::res) ) else (rt_loopr header t index res)
	in rt_loopr header alst index [];;

let rec remap_rows rlst alst =
	let rec rt_remap_rows rlst alst index acc = match rlst with (* rt_remap_rows takes in two lists and ups the index each time rt_remap_rows is recursively called. Then it calls loopr and adds any matching 										values and their subsequent new values to the accumulator. *)
		| [] -> List.rev acc
		| h::t ->  rt_remap_rows t alst (index+1) ((loopr (h) alst (index) )@acc)
	in rt_remap_rows rlst alst 1 [];;

(* transpose table works on the associative form *)

	let rec transpose_table alst =
		let rec tr_transpose_table alst acc = match alst with	(* tr_transpose table flips the rows and columns for each triple and adds them to an accumulator *)
			| [ ] -> acc
			| h::t -> tr_transpose_table t ((swap_row_col h) ::acc)
		in tr_transpose_table alst [];;



(* here's a tricky one! *)

	let rec r_match alst index acc = match alst with	(* r_match checks for a match between the current index being passed in and the row of the triple. A match means that the triple will have its 								character value added to the accumulator. Any duplicates in the smaller lists are removed at this point with remove_duplicates *)
		| [] -> remove_duplicates (List.sort compare (acc))
		| h::t -> if (get_row h) = index then (r_match t index ((get_character h)::acc) ) else (r_match t index acc)

	let table_of_assoc alst = 				(* table_of_assoc ups the index each time its called so it can create lists that hold the character values of each row. In my code an empty 								list is added to the final product so remove_elt is called to remove it. *)
		let rec tr_table_of_assoc alst index res = match alst with
		| [] -> remove_elt [] (List.rev res)
		| h::t -> tr_table_of_assoc (t) (index+1) ((r_match (alst) (index+1) [])::res)
		in tr_table_of_assoc (List.sort compare (alst)) 0 []



let main transpose clst rlst id od =
  let sl = read_lines () in
  let rtable = table_of_stringlist id sl in
  let alist = make_assoc rtable in
  let clist = if clst = [] then alist else (remap_columns clst alist) in
  let rlist = if rlst = [] then clist else (remap_rows rlst clist) in
  let tlist = if transpose then transpose_table rlist else rlist in
  let ntable = table_of_assoc tlist in
  output_table od ntable
