## Types Review

1. `raise 3`
    Type: Error
    Explanation: You can't raise an int, you have to raise an exception.

2. `try float_of_int (3/0) with _ -> infinity`
    Type: float
    Explanation: Infinity is a float and will always be returned.

3. `let rec any p = function [] -> [] | h::t -> (p h) || (any p t) in any`
    Type: Error
    Explanation: any takes in a list, not a function.

4. `let rec flip x y = flip y x in (flip 2)`
    Type: int -> 'a
    Explanation: It takes in two parameters 'a and 'b and returns the values flipped

5. `let rec mop b f = function [] -> [] | h::t -> if b then ((f h)::(mop false f t)) else (mop true f t) in mop`
    Type: bool -> ('a -> 'b ) -> 'a list -> 'b list
    Explanation: b is a boolean and f is a function that takes in something of 'a and returns a 'b. You match with a list of type 'a. And return a list of 'b that is the result of the the function that gets cons'd together.

6. `let rec pam f = function [] -> [] | h::t -> (pam f t)::(f h) in pam`
    Type: Error
    Explanation: Cannot cons a function onto a function.

7. `let rec dlof f = function [] -> f None None | h::t -> f (Some h) (Some (dlof f t)) in dlof`
    Type: ('a option -> 'b option -> 'b) -> 'a list -> 'b
    Explanation: f is a function. You apply two option types to it, this returns a 'b. You match with a 'a list. And it returns a 'b.

8. `try (Invalid_argument "3") with _ -> Not_found`
    Type: exn
    Explanation: Not_found is an exception
