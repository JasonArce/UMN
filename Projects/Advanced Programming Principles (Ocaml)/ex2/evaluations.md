1. fun s -> match s with (x,[]) -> x | (_,h::t) -> h
Legal
type: 'a * 'a list -> 'a = <fun>
The function gives you the first value in the list. For instance if the first 'a in the list was "a" then we would return "a".

2. let rec drip n x = match (n,x) with (0,_) -> [] | (h,t) -> drip (h-1,t) in drip

Not legal

The - operator in "h-1" cannot be used as (h,t) is a tuple, not an int.

3. match [3] with h::t -> t::5

Not legal

In the last part "t::5", the 5 is not allowed to be there. Instead of the 5, the code is looking for a list full of integers when only a single integer is given.

4. [1; 17; [1;3]]

Not legal

The list is of type integer so when it has the input of integer, integer, integer list it fails. This is because ocaml only allows lists of the same type.

5. [[]; ["hi"]; [":)"; ":("; "(o:)3"]]

Legal

This works as we have a list that is full of type "string list". If we had something like:
[["hi"];["hey"];["bye"]]
then we would have a list with 3 string lists.

6. let rec odds ls = match ls with [] -> [] | h::[] -> [h] | h::_::t -> h::(odds t) in odds [1;2;4;8]

Legal

We are returning a list with every other value in the original list. In the list above we are returning [1;4]. You can see that we are skipping every other number from the "h:: _ ::t" and then using recursion to return the "odd" integer.
