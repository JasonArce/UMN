# `length (append l1 l2) = (length l1) + (length l2)`

### Property
P(l1): &forall; l2 &in; 'a list, length (append l1 l2) = (length l1) + (length l2)

### Base Case
P([]): &forall; l2 &in; 'a list, length (append [] l2) = (length []) + (length l2)
We have:
LHS
= length (l2) **[eval append]**
RHS
= 0 + length l2 **[eval length]**
= length (l2) **[simplify]**
length (l2) = length (l2) &check;

### Inductive Case
&forall; l2 &in; 'a list, P(l1) => &forall; x P(x::l1)
&forall; l1 [&forall; l2, length (append l1 l2) = (length l1) + (length l2)] => &forall; l2 [&forall; x, length (append (x::l1) l2) = (length (x::l1) + (length l2))]

#### IH:  &forall; l2 &in; 'a list, length (append l1 l2) = (length l1) + (length l2).
Prove: P(x::l1) = &forall; l2 [&forall; x, length (append (x::l1) l2) = (length (x::l1) + (length l2))]
Start:
length (append (x::l1) l2) = (length (x::l1) + (length l2))
LHS
= length (x::append l1 l2) **[eval append]**
= length (x::l1::(append l2 l3)) **[eval append]**
= length (x::l1::l2::l3::....::[]) **[continuous evaluation of append until the base case, [], is reached]**
= &sum; length (x::l1::l2::l3::....::[]) **[recognize that a summation is needed]**
= &sum; 1+length(l1::l2::l3::....::[]) **[eval length]**
= &sum; 1+1+length(l2::l3::....::[]) **[eval length]**
= &sum; 1+1+...+length ([]) **[continous eval of length]**
= &sum; 1+1+...+0 **[eval length]**
RHS
length (x::l1) + (length l2)
= 1+(length l1) + length l2 **[eval length]**
= 1+1+(length l2) **[eval length]**
= 1+1+1+....+length([]) **[eval length]**
= 1+1+1+....+0 **[eval length]**
= &sum; 1+1+1+....+0 **[recognize a summation is needed]**
&sum; 1+1+...+0 = &sum; 1+1+....+0 &check;

# `mem x (append l1 l2) = (mem x l1) || (mem x l2)`

### Property
P(x): &forall; l1 &forall; l2 &in; 'a list, mem x (append l1 l2) = (mem x l1) || (mem x l2)

### Base Case
P([]): &forall; l1 &forall; l2 &in; 'a list, mem [] (append l1 l2) = (mem [] l1) || (mem [] l2)
We have:
LHS
= false **[eval mem]**
RHS
= false || false **[eval mem]**
= false **[simplify]**
false = false &check;

### Inductive Case
&forall; l1 &forall; l2 &in; 'a list, P(x) => &forall; y, P(y::x)
&forall; x, [&forall; l1 &forall; l2, mem x (append l1 l2) = (mem x l1) || (mem x l2)] -> &forall; l1 &forall; l2 [&forall; y, mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)]

#### IH: &forall; l1 &forall; l2 &in; 'a list, mem x (append l1 l2) = (mem x l1) || (mem x l2)
Prove: P(y::x) = &forall; l1 &forall; l2 [&forall; y, mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)]
Start:
mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)
=

# `length (shift_right l) = (length l)`
### Property
P(x): &forall; l1 &forall; l2 &in; 'a list, mem x (append l1 l2) = (mem x l1) || (mem x l2)

### Base Case
P([]): &forall; l1 &forall; l2 &in; 'a list, mem [] (append l1 l2) = (mem [] l1) || (mem [] l2)
We have:
LHS
= false **[eval mem]**
RHS
= false || false **[eval mem]**
= false **[simplify]**
false = false &check;

### Inductive Case
&forall; l1 &forall; l2 &in; 'a list, P(x) => &forall; y, P(y::x)
&forall; x, [&forall; l1 &forall; l2, mem x (append l1 l2) = (mem x l1) || (mem x l2)] -> &forall; l1 &forall; l2 [&forall; y, mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)]

#### IH: &forall; l1 &forall; l2 &in; 'a list, mem x (append l1 l2) = (mem x l1) || (mem x l2)
Prove: P(y::x) = &forall; l1 &forall; l2 [&forall; y, mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)]
Start:
mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)
=


# `sum (shift_right l) = sum l`
### Property
P(x): &forall; l1 &forall; l2 &in; 'a list, mem x (append l1 l2) = (mem x l1) || (mem x l2)

### Base Case
P([]): &forall; l1 &forall; l2 &in; 'a list, mem [] (append l1 l2) = (mem [] l1) || (mem [] l2)
We have:
LHS
= false **[eval mem]**
RHS
= false || false **[eval mem]**
= false **[simplify]**
false = false &check;

### Inductive Case
&forall; l1 &forall; l2 &in; 'a list, P(x) => &forall; y, P(y::x)
&forall; x, [&forall; l1 &forall; l2, mem x (append l1 l2) = (mem x l1) || (mem x l2)] -> &forall; l1 &forall; l2 [&forall; y, mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)]

#### IH: &forall; l1 &forall; l2 &in; 'a list, mem x (append l1 l2) = (mem x l1) || (mem x l2)
Prove: P(y::x) = &forall; l1 &forall; l2 [&forall; y, mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)]
Start:
mem (y::x) (append l1 l2) = (mem (y::x) l1) || (mem (y::x) l2)
=
