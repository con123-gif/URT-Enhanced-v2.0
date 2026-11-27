# Mimic-number uniform density theorem and campaign reconciliation

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. This is a new-to-this-archive rigorous analytic extension of rounds 4–9, not a claim of literature priority or a Lean certificate. No original URT controller execution; the mechanism is recursive digit transformation and probabilistic smoothing.

## Theorem: bounded hitting time has uniform density zero

For radix M>=2 and 1<=D<=M, write f(n)=Nat.ofDigits(M-D,M.digits(n)) and let H(n) be the first hitting time of D (infinity if it never hits). For every fixed integer h>=0,

    lim_(N->infinity) sup_(a>=0) #{n in [a,a+N): H(n)<=h}/N = 0.

In particular, in the terminating regime ceil(M/2)<=D<M, the hitting time of a uniformly selected positive multiple of D in ANY interval of increasing length tends to infinity in probability. This is stronger than merely exhibiting arbitrarily large depths or zero natural density on initial windows. Conditioning on multiples is legitimate: their number in every such interval differs from N/D by at most one.

Proof. If B=M-D>=2, each finite target has a finite preimage, since a word of length L with nonzero leading digit has image at least B^(L-1). A finite union of finitely iterated preimages of {D} is finite. If B=0, f is the least significant digit, hence no n except D itself ever hits D. It remains to prove the boundary B=1, D=M-1, where every exact positive depth is infinite and a finite-preimage argument fails.

For A subset of nonnegative integers define d_A(T)=sup over integer a of |A intersect [a,a+T)|/T (extend A by the empty set on negative integers). Let S(n) be the base-M digit sum. We show that if d_A(T)->0, then d_(S^-1(A))(T)->0.

For a uniform k-digit padded word W in [0,M^k), let X_k=S(W) have distribution p_k. Its probability mass function is symmetric and unimodal. For a direct induction, convolution with a uniform digit gives p_(k+1)(j)-p_(k+1)(j-1)=(p_k(j)-p_k(j-M))/M. For j at or below the new center (k+1)(M-1)/2, j is no farther than j-M from the old center k(M-1)/2, so this difference is nonnegative. Symmetry supplies the other half. The base case k=1 is uniform.

Also max_j p_k(j)->0. Condition on which digits lie in {0,1} and on the values of all other digits. The remaining random sum is Bin(K,1/2) with K distributed Bin(k,2/M). Its largest atom is at most C/sqrt(K+1) by the standard central binomial coefficient bound (e.g. Wallis/Stirling). Chebyshev's inequality gives P(K<k/M)->0; thus the unconditional maximum is O_M(k^-1/2). For M=2, K=k deterministically.

For every integer shift s and every T>=1, layer cake applied to the unimodal mass function gives

    P(s+X_k in A) <= d_A(T) [1+T max_j p_k(j)].

Indeed, a nonempty superlevel set of p_k is a consecutive interval of length L. Partition it into length-T intervals and one remainder, which is contained in a length-T interval. Its intersection with the shifted set A has cardinality <= d_A(T)(L+T). Integrate over superlevel thresholds from 0 to max p_k; the integral of the length is 1. This bound is uniform in s. Choose T so d_A(T) is arbitrarily small, then k sufficiently large.

Every aligned block [z M^k,(z+1)M^k) has digit sum distribution S(z)+X_k by concatenation, so the preceding bound applies uniformly over z. An arbitrary interval of N consecutive integers decomposes into full aligned blocks plus at most 2(M^k-1) uncovered integers. Holding k fixed and letting N grow yields the desired uniform zero-density property for S^-1(A). Induct from A_0={D}, A_(h+1)=S^-1(A_h). As S(D)=D, A_h={H<=h}; thus every fixed hitting-time level, and every finite union of levels, has uniform density zero. QED.

For the B=1 case a separate exact block formula follows: among padded k-digit suffixes following prefix z, the number whose digit sum equals D is binomial(k+D-S(z)-1,D-S(z)) when S(z)<=D, zero otherwise. This is stars and bars, since D=M-1 bounds every digit automatically. It counts H<=1 (includes the fixed point D if present); subtract that fixed point for H=1.

## Executed independent finite checks

Python exact integers: 2,360 complete aligned-block histogram comparisons against direct iteration (M=2..12, k with M^k<=10000, ten prefixes per pair, h=1..4); 8,250 closed-form depth-1 coefficient comparisons (M=2..12, k=1..50, s=0..2M); 550 unimodality and normalization tests. All passed. These checks are illustrative, not the proof of the uniform limit. For decimal digit sums, the cumulative H<=2 fractions for k=16,32,64,128,256,512 are approximately 0.108919,0.109990,0.061636,0.040574,0.083506,0.055053. The oscillation demonstrates why monotone numerical extrapolation of depth fractions is not warranted.

```python
from math import comb
from random import Random
rng=Random(2711)
def ds(n,m):
    s=0
    while n:n,a=divmod(n,m);s+=a
    return s
def hit(n,m,h):
    for _ in range(h):n=ds(n,m)
    return n==m-1
def dist(m,k):
    p=[1]
    for _ in range(k):
        q=[0]*(len(p)+m-1)
        for i,c in enumerate(p):
            for a in range(m):q[i+a]+=c
        p=q
    return p
checks=formula=unimod=0
for m in range(2,13):
    for k in range(1,51):
        p=dist(m,k);assert sum(p)==m**k and p==p[::-1]
        assert all(p[i]<=p[i+1] for i in range((len(p)-1)//2));unimod+=1
        for s in range(2*m+1):
            q=m-1-s;actual=p[q] if 0<=q<len(p) else 0
            expected=comb(k+q-1,q) if q>=0 else 0
            assert actual==expected;formula+=1
        if m**k>10000:continue
        for z in [0,1,m-1,m,m+1,*(rng.randrange(0,20000) for _ in range(5))]:
            s=ds(z,m)
            for h in range(1,5):
                expected=sum(c for i,c in enumerate(p) if hit(s+i,m,h-1))
                actual=sum(hit(z*m**k+x,m,h) for x in range(m**k))
                assert expected==actual;checks+=1
assert (checks,formula,unimod)==(2360,8250,550)
```

## Reconciliation and submission checkpoint

Actual GitHub upstream PR metadata confirms all three distinct full proof PRs by con123-gif now merged: A180195 #7724 at 17:05:50 UTC, A002538 #7815 at 17:13:14 UTC, A158960 #7817 at 17:13:23 UTC. Under repository credit policy these are three credited merged proofs; public website certificate feed has not yet been independently re-read. Three of the campaign target 20, 17 remaining (subject to later prior-source audit). These are parallel campaign submissions, not proofs produced by this session.

A081670 statement PR7865 merged 17:17:39 UTC; another contributor LAPRAI already has proof PR9230, so do not send duplicate proof. Existing statement PRs 7223,7625,7930,7931,7933,8442,8569,8568,8847,8859,9126 remained open on direct read. Mimic statement PR6800 merged by third party; reversal reduction PR7177 remains open. Read registered mimic statement: current theorem encodes exact histogram, divisibility, hitting-time existence/classification and finite-fiber/unbounded-fiber results, not the new asymptotic extension. Do not substitute a weaker or changed statement. The previous hand proof is not yet Lean formalized. No new claim, note, or proof PR in this session.

Actual verifier log job140643653986/run46039599862 confirms five independent campaign probes now pass with final OMA.solution/disproof axioms exactly propext, Classical.choice and Quot.sound: A329813 canonical, A383246, A383248, MO319325, MO487192. Source scope and official imported-target checks still necessary. Their statement/proof stage must be coordinated with current workers. MO311744 repair job140634502717 still fails and is excluded. Earlier A337945 prior-work exclusion retained.

Direct live join.txt access failed in web and sandbox DNS; current upstream lib/join.ts and tools/oma.sh read. Historical official note #33408 verified from actual job140538181549; release response parser SyntaxError confirmed. Correct parsing for any future authorized reuse: python3 -c 'import json; d=json.load(open("release.json")); print(d.get("status",d.get("ok")))' (ordinary quoting, no escaped hex quotes). Do not re-use prior leases. Current action network access is checked separately if possible; no claim attempted without fresh coordinated brief/role. Five other candidate catalogue IDs (A085781, A110199, A112992, A075997, A113249) already have competing PRs; switched rather than duplicating.

Resume: reconcile accepted count and site's certificate feed; obtain fresh live proof assignment for a genuinely eligible statement with no preceding proof PR; coordinate five repaired probes with current workers. Continue full mimic theorem formalization if available, not the asymptotic extension as a replacement. No RH or Cathedral physics changes.
