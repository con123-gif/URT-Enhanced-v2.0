# Lane 13 — prime-jump energy transfer (25 Nov 2026)
RESULT: unconditional arithmetic inequality, conditional RH-only sufficient criterion; no new proof of RH. ONE_EQUATION_MISSION at e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 (blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d) governs. Read SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, state/runner/continuity excerpts, peer 596dc680 (outer shell), 057d61df (discrepancy), 2be931e7 (factorial blind modes), 0dfa42f3 (CountI), 7a9ec19f (square mesh), ce3c04a5 (quantitative Landau), 98209c0d and a5911b27 (kernel/dependency). Latest peer commit listing included 91a5aa50 (Green). Not an exhaustive peer archive reread. Earlier matched scheduler controls (93f6005c, 2ee3b645) do not establish a URT advantage, and there is no need for that heuristic in this argument. No Cathedral changes.

## One new inequality using only actual prime samples

Let c=1-log 2, W(x)=sum_{x/2<p<=x}(2-x/p)log p, D(x)=cx-W(x), d(x)=max(D(x),0). For 0<theta<1, define the post-jump prime budget

    S_theta(a,V)=sum_{a<p<=V} d(p) log(p) p^(-theta-1).

For all sufficiently large V>=2a, a>=1, the following unconditional bound holds:

    (1-theta)c integral_a^(V/2) d(x)x^(-theta-1) dx
      <= (2+3c*2^theta) S_theta(a,V)
         + sum_{a<p<=V} (log p)^2 p^(-theta-1).                 (E)

In particular the final sum is O_theta(a^(-theta) log^2(2a)), even summing over all integers. No assumptions on prime gaps or on the unknown signs of D at composite arguments. This transfer replaces the need to sample square meshes by a weighted sum at prime nodes; it does not estimate S itself.

Proof: W is piecewise affine and right continuous. It jumps upward by log p at p; at 2p the departing term is zero, so only the slope changes. Off these events, D'(x)=c+sum_{x/2<p<=x} log(p)/p >=c. Also 0<=d(x)<=cx since W>=0. Set F(x)=d(x)^2 and w(x)=x^(-theta-1). Between events the derivative of Fw is

    (Fw)'=2d D' w -(theta+1)d^2 w/x >= (1-theta)c d w.

At a prime p the downward jump in F is
    Delta_p=(D(p)+log p)_+^2-d(p)^2,
    0<=Delta_p<=2d(p)log p+(log p)^2.
The inequality holds even if D changes sign across p. Integrate the derivative over (a,b) and include all jumps a<p<=b (right-continuous endpoint convention). Then

    (1-theta)c integral_a^b d w
       <= F(b)w(b)-F(a)w(a)+sum_{a<p<=b} Delta_p w(p)
       <= F(b)w(b)+2 S_theta(a,V)+sum_{a<p<=V}(log p)^2 w(p)     (a<=b<=V).

The unconditional prime number theorem gives sum_{V/2<p<=V} log p >= V/3 for all sufficiently large V. Since V>=2a, choose b in this band minimizing d(p). From S_theta(a,V)>=V^(-theta-1) d(b) sum_{V/2<p<=V}log p we have d(b)<=3 V^theta S_theta(a,V). Thus F(b)w(b)<=c d(b)b^(-theta)<=3c*2^theta S_theta(a,V), using d(b)<=cb rather than squaring the bound on d(b). Since b>V/2, (E) follows. The only analytic input for endpoint choice is the unconditional PNT, no error rate or short-gap theorem.

## Consequence for the mission

For every eps in (0,1/2), put theta=1/2+eps. It suffices that for some fixed delta>0 and arbitrarily large Y, with V=Y^(1+delta), S_theta(Y,V)<=Y^o(1) (meaning there is an unbounded sequence with log(1+S)/log Y tending to zero). In particular a concrete sufficient sparse-exception test is

    sum_{Y<p<=Y^(1+delta), D(p)>p^theta} log p <= Y^(theta+o(1)).

Good primes contribute at most sum log(p)/p = O(1+log(V/Y)) by ordinary partial summation of the Chebyshev upper bound; bad ones contribute at most c Y^(-theta) times the displayed exceptional log mass. This is a sufficient test, not proved unconditionally here. No strict ordering between this and the square-mesh test is asserted.

By (E), the positive deficit integral on [Y,V/2] is subpolynomial in Y. For large Y this contains [Y,Y^(1+delta/2)]. Peer 596dc680 proves for g(u)=-B_2(exp u), B_2 the centered von Mangoldt outer shell, that g(log x)<=D(x)+2 and the Laplace multiplier is nonzero throughout Re(s)>0. The former inequality uses the monotone baseline error and the nonnegative higher-prime-power contribution. Set R(u)=max(g(u),0), U=log Y. Then R>=g, R>=0, R exp(-theta*u) integrable on the compact window; its integral is <= the bound in (E) plus 2Y^(-theta)/theta, hence <= exp(eta U) for every eta>0 on sufficiently distant members of the sequence. This verifies the original WindowHypU quantifiers, conditional on the prime budget. The pinned generic landau_window (with 0<theta<1, fixed positive delta/2, and full PoleData supplied as in 596dc680) excludes zeros Re>theta. Vary eps and reflect by the functional equation to obtain RH. Conversely RH implies the global classical Chebyshev bound O(sqrt(x)log^2(2x)), and partial summation gives D=O(sqrt(x)log^2(2x)), so the sparse test eventually has no exceptions. No deduction from finite data to this asymptotic test.

Optional consequence of peer ce3c04a5's quantitative obstruction: if a zero has beta>theta, then for each fixed delta>0 and every b<(1+delta)(beta-theta), S_theta(Y,Y^(1+delta))>=Y^b eventually (apply the peer bound on any fixed shorter window, then (E); choose a strictly larger intermediate exponent to absorb constants). This is conditional on the peer analytic lemma, not an independently rechecked kernel fact.

## Failed simplifications / negative controls
Dropping endpoint energy from the finite-window inequality fails: the actual prime-free interval (2,2.9] has positive D on a nonempty subinterval and no jumps. Dropping the squared-log term from the pointwise jump majorant fails at p=3: D(3)<0 but D(3-)>0, so the linear post-jump term is zero while Delta_3>0. Both checked below. No inference from signed means, uniform residue-class distribution, or URT ranking to the prime budget.

## Source and execution
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, inspected source:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean, blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872: PoleData, WindowHypU.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean, blob 7915058f10b33a52652290cd887cbccdc00e676a: landau_window, landau_window_key.
Observed upstream head 75e2012dcc6f3093e223ef8d327b88395ff7d27c (25 Nov 07:24:48 UTC), corresponding blobs f4c5124f8a0188f85b60b2687864d531f9c0a3d8 and c3ef70f724a72f916a4f17e1f3c52d73870e862a; WindowHypU text retained, landau_window now drops explicit theta range premises using a separate proof. No mixing revisions. (E) is a human arithmetic derivation, not a theorem claimed to occur in Lean. Lean and Lake not found on local PATH. No independent kernel or axiom verification. General Cathedral CI checkpoint #426, run 45563874788, passed before this contribution; not this result's CI.

Actual CPython/NumPy certificate (exit 0): primes 78498, windows 15, affine intervals integrated 334680, max identity residual 6.707613251725336e-15, min finite energy slack 0.009456364174168876, min transfer slack 0.02099488869104122. Two negative controls: terminal deficit 0.5086422270681886, pre/post p=3 0.5739848680401918 / -0.524627420627918. Integration is floating-point Gauss-Legendre quadrature on positive affine pieces, not rigorous numeric integration. Six direct sum controls. Analytic proof gives (E); finite tests only check implementation and sanity.

Reproduce (executed):
~~~python
import math
import numpy as np
from numpy.polynomial.legendre import leggauss
N=1_000_000
s=np.ones(N+1,dtype=bool); s[:2]=False
for p in range(2,math.isqrt(N)+1):
    if s[p]: s[p*p::p]=False
p=np.flatnonzero(s); l=np.log(p.astype(float)); L=np.r_[0.,np.cumsum(l)]; H=np.r_[0.,np.cumsum(l/p)]
c=1-math.log(2)
def D(x):
    x=np.asarray(x,dtype=float)
    a=np.searchsorted(p,x/2,side='right'); b=np.searchsorted(p,x,side='right')
    return c*x-2*(L[b]-L[a])+x*(H[b]-H[a])
def v(x):
    a=np.searchsorted(p,x/2,side='right'); b=np.searchsorted(p,x,side='right')
    return c+H[b]-H[a]
# Independently evaluate finite prime sum at a few points.
for x in [2.,2.9,3.,101.5,10000.,999999.5]:
    q=p[(p>x/2)&(p<=x)]
    true=c*x-math.fsum((2-x/int(k))*math.log(int(k)) for k in q)
    assert abs(float(D(x))-true)<2e-7
# Event breakpoints include both jumps at p and slope changes at 2p.
# For a fixed window integrate each positive affine piece with Gauss-Legendre.
z,w=np.polynomial.legendre.leggauss(8)
worst=0.; min_slack=math.inf; min_transfer_slack=math.inf; windows=0; intervals=0
for theta in [.55,.65,.85]:
    for a,V in [(10,100),(100,1000),(1000,10000),(10000,100000),(100000,1000000)]:
        qs=p[(p>a)&(p<=V)]; ds=np.maximum(D(qs),0); logs=np.log(qs.astype(float))
        S=math.fsum(ds*logs*qs.astype(float)**(-theta-1))
        r=qs>=V/2; assert np.any(r)
        b=int(qs[r][np.argmin(ds[r])]); mass=math.fsum(logs[r]); assert mass>=V/3
        # Finite bound on endpoint using exactly the observed mass.
        assert float(max(D(b),0))<=S*V**(theta+1)/mass+1e-8
        def integrate(a,b):
            e=np.unique(np.r_[a,p[(p>a)&(p<b)],2*p[(2*p>a)&(2*p<b)],b]).astype(float)
            lo=e[:-1]; hi=e[1:]; m=v(lo); d=D(lo)
            assert np.all(m>=c-1e-12)
            t=np.minimum(hi,lo+np.maximum(-d,0)/m); mid=(t+hi)/2; half=(hi-t)/2
            x=mid[:,None]+half[:,None]*z; y=np.maximum(d[:,None]+m[:,None]*(x-lo[:,None]),0.)
            f=x**(-theta-1)
            I=math.fsum(half*np.sum(w*y*f,axis=1))
            J=math.fsum(half*np.sum(w*(2*m[:,None]*y*f-(theta+1)*y*y*f/x),axis=1))
            return I,J,len(lo)
        I,J,k=integrate(a,b); intervals+=k
        q=qs[qs<=b]; d=D(q); logs=np.log(q.astype(float)); wq=q.astype(float)**(-theta-1)
        jumps=math.fsum((np.maximum(d+logs,0)**2-np.maximum(d,0)**2)*wq)
        jump_upper=math.fsum((2*np.maximum(d,0)*logs+logs**2)*wq)
        F=lambda x: max(float(D(x)),0)**2*x**(-theta-1)
        residual=abs(J-jumps-(F(b)-F(a)))
        worst=max(worst,residual)
        assert residual<2e-7
        slack=F(b)+jump_upper-(1-theta)*c*I
        min_slack=min(min_slack,slack);assert slack>=-1e-10
        Ihalf,_,k2=integrate(a,V/2);intervals+=k2
        E=math.fsum(np.log(qs.astype(float))**2*qs.astype(float)**(-theta-1))
        rhs=(2+3*c*2**theta)*S+E
        slack2=rhs-(1-theta)*c*Ihalf
        assert slack2>=-1e-10;min_transfer_slack=min(min_transfer_slack,slack2)
        windows+=1
print('primes',len(p),'windows',windows,'affine intervals integrated',intervals)
print('max identity residual',worst,'min finite energy slack',min_slack,'min transfer slack',min_transfer_slack)
# Actual-prime controls: cannot discard terminal energy or squared log jump.
assert D(2.9)>0 and not np.any((p>2)&(p<=2.9))
assert D(3)<0 and D(3)+math.log(3)>0
print('negative controls 2: terminal deficit',float(D(2.9)),'pre/post p=3',float(D(3)+math.log(3)),float(D(3)))
~~~

RESUME HERE: obtain an actual subpolynomial upper bound for S_theta(Y,Y^(1+delta)) on arbitrarily distant windows, using native prime arithmetic; specifically test whether a one-sided estimate for the correlated weighted sum at prime endpoints can be proved without replacing signed quantities by absolute values. No claim that the criterion is easier in asymptotic strength or has been proved. If no such estimate, pursue the existing native CountI/ASK-MAIN supplier rather than repeatedly compressing equivalent RH formulations.
HANDOFF TO prime-window, Landau, formal audit and integration lanes for independent review of (E) and the exact remaining budget. RH status OPEN.
