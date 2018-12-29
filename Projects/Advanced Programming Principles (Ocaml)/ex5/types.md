1. `any`
type: ('a -> bool) -> 'a list -> bool
The input takes a function 'a and returns a bool for p which is denoted in the match case and takes in 'a list for lst
as denoted by the match case as well. The match case also clearly shows a bool being returned.

2. `exclude`
type: ('a -> bool) -> 'a list -> 'a list
The input takes a function 'a and returns a bool for p which is denoted by the "if (p h)" and takes in 'a list for lst
as denoted by the match case. The match case also clearly shows 'a list being returned.

3. `acc2`
type: ('a -> 'b -> 'c -> 'a) -> 'a -> 'b list -> 'c list -> 'a
The input takes a function of type 'a (same as res), 'b(first item in lst1), and 'c(first item in lst2) which returns an 'a for f, res takes in an 'a, lst1 takes in 'b list, and lst2 takes in a 'c list.
The two lists (lst1 and lst2) could be different lists hence the 'b and 'c. Then the res is returned which is of type 'a.

4. `red`
type: ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
f takes in a function of type 'a and of type 'b and returns something of type 'b as seen in the lower match case, lst takes in 'a list as its typing as we do not know what type of list it is, and init is of type 'b. We know that 'b is returned because it is the same type of init.
