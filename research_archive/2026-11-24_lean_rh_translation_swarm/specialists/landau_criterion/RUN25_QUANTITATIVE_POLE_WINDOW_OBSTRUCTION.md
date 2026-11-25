# RUN25 — quantitative Landau obstruction on every distant window
25 Nov 2026. Mission lane 4. RESULT: rigorous human conditional obstruction and independent review of prime RUN25; not RH closure, not a new arithmetic cancellation estimate, no novelty or Lean/URT verification claim.

Preflight: pinned ONE_EQUATION_MISSION e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity/runner/state excerpts and latest relevant peer handoffs 7a9ec19f, 98209c0d, a5911b27, ce477f4e, prior Landau RUN24, outer-shell 596dc680 and single discrepancy 057d61df. General CI run 45563874788 precedes this note and is not its verification. Not an exhaustive reread of every peer archive or external blueprint.

## Result: quantitative necessary consequence of an off-line zero
Write W(x)=sum_{x/2<p<=x}(2-x/p) log p, D(x)=(1-log 2)x-W(x), D_+=max(D,0). For ANY zeta zero rho0=beta+i*tau with beta>theta, 0<theta<1, and every fixed delta>0:
    liminf_{Y->infty} log(1+integral_Y^{Y^(1+delta)} D_+(x) x^(-theta-1) dx)/log Y
        >= (1+delta)(beta-theta).
In particular a zero off the critical line cannot merely cause isolated bad sample points: it forces positive-deficit mass at polynomial scale in EVERY sufficiently distant window. The proof is a quantitative adaptation of the pinned Landau moment argument, not an assertion that this stronger statement is already in Lean or novel in the literature.

## Proof
Let B(x)=sum_{x/2<n<=x}(Lambda(n)-1)(2-x/n), g(u)=-B(exp u). Peer 596dc680 proves that Phi(s)=J(s)(zeta(s)+zeta'(s)/zeta(s)) is its Laplace transform, with J(s)=int_1^2 (2-v)v^(-s-1)dv, entire, and sJ(s)=1-int_1^2 v^(-s)dv. For Re(s)>0 the integral has modulus strictly less than one, hence J(s) != 0. The s=1 poles cancel, each positive-real-part zeta zero gives a genuine simple pole of Phi with residue mult(rho)J(rho). There are no poles on the positive real axis: Euler product for s>1, alternating eta for 0<s<1. Zeros are isolated, Re(rho)<=1; g is measurable with |g(u)|<=C0 exp(2u) for u>=0. The exact source PoleData is satisfied in the human interpretation. No assumption about RH is made.

1. Choose any c in (1,1+delta) and l >= max((2c+1)/(c-1),(2c+1)/(1+delta-c)). For arbitrarily large fixed sigma choose
    sigma >= max(2+l+2c(2+l)^2, 2c(l-2)^2, 3).
Put a_-=sigma-2-l, a_+=sigma-2+l, k=ceil(c sigma U), U>=1. Both a_±>0. The source Chernoff estimate, obtained by multiplying the tails by exp(l(u-V)) or exp(l(U-u)), V=(1+delta)U, gives
    T = integral_(0,infty) outside [U,V] u^k exp(-(sigma-2)u)/k! du
      <= exp(-lV)/a_-^(k+1)+exp(lU)/a_+^(k+1).
Use log(1+x)<=x for x>-1. The coefficients of U in the exponents after multiplying by sigma^k are bounded by
    -l(1+delta)+c sigma(2+l)/a_- <= -1+c(2+l)^2/a_- <= -1/2,
    l+c sigma(2-l)/a_+ <= -1+c(l-2)^2/a_+ <= -1/2.
The ceiling adds at most log(sigma/a_-) to the right-tail exponent and does not increase the left-tail exponent. Thus T<=C sigma^(-k) exp(-U/2) with C=sigma/a_-^2+1/a_+. Crucially sigma may be made arbitrarily large; the original existence theorem landau_tails alone does not state this freedom.

2. Take sigma large enough that |sigma-rho0|<sigma-theta. Let D0 be the nearest distance from sigma to a pole. It is attained, since the closed disk of radius |sigma-rho0| lies in Re>0 and contains a finite nonempty pole set. A minimizing pole rho1 is nonreal, so sigma-Re(rho1)<D0. Shift the center to sigma+i Im(rho1), then perturb its imaginary part slightly to obtain a unique nearest pole rho with d=|z-rho|<D0. Justification: in a slightly enlarged compact disk of radius D0 around the shifted center there are finitely many poles; for each distinct pair, equal-distance centers on Re=sigma occur at most once (if imaginary parts agree, never, since all Re<sigma). Avoid these finitely many ties while retaining the strict distance bound; poles outside the enlarged disk cannot compete. Choose d<e<D0 with the disk of radius e about z containing only rho, and a slightly larger such radius still below D0. The real-center disk of radius D0 has no poles. Cauchy estimates for the pole-subtracted holomorphic function and the real-center holomorphic function then imply, writing A_k(z)=(-1)^k Phi^(k)(z)/k!,
    |A_k(z)|+Re A_k(sigma) >= |Res(Phi,rho)|/d^(k+1) - M/e^k.
The residue is nonzero and all constants are fixed independently of U.

3. By the Laplace identity and differentiation under the integral (dominated by polynomial times exp(-(sigma-2)u)), the left side is at most
    2 integral_0^infty g_+(u) u^k exp(-sigma u)/k! du.
This uses |g|+g=2g_+, not a bound for a signed mean. For E=sigma-theta, u^k exp(-Eu)/k!<=E^(-k) by the exponential series. Split the integral into [U,V] and its tails, and let L(U)=integral_U^V g_+(u) exp(-theta u)du. Combining the two bounds,
    2 L(U) >= (|Res|/d)(E/d)^k - M(E/e)^k - 2 C0 C (E/sigma)^k exp(-U/2).
Since d<e and d<E<sigma, the first term dominates for every large U. Therefore L(U)>=exp(bU) eventually for every b<c sigma log(E/d).

4. The choice sigma can be enlarged before step 2. We have d<D0<=|sigma-rho0|<=sigma-beta+tau^2/(2(sigma-beta)). Also log(E/d)>=(E-d)/E. Consequently for any b<c(beta-theta) we can choose sigma sufficiently large so c sigma log(E/d)>b. Taking c arbitrarily close to 1+delta gives L(U)>=exp(bU) eventually for each b<(1+delta)(beta-theta). Constants and thresholds may depend on b, delta, theta and the hypothetical zero. No uniformity in these parameters is asserted. Finally g(log x)<=D(x)+2 by the bounded monotone baseline Riemann-sum error (<=2) and nonnegative higher-prime-power terms, so the corresponding positive-part integral of D differs on the lower-bound side by at most 2Y^(-theta)/theta. Taking U=log Y and allowing a strictly smaller b proves the displayed liminf. The liminf uses all sufficiently large real Y, not a subsequence. QED.

## Independent peer audit and consequence for sparse bad squares
Prime RUN25 at 7a9ec19f (blob 789dae1d3cd9e8656f7820f4241c5a6b56b6fc91) correctly uses a one-sided Lipschitz bound: D(x)-D(t)<=6(x-t), t<=x, hence its mesh integral inequality and upper bound by O(log N)+3(1-log 2)N^(-2eps)B_N follow. Its proof's passage from [N^2,M^2] to a fixed shorter log window avoids the floor issue. No signed cancellation was inferred. I found no error in this human implication.

The quantitative result strengthens the necessary bad-square count. Set theta=1/2+eps, eps in (0,1/2), and for fixed delta>0 let B_N count n in [N,floor(N^(1+delta))) with D(n^2)>n^(2theta). If beta>theta, then for every lambda<(1+delta)(2beta-1), B_N>=N^lambda eventually. To see this first apply the previous lower bound on a shorter window [N^2,(N^2)^(1+delta')] with 0<delta'<delta and the mesh upper bound. For any 0<b<(1+delta')(beta-theta), eventually B_N>=const*N^(2eps+2b). To sharpen, restrict to late subwindows starting at K=ceil(N^t), 1<t<1+delta, with fixed small h>0 satisfying t(1+h)<1+delta. Its bad squares are a subset of B_N. The preceding inequality gives B_N>=const*K^(2eps+2b) for any b<(1+h)(beta-theta). Taking t close to 1+delta and h small yields every strict exponent lambda<(1+delta)(2beta-1). All floor endpoints are absorbed by the strict inequalities. This is a necessary consequence of a hypothetical off-line zero, not an unconditional upper bound for the count. It quantifies the actual arithmetic obstruction a proof of the mission equation must overcome.

## Reproducible checks (actual local CPython run, exit 0)
The following exact rational tests check the two tail margins and explicit pole-distance sufficient condition; no synthetic poles are treated as zeta zeros, and no finite computation proves the analytic statement. Output: tail rate cases 72 pole distance / exponent cases 7776 invalid premise controls 2.

```python
from fractions import Fraction as Q
from math import ceil
n=0; m=0
for delta in map(Q,['1/8','1/4','1/2','1','2','4']):
 for f in map(Q,['1/4','1/2','3/4']):
  c=1+f*delta
  l=max((2*c+1)/(c-1),(2*c+1)/(1+delta-c))
  for j in [0,1,10,100]:
   s=Q(ceil(max(2+l+2*c*(2+l)**2,2*c*(l-2)**2,3))+j)
   assert s>2+l
   assert -l*(1+delta)+c*s*(2+l)/(s-2-l)<=Q(-1,2)
   assert l+c*s*(2-l)/(s-2+l)<=Q(-1,2)
   n+=1
   for theta in map(Q,['1/2','3/5','3/4']):
    for beta in [theta+(1-theta)/4,theta+(1-theta)/2,theta+3*(1-theta)/4]:
     for gamma in map(Q,['1/10','1','10','100']):
      for frac in map(Q,['1/4','1/2','3/4']):
       a=frac*c*(beta-theta)
       gap=beta-theta-a/c
       S=max(s,Q(ceil(beta+gamma**2/(2*gap))+1))
       q=S-beta+gamma**2/(2*(S-beta))
       assert q*q>=(S-beta)**2+gamma**2
       E=S-theta
       assert 0<q<E and c*S*(E-q)/E>a
       m+=1
assert Q(3)>2 and Q(3)<=2+8
assert not Q(3,4)-Q(3,4)>0
print('tail rate cases',n,'pole distance / exponent cases',m,'invalid premise controls',2)
```

## Pinned source provenance
Upstream leanprover-community/riemann-hypothesis commit 40e56bab026552e089d7afcfeff08d2defb9c005. Connector fetched each exact blob:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean: 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (PoleData, WindowHypU).
- Under the same directory LandauTheorems/: landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a (landau_window, key); landauTails.lean 0e55797bac5320acf02d9acc832ca53df716e436 (landau_tails_chernoff, landau_tails_pow, landau_tails); landauWindowIneq.lean cda93b0185260d72395d2ef2c90314e0fa7128ef; LandauNearest.lean 6a177498987e1ef453727131bf2004bc797a01a2; LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b; LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7; LandauCoeff.lean dc8287f2dbe7c767dcb77893eaf53d07092ed1f3; LandauKernelMax.lean b230a9e40c3710eac205f32ceb8a44f2d003b647.
- Latest observed upstream 246656fc62ac80c1214f48550138076c4f278569, 25 Nov 07:17:13 UTC. PoleData and WindowHypU in f4c5124f8a0188f85b60b2687864d531f9c0a3d8 at L56,66; merged landauWindow.lean c3ef70f724a72f916a4f17e1f3c52d73870e862a includes nearest L417, tails L753, window inequality L881, window theorem L1153. No mixing of latest proof with pin. No Lean kernel replay.

RESUME HERE: Prime/math lanes should try to derive a subpolynomial weighted positive-deficit integral on arbitrarily distant windows, or an unconditional sparse-square bound beating the above necessary exponent; use actual arithmetic estimates, not signed means or finite samples. Landau lane should independently seek a shorter analytic implication only when it materially changes the arithmetic workload, otherwise help solve cancellation. Audit lane please independently check the adjustable sigma tail estimate, nearest-pole argument and late-subwindow exponents. HANDOFF TO prime_window, math, audit, integration. RH remains OPEN. No URT used.
