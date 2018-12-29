# Lab 10 Solutions

## List induction

## Polynomials

### Property
P(p1): deg p1 = deg (simplify p1)

### Base Case(s)
P(Int _): deg (Int _) = deg (simplify (Int _))
LHS
= 0 **[eval deg]**
RHS
= deg (Int _) **[eval simplify]**
= 0 **[eval deg]**
0 = 0 &check;

P( X ): deg x = deg (simplify x)
LHS
= 1 **[eval deg]**
RHS
= deg (x) **[eval simplify]**
= 1 **[eval deg]**
1 = 1 &check;

### Inductive Case
&forall; p1 [deg p1 = deg (simplify p1)] -> [&forall; e1 &forall; e2, deg (Add(e1,e2)) = deg (simplify (Add(e1,e2))]<br>

&forall; p1 [deg p1 = deg (simplify p1)] -> [&forall; e1 &forall; e2, deg (Mul(e1,e2)) = deg (simplify (Mul(e1,e2))]<br>

### Inductive Hypothesis
deg p1 = deg (simplify p1)<br>

Prove this ish<br>
start:<br>
  deg (Add(e1,e2)) = deg (simplify (Add(e1,e2))<br>
  = max (deg e1) (deg e2) **[eval deg]**<br>
  = max (deg (simplify e1)) (deg (simplify e2)) **[By I.H.]**<br>
  = deg (Add((simplify e1),(simplify e2))) **[reverse eval deg]**<br>
  = deg (simplify (Add(e1,e2))) **[reverse eval simplify]**<br>
  deg (simplify (Add(e1,e2))) = deg (simplify (Add(e1,e2))) &check;<br>
  
 Another one:
   deg (Mul(e1,e2)) = deg (simplify (Mul(e1,e2))<br>
   = (deg e1) + (deg e2) **[eval deg]**<br>
   = (deg (simplify e1)) + (deg (simplify e2)) **[by IH]**<br>
   = deg (Mul(simplify e1, simplify e2)) **[reverse eval deg]**<br>
   = deg (simplify (Mul(e1,e2))) **[reverse eval simplify]**<br>
   deg (simplify (Mul(e1,e2))) = deg (simplify (Mul(e1,e2))) &check;<br>
