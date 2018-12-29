(* OCaml file for lab 1.
   Fix the errors in this file.  *)

let zero = (-2 + 2)

let myfun x = x
let beginning s = s.[zero]
let len k = String.length k
  
let mult x y = x * y

let or3 a b c = a || b || c

let helloworld = "hello" ^ "world"

let ending s t = let last = len s - 1 in String.sub s (last - t) t  

 (* let c = beginning "" *)
	       
let () = print_string (ending "Looks like we made it!\n" 9)

let scale cs (cx, cy) = (cs*.cx, cs*.cy)

let length (dx, dy) = sqrt (dx *. dx +. dy*.dy)

let unit_vector (ex, ey) = if length(ex,ey) = 1.0 then true else false

