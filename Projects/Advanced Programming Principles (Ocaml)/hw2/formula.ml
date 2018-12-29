(* formula.ml - command line driver for hw2 boolExpr *)

let arglist = Array.to_list Sys.argv in match arglist with
| _::"--eval"::t -> BoolExpr.main t
| _::"--findsat"::t -> BoolExpr.sat_main () (* this case uses the sat_main function written in boolExpr.ml *)
| _::t -> BoolExpr.main t
| _ -> failwith "there's always at least one argument."
