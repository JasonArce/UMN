(* picky function to truncate to places decimals *)
let float_trunc places s =
  let mul = 10. ** (float_of_int places) in
  (floor (s *. mul)) /. mul

let to_meters = List.map (fun (f, i) -> float_trunc 2 (((float_of_int f) *. 0.3048) +. ((float_of_int i) /. 12. *. 0.3048)))

let rot13 s = 
 let change_character c = match c with
 | 'a'..'z' -> if((int_of_char c) + 13 > (int_of_char 'z')) 
		then char_of_int ((int_of_char 'a') + 12 - ((int_of_char 'z') - (int_of_char c)))
		else char_of_int ((int_of_char c) + 13)  
 | 'A'..'Z' -> if((int_of_char c) + 13 > (int_of_char 'Z')) 
		then char_of_int ((int_of_char 'A') + 12 - ((int_of_char 'Z') - (int_of_char c)))
		else char_of_int ((int_of_char c) + 13)  
 | _ -> c
  in String.map change_character s

let wite_out ls pos = List.mapi (fun i s -> if (i=pos) then " " else s) ls;;
