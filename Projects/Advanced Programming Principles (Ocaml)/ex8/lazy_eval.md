1. `take 2 (squares 3)`
Normal Form
[9; 16]
The argument to take decreases in each evaluation until it reaches 0, at which point we don't need to evaluate any further terms of (squares 3)

2. `fold_right (&&) (map ((<) 0) (squares 2)) true`
Never
Every element of (squares 2) is positive, so every term of the map will evaluate to "true" and we'll reach [].

3. `fold_right (||) (map (fun n -> n mod 3 = 0) (factorials ())) false`
Normal Form
true
The function is prevented from going infinite because the mapping function will return 3 which makes the function false so it stops.

4. `take (sum_list (squares 1)) (factorials ())`
Never
sum_list does not decrement squares, so it goes on infinitely.

5. `take 1 (reverse (squares 2))`
Never
Reverse does not finish evaluating (squares 2) properly, so the take 1 is never executed.

6. `fold_right (+) (take 1 (factorials ())) 0`
Normal Form
1
Take 1 takes the fist factorial which is 1, and adds it to 0.

7. `(fun x -> if false then x else ()) (flip 0 0)`
Normal Form
0 0
The function is executed once, and flip 0 0 is performed which results in 0 0.
