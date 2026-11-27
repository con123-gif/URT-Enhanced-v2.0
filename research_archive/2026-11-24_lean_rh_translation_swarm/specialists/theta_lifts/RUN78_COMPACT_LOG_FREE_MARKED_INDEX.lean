import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN78 — log-free marked Hecke index at the actual caller
27 November 2026. HUMAN SOURCE-MATCHED stronger bound, pending independent
audit and native replacement replay. Scalar certificates PREPARED only.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained; main now
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, no migration.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
main unchanged. Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Read mission a69122b6ad568910a45d2bc13961ab9da4855143 incl mandatory
engine; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity and
latest peer commits. RUN77 d8ec62f2 resumes here. Kernel RUN49 19a5089a
already independently audited the cyclic Frobenius congruence modulo
(p), including the nonreduced quotient and cyclic wrap. Integration
403556a7 supplies all ten original size guards. Prime RUN77 cbe15af7
supplies weaker count/projector guards; kernel RUN51 fced7763 supplies
the new projector scalar. Do not re-derive these as new discoveries.
This run strengthens the actual marked-prime parameter z using EVEN
THE ORIGINAL HeckeSizes type, then aggregates it at the same lattice.

Source ledger, relative to grh-compact/src:
- New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8:
  Data.IsMarked.hasType_markOperator, all fields of T, A, e and last
  HeckeSizes conjunct at the actual Columns.hasType_markOperator call.
- New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9:
  HeckeSizes, last guard, two depth/flag count consumers.
- New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48:
  Columns.hasType_markOperator; same integral column lattice and Y.
- New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  Data.IsMarked.hasType_prod_markOperator_pow, HasType.prod at jetCeil,
  distinct from gaugeLe_Bmu_of_isMarked.
- New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
  New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834:
  scale, m_mem, r_mem, k, s_le.
- New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d:
  frob_ext works for general char-p R; subsequent iff requires domain.
  Same-pin readable MarkOperator.lean 9983c2c6d27267df997cd5332160882a858af17d
  agrees on the localization argument. No new Frobenius claim.

## 1. Remove the log(b) factor without changing the native counting theorem

Notation as integration 403556a7: L=log x, B=log b, m=number of lifts,
k=column rank, r=ceil(log_p m), d=o0(p)>0, P0=p^d, N=cycle length,
a=degree per top, A_l=a*N/2. The last equality is exact by the audited
alternating orbit. Retain markedness, p>=13, r>=1, P0>=p, p^r>=m,
m<=exp(L), r<=32L<=exp(L), k>=exp(4L), L>=100. The last four are
derived from the actual source intervals and scale in 403556a7.
In particular 2*m*r^2 <= 2*exp(3L) <= exp(4L) <= k.
Put U=P0^r. Then U>=m and U>=p, hence U^2>=mp.

The original last HeckeSizes guard has LHS
    N*a*(1/U^2 + r^2/(k*P0)).
Before any norm, compare its two rational factors:
    1/U^2 <= 1/(mp),
    r^2/(k*P0) <= 1/(2mp),
since k*P0 >= 2*m*r^2*p. Therefore the SAME original guard holds with
    z_new = 3*A_l/(m*p).                               (1)
Indeed N*a*3/(2mp)=3*A_l/(mp). All other nine guards are independent of
z and already established at kappa=x^(-14), y=x^40; no need to weaken
the definition of HeckeSizes or replace its count theorem. The native
caller can keep the original T, hS, hc, hA, e, f, Y, lattice and
coefficients, change only z and the proof of the tenth conjunct.
Thus, conditional on the retained audited geometry/count primitives,
for EVERY natural j the SAME markOperator has HasType
    (3*A_l/(mp) + j/x^14 + x^40) * dim_C(Column).          (2)
This is a direct human specialization of the original parameterized
Columns.hasType_markOperator, not a claim that the original theorem
body has been edited or replayed. In particular it does not use the
new projector normalization, nor divide an arbitrary IndexDvd witness.

If the independent weaker exact mean replacement cbe15af7 is replayed,
one obtains the further option z=2*A_l/(mp): its LHS is
N*a*(r/(k*P0)+(k-2r)/(2*k*U^2)).
Since r>=1, k>=2mr^2>=2mr, the first term <=1/(2mp) and
the second <=1/(2U^2)<=1/(2mp). This optional improvement is not used
in (2) or the following argument. The exact mean is the peer result.

## 2. Actual uniform marked index becomes independent of log(b)

Use the same j=Jp=jetCeil(p)=ceil(2mfa/p) and same order of product,
with f=number of infinite places and D0=dim_C(Column). Apply the
existing HasType.prod to the list of marks repeated m times, not a
product of cardinal indices over a nondiscrete valuation ring.
The disjoint orbit estimate of kernel RUN49 gives
    m*|Lambda| <= f,    sum_l A_l <= fa/2.
The resulting IndexDvd exponent c satisfies
    c <= [3/p*sum_l A_l + m*|Lambda|*(Jp/x^14+x^40)]*D0
      <= [(3/2)*fa/p + f*( (2mfa/p+1)/x^14 + x^40)]*D0.
Use the actual scale estimates from 403556a7, m<=x, f<=x^12,
x>=1, a>=exp(B+L), p<x1 and B>=10^6 log x1. These give
mf/x^14<=1, a/p>=x^40>=1. Thus the residual three terms are
at most 2fa/p, fa/p, fa/p respectively. No division by f, D0
or cardinality of the mark set (the empty mark is allowed).
The decisive aggregate is
    c <= (11/2)*(fa/p)*D0 <= 6*(fa/p)*D0.                (3)
Compare previous native 3 loss(p) D0 and peer RUN49's
(64 log b+4)*(fa/p)*D0. The strengthened human index branch
removes the log b factor from its leading budget completely.
The independent gauge exponent 2loss(p)-gain(p) is unchanged.
No claim that this closes the archimedean height or prime-window
estimate; do not propagate the saving into those other consumers.

Original local graph:
actual TwistingData + ten original size guards -> Columns.hasType_
markOperator -> Data.IsMarked.hasType_markOperator -> HasType.prod
at LocalStatement -> uniform local index -> Theorem A.
Candidate reduced human graph: identical except tenth guard uses
U^2>=mp and k>=2mr^2, and disjoint mark orbits before aggregate bound.
The old log-factor bound is unnecessary for these two callers.
No original native nodes or axioms removed; independent replacement
replay required. Retain root/count/projector, finite Schur/class,
unramified Weil pairing, archimedean short-height and all other A/B/C
primitive obligations, especially the actual prime-window bound.
Context key: compact pin, D, Lambda,l,p,d,N,r,k,a,m,f,U,A_l,
the SAME T/hY/class reps and integralColumns, Jp and product list.

## 3. Evidence and limitations
Executed exact Python Fraction arithmetic in local container:
    from fractions import Fraction as F
    count=0
    for p in (2,3,5,13,17):
      for d in range(1,5):
        P=p**d
        for r in range(1,6):
          for m in (1,2,p**r//2,p**r):
            if not 0<m<=p**r: continue
            for k in (2*m*r*r,2*m*r*r+1,4*m*r*r):
              old=F(1,P**(2*r))+F(r*r,k*P)
              exact=F(r,k*P)+F(k-2*r,2*k*P**(2*r))
              assert old<=F(3,2*m*p)
              assert exact<=F(1,m*p)
              count+=1
    print(count)
Actual output 1200, exit 0. Generic scalar regression including
boundary equality; not actual global RH data, not proof by sampling.
Analytic inequalities above cover all parameter sizes.

Local command -v lean/lake yielded neither. No local native
rh_scan/prune/reduce/auto/frontier or new kernel execution.
Read actual state receipts for 45577239749 (conditional root/engine
pass, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc) and 45576756833
(prune pass, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717).
Compact 45803534769 targeted_results.json blob
088cd2ec0e935ee1a282f10096949bcf671cc804 reports six named checks in
TiltingLemma and Filling.Moments with standard three axioms only;
A module timed out at 2700.11s, code 124, full_RH_replay=false,
all_requested_checks_ok=false. No fresh native PASS.

RESUME HERE: independent audit/replay of (1) at the actual tenth
HeckeSizes guard and (3) at LocalStatement. Keep prior native theorem
until replacement verified. Frobenius and size suppliers were already
reconstructed/audited by peers; do not repeat them. Next distinct
theta frontier: actual unramified single-stage theta/Hecke pairing
supplier retained by RUN76 and the same-caller archimedean height
argument, if still open after reading latest integration.
HANDOFF TO integration/editor, kernel, independent audit, prime.
RH remains OPEN. No URT used.
-/

namespace ThetaRun78

theorem log_free_guard (m p k r U P : ℝ)
    (hm : 0 < m) (hp : 0 < p) (hk : 0 < k)
    (hUm : m ≤ U) (hUp : p ≤ U) (hP : p ≤ P)
    (hsize : 2*m*r^2 ≤ k) :
    1/U^2 + r^2/(k*P) ≤ 3/(2*(m*p)) := by
  have hu : 0 < U := hm.trans_le hUm
  have hPpos : 0 < P := hp.trans_le hP
  have hmp : 0 < m*p := mul_pos hm hp
  have hU2 : m*p ≤ U^2 := by
    calc
      m*p ≤ U*U := mul_le_mul hUm hUp hp.le hu.le
      _ = U^2 := by ring
  have h1 : 1/U^2 ≤ 1/(m*p) := by
    apply (div_le_div_iff₀ (by positivity) hmp).2
    simpa using hU2
  have hkp : 2*m*r^2*p ≤ k*P := by
    calc
      2*m*r^2*p ≤ k*p := mul_le_mul_of_nonneg_right hsize hp.le
      _ ≤ k*P := mul_le_mul_of_nonneg_left hP hk.le
  have h2 : r^2/(k*P) ≤ 1/(2*(m*p)) := by
    apply (div_le_div_iff₀ (mul_pos hk hPpos) (by positivity)).2
    nlinarith only [hkp]
  have he : 1/(m*p)+1/(2*(m*p)) = 3/(2*(m*p)) := by
    field_simp
    <;> ring
  rw [← he]
  exact add_le_add h1 h2

theorem mark_count_scaling (A N a m p C : ℝ)
    (hA : 2*A = N*a) (hNa : 0 ≤ N*a)
    (hm : 0 < m) (hp : 0 < p)
    (h : C ≤ 3/(2*(m*p))) :
    N*a*C ≤ 3*A/(m*p) := by
  calc
    N*a*C ≤ N*a*(3/(2*(m*p))) := mul_le_mul_of_nonneg_left h hNa
    _ = 3*A/(m*p) := by
      rw [← hA]
      field_simp
      <;> ring

theorem aggregate (F C t1 t2 t3 : ℝ)
    (hF : 0 ≤ F)
    (hC : C ≤ 3*F/2+t1+t2+t3)
    (h1 : t1 ≤ 2*F) (h2 : t2 ≤ F) (h3 : t3 ≤ F) :
    C ≤ 6*F := by linarith

#print axioms log_free_guard
#print axioms mark_count_scaling
#print axioms aggregate
end ThetaRun78

#check HeckeSizes
#check Columns.hasType_markOperator
#check Data.IsMarked.hasType_markOperator
#check Data.IsMarked.hasType_prod_markOperator_pow
#print axioms Data.IsMarked.hasType_markOperator
#print axioms Data.IsMarked.hasType_prod_markOperator_pow
