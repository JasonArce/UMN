# Correctness of choose

We have been given the following program:
```
let rec choose n k =
  if (n=k) || (k = 0) then 1
  else ((choose (n-1) (k-1))*n)/k
```

and we would like to prove that: For all n>0 and k>0 that if k <= n
then `choose n k` = n!/((n-k)! * k!)

We will prove this by induction on n:

## Thm: &forall; n &in; &naturals;  &forall; k &in; &naturals;, if k <= n then `choose n k` = n!/((n-k)! * k!)

**Property _P_**:

Let P(n) = &forall; k, if k<=n then `choose n k` = n!/((n-k)! * k!).

Then what must be shown is that &forall; n, P(n).
We will prove this by induction on n. There are two cases we
must prove to show this property holds for all natural numbers:

- We must show that P(0) holds

- We must show that P(n+1) holds assuming For all m<=n, P(m).

### Base Case:
In the case where n = 0 we have P(0) = &forall; k, k <= 0 &rArr; `choose 0 k` = 0!/((0-k)!*k!)
But we can only have k <= 0 if k = 0, so this simplifies to showing that

`choose 0 0` = 0!/(0!0!) = 1

But by evaluation of `choose` we can see that `choose 0 0` = 1. &check;

### Inductive Case:

In the inductive case we want to show that for all m &in; &naturals;, P(m) &rArr; P(m+1).

So we have n = m+1, and we know that P(m) is true, but that is all we know about m.  Our inductive hypothesis is:

> **IH: &forall; k, k <= m &rArr; `choose m k` = m!/((m-k)! * k!)**

We want to show P(m+1). Therefore, we want to show if k <= m+1 then `choose
(m+1) k` = (m+1)!/(((m+1)-k)! * k!).  

Assume k<=m+1. Then, we must show `choose (m+1) k` = (m+1)!/(((m+1)-k)! * k!):

- `choose (m+1) k` = (m+1)!/(((m+1)-k)! * k!) simplifies to:

- `if (m+1=k) || (k = 0) then 1 else ((choose m (k-1))*(m+1))/k` = (m+1)!/(((m+1)-k)! * k!) ***[by def of choose]***

- We must consider two further cases here due to the if:

  - In the first case m+1=k or k = 0 and we return 1. Therefore, we
    must consider two further cases:
    - Suppose k=0, then the lhs evaluates to `1`, so we have
      - `1` = (m+1)!/(((m+1)-k)! * k!), and since k = 0, the rhs simplifies to
      - `1` = (m+1)!/((m+1)! * 0!), ***[by arithmetic]***, or
      - `1` = 1 ***[by arith]***, &check;
    - Suppose m+1=k, then we have:
      - `1` = (m+1)!/(((m+1)-k)! * k!), or
      - `1` = 1 ***[by arith]***, &check;
  - In the second case we have 0 < k <= m, and by evaluation of `choose` we must show:
    - `((choose m (k-1))*(m+1))/k` = (m+1)!/(((m+1)-k)! * k!)
    - (m!/((m-(k-1))! * (k-1)!)) * (m+1)/k = (m+1)!/(((m+1)-k)! * k!) ***[by IH]***
    - ((m+1)!/((m-k+1)! * (k-1)!)/k = (m+1)!/(((m+1)-k)! * k!) ***[by arith]***
    - ((m+1)!/((m-k+1)! * (k-1)! * k) = (m+1)!/(((m+1)-k)! * k!) ***[by arith]***
    - ((m+1)!/((m-k+1)! * k!) = (m+1)!/(((m+1)-k)! * k!) ***[by arith]***
    - (m+1)!/(((m+1)-k)! * k)! = (m+1)!/(((m+1)-k)! * k!) ***[by arith]***, &check;
