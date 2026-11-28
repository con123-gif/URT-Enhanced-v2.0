# A329813 / A329654: existence and complete collision classification
28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Original recurrence and seed-scaling observation: Andres Cicuttin (2019). Classical gamma-ratio asymptotics credited. This is a human mathematical extension of our already merged disproof, not a second eligible problem, not a new Lean certificate, and not a priority claim.

## Preflight and scope
Read official join.txt and tools/oma.sh (main) via web, AGENTS.md, current ledger blob 2add1e4339932afa79bd58cea1a7d927925c4c8a, VERIFIED_PROOFS.json blob d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b (37 actual records). Read canonical A329813 statement ece44c696ff7c6a16926563bacde6a36ea462e76 and proof 9a4d420b3f89e23e0ca149066e95680712aefabe. Live PR metadata: 13332 merged 2026-11-28T02:12:52Z, 10139 still open; 12465/12514/12591/12868 merged, 13431/14443/14393/10062/10398 open. Connector exact-ID is:pr searches returned zero even for known registrations, hence unusable as clean race evidence. No claim or official submission attempted. Local Lean and gh not installed; curl api.github.com DNS failed. No current whole imported-target check available in this run.
Source: https://oeis.org/A329813 and https://oeis.org/A329654 (indexed source content retrieved; direct A329813 read 403); https://oeis.org/A145103 (rounded variant, read), A145102 direct 403. Current agent brief inaccessible. Earlier campaign source/history audit acknowledged, not repeated in full. Bounded gamma/recurrence searches did not retrieve an exact prior classification; not an exhaustive literature or TrureTuring audit. The already merged Lean proof disproves universal pairwise distinctness by seed scaling, and explicitly leaves existence and fixed unit-seed distinctness open. Here both remaining mathematical questions are answered, including every possible collision pattern. Do not count the extension as a new resolution.
Fresh screening: A092028 is explicitly already proved in https://www.trureturing.org/research/oeis-a092028-least-self-divisor-power-minus-one/ (least prime factor of n-1; multiplicative-order argument); sister A092067 has Neder's 2019 proof. A251758 has an explicit August 2026 OEIS note pointing to Adamczewski arXiv:2608.11941 appendix A; withhold pending primary scope audit, no claim. 

## Theorem
Let b_0=x, b_1=y be nonzero real numbers, b_{n+2}=(n+2)b_{n+1}/b_n. All b_n are nonzero by induction. For each r in {0,1,2,3,4,5}, the limit L_r=lim_{m->infinity} b_{6m+r}/(6m+r) exists and is nonzero, with
L_r=(b_r/6) Gamma((r+2)/6) Gamma((r+3)/6) / [Gamma((r+6)/6) Gamma((r+5)/6)].
For r=0 omit m=0 in the normalized sequence.

Proof: successive substitution gives b_{n+2}=(n+2)b_{n+1}/b_n, b_{n+3}=(n+3)(n+2)/b_n, b_{n+4}=(n+4)(n+3)/b_{n+1}, b_{n+5}=(n+5)(n+4)b_n/[(n+2)b_{n+1}], and hence
b_{n+6}/b_n=(n+6)(n+5)/[(n+2)(n+3)].
Iterating for n=r+6j gives the exact gamma product
b_{6m+r}=b_r Gamma(m+(r+6)/6) Gamma(m+(r+5)/6) Gamma((r+2)/6) Gamma((r+3)/6) /
[Gamma(m+(r+2)/6) Gamma(m+(r+3)/6) Gamma((r+6)/6) Gamma((r+5)/6)].
By Stirling's ratio formula Gamma(m+a)/Gamma(m+b) ~ m^(a-b), the product grows like m (exponents sum to 1), yielding the stated limit.

An elementary independent existence check: for t_n=b_n/n, n>=1, t_{n+6}/t_n=1-6/[(n+2)(n+3)] in (0,1). The product along each residue converges to a positive number because its deficits are summable. More explicitly for any n>=5, the product is bounded below by 1-6/(n+2)>0, since finite products of 1-u_j with 0<=u_j<=1 are >=1-sum u_j, and the stride-6 sum is no greater than the telescoping full sum over k>=n of 6/[(k+2)(k+3)]. This gives a rational enclosure for positive seeds: (1-6/(n+2))*t_n <= L_(n mod 6) <= t_n.

## Fixed unit seeds
For x=y=1 the following rational open intervals enclose all six limits, as checked using exact Fraction recurrence up to n=125 and the product bound at n=120,...,125:
r=0: (672/1000,707/1000)
r=1: (413/1000,435/1000)
r=2: (590/1000,621/1000)
r=3: (1369/1000,1439/1000)
r=4: (2226/1000,2339/1000)
r=5: (1561/1000,1640/1000)
All pairwise disjoint. Thus the fixed unit-seed conjecture is true.

## Complete collision classification
Passing to the limit in the recurrence for t gives L_(r+2)=L_(r+1)/L_r (indices mod 6; factor (n+1)/n tends to 1). Write A=L_0 and B=L_1. The cycle in residues 0..5 is exactly
(A, B, B/A, 1/A, 1/B, A/B).
A and B range independently over all nonzero reals, because L_0=x*C_0 and L_1=y*C_1 with C_0,C_1 strictly positive unit-seed limits. In particular x=1/C_0 and y=1/C_1 give all six limits equal to 1.

For positive A,B write u=log A, v=log B. The multiset of logarithms is {+/-u,+/-v,+/-(v-u)}. If u=v=0 there is one distinct value. If exactly one of u,v,v-u is zero, there are three. Otherwise equality between two of their absolute values is equivalent to u=-v, v=2u or u=2v (by solving the signed linear equalities; zero cases excluded). Those lines meet only at the origin, and yield four distinct values. Off all six lines there are six. Thus the possible counts in the positive case are 1,3,4,6.

For any nonpositive seed sign pattern there are exactly two positive and four negative limits (directly from cycle signs). Rotate the cycle so that A=P>0, B=-Q<0. Put u=log P,v=log Q. The positive magnitudes have logs {u,-u}, negative magnitudes have logs {v,v-u,-v,u-v}. Count distinct signs separately. If u=0, there is one positive and either one negative if v=0 or two negatives otherwise (total 2 or 3). If u!=0 there are two positives; the negatives number three when v=0 or v=u, two when 2v=u, four otherwise. Total 5,4,6 respectively. These cases exhaust all possible equalities by comparing |v| and |v-u|, and checking whether either is zero. Together all counts 1 through 6 are attained.

## Executed exact challenge (local Python 3)
```python
from fractions import Fraction as F
from itertools import product
b=[F(1),F(1)]
for n in range(2,126): b.append(n*b[-1]/b[-2])
for n in range(1,120):
    assert b[n+6]/b[n]==F((n+6)*(n+5),(n+2)*(n+3))
for x,y in product(range(-10,11),repeat=2):
    A=F(2)**x; B=F(2)**y
    cycle=[A,B,B/A,1/A,1/B,A/B]
    expected=1 if x==y==0 else 3 if x*y*(x-y)==0 else 4 if (x+y)*(2*x-y)*(x-2*y)==0 else 6
    assert len(set(cycle))==expected
    B=-B;cycle=[A,B,B/A,1/A,1/B,A/B]
    expected=(2 if y==0 else 3) if x==0 else 5 if y==0 or y==x else 4 if 2*y==x else 6
    assert len(set(cycle))==expected
intervals=[(672,707),(413,435),(590,621),(1369,1439),(2226,2339),(1561,1640)]
for n,(lo,hi) in zip(range(120,126),intervals):
    U=b[n]/n; L=U*(1-F(6,n+2))
    assert F(lo,1000)<L<=U<F(hi,1000)
for i,(a,b) in enumerate(intervals):
    for c,d in intervals[i+1:]: assert b<c or d<a
```
Actual executed results: 119 exact stride checks, 882 exact collision checks, 12 strict rational bounds, 15 disjointness checks, no assertion failures. Mathematical proof above, not inference from grid. No Lean execution or new accepted count.

## RESUME HERE
Do not re-submit A329813 or its A329654 alias. If beneficial, independently formalize elementary product bound and exact unit-seed enclosures in a scratch fixture after a working verifier is restored; this remains the same problem. For mission count, switch to a distinct eligible assertion, not a known prior result. Current master counts 37 archived / 5 upstream full checker accepted / 4 merged / 0 certified original. Preserve RH and existing schedules.