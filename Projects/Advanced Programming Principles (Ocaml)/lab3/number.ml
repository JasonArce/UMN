type number = Integer of int | Float of float 

let z1 = Integer 7

let z2 = Integer 10

let r1 = Float 2.1

let r2 = Float 6.2

let to_int = function
| Integer i -> Some i
| _ -> None 

let to_float = function
| Float x -> Some x
| _ -> None

let float_of_number = function
| Integer i -> float_of_int i 
| Float f -> f

let (+?) (x1:number) (x2:number) = match (x1,x2) with
| (Integer x, Integer y) -> Integer(x + y)
| (x, y) -> Float (float_of_number x +. float_of_number y)
