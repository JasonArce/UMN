## Binomial Coefficients
Property: ∀ n ∈ ℕ, ∀ k ∈ ℕ,
k ≤ n -> choose n k = n! / ((n-k)! * k!)

Base Case:
	 ∀ n, choose n k
	k ≤ 1 -> P(1) = choose 1 k [substitute]
	1 [k <= 1 would be 0 which returns 1] -> (choose 0 (k-1)) * 1 / k [eval choose]
	1 -> (1) * 1 / k [eval choose]
	1 -> 1 [simplify]
	1 = 1 &check;

Inductive case: ∀ n, P(n) => P(n+1)

Inductive Hypothesis: ∀ k, k ≤ n -> choose n k = n! / ((n-k)! * k!)
Prove: ∀ k ( ∀ n, k ≤ (n+1) -> choose (n+1) k = (n+1)! / (((n+1)-k)! * k!) )

choose (n+1) k = (n+1)! / (((n+1)-k)! * k!) ) [simplifies]
choose ((n+1-1) (k-1))*(n+1)/k [eval]
choose ((n) (k-1)) *(n+1)/k [simplifiy]
n! / ((n-(k-1)! * k!)) * (n+1)/k [by IH]
(n+1)! / (((n+1)-k)! * k!) ) [simplify]
(n+1)! / (((n+1)-k)! * k!) ) = (n+1)! / (((n+1)-k)! * k!) ) [we good] &check;


## Structured Arithmetic

## Structured Comparisons
