1. 3 - 2 + 4
Legal
type: int
value: 5

2. 3.14 * 6 * 6
Not legal
The * operator has type int -> int -> int but 3.14 has type float.

3. if 1 then 3 else 4
Not legal
The "if" expression needs to evalue a boolean but has type int.

4. if 1 > 0 then 1 else "no"
Not legal
The "then/else" expression expects to have matching data types but int and string were found, this does not work.

5. let x = 42 in 42 + y
Not legal
The "y" is has no value as it is unbound. Therefore a result cannot be reached.

6. let circ d = 3.14 *. d in circ 4
Not legal
The "4" is an int, while a float was expected. A float and an int cannot be multiplied together with the * operator.

7. let circ d = 3.14 *. d in circ, 4.0
Legal
type: float
value: (fun, 4.)

8. let x = 2 in let y = x + 3 in let x = y + x in x
Legal
type: int
value: 7

9. let z z = z ^ "z" in z "cheez"
Legal
type: string
value: "cheezz"

10. let x = "one" in let y = 1,x in let x = 2 in y+x
Not legal
The * operator has type int -> int but "one" has type string. Therefore, a value cannot be reached as the * operator cannot handle int -> string.
