### ``power``

#### `Property`
P(n): &forall; x &in; float, power x n = x^n

#### `Base Case`
P(0): power x 0 <br>
= 1 **[eval power]**  <br>
1 is the base case for power. &check;

#### `Inductive Case`
&forall; n [&forall; x, power x n = x^n] -> [&forall; x, power x (n+1) = x^(n+1)] <br>

#### `Inductive Hypothesis`
&forall; x, power x n = x^n <br>
Prove: P(n+1) = &forall; x [&forall; n, power x (n+1) = x^(n+1)] <br>
Start:
power x (n+1) <br>
= x *. (power x (n+1)-1 ) **[by eval of power]** <br>
= x *. (power x n) **[simplify]** <br>
= x *. x^n **[by I.H.]** <br>
= x^(n+1) **[Definition of a power]** <br>
x^(n+1) = x^(n+1) &check;

### ``pow_nat``

#### `Property`
P(n): &forall; x &in; float, power x (to_int n) = pow_nat x n

#### `Base Case`
P(1): power x (to_int 1) <br>
= power x (1+0) **[eval to_int]** <br>
= power (1*x) 0 **[eval of power]** <br>
= 1*x **[eval of power]** <br>
1 = 1 &check;

#### `Inductive Case`
&forall; n [&forall; x, power x (to_int n) = pow_nat x n] -> [&forall; x, power x (to_int Succ n ) = pow_nat x (Succ n)] <br>

#### `Inductive Hypothesis`
&forall; x, power x (to_int n) = pow_nat x n <br>
Prove: P(Succ n) = &forall; x [&forall; n, power x (to_int Succ n) = pow_nat x (Succ n)] <br>
Start:
power x (1+to_int n) **[eval to_int]** <br>
= x *. (power x (1 - 1 + to_int n)) **[eval power]** <br>
= x *. (power x (to_int n)) **[eval simplify]** <br>
= x *. (pow_nat x n) **[by I.H]** <br>
= pow_nat x (Succ n) **[simplify and rewrite]** <br>
pow_nat x (Succ n) = pow_nat x (Succ n) &check;

### ``less_nat``

#### `Property`
P(n): &forall; m &in; nat, less_nat m n &iff; (to_int m) < (to_int n)

#### `Base Case`
P(Zero): less_nat m (Zero) &iff; (to_int m) < (to_int Zero) <br>
LHS <br>
= false **[eval less_nat]** <br>
RHS <br>
= to_int m < 0 **[eval to_int]** <br>
= false **[m cannot be less than 0]** <br>
false &iff; false **[combine]** <br>
= true **[false = false implies true]** <br>

#### `Inductive Case`
&forall; n [&forall; m, less_nat m n &iff; (to_int m) < (to_int n)] => [&forall; m, less_nat m (Succ n) &iff; (to_int m) < (to_int (Succ n))] <br>

#### `Inductive Hypothesis`
&forall; m, less_nat m n &iff; (to_int m) < (to_int n) <br>
Prove: P(Succ n) = &forall; n, less_nat m (Succ n) &iff; (to_int m) < (Succ n) <br>
Start:
LHS
less_nat m (Succ n) <br>
= less_nat m ((Succ n)-1) **[eval less_nat]** <br>
= less_nat m n **[simplify]** <br>
= less_nat m n = less_nat m n <br>
= true &check; <br>
RHS
(to_int m) < (to_int (Succ n)) <br>
= true **[Property of arithmetic. If m < n, then m < n+1]** <br>
= true &iff; true **[combine]** <br>
= true &check;
