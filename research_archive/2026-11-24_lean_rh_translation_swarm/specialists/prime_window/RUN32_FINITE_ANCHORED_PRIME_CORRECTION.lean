import Development.AutomorphicArithmetic.PrimitiveCosets.CoreGm
import Formalism.SharpRestriction.RamificationFrobenius.TotientGaloisClasses.ExplicitFormulaErrorOfHostConditions
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — finite anchored signed prime correction, 25 Nov 2026.
SOURCE-MATCHED human reduction; scalar Lean certificate PREPARED, not compiled.
RH OPEN. Optional local replacement of the principal core_gm correction,
not an independent RH criterion, and not a proof of its missing bound.

Preflight: read current ONE_EQUATION_MISSION (including mandatory native
pipeline), SWARM, HANDOFF, AGENTS, live manuscript, RUN28–31, earlier
RUN2/4/23/24/26/27, current 20 commits through 90ea4293, especially
6044fe17 (RUN31) and dd7cd00b (same-witness height guard). RUN31 removes
higher powers in a centered prime correction but leaves infinite
moments and log derivatives. Here the actual native analytic condition
HostConditions.a cancels those coefficients exactly at a finite anchor.

## Compact mathematical block for §2 if useful

Fix eps>0 and one actual principal host at scale x. Use the native
primitive reading GPsi = An.gChi on all three unkept quadratic modes.
Let F=G+J, J=g_01-g_10-g_11, as in the manuscript. On each p^k, let
c(p,k) be the nonnegative signed four-mode coefficient, equal to four
times the fraction of the inertia coset projecting to the fixed color.
RUN31 establishes 0<=c<=4, c(p,2j)=0 except c(d,2j)=2 at the actual
ramified prime d, and c(p,2j+1)=c(p,1). Keep the original host and ell.

For any positive anchor T>=2x (T is NOT a second scale requiring a new
host or geometry witness), define the nonnegative finite kernel
  W_(x,T)(n) = max(min(1-x/T, x/n-x/T),0).
It is 1-x/T for n<=x, x/n-x/T for x<n<T, and 0 for n>=T.
Exactly, coefficientwise,
  W_(x,T)(n) = (x/T)max(T/n-1,0)-max(x/n-1,0).
In J the principal logarithm and Euler term are absent. The SAME
linear log-derivative coefficient at x and T cancels before estimating:
  -J(x) = P(x,T)+H(x,T)-(x/T)J(T),                      (1)
  P(x,T) = sum_{p<T} (c(p,1)-1) log p W_(x,T)(p),
  H(x,T) = sum_{p^k<T,k>=2} (c(p,k)-1) log p W_(x,T)(p^k).
No infinite sums, L'/L values or asymptotic prime number formula in (1).
The principal ramp G still has its original centering.

**Uniform sign of the entire higher-power correction.** Since
0<=W(n)<=min(1,x/n), the positive c(p,k) contribution to H is at most
96 x^(1/3)+log x+1 by the RUN31 unconditional Chebyshev/Tonelli bound.
For the negative principal contribution retain only squares p^2<=x:
  sum_{p,k>=2} log p W(p^k) >= (1-x/T) theta_P(sqrt x)
                               >= theta_P(sqrt x)/2.
The elementary Chebyshev lower estimate from RUN31 gives eventually
theta_P(t)>=(log 2/2)t. Thus
  H(x,T) <= 96 x^(1/3)+log x+1-(log 2/4)sqrt x <=0      (2)
for sufficiently large x with an absolute threshold independent of the
host and of every T>=2x. No prime-power term silently omitted; the sign
is from exact parity cancellation and the dominating principal squares.
The upper bound in (2) is coarse; it does NOT claim the sign at x=4096
for every possible host.

**Use the actual analytic producer at one finite anchor.** Native
HostRaw.ChebyshevCharacterBound x eps c0 in HostConditions.a states
for every primitive character induced by the SAME host and every
T >= exp(x^(eps/3))/3:
  ||An.gChi chi T|| <= T exp(-c0*x^(eps/8)).
The three modes qualify by HostRaw.isPrimOf_prim and IsCharE. Therefore
  |J(T)| <= 3T exp(-c0*x^(eps/8)).
For c0>0 fixed before the window threshold, take
  T=max(2x, exp(x^(eps/3))/3).
Then (1),(2) give
  -J(x) <= P(x,T)+3x exp(-c0*x^(eps/8)).                 (3)
The last error is <=1 eventually, uniformly in the chosen hosts
provided the native c0 is fixed positive. This is precisely where the
original large-y analytic estimate enters; do not infer it from EAtH
alone (that structure has only bdG and bdL, not HostConditions.a).
Transport a from the actual same-host PreHostAn.ha10, or keep the
original bdG proof if that witness is unavailable. ThinScales also uses
large-y analytic estimates; none is discarded from other consumers.

Thus the three separate pointwise absolute bounds in the specialized
core may be replaced locally by ONE finite signed prime inequality
  P(x,T) <= 3 x^(1/2+eps)
with the same fixed c0, host, level and scale, and uniform eventual
thresholds. The existing F=G+J bound then gains only a unit, absorbed
in the existing exponent slack. It is neither proved that this
finite signed inequality holds nor that it is easier than the original
native analytic producer. In particular T grows subexponentially in x
(for small eps), so this is NOT a faster numerical evaluation promise.
No independent outer-shell route, no hypothesis of RH, and no claim
that replacing c1 globally is legitimate. Keep the simpler original
bdG in the ten-page manuscript unless this alternative helps close an
actual supplier. The new elimination is of infinite moments and
log-derivative constants in the candidate prime-only correction.

## Source and graph provenance

Pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Actual source inspected:
* src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/
  Analytic.lean 599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1:
  An.gChi, HostRaw.IsCharE/isPrimOf_prim, ChebyshevCharacterBound,
  BoundedCharsPointwise, HostConditions.a/c1, PreHostAn.ha10.
* same directory ExplicitFormulaErrorOfHostConditions.lean
  ed60b4b997cd4703713660b185b9e43fd95559a1:
  EAtH, EAtH.explicit_formula_error_of_host_conditions (h.c1 to bdG,
  h.b to bdL). Note absence of h.a from this consumer's output.
* src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean
  3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d, core_gm calls
  hostFactsS, charsA, ch_core, gmA_eq, sigA_le;
  SigALe.lean e9c80e2017ec149ac559bc20c184b9264b9ec0c2, sigA_le.
* same directory charsA.lean 7d6a3faa3f6dcc1923a65473d848d8da0601e7a2
  (uses bdL and shares), GmAEq.lean 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03.
* src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/
  ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de, core/ch_core.
* RUN31's exact hostFactsS, prim_read, four-character projection and
  elementary Chebyshev proofs and sources are retained unchanged.

Original root-visible path retained: core_gm -> sigA_le -> bdG,
chr_bounded, prim_read; upstream EAtH producer -> HostConditions.c1.
Candidate local principal replacement: core_gm -> signed F=G+J ->
(1),(2),(3), same-host HostConditions.a, finite prime P budget.
This is a strictly local candidate, not a checked global binder deletion.
Cache key includes source pin, same actual host/ell, eps,x,T and fixed
c0; do not reuse different hosts or anchors. Backtrack to c1 if no
simpler supplier for P. Preserve all original and reduced graph roles,
pending obligations and axiom evidence. No URT advantage established
or used: exact algebra is the useful technique. Latest upstream observed
8e5cefeeaffe7e4c12153385b7bb33fb7223c41a (25 Nov 11:57:33 UTC), not mixed.

## Executed arithmetic regression (not asymptotic evidence)
CPython+NumPy, actual primes through 2^20, exit 0 on final run.
82025 primes, 242 higher prime powers, nine actual admissible pairs:
(3,23),(3,71),(11,7),(19,71),(43,7),(43,71),(59,23),(67,7),(83,71).
1260 exact Fraction kernel identities/inequalities; 252 weighted
prime-power tests. Max floating residual 2.6716406864579767e-12;
max/min H for tested x>=4096: -27.986621686117626/-510.10098130040785.
Initial double-precision kernel comparison with absolute tolerance
1e-12 failed (observed residual 2.425393219596117e-12), so replaced
it with exact rational tests, retaining the failed comparison record.
No finite-to-infinite inference, no full host simulation, no test of
the native large-y estimate or the unproved signed prime budget.

Reproduce:
import numpy as np, math
from fractions import Fraction as F
N=2**20;s=np.ones(N+1,dtype=bool);s[:2]=False
for p in range(2,math.isqrt(N)+1):
 if s[p]:s[p*p::p]=False
pr=np.flatnonzero(s);powers=[]
for p0 in pr[pr<=math.isqrt(N)]:
 p=int(p0);n=p*p;k=2
 while n<=N:powers.append((n,p,k));n*=p;k+=1
n,p,k=np.array(sorted(powers)).T;logs=np.log(p)
def leg(a,q):
 r=pow(int(a)%q,(q-1)//2,q);return -1 if r==q-1 else r
pairs=[(q,d) for q in map(int,pr[pr<100]) for d in map(int,pr[pr<100])
       if q%8==3 and d%16==7 and q!=d and leg(q,d)==1]
checks=0;max_err=0;max_diff=-1e100;min_diff=1e100;exact=0
for t in list(map(int,n))[:100]+[64,256,4096,8192,16384]:
 for x in [64,256,4096]:
  for T in [2*x,3*x,4*x,N]:
   w=x*(max(F(1,t)-F(1,T),0)-max(F(1,t)-F(1,x),0))
   v=max(min(1-F(x,T),F(x,t)-F(x,T)),0)
   assert w==v and 0<=w<=min(1,F(x,t));exact+=1
for q,d in pairs:
 a=np.array([leg(t,d) for t in p]);b=np.array([leg(t,q) for t in p])
 c=(1-a**k)*(1+b**k)
 assert np.array_equal(c,np.where(k%2==0,2*(p==d),(1-a)*(1+b)))
 for x in [64,256,1024,4096,16384,65536,262144]:
  for T in [2*x,3*x,4*x,N]:
   W=np.maximum(np.minimum(1-x/T,x/n-x/T),0)
   v=float(np.dot((c-1)*logs,W))
   v2=float(np.dot((c-1)*logs,np.maximum(T/n-1,0)*x/T-np.maximum(x/n-1,0)))
   max_err=max(max_err,abs(v-v2));assert abs(v-v2)<1e-7
   if x>=4096:
    max_diff=max(max_diff,v);min_diff=min(min_diff,v);assert v<=0
   checks+=1
print(len(pr),len(n),pairs,exact,checks,max_err,max_diff,min_diff)
End Python.

Native Lean/Lake not found on local PATH. Independently re-read actual
prior CI status files: 45577239749 pass (98.87s) blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc; 45576756833 pass (77.94s)
blob 7da354941e402b6f8b364ed03d8c5c82d27b7717. These certify the
existing conditional half-strip root and native engines ONLY, not
this bridge. No new native PASS or axiom audit claimed. Scalar
certificate below prepared for existing kernel batch, including
actual producer scan/prune; original proof uses c1, so its removal
requires a new principal caller, not simply rh_prune of old body.

RESUME HERE: check same-host PreHostAn.ha10 transport at the actual
family producer; compare the finite signed P budget with the original
c1 proof body. If no simplification of its real arithmetic supplier,
keep c1 and stop re-expressing the correction. Independent audit of
(1)–(3), and native scalar/caller replay requested. No changes to
the live manuscript until this yields a genuinely shorter supplier.
HANDOFF TO integration/editor, literature, character_boxes, audit,
kernel extractor. All previous work preserved; RH OPEN.
-/

namespace RHFiniteAnchoredPrime

theorem finite_anchor_kernel (u v : ℝ) (hv : v ≤ 1) :
    max (u-v) 0 - max (u-1) 0 = max (min (1-v) (u-v)) 0 := by
  by_cases h : u ≤ 1
  · rw [max_eq_right (by linarith : u-1 ≤ 0),
        min_eq_right (by linarith : u-v ≤ 1-v), sub_zero]
  · rw [max_eq_left (by linarith : 0 ≤ u-v),
        max_eq_left (by linarith : 0 ≤ u-1),
        min_eq_left (by linarith : 1-v ≤ u-v),
        max_eq_left (by linarith : 0 ≤ 1-v)]
    ring

theorem anchor_transfer (Jx JT P H r A : ℝ) (hr : 0 ≤ r)
    (hId : -Jx = P+H-r*JT) (hH : H ≤ 0) (hA : -A ≤ JT) :
    -Jx ≤ P+r*A := by
  have hb := mul_le_mul_of_nonneg_left hA hr
  linarith

theorem core_anchor (G Jx JT P H r A E : ℝ) (hr : 0 ≤ r)
    (hId : -Jx = P+H-r*JT) (hH : H ≤ 0) (hA : -A ≤ JT)
    (hF : G+Jx ≤ E) : G ≤ E+P+r*A := by
  have h := anchor_transfer Jx JT P H r A hr hId hH hA
  linarith

theorem core_anchor_auto (G Jx JT P H r A E : ℝ) (hr : 0 ≤ r)
    (hId : -Jx = P+H-r*JT) (hH : H ≤ 0) (hA : -A ≤ JT)
    (hF : G+Jx ≤ E) : G ≤ E+P+r*A := by
  rh_auto_frontier 2
  all_goals first
    | exact core_anchor G Jx JT P H r A E hr hId hH hA hF
    | rh_reduce 3 using [core_anchor]
    | rh_auto 3

rh_scan Formalism.HC.EAtH.explicit_formula_error_of_host_conditions limit 2000
rh_prune Formalism.HC.EAtH.explicit_formula_error_of_host_conditions as RHFiniteAnchoredPrime.eAtH_pruned
#print axioms finite_anchor_kernel
#print axioms anchor_transfer
#print axioms core_anchor
#print axioms core_anchor_auto
end RHFiniteAnchoredPrime
