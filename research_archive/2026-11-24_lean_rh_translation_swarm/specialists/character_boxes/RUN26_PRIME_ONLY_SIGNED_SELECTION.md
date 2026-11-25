# RUN26 — signed prime-only selection using the actual two-stage character mean-square supplier
25 Nov 2026. Lane 6, RH-only one-equation mission. RESULT: source-matched local mathematical replacement, conditional on the explicitly named native analytic suppliers (not independently Lean-checked here). This is a construction of the common pair for the signed auxiliary budget, not the ordinary-prime lower bound or full RH proof.

Preflight: original ONE_EQUATION_MISSION e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 and current recursive mathematics/algebra update, AGENTS, SWARM, HANDOFF, EXPANSION, continuity and state/runner excerpts; prior RUN25 223e6835 and peer signed ramp 86122968, thin Fourier 32968b08, prime 003dfd86, Landau 8bfe5c650, theta 51592596. Recent branch history inspected through 51e477a1. Not an exhaustive historical reread. No physical work or URT.

## 1. The real producer, not an assumed PairEx

Pinned QH.pairEx is in MeanSquareBounds/pairEx.lean. Its actual chain is pair_exists -> pair_share -> stage1/stage2 -> stage -> meanSqK, bad_share, count_bad, count_a, box_of_S; the last uses tailK and kappaC. pairEx separately invokes kappa4 for the derivative bound. Both ShortNorms/supplyOfAdmOf.lean and hostExOneOf.lean invoke QH.pairEx. Thus PairEx is not merely a stated assumption in the local producer. No claim about its full elaborated dependency closure or validity of its deeper suppliers.

Native stage2 (CharOf) uses two primitive base twists per fixed base character, and StagePow.stage unions B2 over this set for the norm estimates. B1 is a separate zero-box exception set, covering all primitive conductors f*r for f<=F, r>F. Do not conflate these two exceptional sets.

## 2. Direct local supplier for RUN25, with precisely the same WinPair scales

Fix 0<eps<1/52 and K>=1. Put tau=eps/4, z=Y^(eps/5), z'=z log(Y)^2, X=Y^K, Z=X^400. The following proof uses the native analytic conclusions meanSqK, bad_share, count_bad, count_a, tailK, kappa4 with the exact admitted and scale conditions established in Stage1Succ.stage1 and CharOf.stage2. These supplier proofs were traced at source level, not independently kernel-replayed or re-proved in this run.

For every sufficiently large Y, choose ONE common q,d (not a different pair for each y). The result, conditional on those analytic suppliers, is the local bound
    |U_{q,d}(y)| <= (3/2)y^(1/2+eps/4) + 3Y^(6eps/5) + 72 y/sqrt(Z)
                 <= y^(1/2+eps/2)    for all Y<=y<=Y^K,
after increasing Y0(eps,K). Retain WinPair, all principal-host real zero boxes, and the separate individual derivative bounds. In this local branch no individual d or qd ramp norm estimate is needed. This does NOT eliminate the native BoundedCharsPointwise premises of other consumers.

Proof: as in RUN25, a(n)=(n/q), b(n)=(n/d), f=b+ab-a. The nonprincipal primitive characters are a,b,ab (distinct odd primes; primitive product at coprime conductors). Write P(n)=1 if n prime and 0 otherwise; define the two normalized coefficient functions
    k1(n)=P(n),   k2(n)=P(n)(1+a(n))/2.
Both have norm <=1, including n=q or d. With cN(y,n)=Lambda(n)*min(1,y/n), the exact signed finite prime sum is
    T(y)=sum_{p<=Z} f(p) log(p) min(1,y/p)
        = 2*S(Z,y,d,k2) - S(Z,y,q,k1).
The q stage uses k1 independent of candidate q; the d stage uses k2 AFTER fixing q and independent of candidate d. This order is essential: the uniform coefficient quantifier of MeanSq does not authorize coefficients depending on the summation variable.

Choose q in primePairSetFirst(z)=PPset(8,3,exp z), then d in primeSetTwoBounds(z,z',q) (a PPset in the CRT class from CharOf). Both sets have the native admitted hypotheses and size >=U_stage^(9/10) for all sufficiently large Y, by the same count_a application as StagePow.stage; stage2 uses eps'=6eps/5. For stage1 take F=8, U_stage=exp z, Q=F U_stage; for stage2 take F=8 exp z, U_stage=exp z', Q=F U_stage. All admitted bounds, F<=sqrt(U_stage), m0 prime-factor restrictions, and conductor bounds are those in Stage1Succ/CharOf with N0=8. In stage1 the bound on admitted prime factors is p<=z or p>Z; in stage2 q>Z and all other factors <=Y^(eps'/5). For Y sufficiently large, each candidate r satisfies r>sqrt(U_stage)>=F.

Exclude B1 exactly as StagePow: if a primitive character of conductor f*r with f<=F fails ZeroFreeBox(Q), exclude r. Its share is <= |Cb| U_stage^(-21/40), by count_bad and count_a, eventually <=1/4 uniformly. Exclude a second set of share <=1/4 by bad_share applied to meanSqK and the single coefficient k1 or k2, with tau as above. There is a candidate outside both sets at each stage because the candidate sets are nonempty. In the second stage the threshold is uniform over the already fixed q, because meanSqK uses all admitted m0,a0 and bad_share uses all norm-bounded kappa. Hence
    |S(Z,y,q,k1)|, |S(Z,y,d,k2)| <= y^(1/2+tau)/2
for EVERY y in the common interval, giving |T(y)|<=3y^(1/2+tau)/2. RowsOfMem ensures WinPair including d_small and d_q (not just congruences of q,d). No induction over y or exchange of existential and universal quantifiers.

All twists with base primitive conductor dividing 8 and nontrivial q or d factor have the required GoodC boxes because each is a primitive coprime product, conductor <=F*r, and B1 was excluded. This covers the principal PairGood.boxes (via primitive-character identification and pairEx_box/IndUnique), including the base characters of conductor dividing 8. For the derivative bound use kappa4 with parameter eps, A=3 and Q1=8 exp(z), Q2=8 exp(z+z'); its required log-height inequalities hold by log_exp_product_bounds in pairEx. Thus all three individual |ell_chi|<=4 log(Y)<=4 log(y) remain. The argument deliberately does NOT reduce B1: removing either d or qd zero box would invalidate the following tail step without a new signed-tail theorem.

## 3. The tail is small, without individual weighted-ramp norm estimates

Use tailL(chi,Z)=-ell_chi-sum_{n<=Z} Lambda(n) chi(n)/n. With eps'=6eps/5, both Q1,Q2 obey Y^(eps'/6)<=log Q<=Y^(eps'/4) eventually, since log Q1=z+log 8 and log Q2=z+z'+log 8. Apply tailK at eps',K. Then for every Y<=y<=X:
    y |tailL(b,Z)+tailL(ab,Z)-tailL(a,Z)| <= 3Y^eps'.
No GRH assumption; these are the native zero-box-based suppliers, not a new proof of them.

A(t)=sum_{p^k<=t,k>=2} log p <= 12 sqrt(t) for t>=2: by theta(v)<=4v log 2 (binomial induction, RUN25),
A(t)<=4 log 2*(sqrt(t)+log_2(t)*t^(1/3)); use sup log(t)/t^(1/6)=6/e and 4 log 2+24/e<12.
Therefore by integrating the counting function, sum_{p^k>Z,k>=2} log p/p^k <= integral_Z^infty A(t)/t^2 dt <=24/sqrt(Z). Since |f|<=3, the signed higher-power tail is bounded by 72/sqrt(Z).

From RUN25's exact linear centering (no appeal to a uniform PNT in progressions), for y<=Z,
    U(y) = -T(y) - y*Re(tailL(b,Z)+tailL(ab,Z)-tailL(a,Z))
           + y*sum_{p^k>Z,k>=2} f(p^k) log p/p^k.
This follows by expanding max(y/p-1,0)=y/p-min(1,y/p) and combining the finite prime and prime-power linear terms. Combining the estimates proves the claimed inequality. The extra terms are uniformly absorbable because 6eps/5<1/2, y>=Y and y/sqrt(Z)<=1 for Y>=1. In particular this supplies the signed prime-only budget, and RUN25 transfers it to S(y)<=U(y)+150y^(1/3).

## 4. What is and is not removed

The local signed proof uses two scalar finite-sum events (one per stage), rather than three primitive ramp events, and the d stage has one normalized coefficient instead of two; no individual Gd/Gqd bound is used in this local conclusion. The stronger native PairEx already has enough information to imply a similar signed result: it allows smaller tau at fixed eps by invoking pair_exists directly. The present argument makes the cancellation before the exceptional-set estimates and avoids invoking those individual G bounds. Not an unconditional independent validation of the native analytic suppliers. Not a global deletion of PairGood.bounds, ThinScales, VVle, tied-family, ASK-MAIN or geometric obligations. In particular BoundedTw.boundedTw and ShortNorms.supplyOfAdmOf consume individual character bounds. The original proof can preserve those separate events by intersecting with native good sets using smaller shares, but then no global count saving is claimed. No new zeta cancellation bound or proof of RH.

## 5. Provenance and actual regression

Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream H=75e2012dcc6f3093e223ef8d327b88395ff7d27c (2026-11-25 07:24:48 UTC), unchanged from RUN25. Directory listings at P and H: pairEx, StagePow, TailKExp, PrimeSetTwoBounds blobs differ; nine other named P paths were absent from the returned H listing (not evidence of semantic removal). No H source mixed into this proof.

Pinned blobs under src/Development/AutomorphicArithmetic/MeanSquareBounds:
- pairEx.lean 0020840fcf9b97e9e6e834c591e8516b9875e003
- PairExists.lean 7e63fdeda04264253733059bf951a4c1635cebaa
- PairShare.lean 712579c16be75074705a2c5c00f69e2f5d835cf9
- PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8
- StagePow.lean 2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7
- Stage1Succ.lean 79f79fe71e41f403a4d22e5b86540410748ac7c3
- CharOf.lean 3eeed8077330efa249cde313d99d89a7c09d8ba6
- meanSqK.lean 136f54f1321278b0ed23791fb2660ddd162bac97
- BadShare.lean 5cd176ccccf4c232a31c6f852536aa579320d4d3
- BoxOfS.lean 2744746f957268e351b72b7e971600b943f9ebdb
- CountBad.lean 48667a14c192c3bb8938a2f876ecf447dbd1753c
- TailKExp.lean 674d74e662e64a2fe4a6a814a3e7698d31e15f3b
- Kappa4Loglog.lean e7f65342e957fa42936e7d8223888312a8967462
- RowsOfMem.lean f9d738eb0e0dce29b14633183dcafe3e0db5cb0d
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc; hostExOneOf.lean 9a41aad79588464cd3363d15bbe53e327d6a06db; hostOfFieldOf.lean 261b566b0ea0d155ef1a434889d720c3b439735f. Under src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums: MSqCount.lean 6883d25c4f9fcd1dbe49b19e4dea23bfe8c87935 and TailFinal.lean 67d89c0b72c4a974e6618ebc119a712eaabd602b. BoundedTw, WinPairs, PairGood and ExistsPageN also read, see prior lane pins.

Executed local CPython regression, exit 0: 17,984 real primes, 53,952 coefficient checks, 269,760 exact rational ramp identities, 45 finite weighted sums (max float residual 2.842170943040401e-14), 18 finite higher-power tail checks (max partial tail*sqrt(Z)=1.3680876681590723), one negative control (p=7). These small pairs meet congruences only, NOT the actual asymptotic WinPair scales or d_small. No tests of the uniform analytic estimates or actual host existence. Lean/Lake absent from PATH. No kernel/CI replay. Independent audit requested.

Reproduce:
```python
from math import isqrt,log,sqrt,fsum
from fractions import Fraction as F
N=200000
s=bytearray(b'\1')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
    if s[p]:s[p*p::p]=b'\0'*((N-p*p)//p+1)
ps=[p for p in range(2,N+1) if s[p]]
def leg(n,p):
    if n%p==0:return 0
    return 1 if pow(n%p,(p-1)//2,p)==1 else -1
coeff=exact=windows=tails=0;maxerr=0.;maxratio=0.
for q,d in [(3,23),(11,263),(19,151)]:
    assert s[q] and s[d] and q%8==3 and d%16==7 and (d+1)%q==0
    ab=[(p,leg(p,q),leg(p,d),log(p)) for p in ps]
    for p,a,b,l in ab:
        k=F(1+a,2);assert 0<=k<=1
        assert b+a*b-a==2*k*b-a
        coeff+=1
        for y in (3,17,100,999,10000):
            w=min(F(1),F(y,p));assert (b+a*b-a)*w==2*k*b*w-a*w
            exact+=1
    for y in (3,17,100,999,10000):
        for Z in (10000,50000,200000):
            v=[(p,a,b,l*min(1,y/p)) for p,a,b,l in ab if p<=Z]
            full=fsum((b+a*b-a)*w for p,a,b,w in v)
            hq=fsum(a*w for p,a,b,w in v)
            hd=fsum((1+a)*b*w/2 for p,a,b,w in v)
            e=abs(full-(2*hd-hq));assert e<1e-9
            maxerr=max(e,maxerr);windows+=1
    terms=[]
    for p in ps:
        n=p*p
        while n<=N:terms.append((n,log(p)));n*=p
    for Z in (2,10,100,1000,10000,50000):
        t=fsum(l/n for n,l in terms if n>Z)
        assert t<=24/sqrt(Z)
        maxratio=max(maxratio,t*sqrt(Z));tails+=1
p=next(p for p in ps if leg(p,3)==1 and leg(p,23)!=0)
a,b=leg(p,3),leg(p,23)
assert b+a*b-a!=(1+a)*b/2-a
print(dict(primes=len(ps),coefficients=coeff,exact_ramps=exact,window_checks=windows,max_float_residual=maxerr,finite_tail_checks=tails,max_partial_tail_times_sqrt=maxratio,negative_control_prime=p))
```

RESUME HERE: the local signed auxiliary supplier now reduces to the actual native analytic leaves rather than an unspecified U estimate. Next trace BoundedTw.boundedTw's first output through supplyOfAdmOf/hostOfFieldOf into each surviving consumer: replace only those where the combined signed ramp suffices (or show the individual estimate is indispensable); alternatively independently audit meanSqK's exceptional-squarefree-mode estimate. HANDOFF TO mathematics, structure, audit, integration and editor. No change to prior work. RH OPEN.
