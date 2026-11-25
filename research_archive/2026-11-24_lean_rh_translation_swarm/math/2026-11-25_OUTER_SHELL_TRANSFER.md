# RH simplicity — exact outer-shell transfer and one-sided window criterion
25 November 2026. Status: human derivation, conditional RH reduction; actual finite calculation run in local CPython; no Lean replay or claim of unconditional RH or novelty. Resume prior 58e1c84e69703daf886f6b1764235c785f09d89f fractal shell and 057d61df7aaeecb3d64fec6fe11a3f94c05a8a39 centered discrepancy. Read AGENTS and current HANDOFF_QUEUE; no physics changes.

## Exact transfer
Let A(x)=sum_{n<=x}(Lambda(n)-1) (zero for 0<x<1), 1<r<=2, and B_r(x)=sum_{x/r<n<=x}(Lambda(n)-1)(2-x/n). The latter is exactly the outermost shell of the previously defined fractional-part kernel, since 1<=x/n<r<=2. Stieltjes integration by parts gives
 A(x)=B_r(x)+(2-r) A(x/r)+x int_{x/r}^x A(t)/t^2 dt.
No prime estimate is used. Divide by x^alpha, alpha>0, to get a positive transfer on A(x)/x^alpha with forcing B_r(x)/x^alpha and total mass
 q_alpha(r)=(2-r)r^(-alpha)+int_1^r u^(-alpha)du<1
 because (2-r)+(r-1)=1 and the weight u^(-alpha)<1 for u>1. For any X, negative-part weighted supremum M_X of A over 0<x<=X is finite and M_X<=N_X+q_alpha M_X, where N_X is corresponding negative-part supremum of B_r. Thus M_X<=N_X/(1-q_alpha); same with absolute values. This is a noncircular finite-interval resolvent bound, not an assumption of bounded A on the infinite interval. It does NOT bound B_r itself. q_alpha'(r)=-alpha*(2-r)r^(-alpha-1)<=0, so the best contraction in this restricted kernel class is r=2, not phi. At alpha=1/2, q_phi=0.8443224050289155, q_2=0.8284271247461903, q_(pi/e)=0.9354303377051861.

## Stronger result: the single outer shell suffices even on arbitrarily distant windows
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a, theorem Deduction.landau_window. This generic source theorem requires PoleData and WindowHypU; applying it to a different observable is a new human adaptation, not a claim that the source Main uses B_r or that it has been rechecked in Lean.

For Re(s)>1, by absolute convergence and the substitution x=nu,
 Phi_r(s)=int_1^infinity -B_r(x)x^(-s-1)dx
 = J_r(s)*(zeta(s)+zeta'(s)/zeta(s)),
 J_r(s)=int_1^r (2-u)u^(-s-1)du.
Endpoints of each n interval are immaterial to integration. J_r is entire by compact integration. Integration by parts gives
 s J_r(s)=1-(2-r)r^(-s)-int_1^r u^(-s)du.
For Re(s)>0, the modulus of the last two terms combined is strictly less than (2-r)+(r-1)=1. Therefore J_r(s) is nonzero everywhere in that half-plane. No zeta zero there can be canceled by the shell filter. At s=1 the simple poles of zeta and its log derivative cancel. At each zero rho of zeta with Re(rho)>0, Phi_r has simple pole with residue mult(rho)*J_r(rho), nonzero; zeros isolated. No positive real zeta zeros: Euler product for s>1, and zeta(s)=eta(s)/(1-2^(1-s)) for 0<s<1, eta(s)>0 by alternating terms. Thus the positive-real-pole residue condition in PoleData is vacuous. g(u)=-B_r(e^u) is measurable and |g(u)|<=e^u(u+1)<=e^(2u) for u>=0; its Laplace transform is Phi_r for Re(s)>2. These facts satisfy the human statement of PoleData.

For any fixed 0<theta<1, suppose there exist C>=0 and delta>0 such that for arbitrarily large Y,
 B_r(x)>=-C*x^theta throughout [Y,Y^(1+delta)].
Take U=log Y and R(u)=C*exp(theta*u) on [U,(1+delta)U]. The weighted integral is C*delta*U<=exp(eta*U) for every fixed eta>0 and sufficiently large U. This supplies WindowHypU with its exact quantifiers. The pinned generic landau_window implies Re(rho)<=theta for every positive-real-part zeta zero. If the premise holds for each theta=1/2+eps with 0<eps<1/2 (C,delta may depend on eps), the functional equation proves RH. Conversely RH gives the global bound |B_r(x)|=O(sqrt(x) log^2(2x)) by the classical RH Chebyshev estimate and integration by parts. This is an RH-equivalent single-shell target, NOT a solution or independent proof of the hard cancellation. No control of the smaller shells is needed. The one-sided window condition suffices directly via Landau; do not mistakenly use the finite-interval resolvent to extrapolate beyond a window.

## Local actual prime calculation
Sieve up to 5,000,000, 348,513 primes, all prime powers encoded; 1,400 integer sample points (401 log-spaced plus last 1000, with overlap). Double precision prefix sums and an independent direct sum at x=1000,100000,5000000. Observed:
r | q_(1/2) | min B/sqrt(x) | max B/sqrt(x) | max absolute transfer residual
pi/e | .9354303377051861 | -.9307234890264992 | .8469823010473181 | 3.8005652669426127e-7
phi | .8443224050289155 | -.5921375849552987 | .5816339046200288 | 4.883550968060035e-7
2 | .8284271247461903 | -.5892636921736972 | .6251048609734686 | 7.450187382573858e-7
A/sqrt(x) range [-.6035650061223717,.6082268566329456]. Direct-vs-prefix discrepancies <=2.42e-7. Floating roundoff, finite samples only, no asymptotic conclusion. CPython run exit 0; new CI not checked. Reproduce:
```python
import numpy as np, math
N=5_000_000
p=np.ones(N+1,dtype=bool);p[:2]=False
for i in range(2,math.isqrt(N)+1):
 if p[i]:p[i*i::i]=False
lam=np.zeros(N+1)
for prime in np.flatnonzero(p):
 j=int(prime);l=math.log(j)
 while j<=N:
  lam[j]=l;j*=int(prime)
d=lam[1:]-1
A=np.r_[0.,np.cumsum(d)]
W=np.r_[0.,np.cumsum(d/np.arange(1,N+1))]
n=np.arange(1,N,dtype=float)
I=np.r_[0.,np.cumsum(A[1:N]/(n*(n+1)))]
xs=np.unique(np.r_[np.geomspace(1000,N,401).astype(int),np.arange(N-999,N+1)])
print('N',N,'primes',np.count_nonzero(p),'samples',len(xs))
print('A/sqrt min max',np.min(A[xs]/np.sqrt(xs)),np.max(A[xs]/np.sqrt(xs)))
for r in [math.pi/math.e,(1+math.sqrt(5))/2,2.]:
 a=xs/r;k=np.floor(a).astype(int)
 B=2*(A[xs]-A[k])-xs*(W[xs]-W[k])
 integral=xs*(A[k]*(1/a-1/(k+1))+I[xs-1]-I[k])
 err=A[xs]-B-(2-r)*A[k]-integral
 q=(2-r)/math.sqrt(r)+2*(math.sqrt(r)-1)
 print('r',r,'gain',q,'B normalized range',np.min(B/np.sqrt(xs)),np.max(B/np.sqrt(xs)),'identity abs residual',np.max(abs(err)))
 for x in [1000,100000,N]:
  lo=math.floor(x/r); n=np.arange(lo+1,x+1)
  direct=np.sum(d[lo:x]*(2-x/n)); fast=2*(A[x]-A[lo])-x*(W[x]-W[lo]);print('direct',x,direct,fast,abs(direct-fast))
```
RESUME HERE: derive the lower bound for B_r on windows by independent arithmetic, ideally r=2 (optimal within the kernel class), compare actual prime power contribution versus primes alone and the native ASK-MAIN error supply. Do not count another equivalent restatement as completion. For this shell the contribution from higher prime powers is O(sqrt(x)) by Chebyshev's upper bound and summing over k>=2; hence only primes themselves require nontrivial one-sided cancellation. The full bound is not proven. HANDOFF TO RH math, landau, geometry, editor and audit lanes.
