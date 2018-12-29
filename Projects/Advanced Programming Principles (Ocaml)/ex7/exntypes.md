# `exntypes.md` solutions

1. `raise`
Valid : exn -> 'a
When raise is called, it raises an exception and returns the type of the expression, 'a.


2. `exception T of string;; let strange x = raise (T x) in strange`
Valid : string -> 'a
The above code takes in an a string and when it is called, it raises an exception.


3. `Invalid_argument "Not OK?"`
Valid : exn -> string
When this is called, a new expression is created that is a string called "Not OK?".


4. `invalid_arg "OK?"`
Runtime Exception.
invalid_arg raises an exception when the conditions are met for this statement to be called. It cannot be called by itself.


5. `try String.sub "most unfortunate" (-1) 3 with | Invalid_argument _ -> (-1) | Failure _ -> (-2)`
Type Error.
String.sub returns a string, but the match cases are returning an integer.

6. `let rec list_mul = function  | [] -> 1 | 0::_ -> failwith "zero"  | h::t -> h * (list_mul t) in try list_mul [2;0;5] with Failure "zero" -> 0`
Valid: int -> 'a
The function takes in a list and returns an exception.


7. `let guard_inv x = try (1/x) with  Division_by_zero -> infinity in guard_inv`
Type Error.
The match case returns 1/x as an integer, and infinity as a float. Since they are not the same type, a type error is encountered.


8. `exception F of int;; F 7`
Valid : exn -> int
The above code takes in an exception and when it is called on 7, it returns an exception.
