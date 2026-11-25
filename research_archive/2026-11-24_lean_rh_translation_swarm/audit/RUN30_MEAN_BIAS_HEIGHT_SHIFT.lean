import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import Development.AutomorphicArithmetic.PrimitiveCosets.CoreGm
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN30 audit — aggregate height displacement before taking norms
2026-11-25. Human proof/source-matched; native scalar certificate PREPARED,
not compiled. RH OPEN. Independent review of prime RUN29 9fab679150f21951553a6cbb736b3df198037ce8.

Mission current blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, manuscript
4f571d3bfce24fbaef352cd403666872a8981175, SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74,
AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972, handoff, research state,
protocol/log and continuity consulted. Recent peers include 613a36df,
82c81900, 866504ea, 109c156c, 9fab6791. Latest orchestrator summary checkpoint
440 is physical/project regression only, not RH validation.

Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005, paths under src:
Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean
878f5077bc382426c7da988e5a375b85deeaa7de lines 283-338: core hY is a
SUM lower bound, not individual lower bounds. Retain all other premises.
Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean
3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d: actual ch_core and sigA_le consumers.
Development/AutomorphicArithmetic/PrimitiveCosets/SigALe.lean
e9c80e2017ec149ac559bc20c184b9264b9ec0c2: individual unkept bounds.
Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean
18deb7cb85d6f650a69f01fda6e0c789b9f04d89: cosetMean, primVal, GPsi.

## One compact independent proof block for manuscript §2
AGREE with RUN29's normalized four-mode shift under its retained principal
host and character identification. The coefficient c_n for n=p^i is
4 times the fraction of the inertia coset projecting to (1,0) in E0;
hence 0<=c_n<=4. At all other n Lambda(n)=0. GPsi's trivial branch
and three fixed ell terms give S(z)=G(z)+J(z)=
sum_n Lambda(n)c_n (z/n-1)_+ - z log z + B z, same B on this host.
All sums at bounded heights are finite. No bdL needed locally.

NEW: do not take an absolute value before summing over TT. Write
P(x)=sum_{n<=x} Lambda(n)c_n, d_t=y_t-x, dbar=mean d_t,
v=mean d_t^2, mu=1+dbar/x. All means on the same nonempty TT.
For x,y,n>0, with R_n(z)=max(z/n-1,0),
  R_n(y)-(y/x)R_n(x) >= ((y-x)/x)*1_{n<=x}.
If n<=x use R_n(x)=x/n-1, R_n(y)>=y/n-1 and cancel exactly;
otherwise R_n(x)=0 and R_n(y)>=0. The choice <= includes n=x;
it is the right tangent, valid even when y<x. Nonnegative coefficients
are ESSENTIAL here. Also log(y/x)<=y/x-1, so
  y log(y/x) <= (y-x)+(y-x)^2/x.
Subtract S(y)-(y/x)S(x): B cancels, and summing the previous
two bounds gives the following single valid lower bound:
  mean_t S(y_t) >= mu*S(x) + (dbar/x)*(P(x)-x) - v/x.      (*)
This uses the actual SUM hY in core, with Y equal to the RHS.
Retaining the original geometric, thin, size and host premises,
write E=2Err/(Qd)+4/(xd) (Q=rmb,d=|T2|/|H|, Qd>0). Then
  mu*(G(x)+J(x)) <= E - (dbar/x)*(P(x)-x) + v/x.
The original lower bound mu>=1-w/x>0 (|d_t|<=w<=1,x>=3)
is retained. If the numerator is signed, divide by actual mu,
NOT by its lower bound unless the numerator is nonnegative.
The unkept estimate -J<=3x^(1/2+eps) survives.
For a sign-free upper bound, use P>=0 and P<=4psi(x), giving
E+|dbar|*(1+4 log x)+v/x as a nonnegative numerator if E>=0.
The elementary Chebyshev estimate already in the manuscript can
replace 4 log x by 16 log 2. Thus worst-case order and eventual
exponent remain unchanged; no new PNT or prime-discrepancy input.
If the native construction supplies dbar=0, the loss reduces to
v/x<=w^2/x, rather than O(w). **This mean-zero condition is NOT
supplied by the currently inspected SizesA or core.** Keep its term
unless a producer proves it. Do not claim improved RH exponent or
global premise deletion. Optional backtracking: use peer RUN29
pointwise bound if this aggregate implementation is less concise.

Failed route: dropping the bias term solely because |d_t|<=1.
Counterexample in the scalar nonnegative ramp class: x=20,y=19,
c_n=4 on odd prime powers with odd exponent, zero elsewhere.
No nonzero ramp breakpoint in (19,20]. P=4 sum(log p) on that
finite support. Exact normalized shift equals -P/20-19 log(19/20),
numerically -2.1043188673645573032, strictly below -1/20.
This is a counterexample to a general scalar inference, not a
realization claim for a particular native Galois host.
Negative coefficients also invalidate the tangent transfer: n=x=5,
y=4,c=-1 gives 0 on left and +1/5 on right. No such coefficient
occurs in the audited principal Fourier projection.

## Reproducibility (executed CPython, Fraction exact and mpmath 55 digits)
Output: primes=168, prime_powers=193, exact_ramp=10615,
aggregate_numeric=88 (33 balanced subset), negative_controls=2.
No asymptotic or actual-host test. Code (extract as Python):
```python
from fractions import Fraction as F
from math import isqrt
import mpmath as mp
mp.mp.dps=55
N=1000
s=bytearray(b'\1')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
 if s[p]:s[p*p::p]=b'\0'*(((N-p*p)//p)+1)
pp=[]
for p in range(2,N+1):
 if s[p]:
  n,k=p,1
  while n<=N:pp.append((n,p,k));n*=p;k+=1
xs=list(map(F,[3,4,10,19,20,47,97,256,997]))+[F(19,2),F(51,2)]
ds=list(map(F,[-1,0,1]))+[F(-1,2),F(1,2)]
checks=0
for n,p,k in pp:
 for x in xs:
  for d in ds:
   y=x+d
   R=lambda z:max(z/n-1,0)
   assert R(y)-y/x*R(x)>=d/x*int(n<=x)
   checks+=1
q=lambda p,k:4*int(k%2==1 and p%4==3)
m=lambda v:mp.mpf(v.numerator)/v.denominator if isinstance(v,F) else mp.mpf(v)
profiles=[(-1,1),(-1,0,1),(-1,-1,1),(0,1),(1,1),(-1,-1),(-1,1,1),(-1,0,0,1)]
agg=balanced=0
for x in xs:
 P=sum(q(p,k)*mp.log(p) for n,p,k in pp if n<=x)
 def A(y):return sum(q(p,k)*mp.log(p)*m(max(y/n-1,0)-y/x*max(x/n-1,0)) for n,p,k in pp)-m(y)*mp.log(m(y/x))
 for profile in profiles:
  dd=[F(d) for d in profile];dbar=sum(dd)/len(dd);v=sum(d*d for d in dd)/len(dd)
  exact=sum(A(x+d) for d in dd)/len(dd)
  bound=m(dbar/x)*(P-m(x))-m(v/x)
  assert exact+mp.mpf('1e-49')>=bound
  agg+=1
  if dbar==0:
   assert exact+mp.mpf('1e-49')>=-m(v/x);balanced+=1
x=F(20);y=F(19)
pp0=[(n,p,k) for n,p,k in pp if n<=20 and p%2 and k%2]
P=4*sum(mp.log(p) for n,p,k in pp0)
A=(m(y-x)/m(x))*P-m(y)*mp.log(m(y/x))
assert A < -m((y-x)**2/x)
x=F(5);y=F(4);n=5
assert -(max(y/n-1,0)-y/x*max(x/n-1,0)) > (y-x)/x
assert -(max(y/n-1,0)-y/x*max(x/n-1,0)) < -(y-x)/x
print(dict(primes=sum(s),prime_powers=len(pp),exact_ramp=checks,aggregate_numeric=agg,balanced_numeric=balanced,negative_controls=2,mean_bias_counterexample=mp.nstr(A,20)))
```

Original source-visible edges core_gm -> ch_core -> core, one_char,
DerivInt, charsA, sigA_le. Proposed local overlay: principal core_gm
-> same core with (*) as hY, quotient Fourier identity and bdG on
three unkept modes. Source-visible matches, not elaborated graph.
Original graphs, all other consumers, constructor/type/value edges,
pending dependencies and axioms retained. Cache key
(pin,actual D,ell,TT,A0,x,all y_t,principal identification); no
independent host or unrelated heights. No URT claimed.
Local command -v lean/lake returned no paths. Retrieved actual old CI
status logs: 45577239749 pass 98.87s, b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
conditional strip root axioms propext, Classical.choice, Quot.sound.
45576756833 pass 77.94s, 7da354941e402b6f8b364ed03d8c5c82d27b7717;
rh_of_right scan pending 324, no binder reduction. Neither validates
this file. No new kernel PASS. Scalar certificates below unexecuted.

RESUME HERE: lift tangent inequality to actual finite GPsi sums using
the four-mode projection, then discharge native core hY at the caller;
retain mean bias unless aT/height supplier proves a mean constraint.
HANDOFF TO: prime, integration/editor, kernel. AGREE with normalized
cancellation; DISAGREE with dropping mean bias; PARTIAL for actual
caller kernel and RH. Essential upstream suppliers remain open.
-/

namespace RHAuditMeanBias30

theorem ramp_tangent (n x y : ℝ) (hn : 0 < n) (hx : 0 < x) :
    (if n ≤ x then (y-x)/x else 0) ≤
      max (y/n-1) 0 - (y/x)*max (x/n-1) 0 := by
  by_cases h : n ≤ x
  · have hx1 : 0 ≤ x/n-1 := by
      have := (le_div_iff₀ hn).2 (show 1*n ≤ x by simpa using h)
      linarith
    rw [if_pos h, max_eq_left hx1]
    have he : (y-x)/x = (y/n-1)-(y/x)*(x/n-1) := by
      field_simp <;> ring
    rw [he]
    linarith [le_max_left (y/n-1) (0:ℝ)]
  · have hx1 : x/n-1 ≤ 0 := by
      have := (div_le_iff₀ hn).2 (show x ≤ 1*n by simpa using (le_of_not_ge h))
      linarith
    rw [if_neg h, max_eq_right hx1, mul_zero, sub_zero]
    exact le_max_right _ _

theorem pointwise_budget (x y P R L Sx Sy : ℝ)
    (hx : 0 < x)
    (hR : (y-x)/x*P ≤ R)
    (hL : L ≤ (y-x)+(y-x)^2/x)
    (hS : Sy-y/x*Sx = R-L) :
    y/x*Sx+(y-x)/x*(P-x)-(y-x)^2/x ≤ Sy := by
  have he : (y-x)/x*(P-x) = (y-x)/x*P-(y-x) := by
    field_simp <;> ring
  rw [he]
  linarith

theorem pointwise_auto (x y P R L Sx Sy : ℝ)
    (hx : 0 < x)
    (hR : (y-x)/x*P ≤ R)
    (hL : L ≤ (y-x)+(y-x)^2/x)
    (hS : Sy-y/x*Sx = R-L) :
    y/x*Sx+(y-x)/x*(P-x)-(y-x)^2/x ≤ Sy := by
  first | (rh_reduce 3 using [pointwise_budget]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact pointwise_budget x y P R L Sx Sy hx hR hL hS

rh_scan Deduction.CharacterBalanceMoves.core limit 2000
rh_prune Deduction.CharacterBalanceMoves.core as RHAuditMeanBias30.core_pruned
#print axioms ramp_tangent
#print axioms pointwise_budget
end RHAuditMeanBias30
