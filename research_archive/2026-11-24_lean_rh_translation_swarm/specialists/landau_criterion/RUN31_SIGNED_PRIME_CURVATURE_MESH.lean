import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN31 — signed prime curvature at the existing native WindowHyp consumer.
25 Nov 2026. Human/source-matched conditional reduction; scalar/caller
Lean certificate PREPARED, NOT compiled. RH remains OPEN.

Mission read first (latest blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
including unified engine, ten-page cap and shared pyramid). SWARM
4b77b161d6876915c15cea5a4d4a519beaf5de74, HANDOFF
bbc46df7d7716a6d8863275b5271801eacfaad0d, EXPANSION
c8152d0751072ed693046ada46f8dbcc93d24aab, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, continuity
61459cfddab270c187cf628ed60b84749d290a0c, research state/log/protocol
opening sections inspected. Live manuscript 7beedb2752d934a81d4c92b5a19c1c48362e0dc9.
Recent peer commits 4510eb2b, 5991ed4b, c11635a0, e02666f2, bb29422d,
90ea4293 read (including actual changed proof blocks/handoffs).
Prior RUN30 09dc515184fa493e2c83666aee9fd6950eff9244 and peer b7b335f6
use semiconvexity and nonnegative endpoint budgets; this run retains the
positive prime-power curvature and signed endpoints before taking max.
No claim to have reread all 15 archives or the external blueprint.

Upstream pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Source files relative to
src/Development/AutomorphicArithmetic/DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96;
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f;
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9;
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002;
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a.
Actual declarations read. Latest upstream commit list returned
8e5cefeeaffe7e4c12153385b7bb33fb7223c41a, same as RUN30; no new-head
equivalence claimed. Live manuscript preserves canonical [E], fixed
delta=1/2, theta=1/2+9 eps in (1/2,1).

## Editor-ready replacement of the RUN30 cell budget (optional)

Let a>=1, b>a, h=b-a, t=(x-a)/h in [0,1]. Write G for the exact
singleton native centered von Mangoldt ramp (including prime powers).
For each a<n<b let s=(n-a)/h and w_n=Lambda(n)/n>=0. Every ramp term
outside the open cell is affine or zero, including the boundary terms.
Thus, cancelling the common affine terms and NOT taking norms,
  G(x)=(1-t)G(a)+tG(b)+J(x)
       - h sum_{a<n<b} w_n min(t(1-s),(1-t)s),
where J(x)=(1-t)a log a+t b log b-x log x.
Indeed the normalized hinge defect equals
  t max(1-s,0)-max(t-s,0)=min(t(1-s),(1-t)s)
for 0<=s,t<=1. Also 0<=J(x)<=h^2 t(1-t)/(2a) by convexity of
x log x and of x^2/(2a)-x log x on [a,b].
Each minimum is at least t(1-t)min(s,1-s). Consequently, for
SIGNED upper budgets A>=G(a), B>=G(b), define
  P=sum_{a<n<b} (Lambda(n)/n) min(n-a,b-n),
  C=h^2/(2a)-P.
Then
  G(x) <= (1-t)A+t B+C t(1-t).                         (1)
P may be replaced by ANY proved lower bound P0>=0, P0<=P,
if evaluating actual prime powers is not suitable for the producer.
No assertion that such a lower bound is large enough asymptotically.

Let Q(A,B)=integral_0^1 max((1-t)A+tB,0) dt.
It equals (A+B)/2 if both >=0, 0 if both <=0, and
max(A,B)^2/(2|A-B|) if their signs are strictly opposite.
(The zero endpoints are covered by the first two cases.)
Integrate the triangular positive part to get the mixed-sign formula.
Use R(x)=max((1-t)A+tB+C t(1-t),0), nonnegative and majorizing G,
and max(v+w,0)<=max(v,0)+max(w,0). Then
  integral_a^b R(x) x^(-theta-1) dx
    <= h/a^(theta+1) * ( Q(A,B)+max(C,0)/6 ).           (2)
The factor 1/6 is exact. Weight monotonicity is applied only AFTER
forming the nonnegative majorant. For a mesh, adjacent majorants
agree at shared endpoints; thus continuous on the closed window.
Summing (2) yields EXACTLY the original WindowHyp sufficient cap
when this sum <=Y^eta. Require every eta>0 and every threshold Y0,
cofinal Y>=max(1,Y0), full finite mesh of [Y,Y^(3/2)].
All same-host producer requirements are preserved. No need to impose
A,B>=0 or uniform pointwise bound on their magnitudes.
The RUN30 cost with A+,B+ dominates the new cost, because
Q<= (A_++B_+)/2 and C_+<=h^2/(2a). The improvement is strict when
opposite signed nonzero endpoint budgets occur or P>0 (h>0).
In particular all curvature cost can be omitted if P>=h^2/(2a);
that condition is NOT shown on general cells. For sparse meshes the
old sufficient cap still works. The arithmetic window itself is
unproved; this is not a derivation of RH or canonical [E].
If editor prefers, retain the existing shorter original pointwise
argument; do not enlarge main manuscript with this optional budget.

Graph (source-visible, not complete elaborated):
original core_gm -> windowInequality_of_artinInputs -> formB ->
zeroFree_of_rpow_window -> windowHyp_of_rpow + lemmaL -> poleData,
windowHypU_of_windowHyp, landau_window, line-one exclusion.
overlay same native singleton and same-host producer -> signed node
budgets + local weighted prime-power lower moments -> (1),(2) ->
WindowHyp -> lemmaL (unchanged). Positive poles, 0<theta<1, delta>0,
and native conditional half-strip endpoint unchanged. No global edge
deletion claimed. Cache context (pin, singleton, theta,delta, mesh);
do not reuse signed scalar budget in nonprincipal contexts without
nonnegative coefficients. Original and prior overlay graphs retained.
No URT comparison justified.

## Executed checks (local CPython, exit 0)
89,376 exact rational normalized hinge cases; 9,700 actual prime powers
up to 100,000; 420 cells, 42,420 pointwise checks; 416 cells strictly
improved; 30 cells had a negative endpoint. Maximum numerical exact
identity residual 4.0896974695669996e-10 (tolerance 2e-8).
Old/new sums of weighted bounds over these overlapping test cells:
614.4847604742051 and 546.6680430766361. Not an asymptotic window
certificate, not a native geometry test, not a claimed speedup.
Reproduce with CPython (copy code between markers):
PYTHON BEGIN
from fractions import Fraction as F
from math import log, isqrt
import bisect
count=0
for d in range(2,65):
    for j in range(1,d):
        s=F(j,d)
        for i in range(d+1):
            t=F(i,d)
            K=(1-t)*max(-s,0)+t*max(1-s,0)-max(t-s,0)
            assert K==min(t*(1-s),s*(1-t))
            assert K>=t*(1-t)*min(s,1-s)
            count+=1
N=100000
sieve=bytearray(b'\1')*(N+1); sieve[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
    if sieve[p]: sieve[p*p:N+1:p]=b'\0'*(((N-p*p)//p)+1)
pp=sorted((q,log(p)) for p in range(2,N+1) if sieve[p] for q in [p])
for p in range(2,isqrt(N)+1):
    if sieve[p]:
        q=p*p
        while q<=N: pp.append((q,log(p))); q*=p
pp.sort(); ns=[q for q,l in pp]; sl=[0.]; sw=[0.]
for n,l in pp: sl.append(sl[-1]+l); sw.append(sw[-1]+l/n)
gamma=0.5772156649015328606
def G(x):
    k=bisect.bisect_right(ns,x)
    return x*sw[k]-sl[k]-x*log(x)+(1+gamma)*x
def poschord(A,B):
    if A>=0 and B>=0:return (A+B)/2
    if A<=0 and B<=0:return 0.
    return max(A,B)**2/(2*abs(A-B))
checks=0; strict=0; oldtot=0.; newtot=0.; cells=0; negends=0; maxres=0.; tol=2e-8
for a0 in [100,500,1000,5000,10000,20000,50000]:
    for h in [20,50,100,200,500,1000]:
        for a in range(a0,min(a0+10*h,N-h),h):
            b=a+h; A=G(a); B=G(b); rows=pp[bisect.bisect_right(ns,a):bisect.bisect_left(ns,b)]
            P=sum(l/n*min(n-a,b-n) for n,l in rows)
            C=h*h/(2*a)-P
            old=(max(A,0)+max(B,0))/2+h*h/(12*a)
            new=poschord(A,B)+max(C,0)/6
            assert new<=old+tol
            cells+=1; strict+=new<old-tol; negends+=A<0 or B<0; oldtot+=old*h/a**1.6; newtot+=new*h/a**1.6
            for j in range(101):
                t=j/100; x=a+t*h
                hinge=sum(l/n*min(t*(b-n),(1-t)*(n-a)) for n,l in rows)
                loggap=(1-t)*a*log(a)+t*b*log(b)-x*log(x)
                identity=(1-t)*A+t*B+loggap-hinge
                maxres=max(maxres,abs(G(x)-identity))
                assert abs(G(x)-identity)<tol
                assert G(x)<=(1-t)*A+t*B+C*t*(1-t)+tol
                checks+=1
print(dict(exact_hinge_checks=count,prime_powers=len(pp),cells=cells,strict_improvement_cells=strict,cells_with_negative_endpoint=negends,pointwise_checks=checks,max_identity_residual=maxres,old_weighted_sum=oldtot,new_weighted_sum=newtot))
PYTHON END

Neither lean nor lake is installed locally. Re-read actual CI jobs
45577239749 and 45576756833: pick, run, record all success.
Status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717. Existing conditional
strip root axioms propext, Classical.choice, Quot.sound; prior
bounded rh_of_right scan 2000 visited, 324 pending, not full RH.
The new scalar/caller checks below are PREPARED only, not queued
or executed. Exact integral and prime-power cell identity currently
human proofs; the scalar bridge does not constitute their formalization.
No import Main or claimed RH root.

RESUME HERE: use the actual same-host signed correction and geometric
budgets to derive the canonical uniform [E]; only if aggregate budgets
are demonstrably easier, use (2). Do not keep re-expressing the already
adequate Landau consumer. Audit the exact finite hinge and signed cell
bridge and submit the scalar file to existing native checking if useful.
HANDOFF TO integration/editor/audit and kernel. Preserve prior work.
-/

namespace RHLandauSignedMesh31

theorem hinge_identity (s t : ℝ) (hs : 0 ≤ s) (hs1 : s ≤ 1) :
    t * max (1-s) 0 - max (t-s) 0 =
      min (t*(1-s)) ((1-t)*s) := by
  rw [max_eq_left (by linarith : 0 ≤ 1-s)]
  by_cases h : t ≤ s
  · rw [max_eq_right (by linarith : t-s ≤ 0),
        min_eq_left (by nlinarith : t*(1-s) ≤ (1-t)*s)]
    ring
  · rw [max_eq_left (by linarith : 0 ≤ t-s),
        min_eq_right (by nlinarith : (1-t)*s ≤ t*(1-s))]
    ring

theorem hinge_lower (s t : ℝ) (hs : 0 ≤ s) (hs1 : s ≤ 1)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    t*(1-t)*min s (1-s) ≤ min (t*(1-s)) ((1-t)*s) := by
  have hm : 0 ≤ min s (1-s) := le_min hs (by linarith)
  have h1 : (1-t)*min s (1-s) ≤ 1-s := calc
    (1-t)*min s (1-s) ≤ 1*min s (1-s) :=
      mul_le_mul_of_nonneg_right (by linarith) hm
    _ ≤ 1-s := by simpa using (min_le_right s (1-s))
  have h2 : t*min s (1-s) ≤ s := calc
    t*min s (1-s) ≤ 1*min s (1-s) :=
      mul_le_mul_of_nonneg_right ht1 hm
    _ ≤ s := by simpa using (min_le_left s (1-s))
  apply le_min
  · calc
      t*(1-t)*min s (1-s) = t*((1-t)*min s (1-s)) := by ring
      _ ≤ t*(1-s) := mul_le_mul_of_nonneg_left h1 ht
  · calc
      t*(1-t)*min s (1-s) = (1-t)*(t*min s (1-s)) := by ring
      _ ≤ (1-t)*s := mul_le_mul_of_nonneg_left h2 (by linarith)

theorem positive_part_upper (v c t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    max (v+c*(t*(1-t))) 0 ≤ max v 0 + max c 0*(t*(1-t)) := by
  have hq : 0 ≤ t*(1-t) := mul_nonneg ht (by linarith)
  have hc := mul_le_mul_of_nonneg_right (le_max_left c 0) hq
  apply max_le
  · have hv := le_max_left v (0:ℝ)
    linarith
  · exact add_nonneg (le_max_right v 0) (mul_nonneg (le_max_right c 0) hq)

theorem replay (s t : ℝ) (hs : 0 ≤ s) (hs1 : s ≤ 1)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    t*(1-t)*min s (1-s) ≤ min (t*(1-s)) ((1-t)*s) := by
  first
  | (rh_reduce 3 using [hinge_lower]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact hinge_lower s t hs hs1 ht ht1

-- Actual native endpoint; the human signed cell proof must establish h.
theorem native_window_consumer (F : Deduction.CharFamily) {θ δ : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (h : Deduction.WindowHyp F θ δ) : Deduction.ZeroFree F θ :=
  Deduction.lemmaL F hθ hθ1 hδ h

end RHLandauSignedMesh31

rh_scan Deduction.lemmaL limit 2000
rh_prune Deduction.zeroFree_of_rpow_window as RH31OriginalWindowCandidate
rh_prune RHLandauSignedMesh31.hinge_lower as RH31HingePruned
#print axioms Deduction.lemmaL
#print axioms RHLandauSignedMesh31.hinge_identity
#print axioms RHLandauSignedMesh31.hinge_lower
#print axioms RHLandauSignedMesh31.positive_part_upper
#print axioms RHLandauSignedMesh31.replay
#print axioms RHLandauSignedMesh31.native_window_consumer
