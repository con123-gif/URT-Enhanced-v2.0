# Mimic first-image distribution: exact regular/singular dichotomy
27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. This is a rigorous hand theorem on the first image distribution, a new extension of our archive; it is not the entire registered hitting-time theorem, not Lean-verified, and not a claim of literature priority. No URT phase controller was used.

## Theorem

Let M>=3, 2<=B=M-D<M, and f(n)=sum_i a_i B^i for the ordinary base-M digits a_i of n. Let N=M^k, T=B^k and R=(M-1)/(B-1). For n uniformly distributed over multiples of D in [0,N), the law of f(n)/T converges weakly to the law mu of

    X = sum_(j>=1) A_j/B^j,

where A_j are independent uniform integers in {0,...,M-1}. More precisely the 1-Wasserstein distance (infimum expected absolute difference over couplings) is bounded by

    W1(law(f(n)/T), mu) <= (2D+R)/B^k + RD/M^k.

Excluding zero adds at most R/ceil(N/D). This includes the original terminating regime B<=D, but applies to any B in the stated range. The support of mu is exactly [0,R]. Its mean is (M-1)/(2(B-1)), variance (M^2-1)/(12(B^2-1)). Most importantly:

    mu has a bounded Lebesgue density if and only if B divides M;
    otherwise mu is singular continuous.

In the first case the density is bounded by 1; the unconditioned finite-step mass at every grid point is <= B^(-k).

## Proof of quantitative convergence

For an unconditioned uniform integer in [0,N), the padded digits are independent uniform; reversing their order gives the law of sum_(j=1)^k A_j/B^j exactly. Coupling with its infinite extension gives a deterministic tail bound R/B^k.

To compare the conditional and unconditional laws, round a uniform integer n down to q(n)=D floor(n/D). All complete blocks of length D have the same probability D/N; only the last block may be short. With L=ceil(N/D), the total variation distance between the law of q(n) and the uniform law on the L multiples is (L-1)(DL-N)/(NL)<=D/N. Their f/T values lie in [0,R], so the Wasserstein distance of the pushforwards is <=RD/N.

If j is the number of trailing digits M-1 of n, then
    f(n+1)-f(n)=B^j-(M-1)sum_(i<j) B^i <= 1.
The inequality follows since M-1>=B-1. Sum the absolute increments: each positive increment is at most 1 and the net increment f(N-1)-f(0)>=0. Hence total variation of the finite integer sequence f(0),...,f(N-1) is <=2N. Each adjacent edge between q(n) and n occurs in at most D of the N such paths, so E|f(n)-f(q(n))|<=2D. After dividing by T and using the triangle inequality with the preceding two couplings, the claimed bound follows. The optional zero removal changes the finite law in total variation by 1/L. Mean and variance of X follow by summing independent geometric series.

## Proof of the measure dichotomy

Write S_a(x)=(a+x)/B. The self-similar law satisfies mu=(1/M)sum_a (S_a)_*mu and is the unique probability fixed point on [0,R]: coupling independent digit expansions contracts Wasserstein distance by B^(-1). The intervals S_a([0,R]) cover [0,R] without gaps because R>=1. Every x in that interval can therefore be approximated within R/B^k by a prefix of length k, and every prefix cylinder has positive probability. Thus its closed support is [0,R].

If B|M, write each uniform digit uniquely as A_j=U_j+B V_j, where U_j is uniform on {0,...,B-1}, V_j uniform on {0,...,M/B-1}, and the two families are independent. Then X=U+B V with U=sum_j U_j/B^j uniform on [0,1] and V=sum_j V_j/B^j independent of U. The convolution of a uniform interval density with any probability has density <=1. At finite k the same decomposition gives a uniform grid variable on {0,...,B^k-1}/B^k independent of the other summand, so each atom has mass <=B^(-k).

Conversely define the characteristic function
    phi(t)=prod_(j>=1) [ (1/M)sum_(a=0)^(M-1) exp(i t a/B^j) ].
For every integer r>=0, phi(2*pi*B^r)=phi(2*pi), since all the first r factors equal 1. At t=2*pi each factor vanishes precisely when B^j divides M, as follows from the finite geometric sum (its denominator is nonzero). If B does not divide M no factor vanishes. Also sum_j |1-factor_j|<infinity by |exp(iu)-1|<=|u|, so the infinite product is nonzero. The characteristic function fails to decay along 2*pi*B^r, contradicting the Riemann-Lebesgue lemma for any absolutely continuous probability.

The Lebesgue absolutely continuous and singular components of mu are separately invariant under the same self-similarity, because each affine S_a preserves both types and a finite sum of singular measures is singular. If the AC component had positive mass, normalizing it would give a second fixed probability on [0,R], necessarily mu itself by uniqueness; this contradicts the Fourier obstruction. Thus mu is singular.

Finally it has no atom. If there is any atom, the maximum atom mass m>0 is attained (only finitely many atoms have mass >=m/2). At a maximizing x, the invariance equation forces each Bx-a to be an atom of mass m, since each summand is <=m. Iterating a=0 forces x=0 by the bounded support, but a=M-1 then forces a negative atom, impossible. So the singular measure is continuous. QED.

For decimal mimic parameters D=7 (B=3) or D=6 (B=4), the scaled first-image limit is singular continuous even though its support is a full interval. For D=8 (B=2) or D=5 (B=5), the scaled law is absolutely continuous. This is about the scaled FIRST image, not a proof of a limiting centered hitting-time distribution. The Fourier and pure-type mechanisms are standard in self-similar probability theory; the direct connection to mimic numbers and quantitative conditioning estimate are new to this archive, not established as original research. Background: Jessen-Wintner pure types; https://doi.org/10.4153/S0008439519000304 ; https://arxiv.org/abs/2303.07785 . Original question https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers .

## Executed independent checks

Python 3 exact integer verification: 236 parameter/window cases, 599552 enumerated inputs across M=3..12, B=2..M-1, M^k<=20000. In every case the independently generated polynomial-coefficient histogram agreed with direct digit evaluation, its support was the full integer interval, total variation and exact Wasserstein bound passed. All 49 cases B|M passed the finite atom bound. Floating characteristic-function illustrations only (not proof): |phi(2*pi)| approximately 0.007690533569 for M=10,B=3 and 0.064170298012 for M=10,B=4; exactly zero by the geometric sum for B=2 or B=5.

```python
from collections import Counter
def step(n,m,b):
    y=0;w=1
    while n:
        n,a=divmod(n,m);y+=a*w;w*=b
    return y
def hist(m,b,k):
    c=Counter({0:1})
    for i in range(k):
        d=Counter()
        for v,count in c.items():
            for a in range(m):d[v+a*b**i]+=count
        c=d
    return c
cases=values=bounded=0
for m in range(3,13):
    for b in range(2,m):
        d=m-b;k=1
        while m**k<=20000:
            N=m**k;T=b**k
            f=[step(n,m,b) for n in range(N)]
            c=Counter(f);a=Counter(f[::d]);L=len(f[::d])
            assert c==hist(m,b,k)
            assert max(f)==(m-1)*(T-1)//(b-1)
            assert set(c)==set(range(max(f)+1))
            assert all(f[i+1]-f[i]<=1 for i in range(N-1))
            assert sum(abs(y-x) for x,y in zip(f,f[1:]))<=2*N
            C=A=z=0
            for j in range(max(f)+1):
                C+=c[j];A+=a[j];z+=abs(C*L-A*N)
            # exact W1 z/(N*L*T), no floating rounding
            assert z*(b-1)<=2*d*N*L*(b-1)+(m-1)*d*T*L
            if m%b==0:
                assert max(c.values())*T<=N;bounded+=1
            cases+=1;values+=N;k+=1
assert (cases,values,bounded)==(236,599552,49)
```

## Live submission reconciliation and resume

Fresh join.txt, live catalogue (2549 open entries), both public target briefs and 2889-record solved feed successfully retrieved in read-only isolated run46048831941/job140674769844, 18:21 UTC: https://github.com/con123-gif/open-math-agents/actions/runs/46048831941 . Three con123-gif merged full proof records remain publicly credited (A180195/A002538/A158960, 45 points each, outcome pending). Actual PR metadata independently rechecked 7724/7815/7817 merged=true. Formal acceptance is distinct from genuine mathematical novelty; conservative novelty-confirmed count remains zero. Fresh catalogue still includes obviously known formulas: do not treat its label as evidence of open status.

Exact imported-target checker receipts independently inspected: https://github.com/con123-gif/open-math-agents/actions/runs/46046988992 job140668601604 explicitly returns verdict=accepted for both proofs/mo-198816.lean (OMA.disproof) and proofs/oeis-a124869.lean (OMA.solution), allowed axioms only. Fresh direct PR metadata and REST search confirm our peer has submitted complete MO198816 proof #10139 (open, author con123-gif; https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/10139); A124869 already has preceding proof PR10098 by caa1982, so do not duplicate. A390583 statement PR10062 by con123-gif is now open; wait for actual merge before imported-target submission. The four statement PRs9480/9482/9501/9503 remained open when checked. Mimic full-proof PR7508 by TheWaler and PR9085 by Salofe already exist; do not duplicate. This session's new theorem is an extension, not a replacement registered proof. No fresh claims, new Lean runs, official notes or proof PRs attributable to this session. Existing prior note33408 remains historical, not a newly acknowledged note. Direct site DNS failed, but fresh public Actions read succeeded; avoid interfering with active peer leases. Resume: monitor MO198816 proof verdict and A390583 statement merge; choose new eligible exact target after proper dedup/source audit; do not inflate formal certificates into genuinely novel accepted solutions. Other research workers untouched.
