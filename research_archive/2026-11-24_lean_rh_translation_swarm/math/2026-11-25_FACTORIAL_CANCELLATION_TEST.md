# RH minimal inequality — factorial cancellation and hidden-mode test
2026-11-25. User asks to prove outer-shell prime inequality, previous commit 596dc680cc04619e91a0d881f39d0cbb028e48f2. Result: exact unconditional arithmetic identity and rigorous limitation of a proposed inference, not proof of RH. Actual local CPython calculation below. Checked prior outer-shell note and pinned TopWin.lean/Supply.lean/SupplyChi.lean; full current peer ledger not audited in this turn. No physical gates changed.

## Actual prime identity
A(x)=sum_{n<=x}(Lambda(n)-1). For fixed integer q>=2 put c_q(j)=1-q*1_{q|j}, N=floor(x), D(x)=sum_{n<=x} floor(x/n). By divisor convolution sum_{d|n}Lambda(d)=log n and reordering:
E_q(x)=sum_{j<=x} c_q(j) A(x/j)
=log(N!)-q log(floor(x/q)!)-D(x)+qD(x/q).
Stirling gives first difference x log q+O_q(log(2x)); Dirichlet hyperbola gives D(x)-qD(x/q)=x log q+O_q(sqrt x). Consequently E_q(x)=O_q(sqrt x) unconditionally. At q=2 this is an exact alternating fractal cancellation, c_2(j)=(-1)^(j-1). It is a bound on the entire weighted sum, not on A or the outer-shell B_2.

## Why the direct inference fails
For z=1+2pi*i/log 2, eta(z)=(1-2^(1-z))*zeta(z)=0. Consider the explicitly nonprime control a(n)=c Re(n^z-(n-1)^z), 0^z=0, c=1/(2|z|), so 1+a(n)>=1/2 by integral bound on derivative of t^z. A_c(x)=c Re(floor(x)^z), and |A_c(x)-c Re(x^z)|<=c|z|. Split the alternating sum at M=floor(sqrt x). For j<=M replacing floor(x/j) with x/j costs O(M). Alternating summation by parts gives |sum_{j>M}(-1)^(j-1)j^(-z)|=O_z(M^(-1)), so eta(z)=0 implies the leading sum is O_z(x/M). For j>M pair consecutive terms; total variation of the floor argument is <= x/M, and a is bounded, so the tail is O_z(x/M). Thus E_2,c=O(sqrt x) although A_c(x) has order x. The exact outer-shell identity gives B_2,c(x)=A_c(x)-x integral_{x/2}^x A_c(t)/t^2 dt = c Re(x^z)+O(1), since integral_1^2 u^(-z)du=0. Along x=2^(k+1/2), B_2,c=-c x+O(1). This disproves any general implication from positivity of weights plus square-root alternating cancellation to square-root shell discrepancy. It is a control, not a counterexample to RH; PNT rules out this particular order-x mode for true primes.

More generally the same splitting works for fixed q, bounded partial sums of c_q, and hypothetical zeta zero rho with 1/2<beta=Re(rho)<1. The Dirichlet series sum c_q(j)j^(-rho) converges to (1-q^(1-rho))*zeta(rho)=0. Take A_c=c Re(floor(x)^rho), c chosen small enough for positive weights. The derivative bound for t>=1 is |rho|*t^(beta-1)<=|rho|, with separate n=1 increment; thus floor replacement costs O(sqrt x). The series tail costs O(x^beta M^(-beta)), and discrete variation on the tail is O((x/M)^beta) (use absolute derivative integral), both <= O(sqrt x). All fixed q square-root factorial-style bounds would be consistent with this hypothetical mode even though A_c=o(x). The earlier nonvanishing outer-shell Mellin multiplier gives B_2,c(x)=c Re(x^rho rho J_2(rho))+O(1) with nonzero rho J_2(rho), so it violates any global bound with exponent below beta. This conditional control identifies the exact common blind modes, not existence of off-line zeros. No conclusion about actual primes follows from it.

## Executed certificate
Local CPython NumPy sieve N=1,000,000 and independent factorial/hyperbola formula at x=1000,10000,100000,1000000: E_2 values .467261567851,10.640819060820,8.735799409401,4.047013063683; maximum absolute difference 6.997e-10. Nonprime control at x=floor(2^(k+.5)), k=8..18: minimum weights about .5 (roundoff), B/x approaches -.0548262183, E/sqrt(x) between -.0219141 and .0688176. Analytic proofs, not finite results, give the stated asymptotics. No CI or Lean execution.
```python
import numpy as np, math
N=1000000
p=np.ones(N+1,dtype=bool);p[:2]=False
for j in range(2,math.isqrt(N)+1):
 if p[j]:p[j*j::j]=False
lam=np.zeros(N+1)
for j in np.flatnonzero(p):
 k=int(j)
 while k<=N:
  lam[k]=math.log(int(j));k*=int(j)
A=np.r_[0.,np.cumsum(lam[1:]-1)]
D=lambda x:2*sum(x//k for k in range(1,math.isqrt(x)+1))-math.isqrt(x)**2
for x in [1000,10000,100000,1000000]:
 j=np.arange(1,x+1);e=np.sum(np.where(j%2,1.,-1.)*A[x//j]);f=math.lgamma(x+1)-2*math.lgamma(x//2+1)-D(x)+2*D(x//2)
 print(x,e,f,abs(e-f));assert abs(e-f)<1e-7
s=1+2j*math.pi/math.log(2);c=1/(2*abs(s))
for k in range(8,19):
 x=math.floor(2**(k+.5));n=np.arange(1,x+1,dtype=float);F=np.r_[0.,c*np.real(n**s)];a=np.diff(F);j=np.arange(1,x+1);e=np.sum(np.where(j%2,1.,-1.)*F[x//j]);lo=x//2;b=np.dot(a[lo:],2-x/n[lo:])
 print(x,np.min(1+a),e/math.sqrt(x),b/x)
```
## Source-native next route
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, TopWin.lean defines ChebyshevInequalityAtWindowScale with fixed eD,eL,epsilon1 and for every sufficiently small eps a tied family with windows. level_of_tiedWin consumes this one level, not all levels. SupplyChi.lean builds HostExW(3/2) for any psi given VWinAt psi 401. Investigate specializing to psi=PChar.one and constructing one native tied family directly; do not claim trivial host meets size constraints or assume source theorem proves the target without independent verification. No unconditional lower bound of required strength found. RESUME HERE: target actual tied-family existence for trivial character; avoid further generic fractal regrouping without arithmetic input.