1. `tr_fact`
    Error line: 10
    Reason: tr_fact n ((n+1) * acc) does not simplify to (n+1) * acc, you need to include the tr_fact n

2. `rfact`
    Error line: 5
    Reason: You can't assume that rfact n+1 is going to be greater than 2, 0 is an exception.

3. `tr_nat`
    Error line: 7
    Reason: Line 7 doesn't match the IH in line 5.

4. `pow2_nat`
    Error line: 6
    Reason: You can't prove the base case by making up a value that would otherwise satisfy it (like making a equal to 1).
