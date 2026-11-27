# 2026-11-27 20:08 UTC — A363482 exact prime occurrence theorem (prior-source hold)

Credit: Cornelius Lytollis (con123-gif), assisted by ChatGPT (GPT-6.2). Mohammed Bouras's continued fraction and source conjecture; Antonio Gracia Llorente and TrureTuring's previously established factorial cancellation and related multiplicity methods are acknowledged. No originality claim.

## Reconciliation and rules

Read current AGENTS.md, CAMPAIGN_LEDGER.md, VERIFIED_PROOFS.json (record_updated_utc 20:05), and previous lane checkpoint at b69364161c2213b3171d3933f7811c680b01727b. Current archive confirms 29 complete kernel-checked certificates, four actual upstream full-proof checker acceptances, three merged credited formal proofs, zero conservatively confirmed new open resolutions. Direct upstream PR reads confirm 7724 merged 17:05:50 (4c3981b3), 7815 merged 17:13:14 (9963fed4), 7817 merged 17:13:23 (9ad85ef3d); PR10139 (actual upstream checker run46047885906/job140671608373 according to latest ledger) and statement PR9501 remain open/unmerged. No duplicate submission. A033955 has preceding PRs6208 and5549; A006579 has preceding PRs9784 and7816. Do not duplicate these. A363482 all-state is:pr exact-ID search zero, not evidence of novelty or eligibility.

Official upstream main tools/oma.sh retrieved and read. join.txt web access failed, local DNS failed; local lean/gh absent. No valid lease acquired or claim attempted. Prior-source hold remains: https://oeis.org/A363482/internal exact source, https://arxiv.org/html/2509.09745v1 Bouras 2025, https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html (general negative-tail factorial identity and related prime-count theorems), https://doi.org/10.5281/zenodo.23506866 (2026-10-20 Gracia Llorente) and https://zenodo.org/records/23506866 inaccessible. Their exact treatment of k=5 is not established; no submission or new count until resolved.

## Complete stronger hand theorem (not Lean checked)

For n>=3 define Q=n²+3n-5. Let a(n) denote the positive reduced denominator of the literal OEIS continued fraction with terminal -5. Then a(6)=49 is the only composite value. Moreover for every prime p, the number of indices n>=3 with a(n)=p is zero for p=2,3; one for p=5,7; and 1+LegendreSymbol(29,p) for p>=11. In particular 29 occurs exactly once. All other occurring primes >=11 occur exactly twice. This is a stronger statement about the same problem, not a second catalogue solve.

### Exact determinant identity, independent short reconstruction

For M_j=[[j,-(j+1)],[1,0]], j=2,...,n-1, let M be their ordered product. Its first row is (A,B)=(n-1,-n(n-2)), by induction (base n=3; multiply by M_n gives (n,-(n²-1))). Its determinant is n!/2. The input column (-5,1) gives output (-Q,R) for some integer R; reciprocal fraction is R/(-Q). The input columns (-5,1) and (1,0) form a unimodular matrix of determinant -1. Thus the transformed columns are (-Q,R), (A,C) with determinant -n!/2, so Q C+A R=n!/2. gcd(Q,A)=1 because Q=5(n-1)+n(n-2), with n(n-2) congruent to -1 mod n-1. Hence gcd(Q,R)=gcd(Q,n!/2)=gcd(Q,n!) as Q odd. This proves a(n)=Q/gcd(Q,n!) without referring to left-factorial recurrences. The rational fold is defined: at level n-1 the value is >n-1. For j>=4 the inductive bound x_{j+1}>j-1 gives x_j=j-(j+1)/x_{j+1}>j-2, since (j+1)/(j-1)<=2. This yields x_4>2; then x_3=3-4/x_4>1. Finally the first-row identity gives nonzero final numerator -Q. Short folds n=3,4 are direct. Thus no intermediate reciprocal is undefined.

### Large-index complete exclusion, n>=24

Q is odd and Q mod 3=n²+1, so neither 2 nor 3 divides Q. Assume prime p divides a(n). Then p>=5 and v_p(Q)>v_p(n!).

If p<=n/2, put k=floor(n/p)+1>=3. Then p^k divides Q since n! contains k-1 multiples of p. But n+2<=kp+1 and p^(k-2)>(k+1/p)^2: for p=5, k>=5 (base k=5); p=7, k>=4 (base k=4); p>=11, k>=3 (base k=3). For fixed p all these bounds propagate in k, since multiplying by p>=5 dominates the ratio ((k+1+1/p)/(k+1/p))^2<(4/3)^2 for k>=3. Therefore p^k>(kp+1)^2>= (n+2)^2>Q, contradiction.

If n/2<p<=n then p² divides Q and n<=2p-1. Hence p²<Q<5p² (using n>=p and p>=5). Q/p² is an odd positive integer strictly between 1 and 5, hence equals 3. This contradicts Q mod3!=0. Consequently every surviving prime exceeds n.

Two distinct odd primes greater than n have product >=(n+1)(n+3)>Q. A repeated prime greater than n requires p=n+1 since Q<(n+2)^2. But Q-(n+1)^2=n-6 is strictly positive and less than n+1 for n>=24, excluding divisibility by p and hence p². Thus a(n) is 1 or a single prime strictly greater than n, and if p>n divides Q it necessarily equals a(n).

### Base cases and occurrence count

Exact direct rational computations at n=3,...,23 give:
13,23,7,49,13,83,103,5,149,1,29,233,53,23,67,373,59,1,499,109,593.
For p>=11 the finite values all satisfy p>n and Q divisible by p precisely when p>n and p divides Q (by the gcd identity and unique factorization). Therefore for every p>=11, indices are precisely 3<=n<p with Q congruent to 0 mod p. The excluded residues 0,1,2 yield Q=-5,-1,5, so none is a root for these p. Completing the square gives (2n+3)^2=29 mod p, an invertible change of variable, hence exactly 1+LegendreSymbol(29,p) solutions including the double root p=29. For p=2,3 no occurrence by residues; for 5 and 7 the base table establishes exactly one each, and the large-index exclusion prevents any further. Exception 49 occurs only at n=6.

## Actually executed independent arithmetic challenges

Python exact factorial/gcd and direct Fraction tests, with SymPy Legendre symbol (not Lean):
```python
from math import gcd,isqrt
from fractions import Fraction
from sympy import primerange,legendre_symbol
from collections import Counter
f=1; counts=Counter(); base=[]
for n in range(1,5001):
    f*=n
    if n<3: continue
    Q=n*n+3*n-5; a=Q//gcd(Q,f); counts[a]+=1
    if n<24: base.append((n,a))
    if n<=300:
        x=Fraction(-5)
        for j in range(n-1,1,-1): x=j-Fraction(j+1,x)
        assert (1/x).denominator==a
    if n>=24:
        assert a==1 or (a>n and all(a%d for d in range(2,isqrt(a)+1)))
for p in primerange(2,5001):
    expected=0 if p in (2,3) else 1 if p in (5,7,29) else 1+int(legendre_symbol(29,p))
    assert counts[p]==expected,(p,counts[p],expected)
assert counts[49]==1
```
4977 tail checks, 298 literal rational fold checks, 669 prime-multiplicity checks through 5000, all completed without errors. The universal argument is mathematical, not inferred from the checks. Full theorem not kernel verified.

## RESUME HERE
Recover primary 2026-10-20 Gracia Llorente paper and check whether k=5 exact classification is already proved. No official claim, no additional eligible count, no Lean run. If known, segregate as prior; otherwise check current eligibility and exact registered target before formalizing. Preserve all RH and peer files.