# Negative-tail quadratic continued fractions: complete composite-exception parametrization in the large-index region
Date: 2026-11-28, 03:10 UTC run. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2, serving variant not exposed). Credit M. Bouras for the continued-fraction family and Antonio Gracia Llorente / the TrureTuring work for preceding factorial-cancellation and prime-multiplicity results. This is an informal complete mathematical argument, not a Lean pass, not a new accepted problem, and not a publication-priority claim.

## Source and current audit
Bouras, arXiv:2509.09745v1, §4.1, https://arxiv.org/html/2509.09745v1, defines the family with negative tail -k. OEIS A356247 and A363347 cached full entries still print the supplementary GCD assertions; direct OEIS/history access was unavailable (403). TrureTuring dossier https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html names general negative-tail occurrence classification and additional GCD identity as open in its own scope, but identifies earlier Gracia Llorente Theorems 5.11–5.12 (DOI 10.5281/zenodo.23506866). The later paper Rigid Factorial Obstructions and Exact Counting Sequences DOI 10.5281/zenodo.23834257 also deserves review. Both Zenodo primary record requests failed; exact overlap with this theorem remains UNVERIFIED. Hold submission. 
Official live /join HTML protocol was readable, /join.txt was not accessible, current official main tools/oma.sh was read. Direct local networking fails DNS and no local Lean/gh binary was present. Exact-ID all-state (is:pr, no state qualifier) connector searches returned empty even for known existing statement PRs, so those results are not valid evidence of absence. No claims or PRs attempted. Fresh PR metadata: 13332 merged 2026-11-28 02:12:52Z; 10139 open/unmerged; 12465 and 12868 registrations merged; 13431, 14393, 14443 open. Latest campaign ledger blob 2add1e4339932afa79bd58cea1a7d927925c4c8a and VERIFIED_PROOFS blob d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b read; latter's summary field 36 conflicts with the ledger's 37, so no new count asserted. Prior ledger reports 5 full checker acceptances and 4 merges after reconciliation. No RH edits.

## Exact statement
For integers k>=1, n>=3, let Q=n^2+(k-2)n-k, and A=Q/gcd(Q,n!/2). This is the actual reduced denominator of the Bouras continued fraction, not a replacement sequence.

For n>=max(64,k), A is composite iff there exist integers 2<=a<=b, h>=1 satisfying
```
a+b+h=k,
h*(n-1)=a*b+1,
p=n+a-1 and q=n+b-1 both prime.
```
In that case A=p*q, allowing p=q. Thus for each fixed k every composite index is either n<max(64,k) or on an explicitly finite list indexed by pairs (a,b), and every index n>=max(64,k) with n>floor((k-1)^2/4)+2 has denominator 1 or prime. This is an effective universal bound, not an extrapolation from computation.

## Proof
For j=2,...,n-1 use matrix M_j=[[j,-(j+1)],[1,0]] on the column (-k,1). Its product has first row (n-1,-n(n-2)), by induction starting with M_2. The row is primitive since n(n-2)=(n-1)^2-1. Its determinant is n!/2. Write the product as [[r,s],[t,w]], and output column (u,v). Then u=-Q, rv-tu=det, sv-wu=k*det. Consequently gcd(u,v) divides gcd(u,det), and gcd(u,det) divides both rv and sv, hence v by Bezout; equality follows. The rational fraction is v/u. The tails do not hit zero: the first inner tail f_(n-1)=n-1+n/k; for j>=3 the induction f_(j+1)>j-1 implies f_j>j-(j+1)/(j-1)>=j-2, and f_2 is nonzero since u=-Q<0. For n=3 there are no intermediate tails. Thus the positive reduced denominator is Q/gcd(Q,n!/2).

Now n>=max(64,k) implies 0<Q<2n^2. For every prime r<=n/2, the entire r-adic factor of Q cancels:
* r=2: with t=floor(n/2), v_2(n!/2)>=t-1, while 2^t>2n^2 for n>=64 (check n=64,65 and induct in steps of two). Thus v_2(Q)<t.
* odd r: t=floor(n/r)>=2. We have r^(t-1)>=2(t+1)^2. For t=2,3,4 use r>n/(t+1)>=64/(t+1); for t>=5 use r>=3 and 3^(t-1)>=2(t+1)^2 (base t=5, then induction since (t+2)^2/(t+1)^2<3). Therefore r^(t+1)>=2r^2(t+1)^2>2n^2>Q, so v_r(Q)<=t<=v_r(n!/2).

For n/2<r<=n, r^3>(n/2)^3>=8n^2>Q, and v_r(n!/2)=1 (r is odd and r^2>n). Any survivor is only one copy of r and requires r^2|Q. If another distinct prime s survived, then s>n/2 and Q>=r^2*s>(n/2)^3>2n^2, impossible. Thus if a survivor <=n exists the denominator is prime. If A is composite, all its prime factors exceed n. Their product with multiplicity already exceeds n^2, and 3 such factors exceed 2n^2. Consequently A=p*q with p,q>n (possibly equal); since A|Q<2n^2, Q=A. Conversely if Q=p*q with p,q>n, none cancels and A=Q composite.

Put p=n+a-1, q=n+b-1, 2<=a<=b. Expanding Q=p*q gives k(n-1)=(a+b)(n-1)+ab+1, hence h=k-a-b=(ab+1)/(n-1) is a positive integer. Conversely this identity and primality produce Q=p*q, proving the equivalence. Since a+b<=k-1, ab<=floor((k-1)^2/4), so n=1+(ab+1)/h<=floor((k-1)^2/4)+2. QED.

## Executed independent checks
Local Python exact rational arithmetic (fractions.Fraction) independently recomputed both prior supplementary GCD witnesses:
- k=1, n=62,138, reduced denominator 199 at each; Q=3781,18905, gcd=3781=19*199.
- k=4, n=116,193, reduced denominator 311 at each; Q=13684,37631, gcd=3421=11*311.
For k=1..75 and 251 indices starting at max(64,k^2+1), 18,825 exact factorial-GCD checks passed. Previous prime occurrence formula checked on 736 (k,p) pairs (k<=30, up to 25 primes from max(64,k^2+5) below 1000) using literal factorial gcd at each index 3..2p-1; no mismatch.
Most importantly, independent complete bounded classification for k=1..80 compared the exact predicted pairs against factorial-GCD evaluation at EVERY n from max(64,k) through floor((k-1)^2/4)+2: 37,512 checks, 225 composite triples, no discrepancies. First examples (k,n,A): (17,65,5183), (17,66,5329), (19,67,5609), (23,98,11639), (23,119,16637). Last examples (79,1402,2073479), (79,1423,2134421), (79,1442,2190319), (80,153,35263), (80,163,39203).

Reproduction code (Python + sympy):
```python
from math import gcd
from sympy import isprime
K=80; bound=(K-1)**2//4+2
fact=1; half=[1]
for n in range(1,bound+1):
    fact*=n; half.append(fact//2)
checks=triples=0
for k in range(1,K+1):
    upper=(k-1)**2//4+2
    predicted={}
    for a in range(2,k-2):
        for b in range(a,k-a):
            h=k-a-b
            if h<=0 or (a*b+1)%h: continue
            n=1+(a*b+1)//h
            if n<max(64,k): continue
            p=n+a-1; q=n+b-1
            if isprime(p) and isprime(q):
                assert n not in predicted or predicted[n]==p*q
                predicted[n]=p*q; triples+=1
    for n in range(max(64,k),max(max(64,k),upper+1)):
        Q=n*n+(k-2)*n-k; A=Q//gcd(Q,half[n])
        assert (A>1 and not isprime(A))==(n in predicted)
        if n in predicted: assert A==predicted[n]
        checks+=1
assert (checks,triples)==(37512,225)
```
The finite computations are independent tests, not the proof. No Lean execution, source registration, official PR or acceptance for this theorem.

## RESUME HERE
Retrieve the primary Gracia Llorente October papers and compare exact theorem scope before formalization; specifically check whether this composite-index parametrization is a prior theorem. Recover actual verifier execution evidence for existing GCD disproofs and A372561 imported target, not merely GitHub green wrapper. Fresh exact-ID search must return known registration positive controls before relying on a negative full-PR result. This checkpoint adds zero to the accepted original problem count.
