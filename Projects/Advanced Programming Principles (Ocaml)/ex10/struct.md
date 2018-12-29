# `size t = size (mirror t)`

### Property
P(t): size t = size (mirror t)

### Base Case
P(Empty): size Empty = size (mirror Empty)
LHS
size Empty
= 0 **[eval size]**
RHS
size (mirror Empty)
= size (Empty) **[mirror]**
= 0 **[eval size]**
0 = 0 &check;

### Inductive Case
&forall; t1 &forall; t2 (P(t1) and P(t2)) => &forall; v, P(Node(v, t1,t2))
&forall; t1 &forall; t2 [&forall; t, size t = size (mirror t)] -> [&forall; v, size Node(v,t1,t2) = size (mirror (Node(v,t1,t2)))]

####IH: size t = size (mirror t)
&forall; t, size t = size (mirror t)
Prove: &forall; v, size Node(v,t1,t2) = size (mirror (Node(v,t1,t2)))
Start:
size (Node(v,t1,t2))
= 1 + (size lt) + (size rt) **[eval size]**
= 1 + size (mirror lt) + size (mirror rt) **[by IH]**
= size(Node(v, mirror lt, mirror rt)) **[reverse eval size]**
= size(mirror(v, lt, rt))**[reverse eval mirror]**
size(mirror(v, lt, rt)) = size(mirror(v, lt, rt)) &check;


# `stree t v = stree (mirror t) v`

### Property
&forall; nl, nmem x nl = mem x (flatten nl)

### Base Case
P(Nil):  &forall; nl, nmem x Nil = mem x (flatten Nil)
LHS
nmem x Nil
= false **[eval nmem]**
RHS
mem x (flatten Nil)
= mem x ([]) **[eval flatten]**
= false **[eval mem]**
false = false &check;

###Inductive Case(s)
&forall; nl1 &forall; nl2 &in; 'a nested, (P(nl1) and P(nl2)) => P(Cons(nl1,nl2))
&forall; nl1 &forall; nl2 [&forall; nl, nmem x nl - mem x (flatten nl)] -> [nmem x Cons(nl1, nl2) = mem x (flatten (Cons(nl1,nl2)))]

&forall; nl1 &forall; nl2 &in; 'a nested, (P(nl1) and P(nl2)) => P(Nest(nl1,nl2))
&forall; nl1 &forall; nl2 [&forall; nl, nmem x nl = mem x (flatten nl)] -> [nmem x Cons(nl1, nl2) = mem x (flatten (Nest(nl1,nl2)))]

####IH: nl, nmem x nl = mem x (flatten nl)
&forall; nl, nmem x nl = mem x (flatten nl)
Prove: nmem x Cons(nl1, nl2) = mem x (flatten (Cons(nl1,nl2)))
Start:
nmem x Cons(nl1, nl2)
= ((nl1 = x) || (nmem x nl2)) **[eval nmem]**
= ((nl1 = x) || (mem x (flatten nl2))) **[by IH]**
= mem x (flatten (Cons(nl1,nl2))) **[reverse eval mem]**

&forall; nl, nmem x nl = mem x (flatten nl)
Prove: nmem x Nest(nl1, nl2) = mem x (flatten (Nest(nl1,nl2)))
Start:
nmem x Nest(nl1,nl2)
= (nmem x nl1) || (nmem x nl2) **[eval nmem]**
= mem x (flatten nl1) || mem x (flatten nl2) **[by IH]**
= mem x ((flatten nl1)@(flatten nl2)) **[property of a list]**
= mem x (flatten(Nest(nl1,nl2))) **[reverse eval flatten]**


# `eval bx = Maybe` &rArr; `has_var bx = true`

### Property
&forall; nl, nmem x nl = mem x (flatten nl)

### Base Case
P(Nil):  &forall; nl, nmem x Nil = mem x (flatten Nil)
LHS
nmem x Nil
= false **[eval nmem]**
RHS
mem x (flatten Nil)
= mem x ([]) **[eval flatten]**
= false **[eval mem]**
false = false &check;

###Inductive Case(s)
&forall; nl1 &forall; nl2 &in; 'a nested, (P(nl1) and P(nl2)) => P(Cons(nl1,nl2))
&forall; nl1 &forall; nl2 [&forall; nl, nmem x nl - mem x (flatten nl)] -> [nmem x Cons(nl1, nl2) = mem x (flatten (Cons(nl1,nl2)))]

&forall; nl1 &forall; nl2 &in; 'a nested, (P(nl1) and P(nl2)) => P(Nest(nl1,nl2))
&forall; nl1 &forall; nl2 [&forall; nl, nmem x nl = mem x (flatten nl)] -> [nmem x Cons(nl1, nl2) = mem x (flatten (Nest(nl1,nl2)))]

####IH: nl, nmem x nl = mem x (flatten nl)
&forall; nl, nmem x nl = mem x (flatten nl)
Prove: nmem x Cons(nl1, nl2) = mem x (flatten (Cons(nl1,nl2)))
Start:
nmem x Cons(nl1, nl2)
= ((nl1 = x) || (nmem x nl2)) **[eval nmem]**
= ((nl1 = x) || (mem x (flatten nl2))) **[by IH]**
= mem x (flatten (Cons(nl1,nl2))) **[reverse eval mem]**

&forall; nl, nmem x nl = mem x (flatten nl)
Prove: nmem x Nest(nl1, nl2) = mem x (flatten (Nest(nl1,nl2)))
Start:
nmem x Nest(nl1,nl2)
= (nmem x nl1) || (nmem x nl2) **[eval nmem]**
= mem x (flatten nl1) || mem x (flatten nl2) **[by IH]**
= mem x ((flatten nl1)@(flatten nl2)) **[property of a list]**
= mem x (flatten(Nest(nl1,nl2))) **[reverse eval flatten]**


# `nmem x nl = mem x (flatten nl)`

### Property
&forall; nl, nmem x nl = mem x (flatten nl)

### Base Case
P(Nil):  &forall; nl, nmem x Nil = mem x (flatten Nil)
LHS
nmem x Nil
= false **[eval nmem]**
RHS
mem x (flatten Nil)
= mem x ([]) **[eval flatten]**
= false **[eval mem]**
false = false &check;

###Inductive Case(s)
&forall; nl1 &forall; nl2 &in; 'a nested, (P(nl1) and P(nl2)) => P(Cons(nl1,nl2))
&forall; nl1 &forall; nl2 [&forall; nl, nmem x nl - mem x (flatten nl)] -> [nmem x Cons(nl1, nl2) = mem x (flatten (Cons(nl1,nl2)))]

&forall; nl1 &forall; nl2 &in; 'a nested, (P(nl1) and P(nl2)) => P(Nest(nl1,nl2))
&forall; nl1 &forall; nl2 [&forall; nl, nmem x nl = mem x (flatten nl)] -> [nmem x Cons(nl1, nl2) = mem x (flatten (Nest(nl1,nl2)))]

####IH: nl, nmem x nl = mem x (flatten nl)
&forall; nl, nmem x nl = mem x (flatten nl)
Prove: nmem x Cons(nl1, nl2) = mem x (flatten (Cons(nl1,nl2)))
Start:
nmem x Cons(nl1, nl2)
= ((nl1 = x) || (nmem x nl2)) **[eval nmem]**
= ((nl1 = x) || (mem x (flatten nl2))) **[by IH]**
= mem x (flatten (Cons(nl1,nl2))) **[reverse eval mem]**

&forall; nl, nmem x nl = mem x (flatten nl)
Prove: nmem x Nest(nl1, nl2) = mem x (flatten (Nest(nl1,nl2)))
Start:
nmem x Nest(nl1,nl2)
= (nmem x nl1) || (nmem x nl2) **[eval nmem]**
= mem x (flatten nl1) || mem x (flatten nl2) **[by IH]**
= mem x ((flatten nl1)@(flatten nl2)) **[property of a list]**
= mem x (flatten(Nest(nl1,nl2))) **[reverse eval flatten]**
