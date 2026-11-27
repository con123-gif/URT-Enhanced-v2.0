# A181674 — exact limiting mean, second term, and the almost-prime generalization

27 November 2026, 21:24 UTC session. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. Complete mathematical argument using classical published prime-counting asymptotics; not Lean verified in this session and not an additional distinct solved catalogue ID. This extends the independently checked Chebyshev disproof in A181674_DISPROOF.md (run 46063152958, job 140722015963). Its full disproof uses only propext, Classical.choice and Quot.sound; that receipt does not verify the stronger results below.

## Theorem

Let P_j be the product of the first j primes, P_0=1. Let Q_k(X) count positive integers <=X with exactly k prime factors counted with multiplicity, for a fixed integer k>=1. Let S_k(X) count unordered two-part partitions of all positive integers <=X into a distinct primorial VALUE and a k-almost-prime. Then

    S_k(X) ~ X (log log X)^(k-2)/(k-1)!.

In particular, for the original semiprime problem A181674,

    S_2(X)/X -> 1.

More precisely, with M the prime Meissel-Mertens constant (approximately 0.26149721284764278),

    S_2(X)/X = 1+(1+M)/log log X+O((log log X)^(-2)).

For k=1 the mean tends to zero; for k=3 it grows as (log log X)/2. These are mathematical corollaries, not separate claimed official solutions.

## Proof of exact identity and leading term

The intersection of the primorial set and the k-almost-prime set consists of exactly P_k (unique factorization). Thus mapping the ordered role pair (primorial, almost-prime) to the sorted unordered pair is injective: the only possible ambiguity would require both entries in that singleton intersection, in which case the roles do not produce distinct pairs. Surjectivity follows directly from the definition. Therefore, putting Q_k(t)=0 for t<1,

    S_k(X)=sum_{P_j<=X} Q_k(X-P_j).

Let K(X)=#{j>=0:P_j<=X}. Since log P_j=theta(p_j) and the prime number theorem gives theta(t)~t and pi(t)~t/log t, monotonicity squeezes K(X) between 1+pi((1-epsilon)log X) and 1+pi((1+epsilon)log X) for every fixed epsilon>0 and sufficiently large X. Hence K(X)~log X/log log X.

Landau's classical fixed-k asymptotic is

    Q_k(X) ~ X (log log X)^(k-1)/((k-1)! log X).

For fixed 0<epsilon<1, monotonicity gives

    K(epsilon X) Q_k((1-epsilon)X) <= S_k(X) <= K(X) Q_k(X).

Both K(epsilon X)/K(X) ->1 and Q_k((1-epsilon)X)/Q_k(X) ->1-epsilon. Dividing by K(X)Q_k(X), then taking limits and letting epsilon decrease to zero proves S_k(X)~K(X)Q_k(X). Substituting the two asymptotics gives the theorem. No conjecture about correlations of primes is used.

## Proof of the second term for k=2

Write L=log X and l=log L. The classical quantitative prime number theorem gives theta(t)=t+O(t exp(-c sqrt(log t))) for some c>0 and pi(t)=t/log t+t/(log t)^2+O(t/(log t)^3). Inverting theta by squeezing at t=L(1 +/- l^(-3)) gives

    K(X)=L/l + L/l^2 + O(L/l^3).

Indeed the theta error is o(L/l^3), so the two theta values straddle L eventually. Substitution of these two t values into the prime-count expansion gives the same displayed expansion; the additive P_0 count is absorbed by its remainder.

Crisan and Erban's published semiprime expansion gives

    Q_2(X)= (X/L)(l+M+O(l/L)).

It remains to justify neglecting the shifts by P_j more accurately than the leading-term squeeze. Set Y=X/L. The successive ratios P_(j+1)/P_j are primes and hence at least 2; consequently sum_{P_j<=Y}P_j<=2Y. For those primorials, Q_2(X)-Q_2(X-P_j)<=P_j (integer count; for integer X the displayed bound is exact). For large X there are at most two primorials in (Y,X]: each corresponding largest prime is at least L/2 by theta(t)~t and log Y=L-l, so if three existed, the product of two successive ratios would exceed (L/2)^2>L, contradicting the interval ratio X/Y=L. Thus

    0 <= K(X)Q_2(X)-S_2(X) <= 2X/L+2Q_2(X)=O(X l/L).

This remainder is o(X/l^2). Multiplying the displayed K and Q_2 expansions yields the asserted two-term formula. In particular, the mean is eventually greater than one and tends to one. This is not a monotonicity claim at finite X.

## Literature and novelty boundary

Source: https://oeis.org/A181674 (exact original conjecture and full prior source review preserved in A181674_SOURCE_PRIOR_AUDIT.md; direct OEIS access returned 403 in this session). The OEIS conjecture list independently reproduces the original claim: https://oeis.org/wiki/Talk:Conjectures/List .

Prior inputs: the classical prime number theorem with its standard de la Vallee Poussin error estimate; Landau's fixed-k almost-prime asymptotic; Dragos Crisan and Radek Erban, On the counting function of semiprimes, Integers 21 (2021), https://arxiv.org/abs/2006.16491 ; the explicit leading and Mertens-constant terms are also summarized at https://www.maths.ox.ac.uk/node/40908 . Both web search engines screened exact-ID/primorial-semiprime average-order and structural almost-prime partition terms; no exact earlier resolution was found in that bounded search. This is not a guarantee of historical priority. The asymptotics used are established mathematics; no URT or Cathedral advantage is claimed.

## Executed numerical checks

Exact prime sieve and semiprime marking using unordered prime factors through 10,000,000. A separate multiplicity sieve verified all first 1,000 semiprime flags; explicit sorted-pair enumeration verified all first 1,000 summatory values. All 2,000 controls passed.

| X | K(X) | Q_2(X) | S_2(X) | mean |
|---:|---:|---:|---:|---:|
| 10 | 3 | 4 | 6 | 0.6 |
| 100 | 4 | 34 | 125 | 1.25 |
| 1000 | 5 | 299 | 1423 | 1.423 |
| 10000 | 6 | 2625 | 15102 | 1.5102 |
| 100000 | 7 | 23378 | 156372 | 1.56372 |
| 1000000 | 8 | 210035 | 1569808 | 1.569808 |
| 10000000 | 9 | 1904324 | 15201629 | 1.5201629 |

These checks are not the infinite proof. Reproduce with:

```python
import numpy as np, math
N=10_000_000
prime=np.ones(N+1,dtype=bool); prime[:2]=False
for i in range(2,math.isqrt(N)+1):
    if prime[i]: prime[i*i::i]=False
pr=np.flatnonzero(prime)
semi=np.zeros(N+1,dtype=bool)
for i,p in enumerate(pr):
    p=int(p)
    if p*p>N: break
    q=pr[i:np.searchsorted(pr,N//p,side='right')]
    semi[p*q]=True
Q=np.cumsum(semi,dtype=np.int32)
P=[1]
for p in pr:
    v=P[-1]*int(p)
    if v>N: break
    P.append(v)
for x in [10,100,1000,10000,100000,1000000,10000000]:
    ps=[p for p in P if p<=x]
    s=sum(int(Q[x-p]) for p in ps)
    print(x,len(ps),int(Q[x]),s,s/x)
M=1000
omega=np.zeros(M+1,dtype=np.int8)
for p in pr[pr<=M]:
    q=int(p)
    while q<=M:
        omega[q::q]+=1; q*=int(p)
assert np.array_equal(omega[1:]==2,semi[1:M+1])
for x in range(1,M+1):
    pairs={tuple(sorted((p,q))) for p in P if p<x
           for q in range(1,x-p+1) if omega[q]==2}
    assert len(pairs)==sum(int(Q[x-p]) for p in P if p<=x)
```

## Submission handoff

The current canonical ledger describes 31 complete checked archived certificates; VERIFIED_PROOFS.json read during this session still described 30 (concurrent update in progress). Direct fresh PR metadata confirms the 3 actual merged full proofs 7724/7815/7817 and the still-open full proof PR10139. Merged statement registrations 9480,9482,9503,9702,9703,9704 are not accepted full proofs. The latest existing exact A181674 claim was HTTP500/no assignment as reported by the canonical ledger, so no repeated claim, duplicate PR, or unofficial bypass was attempted. A401895 reduction PR7177 remains unmerged. Direct site DNS/web access failed; read upstream current lib/join.ts and tools/oma.sh instead and launched an isolated GET-only public status workflow on the authorized fork, branch oma-readonly-2124-20261127, commit 07084456e92d6a679cffa0cc5c53b1152a8e2e2c. It has no credentials, no claim calls and no recurring trigger. Record its actual result separately if available.

The existing complete Lean disproof is still the submission target. Do not replace the checked exact-target certificate with this stronger unformalized asymptotic. No new accepted result or additional distinct problem is claimed by this extension. Next: obtain a fresh valid lease only when official desk is functioning and eligible exact target has no preceding submission; use existing verified disproof, not an amended target.
