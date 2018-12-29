## `type 'a btree = Empty | Node of 'a * 'a btree  * 'a btree`

  &forall; t &in; 'a btree . P(t) if
  + P(Empty)
  + &forall; t1 &forall; t2 &forall; t3. P(t1) && P(t2) && P(t3) &rArr; P(Node(t1,t2,t3))

## `type 'a ttree = EmptyT | Leaf of 'a | TNode of 'a ttree * 'a ttree * 'a ttree`

  &forall; t &in; 'a ttree . P(t) if
  + P(EmptyT)
  + &forall; t. P(t) &rArr; P(Leaf(t))
  + &forall; t1 &forall; t2 &forall; t3. P(t1) && P(t2) && P(t3) &rArr; P(TNode(t1,t2,t3))

## `type bexpr = True | False | Var | Not of bexpr | And of bexpr * bexpr | Or of bexpr * bexpr`

  &forall; x &in; bexpr . P(x) if
  + P(True)
  + P(False)
  + P(Var)
  + &forall; x. P(x) &rArr; P(Not(x))
  + &forall; x1 &forall; x2. P(x1) && P(x2) &rArr; P(And(x1,x2))
  + &forall; x1 &forall; x2. P(x1) && P(x2) &rArr; P(Or(x1,x2))

## `type 'a nested = Nil | Cons of 'a * 'a nested | Nest of 'a nested * 'a nested`

  &forall; l &in; 'a nested . P(l) if
  + P(Nil)
  + &forall; l1 &forall; l2. P(l1) && P(l2) &rArr; P(Cons(l1,l2))
  + &forall; l1 &forall; l2. P(l1) && P(l2) &rArr; P(Nest(l1,l2))

## `type islist = End | I of int * islist | S of string * islist`

  &forall; l &in; islist . P(l) if
  + P(End)
  + &forall; l1 &forall; l2. P(l1) && P(l2) &rArr; P(I(l1,l2))
  + &forall; l1 &forall; l2. P(l1) && P(l2) &rArr; P(S(l1,l2))
