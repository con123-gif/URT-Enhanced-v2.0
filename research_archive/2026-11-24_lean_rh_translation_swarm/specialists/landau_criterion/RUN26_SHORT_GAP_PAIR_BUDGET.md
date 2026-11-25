# RUN26 — unconditional removal of the short-gap prime-pair budget
25 Nov 2026. Lane 4, RH-only. Partial arithmetic theorem, human derivation, RH OPEN. No extra manuscript or equivalent-criterion-only claim.

Preflight: original mission e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 (blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d), updated mission 65e356f7 (blob 53c976376d18b9f2933487a9d86c681fead05cf8), AGENTS, SWARM, HANDOFF, EXPANSION, continuity, runner and research state excerpts, RUN25, recent 50-commit list up to d54c3102, peer prime RUN26 003dfd86, editor 4f64844a, integration 91c8057c, and outer shell / single discrepancy notes. General CI #429 (45570955508) predates this result. Not an exhaustive historical peer reread. Prime RUN26 rejects the floor-quotient mean-square supplier and asks to isolate actual near-diagonal contribution; this is that next step, not another mesh.

## Exact cancellation and actual unconditional estimate
Let c=1-log 2, W(x)=sum_{x/2<p<=x}(2-x/p)log p, D(x)=cx-W(x). Take integer X>=2, integer H>=1, P={p prime: X/2<p<=2X}. Set a=max(X,p,q), b=min(2X,2p,2q).
Define K_X(p,q)=0 when b<=a; otherwise
    K_X(p,q)=4(b-a)-(1/p+1/q)(b^2-a^2)+(b^3-a^3)/(3pq).
For each p set a_p=max(X,p), b_p=min(2X,2p),
    L_X(p)=b_p^2-a_p^2-(b_p^3-a_p^3)/(3p).
Endpoint choices in the integrals have measure zero. The kernels are exact integrals of the two overlapping ramps and of x times one ramp respectively; 0<=K<=X. Expanding D^2 BEFORE bounding gives
    integral_X^(2X) D(x)^2 dx = S_H(X)+R_H(X),
    S_H = sum_{p,q in P, |p-q|<=H} log(p)log(q) K_X(p,q),
    R_H = sum_{p,q in P, |p-q|>H} log(p)log(q) K_X(p,q)
          -2c sum_{p in P} log(p)L_X(p) +(7/3)c^2 X^3.
All pair sums ordered. This is an identity, not a heuristic correlation model.

**Unconditional partial bound:** 0<=S_H(X)<=C X^2 (2H+1)log(2X), with absolute C. Indeed 2 log(p)log(q)<=log(p)^2+log(q)^2 and each fixed integer p has at most 2H+1 integer q at distance <=H. Thus S_H<=X(2H+1)sum_{p<=2X}log^2(p). The elementary Chebyshev upper bound sum_{p<=t}log p=O(t) implies sum log^2(p)=O(X log(2X)). No prime-pair distribution hypothesis, no zero information. For each fixed eps in (0,1/2), take H=floor(X^eps); then S_H=O_eps(X^(2+2eps)). This removes ALL near-diagonal pairs up to this polynomial separation from the required cancellation budget, without estimating their individual correlations or assuming a prime-pair conjecture. It is a bound on their contribution, not a solution of the remaining signed far-pair sum.

## Exact implication and remaining one-sided long-range bound
It suffices, for each eps, that on arbitrarily distant consecutive dyadic blocks X=2^j, j=J,...,floor((1+delta)J)-1, some fixed delta>0 and C_eps give R_floor(X^eps)(X)<=C_eps X^(2+2eps). No lower bound on R is needed; it can be negative. Then the exact identity gives integral D^2 <=C'_eps X^(2+2eps). At theta=1/2+eps, Cauchy-Schwarz yields
    integral_X^(2X) D_+(x)x^(-theta-1) dx
       <= (integral D^2)^(1/2) (integral x^(-2theta-2))^(1/2) = O_eps(1).
Sum over O(J) complete dyadic blocks. For large J their union covers [Y,Y^(1+delta/2)] with Y=2^J, so the weighted positive-part integral is O_eps(log Y) there. The direct prime-only adapter in peer 4f64844a, with Phi(s)=F((s+1)/2)/2, theta'=2eps in (0,1), U=log Y/2, R(u)=max(exp(-u)D(exp(2u)),0), gives the exact WindowHypU quantifiers: fixed delta/2 before eta, and O(U)<=exp(eta U) for every eta>0 and arbitrarily large U. Pole data and Mellin noncancellation from that peer unchanged; no real exceptional zeta zeros in Re>1/2. The pinned Landau theorem and functional equation then give RH. No such long-range estimate is proved here. This partial estimate makes no claim to improve the logical strength of the existing prime-window condition; its benefit is eliminating one explicit arithmetic subproblem and the prime-power/composite-pair terms. Do not bound the three terms of R separately at RH scale: they are of cubic scale and their signed cancellation is the remaining issue.

## Executed certificate
Actual local CPython, exit 0. Rational integration kernel against exact Simpson rule for quadratic polynomial; then true primes by sieve, direct independent piecewise-affine integration of D^2 versus pair expansion. Float log arithmetic not interval-certified. Near bound tested using H=floor(sqrt X) (a regression choice, not an asymptotic claim at that exponent). Code:
```python
from math import log,isqrt,fsum,isclose
from fractions import Fraction as Q
def K(X,p,q):
 a=max(X,p,q); b=min(2*X,2*p,2*q)
 if b<=a:return Q(0)
 return 4*(b-a)-Q(p+q,p*q)*(b*b-a*a)+Q(b**3-a**3,3*p*q)
def S(X,p,q):
 a=max(X,p,q); b=min(2*X,2*p,2*q)
 if b<=a:return Q(0)
 a,b=Q(a),Q(b);w=lambda x:(2-x/p)*(2-x/q)
 return (b-a)*(w(a)+4*w((a+b)/2)+w(b))/6
n=0
for X in range(2,32):
 for p in range(max(1,X//2),2*X+1):
  for q in range(max(1,X//2),2*X+1):
   assert K(X,p,q)==S(X,p,q) and 0<=K(X,p,q)<=X
   n+=1
print('exact kernel checks',n)
c=1-log(2)
for X in [16,64,256,1024]:
 N=2*X;isprime=bytearray(b'\1')*(N+1);isprime[:2]=b'\0\0'
 for p in range(2,isqrt(N)+1):
  if isprime[p]:isprime[p*p::p]=b'\0'*((N-p*p)//p+1)
 P=[p for p in range(X//2+1,N+1) if isprime[p]]
 H=isqrt(X);near=[];far=[];one=[]
 for i,p in enumerate(P):
  a=max(X,p);b=min(N,2*p)
  one.append(log(p)*float(Q(b*b-a*a)-Q(b**3-a**3,3*p)))
  for q in P[i:]:
   val=(1 if p==q else 2)*log(p)*log(q)*float(K(X,p,q))
   (near if q-p<=H else far).append(val)
 Eshort=fsum(near);Elong=fsum(far)-2*c*fsum(one)+c*c*7*X**3/3
 terms=[]
 for j in range(X,N):
  active=[p for p in P if j//2<p<=j]
  a=c*j-fsum(log(p)*(2-j/p) for p in active)
  b=c*(j+1)-fsum(log(p)*(2-(j+1)/p) for p in active)
  terms.append((a*a+a*b+b*b)/3)
 E=fsum(terms); bound=X*(2*H+1)*fsum(log(p)**2 for p in P)
 assert 0<=Eshort<=bound and isclose(Eshort+Elong,E,rel_tol=1e-8,abs_tol=1e-7)
 print('X',X,'H',H,'primes',len(P),'short',format(Eshort,'.9g'),'long_net',format(Elong,'.9g'),'energy',format(E,'.9g'),'bound',format(bound,'.9g'),'residual',format(abs(Eshort+Elong-E),'.4g'))
```
Observed:
```
exact kernel checks 25350
X 16 H 4 primes 7 short 443.109317 long_net -389.154481 energy 53.9548363 bound 8926.2661 residual 2.629e-13
X 64 H 8 primes 20 short 21956.8445 long_net -21319.3945 energy 637.450055 bound 404169.017 residual 8.64e-12
X 256 H 16 primes 66 short 670570.726 long_net -662062.961 energy 8507.76545 bound 18093676.7 residual 9.622e-10
X 1024 H 32 primes 212 short 23252884 long_net -23097202.4 energy 155681.593 bound 707064860 residual 1.144e-08
```
Finite cancellation observed, no inferred asymptotic sign or proof of R bound. Earlier centered-integer variant also independently tested locally (not required for this direct prime-only result). No URT or Lean run.

## Source pin and handoff
Pinned source leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; freshly fetched src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (PoleData, WindowHypU); same directory LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a (landau_window). Latest upstream 75e2012dcc6f3093e223ef8d327b88395ff7d27c, 25 Nov 07:24:48 UTC, unchanged from peer RUN26; separate from pin. This is an independent human arithmetic adaptation, not a claim the pinned source uses the pair expansion or that any native dependencies have been pruned globally.
RESUME HERE: prove upper bound for signed R_H by actual long-range prime correlation estimates (or an independently established native supplier), retaining the mixed linear-prime term and cubic constant until after cancellation; short gaps need no further work for this budget. Audit exact dyadic endpoints and ordered-pair normalization. HANDOFF TO prime_window, mathematics, audit, integration. RH OPEN; prior logs unchanged.
