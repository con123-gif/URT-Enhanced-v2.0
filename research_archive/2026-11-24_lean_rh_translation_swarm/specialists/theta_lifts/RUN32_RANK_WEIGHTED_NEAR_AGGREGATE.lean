import Development.AbelianVarietyTheory.Proofs.FlagMeasures.OneTypeArith
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — 25 November 2026. Lane 8, conditional mathematical reduction.
Prepared Lean certificate, NOT compiled. No RH proof or kernel pass claimed.

Pinned source: leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
Current upstream observed d91ae2678eea19a0c3045ffca37f1da757c2e719;
OneTypeArith at its pinned path returned 404 on current upstream, not mixed.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; manuscript
464e82f81f646d4af85e1f5f70d379026df46261. Working head observed
141537e1635891b683e68f3a4478a31c97a3a933. Read protocols, RUN30–31,
and peer mass/count/covolume changes 56f51000, d41c3276, 38b6cc25;
the latter are distinct obligations.

SOURCE LEDGER (FlagMeasures unless noted; pinned Git blob IDs):
OneTypeArith.lean e339c69f67e1d2f14b60a13ea946c7a8a3d1601d
UnitaryAutomorphicCountingOfCompactDualVolumeRat.lean 2a66d72b3180fbb9cff093ad05a9fda228b0daa6
DiscreteSeriesCountingOfFiniteAndBounds.lean a9291349d3e9a987f33c2930c6428cc5d6e42765
NearTermsModeratePointsOneTypeBound.lean 48a481baec0116e94337ff5d9e42f2ce90ed2e12
NearTermsModeratePointsOneTypeBoundStatement.lean eed052dc3f2006553fb8175d14b784a90f8d5fb2
LayerProdCountMulDensityLeTwo.lean dca6fb68fafb5d8a1eca10cdca0cba0990c984ac
LintegralTypeLe.lean cde0ac17e6d211b559baade35e27366343fb7a43
LintegralLeSumTypes.lean 77201d1b71c95d61798a87cd82e89a47df86bc1c
SizeIntegralsAndCardCompositions.lean 857cd183149c96298a1e5a505e35753c2261a9eb
ModerateLogFactorAbsorbed.lean 461ded98044f718637e6fc7e36fc9ba111ddfa19
CountHypPAtAddQAt.lean 5332269ca685f05b11164a87b8c0d7b5898e0a68
Statements/CuspFrameWeights/SameKindIsometric.lean c7c7a598be6489574fb7e2ccaad87cb68d1f92dd
BlockTheory/SiegelWeilLocal/NearNonzeroTerms.lean a5d901b138c178d54f4e201de57fe073159bb379
CanonicalFlagExistsUniqueSemistable.lean b03c8146bc3331385fba09118e0e175b3f43535a
CanonicalLatticeFlagIsotropicSelfDual.lean 402bb982314c70e3b9d65c35c1d728e4e36

HUMAN PROOF / integration block:
The actual caller constructs hNear by GlobalTheory.NearMod.nearModerate.
For the two exceptional tests of RUN30–31, preserve all their native
CountHyp and NearUnip, PtBound, FlagMeasureBound, ConstantBound hypotheses,
and the same host, measures, moderate region, and archimedean data.
Finite test supports need not coincide. Write D_k = mainTerm of bad
test k, D_0+D_1=P D, D_k>=0, L=n f log n, Y=2 f q(11q log bigX).
For q>=1, a composition c of rank J in [1,q] has a=length(c)<=J.
The native one-type bound for its nonnegative near integral is
I_{k,c} <= ofReal(D_k * 2 kapBd(c) Y^a).
Native ConstantBound gives kapBd(c)<=exp(-JL/2), and the FIRST
projection of moderate_log_factor_absorbed gives 0<=Y<=exp(L/8).
For negative kapBd the ofReal bound is zero. Otherwise multiply the
bounds before dropping rank: 2 kapBd(c)Y^a<=2 exp(-3JL/8).
Thus with z=exp(-3L/8), add the two estimates using D_0+D_1=P D:
I_{0,c}+I_{1,c}<=ofReal(2PD z^J).
The native measurable type cover and vanishing on the thick complement
give the integrated upper bound by the sum over J and c; disjointness
is NOT required. There are exactly 2^(J-1) compositions of J (choose
cuts at its J-1 gaps). Retain rank in the sum:
 S_q(z)=sum_{J=1}^q 2^(J-1) z^J,
 (1-2z)S_q(z)=z(1-(2z)^q).
At the existing threshold n>=3^15, f>=1, log n>=15, hence L>=16.
exp(L/8)>=exp(2)>=4, and therefore 4z<=exp(-L/4)<=1.
Consequently z<=1/4, S_q(z)<=2z and
 I_0+I_1 <= 2 P D S_q(z) <= 4z P D <= exp(-L/4) P D.
This supplies the aggregate exceptional near input of RUN31 using
the actual per-type native supplier and removes the SECOND projection
of moderate_log_factor_absorbed from this argument. It avoids the
original premature replacement of exp(-3JL/8) by exp(-3L/8) and the
resulting 2^q loss. It works for one test as well. The q=0 branch is
the original native definite case, not a new claim about its kernel.
Retain all other premises, including far, deep, rare and count
normalization. No global dependency deletion: the same logarithmic
absorption theorem is still needed for its first projection.
This is a human source-matched proof of the aggregation step; actual
caller elaboration and independent mathematical audit remain open.

GRAPH (local, source-level; not a native dependency export):
old: counting -> nearModerate -> one-type bound, type cover,
     ConstantBound, moderate_log_factor_absorbed.1 and .2,
     uniform worst-rank one_type_arith, sum_card_composition_lt.
new: counting -> aggregate exceptional near bound -> same one-type
     bound, same cover, ConstantBound, absorption.1, exact rank
     composition cardinality, rank geometric sum, L>=16.
Keep original graph and all original root pending/type/value/constructor
and axiom evidence. Cache key includes source pin, common host and
measure identities, Cg, n,f,p,q,b,g and test e/Re/g0 data,
D_0+D_1=PD; do not reuse on a changed context without checking.
Backtrack to original nearModerate if native caller replay fails.
URT not used; no speed or proof-size benchmark asserted.

Actual exact scalar/combinatorial Python test (container):
from fractions import Fraction as F
from collections import Counter
from math import comb
counts=0
for J in range(1,17):
    hist=Counter()
    for mask in range(1<<(J-1)):
        cuts=[0]+[i+1 for i in range(J-1) if mask>>i&1]+[J]
        blocks=tuple(b-a for a,b in zip(cuts,cuts[1:]))
        assert sum(blocks)==J and min(blocks)>0
        hist[len(blocks)]+=1
        counts+=1
    assert sum(hist.values())==2**(J-1)
    assert sum(comb(J-1,k) for k in range(J))==2**(J-1)
checks=0
for z in [F(0),F(1,64),F(1,8),F(1,4)]:
    for q in range(0,17):
        S=sum((2**(J-1)*z**J for J in range(1,q+1)),F(0))
        assert (1-2*z)*S==z*(1-(2*z)**q)
        assert S<=2*z
        checks+=1
z=F(1,2); q=3
assert sum(2**(J-1)*z**J for J in range(1,q+1))>2*z
print(dict(compositions=counts,rank_sum_checks=checks,negative_controls=1))
Observed: {'compositions': 65535, 'rank_sum_checks': 68, 'negative_controls': 1}.
These are exact finite checks of the composition index and scalar
algebra, not tests of automorphic integral hypotheses.

No lean or lake executable locally. Existing CI actual status read:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc conditional
half-strip root passed, propext Classical.choice Quot.sound;
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 pruning baseline
passed (bounded scan 2000 visited, 324 pending). Neither tests this file.
New Lean declarations below are PREPARED only. No imported RH shortcut.

RESUME HERE: trace actual FlagMeasureBound/ConstantBound suppliers,
starting with FlagExplicitConstantLeExpNegHalf.lean, for the minimum
rank-weighted upper bound actually needed here. Native lane: compile
this certificate and replay replacement at actual caller; audit all
remaining type/value/axiom edges. Integration: use the short human
block only as conditional derivation, preserve RUN31.
-/

open MeasureTheory NumberField Matrix Finset
open scoped BigOperators

namespace GlobalTheory.NearMod

noncomputable def rh32_rankBudget (z : ℝ) (q : ℕ) : ℝ :=
  ∑ J ∈ Finset.Icc 1 q, (2:ℝ)^(J-1)*z^J

theorem rh32_rank_identity (z : ℝ) (q : ℕ) :
    (1-2*z)*rh32_rankBudget z q = z*(1-(2*z)^q) := by
  induction q with
  | zero => simp [rh32_rankBudget]
  | succ q ih =>
    rw [rh32_rankBudget, Finset.sum_Icc_succ_top (by omega)]
    change (1-2*z)*(rh32_rankBudget z q + (2:ℝ)^(q+1-1)*z^(q+1)) = z*(1-(2*z)^(q+1))
    rw [show q+1-1=q by omega, mul_add, ih, pow_succ z q, pow_succ (2*z) q, mul_pow]
    ring

theorem rh32_rank_le (z : ℝ) (q : ℕ) (hz : 0 ≤ z) (hz4 : z ≤ 1/4) :
    rh32_rankBudget z q ≤ 2*z := by
  have h := rh32_rank_identity z q
  have hp : 0 ≤ z*(2*z)^q := by positivity
  have hle : (1-2*z)*rh32_rankBudget z q ≤ z := by linarith
  have hden : 0 < 1-2*z := by linarith
  have ht : z ≤ (1-2*z)*(2*z) := by
    nlinarith [mul_nonneg hz (show 0 ≤ 1-4*z by linarith)]
  exact (mul_le_mul_left₀ hden).mp (hle.trans ht)

theorem rh32_one_type_arith (L κ Y : ℝ) (a J : ℕ) (hL : 0 ≤ L) (haJ : a ≤ J)
    (hκ : κ ≤ Real.exp (-(1/2 * J * L))) (hY0 : 0 ≤ Y)
    (hY : Y ≤ Real.exp (1/8 * L)) :
    2*κ*Y^a ≤ 2*(Real.exp (-(3/8)*L))^J := by
  have hYa : Y^a ≤ Real.exp (a*(1/8*L)) := by
    rw [Real.exp_nat_mul]
    exact pow_le_pow_left₀ hY0 hY a
  rcases lt_or_ge κ 0 with hk | hk
  · have hh := mul_nonpos_of_nonpos_of_nonneg hk.le (pow_nonneg hY0 a)
    have hh' : 0 ≤ (Real.exp (-(3/8)*L))^J := by positivity
    nlinarith
  · have h1 : κ*Y^a ≤ Real.exp (-(1/2*J*L))*Real.exp (a*(1/8*L)) :=
      mul_le_mul hκ hYa (pow_nonneg hY0 a) (Real.exp_pos _).le
    rw [← Real.exp_add] at h1
    have ha : (a:ℝ) ≤ J := by exact_mod_cast haJ
    have h2 : -(1/2*(J:ℝ)*L) + a*(1/8*L) ≤ (J:ℝ)*(-(3/8)*L) := by
      nlinarith [mul_nonneg (sub_nonneg.mpr ha) hL]
    have h3 := Real.exp_le_exp.mpr h2
    rw [Real.exp_nat_mul] at h3
    nlinarith

theorem rh32_two_bad (D0 D1 D P z r I0 I1 : ℝ) (q : ℕ)
    (hD : 0 ≤ P*D) (hEq : D0+D1=P*D) (hz : 0 ≤ z) (hz4 : z ≤ 1/4)
    (hr : 4*z ≤ r)
    (h0 : I0 ≤ 2*D0*rh32_rankBudget z q)
    (h1 : I1 ≤ 2*D1*rh32_rankBudget z q) :
    I0+I1 ≤ r*P*D := by
  have hs := rh32_rank_le z q hz hz4
  calc
    I0+I1 ≤ 2*(D0+D1)*rh32_rankBudget z q := by linarith
    _ = 2*(P*D)*rh32_rankBudget z q := by rw [hEq]
    _ ≤ 2*(P*D)*(2*z) := mul_le_mul_of_nonneg_left hs (by positivity)
    _ ≤ r*P*D := by
      have h := mul_le_mul_of_nonneg_right hr hD
      nlinarith

-- Native replay and scan commands for the actual source, not the RH root.
rh_scan GlobalTheory.NearMod.nearModerate
rh_prune GlobalTheory.NearMod.one_type_arith
rh_scan rh32_one_type_arith
rh_reduce rh32_two_bad
rh_auto rh32_two_bad
rh_auto_frontier GlobalTheory.NearMod.nearModerate

#print axioms GlobalTheory.NearMod.nearModerate
#print axioms rh32_rank_identity
#print axioms rh32_rank_le
#print axioms rh32_one_type_arith
#print axioms rh32_two_bad

end GlobalTheory.NearMod
