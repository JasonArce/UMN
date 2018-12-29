### I. ``deg (compose p1 p2) = (deg p1)*(deg p2)``

#### `Property`
P(p1): &forall; p2 &in; polyExpr, deg (compose p1 p2) = (deg p1) * (deg p2)

#### `Base Case(s)`
We have 2 base cases:<br>
P(Int _ ): deg (compose (Int _ p2 ) = (deg (Int _ )) * (deg p2)<br>
P( x ): deg (compose x p2 ) = (deg x) * (deg p2)<br>

P(Int _ ):
LHS<br>
deg (compose (Int _ ) p2)<br>
= deg (Int _ ) **[eval compose]**<br>
= 0 **[eval deg]**<br>
RHS<br>
(deg (Int _ )) * (deg p2)<br>
= 0 * (deg p2) **[eval deg]**<br>
= 0 **[arithmetic]**<br>
0 = 0 &check;<br>

P(X):<br>
LHS<br>
deg (compose (x) p2)<br>
= deg p2 **[eval compose]**<br>
RHS<br>
(deg x) * (deg p2)<br>
= 1 * deg p2 **[eval deg]**<br>
= deg p2 **[simplify]**<br>
deg p2 = deg p2 &cehck;<br>

#### `Inductive case(s)`
&forall; p1 [&forall; p2, deg(compose p1 p2) = deg(p1) * deg(p2)] -> [&forall; p2 &forall; e1 &forall; e2, deg(compose (Add(e1,e2)) p2) = deg (Add(e1,e2) * (deg p2))]<br>

&forall; p1 [&forall; p2, deg(compose p1 p2) = deg(p1) * deg(p2)] -> [&forall; p2 &forall; e1 &forall; e2, deg(compose (Mul(e1,e2)) p2) = deg (Mul(e1,e2) * (deg p2))]<br>

#### `Inductive Hypothesis`
&forall; p2, deg(compose p1 p2) = deg(p1) * deg(p2) <br>
Prove: P(Add(e1,e2)) = [&forall; p1, deg(compose (Add(e1,e2)) p2) = deg (Add(e1,e2) * (deg p2))<br>
Start:<br>
deg (compose (Add(e1,e2)) p2)<br>
= deg( Add(compose e1 p2, compose e2 p2)) **[eval compose]**<br>
= max (deg(compose e1 p2)) (deg(compose e1 p2)) **[eval deg]**<br>
= max (((deg e1) * (deg p2)) ((deg e2) * (deg p2))) **[By I.H.]**<br>
= max ( deg p2 ((deg e1) * (deg e2))) **[Factoring]**<br>
= max ((deg e1) * (deg e2)) * (deg p2) **[Rules of multiplication]**<br>
= deg (Add (e1, e2)) * (deg p2) **[Reverse eval deg]**<br>
deg (Add (e1, e2)) * (deg p2) = deg (Add (e1, e2)) * (deg p2) &check;<br>

&forall; p2, deg(compose p1 p2) = deg(p1) * deg(p2) <br>
Prove: P(Mul(e1,e2)) = [&forall; p1, deg(compose (Mul(e1,e2)) p2) = deg (Mul(e1,e2) * (deg p2))<br>
Start:<br>
deg (compose (Mul(e1,e2)) p2)<br>
= deg (Mul(compose e1 p2, compose e2 p2)) **[eval compose]**<br>
= deg (compose e1 p2) + deg(compose e2 p2) **[eval deg]**<br>
= (deg e1) * (deg p2) + (deg e2) * (deg p2) **[By I.H.]**<br>
= (deg p2) * ((deg e1) + (deg e2)) **[Factoring]**<br>
= (deg p2) * deg(Mul(e1,e2)) **[Reverse eval deg]**<br>
(deg p2) * deg(Mul(e1,e2)) = (deg p2) * deg(Mul(e1,e2)) &check;<br>

### II. ``deg (simplify p) <= deg p``

#### `Property`
P(p): deg (simplify p) <= deg p

#### `Base Case(s)`
We have two base cases:<br>
P(Int _ ): deg(simplify (Int _ )) <= deg (Int _ )<br>
P( x ): deg(simplify x ) <= deg x<br>

P(Int _ ):<br>
LHS<br>
deg(simplify (Int _ ))<br>
= deg (Int _ ) **[eval simplify]**<br>
= 0 **[eval deg]**<br>
RHS<br>
deg (Int _ )<br>
= 0 **[eval deg]**<br>
0 = 0 &check;<br>

P( x ):<br>
LHS<br>
deg (simplify x)<br>
= deg x **[eval simplify]**<br>
= 1 **[eval deg]**<br>
RHS<br>
deg x<br>
= 1 **[eval deg]**<br>
1 = 1 &check;<br>

#### `Inductive Case(s)`
&forall; p, [deg(simplify p) <= deg p] -> [&forall; p1 &forall; p2, deg(simplify(Add(p1,p2))) <= deg Add(p1,p2)]<br>

&forall; p, [deg(simplify p) <= deg p] -> [&forall; p1 &foralll; p2, deg(simplify(Mul(p1,p2))) <= deg Mul(p1,p2)]<br>

#### `Inductive Hypothesis`
deg(simplify p) <= deg p <br>
Prove P(Add(p1,p2)): [&forall; p, deg(simplify(Add(p1,p2))) <= deg Add(p1,p2)]<br>
Start:<br>
deg(simplify p) <= deg p<br>
= deg (simplify (Add(p1,p2))) **[eval simplify]**<br>
= deg(simp_add(simplify p1, simplify p2)) **[eval simplify]**<br>

For the case that (simplify p1,simplify p2) = (Int 0, p) then:<br>
LHS<br>
= deg p **[eval simp_add]**<br>
RHS<br>
= deg (Add(Int 0, p)) **[substitution]**<br>
= max (deg Int 0) (deg p) **[eval deg]**<br>
= max 0 (deg p) **[eval deg]**<br>
= deg p **[p is always greater than 0]**<br>
deg p <= deg p &check;<br>

For the case that (simplify p1,simplify p2) = (p, Int 0) then:<br>
LHS<br>
= deg p **[eval simp_add]**<br>
RHS<br>
= deg (Add(p, Int 0)) **[substitution]**<br>
= max (deg p) (deg Int 0) **[eval deg]**<br>
= max (deg p) 0 **[eval deg]**<br>
= deg p **[p is always greater than 0]**<br>
deg p <= deg p &check;<br>

For the case that (simplify p1, simplify p2) = (Int i1, Int i2) then:<br>
LHS<br>
= deg (Int (i1+i2)) **[eval simp_add]**<br>
= deg (Int i3) **[simplify]**<br>
= 0 **[eval deg]**<br>
RHS<br>
= deg (Add(Int i1, Int i2)) **[substitution]**<br>
= max (deg (Int i1)) (deg Int i2)) **[eval deg]**<br>
= max (0) (0) **[eval deg]**<br>
= 0 **[eval max]**<br>
0 <= 0 &check;<br>

For the case that (simplify p1, simplify p2) = (p1, p2) then:<br>
= deg (Add(p1,p2)) **[eval simp_add]**<br>
deg (Add(p1,p2)) <= deg (Add(p1,p2)) &check;<br>

deg(simplify p) <= deg p <br>
Prove P(Mul(p1,p2)): [&forall; p, deg(simplify(Mul(p1,p2))) <= deg Mul(p1,p2)]<br>
Start:<br>
deg(simplify p) <= deg p<br>
= deg (simplify (Mul(p1,p2))) **[eval simplify]**<br>
= deg(simp_mul(simplify p1, simplify p2)) **[eval simplify]**<br>

For the case that (simplify p1,simplify p2) = (Int 0, _ ) then:<br>
LHS<br>
= deg Int 0 **[eval simp_mul]**<br>
= 0 **[eval deg]**<br>
RHS<br>
= deg (Mul(Int 0, _ )) **[substitution]**<br>
= (deg Int 0) + (deg p) **[eval deg]**<br>
= 0 + deg p **[eval deg]**<br>
0 <= (deg p) &check;<br>

For the case that (simplify p1,simplify p2) = (_ , Int 0) then:<br>
LHS<br>
= deg Int 0 **[eval simp_mul]**<br>
= 0 **[eval deg]**<br>
RHS<br>
= deg (Mul(_ , Int -)) **[substitution]**<br>
= (deg _ ) + (deg Int 0) **[eval deg]**<br>
= (deg _ ) + 0 **[eval deg]**<br>
0 <= (deg _ ) &check;<br>

For the case that (simplify p1, simplify p2) = (Int i1, Int i2) then:<br>
LHS<br>
= deg (Int (i1*i2)) **[eval simp_mul]**<br>
= deg (Int i3) **[simplify]**<br>
= 0 **[eval deg]**<br>
RHS<br>
= deg (Mul(Int i1, Int i2)) **[substitution]**<br>
= (deg (Int i1)) + (deg Int i2)) **[eval deg]**<br>
= 0 + 0 **[eval deg]**<br>
0 <= 0 &check;<br>

For the case that (simplify p1, simplify p2) = (p1, p2) then:<br>
= deg (Mul(p1,p2)) **[eval simp_mul]**<br>
deg (Mul(p1,p2)) <= deg (Mul(p1,p2)) &check;<br>
