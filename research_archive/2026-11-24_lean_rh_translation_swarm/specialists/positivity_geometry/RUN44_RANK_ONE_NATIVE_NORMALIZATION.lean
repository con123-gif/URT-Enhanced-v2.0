/-
RUN44 | 2026-11-26 | lane 7 positivity geometry
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; mandatory unified engine retained.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1.
Prior RUN43 75e752290c518437a8fa2f3a7f6a4c4037644ff3; peer theta
f296aa34449f61b64e628744d7efe5a1cb8be6c1 and editor
8c83c6328da417d5d8ab8d364296610cecc81ce8 checked.
Status: SOURCE-MATCHED / HUMAN ARGUMENT / LEAN CANDIDATE UNEXECUTED.

Actual rank-one measure supplier, NOT another assumed normalization:
  CompanionTheory/AutomorphicTheory/ThetaDilations/SwOne.lean
    d32a22a449c7050f1e122e43d49552ed3a13db21: sw_one
  CompanionTheory/SpectralGeometry/LocalGlobalProofs/AdelicAnalysis/
    SiegelWeilMeasureRankOneStatement.lean
    6f5b52e9069e8be9faf38d53202fd4433c2414ad
    -> SiegelWeilMeasureRankOne.lean f20eb2175e69abb8d2542ed4173de0cc0a79c63e
    -> sw_one.
  RankOneLocalDensitiesProductConverges.lean
    1398ce4e513c72177121bd9ef05618724adf788e: growth_main
  HaarFundamentalDomainRankOneDensity.lean
    33b6fb8216e114e196ca3ce65ce987910b99cffc: bound_hermitian.
  CompanionTheory/SpectralGeometry/CountingDefinitions/AdelicEulerProducts/
    IsEulerProd.lean 6341eea11489ecd82bda087171023fad7d68415e.
  Development/WeilBound/CoreStatements/AutomorphicKernels/
    UnitarySchrodingerModel/UnitarySchrodingerLemmas/LowRankSiegelDensities/
    SiegelDensitiesLowAOf.lean fb980735b91e5c905b07ea8fef96589e5a41f63f:
    one_vec_sw and one_vec_bound branch on M >= 3; binary branch unnecessary
    for this selected use only (not a deletion from the full proof).

EXACT CANCEL FIRST. Let f=[F:Q]>0 and M>=3. The native proof obtains an
Euler-product scalar c>=0 from invariant fibre-supported measure. If a
local factor vanishes it uses the zero-measure branch. Otherwise let w>0
be the fixed archimedean test integral, P(a) the product of dilated local
densities, I(a) the finite theta integral. For the SAME cofinal integers a:
    I(a)=c*w*P(a), |I(a)-w*P(a)| <= C*a^(f*M),
    P(a) >= kappa*a^(f*(2*M-2)), kappa>0.
Cancel before taking a norm:
    |c-1|*w*kappa*a^(f*(M-2)) <= C.
The exponent gap is strictly positive; hence c=1. This is a human proof of
the normalization conditional on the native suppliers, which have actual
source bodies. No inference from finite samples, no external Tamagawa
assumption, no RH import. Growth supplier chooses a=N*p^k, with p one
plus the product of norms of the finite bad set (not necessarily prime).
The same local factors outside places dividing p stay fixed. The changing
finite factors have a positive uniform lower bound. Do not replace cofinal
a by all a; do not drop positivity of w or kappa or M>=3.
Negative controls (exact): e=g, c=2,w=kappa=C=1,P(a)=a^e,I(a)=2*a^e
satisfies the estimates but c!=1. w=0 permits arbitrary c.

Graph retained: volumeRatio -> volumeRatio_of_unfolding -> ratio_of_setting
-> SW1b2; RUN43 overlay -> SWAt43 selected mean. The original SW1b2 bridge
to the rank-one supplier is not yet traced. New candidate overlay:
SWAt43 <- [coordinate/selfdual fibre bridge, selected product identity]
<- SWMeas(rank 1, scalar beta) <- siegel_weil_measure_rank_one
<- siegel_one_vector <- sw_one <- [invariance, factorization, zero branch,
density error, cofinal density growth]. This is a proposed replacement
route for the actual selected geometry consumer, not a verified global
dependency deletion. Keep all original/reduced graphs and unresolved
axioms; no new axiom ledger obtained. Context-key: F,E,sigma,J,M,beta,
basis, Haar/domain, additive character, fibre family, arch test, finite
lattice. Never reuse the normalization proof across mismatched witnesses.

RESUME HERE: close the explicit coordinate-to-selfdual bridge, not another
normalization reduction. In IsEulerProd.lean, IsGramFib disintegrates on
the nonsingular open set, whereas StandardLattice SW1b2 uses qR on all
ambient space and continuity on nonzero values. For a 1x1 Gram, identify
scalar by half trace, show zero fibre is ambient-null, extend by zero,
transport the continuity clauses. Use the native
exists_unit_scaling_selfdual_adelic_measures, herm_measures,
unit_product_closure_properties and gram_fiber_measures_scaling (see
SiegelDensities/Bridge.lean dbe18c... for their use; do NOT import its
full-rank anisotropic conclusion as a replacement). Apply product-of-scales
=1 to the SAME selected arch bump and finite lattice indicators, match
thetaMeas integral to meanL by nonnegative sum/integral exchange, then
feed RUN43 ratio_of_setting43. Also trace actual SW1b2 field from the
published wrapper, and independently replay both original and candidate
axiom audits. ASK-MAIN uniform signed slack and root remain unresolved.
HANDOFF TO: geometry lane; theta lane for fibre bridge; editor for integration.

Verification: 26 actual hash/token assertions on seven pinned source files.
Baseline CI status JSONs retrieved: rh-recursive-reduction-strip-root-20261125
(run 45577239749) and rh-proof-term-prune-native-20261125 (45576756833)
both pass/returncode 0, NOT evidence for this candidate. Local command -v
lean and lake both empty. No new native execution, no kernel PASS.
-/
import Mathlib
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.SiegelWeilMeasureRankOneStatement
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open HeckeCharacterZeroLocus.SiegelWeilU GlobalTheory.CompanionTheory.SW
open NumberField IsDedekindDomain MeasureTheory Topology
open scoped TensorProduct ENNReal NNReal Matrix

namespace RH44RankOneGeometry

theorem cancel_normalization (c w kappa C : ℝ) (P I : ℕ → ℝ)
    (e g : ℕ) (hw : 0 < w) (hkappa : 0 < kappa) (hg : e < g)
    (hcof : ∀ k : ℕ, ∃ a : ℕ, k < a ∧
      I a = c*w*P a ∧ |I a - w*P a| ≤ C*(a:ℝ)^e ∧
      kappa*(a:ℝ)^g ≤ P a) : c = 1 := by
  by_contra hc
  have hq : 0 < |c-1|*w*kappa :=
    mul_pos (mul_pos (abs_pos.mpr (sub_ne_zero.mpr hc)) hw) hkappa
  obtain ⟨k,hk⟩ := exists_nat_gt (C / (|c-1|*w*kappa))
  obtain ⟨a,hka,hI,herr,hP⟩ := hcof k
  have haN : 0 < a := by omega
  have ha : 0 < (a:ℝ) := by exact_mod_cast haN
  have ha1 : 1 ≤ (a:ℝ) := by exact_mod_cast (show 1 ≤ a by omega)
  have hp : 0 ≤ P a := le_trans (by positivity) hP
  have hwp : 0 ≤ w * P a := mul_nonneg hw.le hp
  rw [hI, show c*w*P a - w*P a = (c-1)*(w*P a) by ring,
    abs_mul, abs_of_nonneg hwp] at herr
  have hpow : (a:ℝ)^(e+1) ≤ (a:ℝ)^g :=
    pow_le_pow_right₀ ha1 (by omega)
  have hl : (|c-1|*w*kappa*(a:ℝ))*(a:ℝ)^e ≤ C*(a:ℝ)^e := by
    calc
      _ = (|c-1|*w*kappa)*(a:ℝ)^(e+1) := by rw [pow_succ]; ring
      _ ≤ (|c-1|*w*kappa)*(a:ℝ)^g := mul_le_mul_of_nonneg_left hpow hq.le
      _ ≤ |c-1|*(w*P a) := by
        calc
          _ = (|c-1|*w)*(kappa*(a:ℝ)^g) := by ring
          _ ≤ (|c-1|*w)*P a := mul_le_mul_of_nonneg_left hP (by positivity)
          _ = _ := by ring
      _ ≤ _ := herr
  have hbound := le_of_mul_le_mul_right hl (pow_pos ha e)
  have hlt := (div_lt_iff₀ hq).mp hk
  have hkaR : (k:ℝ) < (a:ℝ) := by exact_mod_cast hka
  have hlt2 := mul_lt_mul_of_pos_left hkaR hq
  linarith

-- Actual native selected rank-one measure supplier, without binary case.
theorem selected_sw44
    (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]
    (σ : E →ₐ[F] E) (hCM : IsCMExt F E σ) (M : ℕ)
    (J : Matrix (Fin M) (Fin M) E) (hJ : IsHermND σ J) (hM : 3 ≤ M)
    (β : F) (hβ : β = 1 ∨ β = -1)
    (T : Matrix (Fin 1) (Fin 1) E)
    (hscalar : ∀ i j, T i j = algebraMap F E β)
    (hT : ∀ i j, σ (T j i) = T i j) :
    SWMeas σ J T hT := by
  have hd : T.det ≠ 0 := by
    rw [Matrix.det_unique, hscalar]
    rcases hβ with h | h <;> simp [h]
  first
  | (rh_reduce 2 using [GlobalTheory.T.siegel_weil_measure_rank_one]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact GlobalTheory.T.siegel_weil_measure_rank_one F E σ hCM M J hJ hM T hT hd

rh_scan GlobalTheory.T.siegel_weil_measure_rank_one limit 2000
rh_scan CompanionTheory.PlacePermOperatorBicommutantSpan.sw_one limit 2000
rh_scan selected_sw44 limit 2000
rh_prune selected_sw44 as RH44SelectedSWPruned
rh_prune cancel_normalization as RH44CancelPruned
#print axioms GlobalTheory.T.siegel_weil_measure_rank_one
#print axioms CompanionTheory.PlacePermOperatorBicommutantSpan.sw_one
#print axioms selected_sw44
#print axioms cancel_normalization
end RH44RankOneGeometry
