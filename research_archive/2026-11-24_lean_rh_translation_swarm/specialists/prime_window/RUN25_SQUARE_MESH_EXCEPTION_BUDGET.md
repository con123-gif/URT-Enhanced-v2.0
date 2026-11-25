# RUN25 — RH-only square-mesh exception budget
25 Nov 2026. PARTIAL: unconditional arithmetic transfer, strictly relaxed sufficient test relative to pointwise checking at fixed exponent; no cancellation theorem proving the test. Mission lane 3, superseding RUN24 historical numerical branch. Read pinned ONE_EQUATION_MISSION e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 (blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d), AGENTS, protocol, queue, expansion, continuity/state/runner excerpts and latest kernel/acceleration/dependency handoffs (98209c0d, ce477f4e, a5911b27), peer outer-shell 596dc680, centered-discrepancy 057d61df, factorial blind modes 2be931e7, class-group 0dfa42f3. Not an exhaustive audit of all peer files. Latest general CI 45563874788 precedes this result.

## One new sufficient criterion
Let c=1-log 2 and D(x)=cx-sum_{x/2<p<=x}(2-x/p)log p. Fix 0<eps<1/2, theta=1/2+eps. It suffices to prove that for some fixed delta>0 and arbitrarily large integers N, M=floor(N^(1+delta)),
    
    #{ N<=n<M : D(n^2)>n^(1+2eps) } <= N^(2eps).     (*)

For every eps this implies RH. No need to establish pointwise control on the exceptional squares, even if their deficits are of order x. A count <=N^(2eps+o(1)) on such a sequence is also sufficient. We do NOT prove (*) here. This is a concrete sparse-exception target, not a claim that numerical verification of (*) proves RH. The analytic implication uses the prior peer's outer-shell Mellin argument, not an identification of this observable with the native all-character Gm.

## Proof (unconditional part)
Write W(x)=cx-D(x). For t>=1 and x>=t, each p in (t/2,t] contributes at x at least (2-x/p)log p (if it has left the band, the latter expression is nonpositive). New primes contribute nonnegatively. Thus
    D(x)-D(t) <= (c+sum_{t/2<p<=t} log(p)/p)(x-t) <= 6(x-t).
For the last bound, elementary binomial argument: theta_P(m)-theta_P(ceil(m/2))<=m log2 for integers m>=2, since all primes in that interval divide binomial(m,floor(m/2))<=2^m. Induction gives theta_P(m)<=4m log2 (m+4ceil(m/2)<=4m, m>=2), also for real t by flooring. Therefore band sum <=2 theta_P(t)/t<=8 log2 and c+8 log2=1+7 log2<6.

For x in [n^2,(n+1)^2] and n>=1, D_+(x)<=D_+(n^2)+18n since gap<=3n. Integration with the decreasing weight x^(-theta-1) gives the explicit inequality
    integral_{N^2}^{M^2} D_+(x) x^(-theta-1) dx
      <= 3 sum_{N<=n<M} D_+(n^2)/n^(2theta+1)
          +54 sum_{N<=n<M} n^(-2theta).
The mesh-error series converges for theta>1/2, uniformly O_eps(N^(-2eps)). Good nodes contribute at most 3/n; arbitrary bad nodes contribute at most 3c n^(-2eps) because W>=0. Consequently the integral is <=3(1+delta log N)+3c N^(-2eps) B+O_eps(N^(-2eps)), where B is the count in (*). Under (*) this is O_eps,delta(log N). If B<=N^(2eps+o(1)), it is N^o(1). All constants are independent of N and the location of the exceptional nodes.

To pass to the pinned Landau theorem, use g(u)=-B_2(exp u) from peer 596dc680, with B_2 centered von Mangoldt shell. The deterministic baseline sum of (2-x/n) over x/2<n<=x differs from its integral cx by at most 2 (bounded monotone right-endpoint sum and final fractional cell). Prime powers contribute nonnegatively, so g(log x)<=D(x)+2: no estimate for higher powers needed in this direction. Set R=max(g,0), U=2log N, delta'=delta/2. For large N, (N^2)^(1+delta')<=M^2. On [U,(1+delta')U], R is measurable, nonnegative and dominates g pointwise; the weighted integral is at most the above estimate +2 integral_{N^2}^infty x^(-theta-1)dx. This is <=exp(eta U) for every eta>0 eventually along the arbitrarily large N. This verifies the exact WindowHypU quantifiers, conditional on (*). Peer 596dc680 proves J_2(s)=integral_1^2 (2-u)u^(-s-1)du nonzero for Re(s)>0 and verifies the pole data for g (human adaptation). Applying landau_window excludes zeta zeros with Re>theta. Vary eps, then apply the functional equation. Conversely RH supplies D=O(sqrt(x) log^2(2x)) via the classical Chebyshev estimate, hence (*) eventually with no bad nodes; this is not a proof of the hard bound. No inference that (*) is easy or known unconditionally. If a zero with real part >theta exists, the contrapositive forces B>N^(2eps) in every sufficiently distant window for each fixed delta.

## Source provenance
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean, blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, PoleData L15–23, WindowHypU L25–29.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean, blob 7915058f10b33a52652290cd887cbccdc00e676a, landau_window_key L40–73, landau_window L83–84 (0<theta<1, delta>0).
Observed upstream head 246656fc62ac80c1214f48550138076c4f278569 (25 Nov 07:17:13 UTC). The WindowHypU statement survives textually at L66–70, blob f4c5124f8a0188f85b60b2687864d531f9c0a3d8. landau_window now L1153–55, blob c3ef70f724a72f916a4f17e1f3c52d73870e862a, omits explicit theta range assumptions; changed source, not mixed with pinned proof. No independent Lean replay or root reachability claim.

## Actual prime arithmetic check (local CPython/NumPy)
Sieved all integers to 4,000,000: 283,146 primes. Checked one-sided transfer at every integer x in [1,4000000] relative to its lower square, max excess over bound 0.0; four independent direct summations max discrepancy 8.62637534737587e-7 (double precision). Nine windows with eps .05,.1,.2 and N=10,100,500, M=min(2000,floor(N^1.3)) had zero bad squares, and midpoint approximations to the integrals were below the bound. Square D(n^2)/n range [-.4355648165197977,.8305422080965417]. For eps=.05 the integral approximations at N=10,100,500 were .259970652,.347236883,.294671741; bounds 28.2741435,44.6154305,38.0121265. Windows are finite/truncated and do not prove arbitrarily distant coverage; quadrature is not certified integration. Reproduce (standalone, actual executed):
```python
import math
import numpy as np
N=2000
X=N*N
isprime=np.ones(X+1,dtype=bool);isprime[:2]=False
for p in range(2,math.isqrt(X)+1):
    if isprime[p]:isprime[p*p::p]=False
primes=np.flatnonzero(isprime); logs=np.log(primes.astype(float))
P=np.r_[0.,np.cumsum(logs)]; H=np.r_[0.,np.cumsum(logs/primes)]
c=1-math.log(2)
def D(x):
    x=np.asarray(x,dtype=float)
    a=np.searchsorted(primes,x/2,side='right'); b=np.searchsorted(primes,x,side='right')
    return c*x-2*(P[b]-P[a])+x*(H[b]-H[a])
n=np.arange(1,N+1); ds=D(n*n)
max_excess=-math.inf
for a in range(1,X+1,100000):
    x=np.arange(a,min(a+100000,X+1)); k=np.sqrt(x).astype(int)
    excess=D(x)-ds[k-1]-6*(x-k*k)
    max_excess=max(max_excess,float(np.max(excess)))
    assert np.all(excess<=1e-7)
max_direct=0.
for x in [100,10000,1000000,X]:
    q=primes[(primes>x/2)&(primes<=x)]
    direct=c*x-math.fsum((2-x/int(p))*math.log(int(p)) for p in q)
    max_direct=max(max_direct,abs(float(D(x))-direct))
assert max_direct<1e-6
print('primes',len(primes),'integer transfer checks',X,'max excess',max_excess,'max direct residual',max_direct)
for eps in [.05,.1,.2]:
    theta=.5+eps
    for L in [10,100,500]:
        M=min(N,math.floor(L**1.3)); k=np.arange(L,M)
        vals=np.maximum(ds[k-1],0)
        bad=int(np.count_nonzero(vals>k**(1+2*eps)))
        q=3*math.fsum(vals/k**(2*theta+1))+54*math.fsum(k.astype(float)**(-2*theta))
        x=np.arange(L*L,M*M,dtype=float)+.5
        approx=math.fsum(np.maximum(D(x),0)*x**(-theta-1))
        assert approx<=q+1e-7
        print(f'eps={eps} L={L} M={M} bad={bad}/{M-L} budget={L**(2*eps):.6g} integral(midpoint)={approx:.9g} envelope={q:.9g}')
print('square D/n range',float(np.min(ds/n)),float(np.max(ds/n)))
```

RESUME HERE: derive an actual uniform upper bound for the bad-square count (*) using real prime arithmetic, or directly supply the weighted positive-part sum in the displayed integral estimate. In particular a bound for signed means alone is insufficient; it must control positive deficits. Do not pursue more reformulations unless they yield actual cancellation. Independent Landau/audit review requested of the mesh bound and exact window quantifiers. HANDOFF TO prime_window, Landau, audit, math, integration. No RH proof, kernel validation, URT test or speedup claimed. Prior work preserved.