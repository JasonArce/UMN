# `rfact`

### Property
P(_n_): `rfact `_n_ = 0

### Base Case
P(0): `rfact 0` = 0 **[eval of `rfact`]**, &check;

### Inductive Case
&forall; _n_ . `rfact `_n_ = 0 &rArr; `rfact (`_n_` + 1)` = 0

#### IH: `rfact `_n_ = 0.
We need to prove that `rfact (`_n_` + 1)` = 0.  We have:
`rfact (`_n_` + 1)` = `(`_n_`+1) * (rfact `_n_`)` **[eval of `rfact`]**
= `(`_n_` + 1) * ` 0 **[by IH]**
= 0, &check;

# `tr_fact`

### Property
P(_n_): `tr_fact` _n_  _acc_= _n_ * _acc_

### Base Case
P(1): `tr_fact` 1 _acc_ = `tr_fact` 0 1 * _acc_ **[by evaluation of `tr_fact`]**
= 1 * _acc_  **[eval of tr_fact]**, &check;

### Inductive Case
&forall; _n_ . `tr_fact` _n_ -> `tr_fact` _n_ + 1

#### IH: &forall; _n_. &forall; _a_ `tr_fact` _n_ _acc_ = _n_ * _acc_
We need to prove that `tr_fact (`_n_` + 1)` = &forall; _acc_ . `tr_fact (n+1)` _acc_  We have:
`tr_fact (`_n_` + 1)` _acc_ = `tr_fact` `(`_n_`+1)-1` ``((n+1) * acc)`` **[eval of `tr_fact`]**
=  `tr_fact` _n_ `((n+1) * acc)` **[simplification]**
= 0, &check;

# `tr_nat`

### Property
P(_n_ `,` _m_): `tr_nat` _n_  _m_= `to_int ` _m_

### Base Case
P(0 `,` `Zero`): `tr_nat` 1 `Zero`
`tr_nat` 0 `Zero` = 0 **[eval of tr_nat]**
= `to_int` Zero - 0  **[eval of tr_int]**, &check;

### Inductive Case
&forall; _m_ . `tr_nat` _m_ -> `Succ` _n_

#### IH: &forall; _n_. &forall; _m_ `tr_nat` _n_ _m_ = `to_int m`
We need to prove that `tr_nat` _n_ `Succ m` = `to_int (Succ m)`  We have:
`tr_nat` _n_ `Succ m` = `to_int (Succ m)`
= `tr_nat` _n_ _m_ = `to_int (m)` **[reversal of tr_nat]** &check;

# `pow2_nat`

### Property
P(_n_): `pow2_nat` _n_  = `pow2 (to_int n)` _a_

### Base Case
P(0): `pow2_nat Zero` = `pow2 (to_int n)` _a_`+ 1`
`pow2_nat Zero` = 1 **[eval of pow2_nat]**
`pow2 (to_int Zero)` _a_ = `pow2 0` _a_ **[eval of `to_int`]**
`pow2 0` _a_ = _a_ **[eval of pow2]**
_a_ = 1, &check;

### Inductive Case
&forall; _n_ . `tr_fact` _n_ -> `tr_fact` _n_ + 1

#### IH: &forall; _n_. &forall; _a_ `tr_fact` _n_ _acc_ = _n_ * _acc_
We need to prove that `tr_fact (`_n_` + 1)` = &forall; _acc_ . `tr_fact (n+1)` _acc_  We have:
`tr_fact (`_n_` + 1)` _acc_ = `tr_fact` `(`_n_`+1)-1` ``((n+1) * acc)`` **[eval of `tr_fact`]**
=  `tr_fact` _n_ `((n+1) * acc)` **[simplification]**
= 0, &check;
