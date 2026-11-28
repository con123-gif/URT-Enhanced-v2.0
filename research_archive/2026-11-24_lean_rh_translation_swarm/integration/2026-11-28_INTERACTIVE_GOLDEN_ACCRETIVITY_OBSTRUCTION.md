# Independent RH route — actual divisor operator: positive primitive but failure of accretivity
28 November 2026. Continuation of 85376a1faf464a3ae86bf1927a575023d361140e (exact prior source retrieved) and f4d07d80ea84d8249178211cfd513e8ffc913e6b. This is a proved local structural property and a numerical interval counterexample with analytic remainder to one proposed stability method. No RH proof, no new zero-free region, no native Lean replay, no worker/schedule changes.

## 1. Actual primitive is strictly positive uniformly
With V=A*(delta_0-E_-), X=exp(u)>=1, N=floor X, direct integration of the actual measure gives
 v(u)=V([0,u])=2N/sqrt(X)-sum_{n<=N} 1/sqrt(n).
Integral comparison for the decreasing function x^-1/2 gives
 2sqrt(N+1)-2 <= sum_{n<=N} 1/sqrt(n) <= 2sqrt(N)-1.
Therefore v(u)<=2, and v(u)>=1-2sqrt(N)(1-sqrt(N/X)).
For N>=2, X<N+1 and
 2sqrt(N)(1-sqrt(N/(N+1))) <= 1/sqrt(N) <= 1/sqrt(2),
using 1-(1+t)^(-1/2)<=t/2 for t>=0. For N=1 the exact expression is 2/sqrt(X)-1>=sqrt(2)-1. Thus
  1-1/sqrt(2) <= v(u) <= 2.
This is unconditional and uses actual integer atoms. Nevertheless a positive cumulative primitive does not guarantee that the Laplace transform Vhat(s)=s Laplace(v)(s) is accretive in the right half-plane.

## 2. Actual counterexample to positive-real / scalar accretivity
The prior exact transform is Vhat(s)=(s-1/2)/(s+1/2)*zeta(s+1/2). Choose s=1/100+166i/5 and z=s+1/2=51/100+166i/5. Re s>0. We bound Re Vhat(s) by Euler–Maclaurin, NOT by assuming zeta has no zeros.
For sigma=Re z>0 and integer N>=1:
 Z_N=sum_{n=1}^{N-1}n^(-z)+N^(1-z)/(z-1)+N^(-z)/2+z N^(-z-1)/12,
 |zeta(z)-Z_N|<=|z(z+1)| N^(-sigma-1)/(12(sigma+1)).
This follows from Euler–Maclaurin with the periodic second Bernoulli polynomial |B_2({x})|<=1/6; the tail integral is bounded absolutely by integrating |z(z+1)| x^(-sigma-2)/12. First derive for Re z>1, then continue to Re z>0 away from z=1 by convergence of the remainder. Multiply error by |(z-1)/z|.

Actually executed in CPython mpmath interval arithmetic at 40 decimal digits:
```python
from mpmath import iv
iv.dps=40
z=iv.mpc(iv.mpf(51)/100,iv.mpf(166)/5); N=1000
S=sum((iv.exp(-z*iv.log(n)) for n in range(1,N)),iv.mpc(0))
S+=iv.exp((1-z)*iv.log(N))/(z-1)+iv.exp(-z*iv.log(N))/2+z*iv.exp((-z-1)*iv.log(N))/12
err=abs(z*(z+1))*iv.exp((-z.real-1)*iv.log(N))/(12*(z.real+1))
f=(z-1)/z
v=f*S; e=abs(f)*err
print(v.real, e, v.real.a-e.b, v.real.b+e.b)
assert v.real.b+e.b < -iv.mpf(12)/100
```
Executed output (before the displayed final assertion, equivalent numerical comparison):
Re f*S in [-0.130425812748243351128410938369386313487528439,-0.130425812748243351128410938369386313122935779].
Error upper 0.00179727278450334836408505523201454375699250926.
Therefore Re Vhat(s) in [-0.133,-0.128], with ample slack. This is a numerical interval evaluation with explicit analytic truncation bound, not a formal Lean certificate. The result tests the ACTUAL operator, not a synthetic substitute.

## 3. Consequence
No proof of Re Vhat(s)>0 throughout Re s>0 is possible. No constant complex rotation makes Re(e^(i theta) Vhat(s)) strictly positive throughout that half-plane either: on s=1, Vhat(1)>0 requires cos(theta)>0, while at the above conjugate pair the sum of the rotated real parts is 2 cos(theta) Re Vhat(s)<0, so at least one is negative. This does not show a zero of Vhat(s); negative real part is not zero. It rules out a specific elementary coercivity approach even with strictly positive primitive.

RESUME: no independent signed inverse bound has been found; neither absolute-norm stability (prior checkpoint) nor scalar accretivity (this checkpoint) can close it. A nontrivial frequency-dependent arithmetic cancellation argument would be required. Do not claim progress toward RH merely from more equivalent criteria or finite computations. Preserve the main compact proof work and the independent route as open.