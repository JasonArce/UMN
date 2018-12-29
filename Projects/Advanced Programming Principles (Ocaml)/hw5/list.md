### I. ``length l = length (reverse l)``

#### `tail_rev Lemma`

##### `Property`
P(l): &forall; acc, tail_rev lst acc = (List.rev lst)@acc

##### `Base Case`
P([]): tail_rev [] acc = (List.rev [])@acc <br>
LHS <br>
tail_rev [] acc <br>
= acc **[eval tail_rev]** <br>
RHS <br>
(List.rev [])@acc <br>
= []@acc **[rule of List.rev]** <br>
= acc **[simplify]** <br>
acc = acc &check;

##### `Inductive Case`
&forall; lst, [&forall; acc, tail_rev lst acc = (List.rev lst)@acc] -> [&forall; x &forall; acc, tail_rev (x::lst) acc = (List.rev (x::lst) )@acc]  <br>

##### `Inductive Hypothesis`
&forall; acc, tail_rev lst acc = (List.rev lst)@acc <br>
Prove: P(x::lst) = &forall; acc [&forall; x, tail_rev (x::lst) acc = (List.rev (x::lst) )@acc]  <br>
Start:  <br>
LHS <br>
tail_rev (x::lst) acc <br>
= tail_rev lst (x::acc) **[eval tail_rev]** <br>
= tail_rev [] (lst::(x::acc)) **[eval tail_rev]** <br>
= lst::x **[eval tail_rev]** <br>
RHS <br>
(List.rev (x::lst)) @ acc <br>
= (lst::x)@acc **[eval List.rev]** <br>
= lst::x **[simplify]** <br>
lst::x = lst::x &check;

#### `Property`
P(l): length l = length (reverse l)

#### `Base Case`
P([]): length [] = length (reverse []) <br>
LHS <br>
= 0 **[eval length]** <br>
RHS <br>
= length ([]) **[eval lemma of tail_rev]** <br>
= 0 **[eval length]** <br>
0 = 0 &check; <br>

#### `Inductive Case`
&forall; l [length l = length (reverse l)] => [&forall; x, length (x::l) = length (reverse (x::l))] <br>

#### `Inductive Hypothesis`
length l = length (reverse l) <br>
Prove: P(x::l) = &forall; x [length (x::l) = length (reverse (x::l))] <br>
Start: <br>
= 1 + (length t) **[eval length]** <br>
= x + (length t) **[1 can be rewritten as x, because x is just a variable to show the list increases by 1]** <br>
= x + (length l) **[t can be rewritten as l]** <br>
= x + length (reverse l) **[By I.H.]** <br>
= length (x::(reverse l)) **[reverse eval of length]** <br>
= length (reverse (x::l)) **[reverse eval of reverse]** <br>
= length (reverse x::l) = length (reverse x::l) &check; <br>

### II. ``tail_sum l = tail_sum (reverse l)``

#### `tsum Lemma`

##### `Property`
P(lst):&forall; acc,  tsum lst acc = &sum; lst + acc

##### `Base Case`
P([]): tsum [] acc = &sum; [] + acc <br>
LHS <br>
= acc **[eval tsum]** <br>
RHS <br>
= 0 + acc **[summation of [] is 0]** <br>
= acc **[simplify]** <br>
acc = acc &check; <br>

##### `Inductive case`
&forall; lst, [&forall; acc, tsum lst acc = &sum; lst + acc] -> [&forall; acc &forall; x, tsum (x::lst) acc =  &sum; (x::lst) + acc] <br>

##### `Inductive Hypothesis`
&forall; acc, tsum lst acc = &sum; lst + acc <br>
Prove: P(x::lst) = &forall; acc [&forall; x, tsum (x::lst) acc =  &sum; (x::lst) + acc] <br>
Start: <br>
LHS <br>
tsum (x::lst) acc <br>
= tsum lst (x+acc) **[eval tsum]** <br>
= tsum [] (lst+x+acc) **[eval tsum]** <br>
= tsum [] (lst+x+0) **[rewrite because acc starts at 0]** <br>
= lst+x **[eval tsum]** <br>
RHS <br>
&sum; (x::lst) + acc <br>
= x + lst + acc **[rules of summation]** <br>
= x + lst + 0 **[rewrite because acc starts at 0]** <br>
= x + lst **[simplify]** <br>
lst + x = lst + x &check;

#### `Property`
P(l): tail_sum l = tail_sum (reverse l)

#### `Base Case`
P([]) tail_sum [] = tail_sum (reverse []) <br>
LHS <br>
= tsum [] acc **[expand tail_sum to be tsum]** <br>
= acc **[proved by tsum lemma]** <br>
RHS <br>
= tsum (tail_rev [] acc) acc **[expand reverse to be tail_rev]** <br>
= tsum ([]) acc **[proved by tail_rev lemma]** <br>
= acc **[proved by tsum lemma]** <br>
acc = acc &check;

#### `Inductive Case`
&forall; l [tail_sum l = tail_sum (reverse l)] => [&forall; x, tail_sum (x::l) = tail_sum (reverse (x::l))] <br>

#### `Inductive Hypothesis`
tail_sum l = tail_sum (reverse l) <br>
Prove: P(x::l) = &forall; x [tail_sum (x::l) = tail_sum (reverse (x::l))] <br>
Start: <br>
LHS <br>
= tsum (x::l) acc **[expand tail_sum]** <br>
= x + l **[eval lemma of tsum]** <br>
RHS <br>
= tail_sum (tail_rev (x::l) acc) **[expand reverse]** <br>
= tail_sum (l::x) **[eval lemma of tail_rev]** <br>
= tsum (l::x) **[expand tail_sum]** <br>
= l + x **[eval lemma of tsum]** <br>
= x + l **[rewrite]** <br>
x + l = x + l &check;
