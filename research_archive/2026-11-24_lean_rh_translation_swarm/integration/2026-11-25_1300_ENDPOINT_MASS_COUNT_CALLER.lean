import Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration — endpoint mass replaces both all-rank packages at the actual count caller
25 Nov 2026. HUMAN SOURCE-MATCHED; native certificate PREPARED, NOT compiled. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; LinkMin.lean blob b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f, lines 48–453.
Preflight current ONE_EQUATION_MISSION blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc;
SWARM, HANDOFF, AGENTS, research state/protocol, current shared manuscript
7beedb2752d934a81d4c92b5a19c1c48362e0dc9. Reviewed latest geometry
188850b1, editor e627db49, audit a543f365 and peer handoffs e669681c,
59e81b98, b99ef9ad, e70e93e7, 18759700, bb29422d, 90ea4293,
6044fe17, 2fd47915, 437f345a, b7b335f6. Distinct consumers.
No unrelated Cathedral research.

## One substantive contribution: caller-level propagation
The geometry RUN31 proves the endpoint identity by direct descent
from Conclusion2 and definite mass at rank k (same D, all embeddings).
At LinkMin lines 72–93, the only use of MassRatio₂ and BaseVolumeEqualsMass
in family_of_global_statements is the substitution
  volY0 = massI(r) = massI(k) * R, R = product_{k<M<=r} ratioH(M).
Replace those two equalities by their composite, with no all-rank
mass recurrence or terminal identification with X(0). Keep positivity
of ratioH, host v, index factors and Weyl dimension, and every log
identity. Thus the native LemmaFiveOneIdentity follows from just the
endpoint. The lower and upper count proofs use these two mass
packages ONLY through that identity; pass the identity, not the
packages, to both. At division_level_prime_family, take the maximum
of the two count thresholds, gap threshold, endpoint threshold and
sigma-degree threshold. Same Fm, D(x,i), x, i, C0, CY, Delta, w, u;
no independent windows or unproved uniformity.

Human manuscript insertion (next to editor's signed-mass paragraph):
The exact normalization is supplied directly by descending the
signature of Y(0) from (k+m/2-1,m/2) to (k,0), using Conclusion2 at
each step to delete an available negative line, then positive line,
and multiply the positive volume ratios ratioH(M). At the actual
terminal W of rank k invoke the definite mass identity, not an
unproved identification W=X(0). Hence volY0=massI(k) product ratioH.
This composite is all the native lower and upper sharp counts need
from the two mass packages: substitute it into DstarD/duStarU, then
the original index, Weyl and log-mass formulas give
LemmaFiveOneIdentity, and the original bounds give the same
FamilyVandermondeCountExplicit. The independent mass-error conjunct
in part_five_explicit_of_propositions is retained. VolRatioTrue,
VolTie, GenusMassStd, DefClassDecomp and all sigma-degree/rank
hypotheses still require the original producers. No RH-scale
estimate is established without them.

Original graph (source-visible overlay, not kernel graph):
family_of_global_sources -> massRatio_of_definiteVolume /
volume_eq_mass_of_definite -> MassRatio₂ + BaseVolumeEqualsMass ->
family_of_global_statements -> upper_weight_bound_eventually /
part_five_family_of_mass_volume -> division_level_prime_family ->
family_part_five_of_explicit_constants -> LinkGLOBAL7.
Candidate: RUN31 direct descent -> RHIntegrationMassEndpoint ->
rh_int_global_identity -> rh_int_lower / rh_int_upper_eventual ->
rh_int_count_of_endpoint -> same FamilyVandermondeCountExplicit.
The old graph is preserved, shared consumers not claimed deleted.
Context cache key (pin, Fm, D, x, i, k, r, same host, C0, CY,
Delta,w,u, count consumer). No reuse across hosts. Backtrack to
original if replay fails. No import Main or its RH theorem.
Source transformation checks: exact source blob and 18 exact
replacement assertions (including occurrence counts) executed via
connector JS; stale original mass-premise token guard passed.
The reproduced source body below is deliberately kept as a native
certificate, not additional human-proof pages. No synthetic tests.
Local command -v lean and lake returned empty. Retrieved actual CI
status.json for 45577239749 (returncode 0, 98.87s) and 45576756833
(returncode 0, 77.94s), blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717. These prove previous
engine/conditional strip checks only, not this file. No new axioms
certified. Native replay and independent review remain open.
Failed attempt: local Lean/Lake unavailable; no attempted compile.
No URT advantage asserted.

RESUME HERE: compile this caller-level certificate alongside geometry
RUN31; use the definitionally equal RH31Endpoint to feed the family
consumer at LinkGLOBAL7. Then prove the actual VolRatioTrue, VolTie
and rank-k DefClassDecomp/GenusMassStd producers or cite established
theorems at their exact strength. Keep original graph and all axioms.
HANDOFF TO editor, geometry, kernel and audit. PARTIAL.
-/

noncomputable section
namespace Formalism.MainNotions.StandardLattice
open NumberField Formalism.BasicNotions Finset

def RHIntegrationMassEndpoint (D : D7) : Prop :=
  letI := D.host.cmStar
  volY0 D = massI D D.R.k *
    ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M

theorem rh_int_endpoint_of_original (D : D7) (h2b : MassRatio₂ D)
    (h41 : BaseVolumeEqualsMass D) : RHIntegrationMassEndpoint D := by
  letI := D.host.cmStar
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have := D.R.r_eq
    have := D.R.two_le_m
    omega
  have hk := D.R.k_ge
  have hv := host_v_pos D
  change volY0 D = _
  rw [show volY0 D = massI D D.R.r from h41, hr]
  exact mass_telescope D h2b hv D.R.k (by omega) (D.R.m - 1)

theorem rh_int_global_identity (D : D7) (hEnd : RHIntegrationMassEndpoint D) : LemmaFiveOneIdentity D := by
  let _ := D.host.cmStar
  have h43 := index_product_formulas_and_ratio D
  intro u
  have hv := host_v_pos D
  have hk := D.R.k_ge
  have hm := D.R.two_le_m
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have er : D.R.r = D.R.k + D.R.m - 1 := rfl
    omega
  have hf : (0 : ℝ) < D.R.f := by exact_mod_cast degree_pos_alt D
  have hkR : (0 : ℝ) < D.R.k := by exact_mod_cast (by omega : 0 < D.R.k)
  have hg : ∀ i : Fin 2, (2 : ℝ) ≤ (D.host.g i : ℝ) := fun i => by exact_mod_cast (D.host.g_prime i).two_le
  have hfac : ∀ (i : Fin 2) (j : ℕ), 1 ≤ j → 0 < 1 - ((D.host.g i : ℝ) ^ j)⁻¹ := by
    intro i j hj
    have h1 : (2 : ℝ) ≤ (D.host.g i : ℝ) ^ j :=
      le_trans (hg i) (le_self_pow₀ (by linarith [hg i]) (by omega))
    have h2 : ((D.host.g i : ℝ) ^ j)⁻¹ ≤ 2⁻¹ := inv_anti₀ (by norm_num) h1
    norm_num at h2 ⊢
    linarith
  have e1 : (D.R.f : ℝ) * D.R.k * logXuD D u = Real.log (DstarD D / duStarU D u) := by
    unfold logXuD logXu
    field_simp
  set R := ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M with hR
  have hvol : volY0 D = massI D D.R.k * R := hEnd
  have hRpos : 0 < R := Finset.prod_pos fun M hM => mass_ratio_pos D hv M (by have := (Finset.mem_Ico.1 hM).1; omega)
  set Q := ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) ^ (D.R.f * (D.R.m * (2 * D.R.k + D.R.m - 1) / 2)) *
      ∏ i : Fin 2, ∏ j ∈ Finset.Ioc D.R.k D.R.r, (1 - ((D.host.g i : ℝ) ^ j)⁻¹) ^ D.R.f with hQ
  have hgg : 0 < (D.host.g 0 : ℝ) * (D.host.g 1 : ℝ) := mul_pos (by linarith [hg 0]) (by linarith [hg 1])
  have hQ2 : 0 < ∏ i : Fin 2, ∏ j ∈ Finset.Ioc D.R.k D.R.r, (1 - ((D.host.g i : ℝ) ^ j)⁻¹) ^ D.R.f :=
    Finset.prod_pos fun i _ => Finset.prod_pos fun j hj =>
      pow_pos (hfac i j (by have := (Finset.mem_Ioc.1 hj).1; omega)) _
  have hQpos : 0 < Q := mul_pos (pow_pos hgg _) hQ2
  have h3 : idxSig D (D.host.g 0) (D.host.g 1) / idxPi D (D.host.g 0) (D.host.g 1) = Q := h43.2.2
  have hidx : idxPi D (D.host.g 0) (D.host.g 1) ≠ 0 := by
    intro h0
    rw [h0, div_zero] at h3
    exact hQpos.ne h3
  have hmk : massI D D.R.k ≠ 0 := (massI_pos D D.R.k).ne'
  have hdim : ∀ ρ, 0 < dimV (uColR D u ρ) := fun ρ => dim_weyl_pos_of_strictAnti _ (column_param_strictAnti D u ρ)
  have hP : 0 < ∏ ρ, (D.dsig ρ / dimV (uColR D u ρ)) :=
    Finset.prod_pos fun ρ _ => div_pos (D.dsig_pos ρ) (hdim ρ)
  have e2 : DstarD D / duStarU D u = R * Q * ∏ ρ, (D.dsig ρ / dimV (uColR D u ρ)) := by
    unfold DstarD DstarP duStarU duStarP
    rw [hvol, Finset.prod_div_distrib, ← h3]
    have hd : (∏ ρ, dimV (uColR D u ρ)) ≠ 0 := (Finset.prod_pos fun ρ _ => hdim ρ).ne'
    field_simp
  have eR : Real.log R = ∑ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), Real.log (ratioH D M) :=
    Real.log_prod fun M hM => (mass_ratio_pos D hv M (by have := (Finset.mem_Ico.1 hM).1; omega)).ne'
  have eQ : Real.log Q = ((D.R.f * (D.R.m * (2 * D.R.k + D.R.m - 1) / 2) : ℕ) : ℝ) *
        Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) +
      (D.R.f : ℝ) * ∑ i : Fin 2, ∑ j ∈ Finset.Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
    rw [hQ, Real.log_mul (pow_pos hgg _).ne' hQ2.ne', Real.log_pow, Real.log_prod]
    · congr 1
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [Real.log_prod, Finset.mul_sum]
      · exact Finset.sum_congr rfl fun j _ => Real.log_pow _ _
      · exact fun j hj => (pow_pos (hfac i j (by have := (Finset.mem_Ioc.1 hj).1; omega)) _).ne'
    · exact fun i _ => (Finset.prod_pos fun j hj =>
        pow_pos (hfac i j (by have := (Finset.mem_Ioc.1 hj).1; omega)) _).ne'
  have eP : Real.log (∏ ρ, (D.dsig ρ / dimV (uColR D u ρ))) =
      ∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) -
        (D.R.f : ℝ) * (Real.log (facProd D.R.r) - Real.log (facProd D.R.k)) := by
    rw [Real.log_prod fun ρ _ => (div_pos (D.dsig_pos ρ) (hdim ρ)).ne']
    have : ∀ ρ, Real.log (D.dsig ρ / dimV (uColR D u ρ)) =
        Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) -
          (Real.log (facProd D.R.r) - Real.log (facProd D.R.k)) := by
      intro ρ
      have hvd : 0 < vand (uColR D u ρ) := by
        have := hdim ρ
        unfold dimV at this
        exact (div_pos_iff_of_pos_right (factorial_product_pos _)).1 this
      unfold dimV
      rw [Real.log_div (D.dsig_pos ρ).ne' (div_pos hvd (factorial_product_pos _)).ne',
        Real.log_div hvd.ne' (factorial_product_pos _).ne',
        Real.log_div (mul_pos (D.dsig_pos ρ) (factorial_product_pos _)).ne' hvd.ne',
        Real.log_mul (D.dsig_pos ρ).ne' (factorial_product_pos _).ne']
      ring
    rw [Finset.sum_congr rfl fun ρ _ => this ρ, Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ,
      D.what₂.card_Tau, nsmul_eq_mul]
  have he : ((D.R.f * (D.R.m * (2 * D.R.k + D.R.m - 1) / 2) : ℕ) : ℝ) =
      (D.R.f : ℝ) * ((D.R.m : ℝ) * (2 * D.R.k + D.R.m - 1) / 2) := by
    obtain ⟨c, hc⟩ := D.R.m_even
    have h1 : D.R.m * (2 * D.R.k + D.R.m - 1) / 2 = c * (2 * D.R.k + D.R.m - 1) := by
      have : D.R.m * (2 * D.R.k + D.R.m - 1) = 2 * (c * (2 * D.R.k + D.R.m - 1)) := by
        generalize 2 * D.R.k + D.R.m - 1 = X
        rw [hc]
        ring
      rw [this, Nat.mul_div_cancel_left _ (by norm_num)]
    have hX : ((2 * D.R.k + D.R.m - 1 : ℕ) : ℝ) = 2 * (D.R.k : ℝ) + D.R.m - 1 := by
      rw [Nat.cast_sub (by omega)]; push_cast; ring
    have hmc : (D.R.m : ℝ) = 2 * c := by rw [hc]; push_cast; ring
    rw [h1, Nat.cast_mul, Nat.cast_mul, hX, hmc]
    ring
  have hn : ((D.R.m - 1 : ℕ) : ℝ) = (D.R.m : ℝ) - 1 := by rw [Nat.cast_sub (by omega)]; simp
  rw [e1, e2, Real.log_mul (mul_pos hRpos hQpos).ne' hP.ne', Real.log_mul hRpos.ne' hQpos.ne', eR, eQ, eP,
    log_mass_ratio_telescoping D D.R.k (by omega) (D.R.m - 1), he, hn, Ico_succ_eq_Ioc, ← hr]
  ring

theorem rh_int_lower (D : D7) (sc : Scale) (C0 CY : ℝ)
    (hx : 2 * (Real.log 8 + 1 + Real.log sc.x) ≤ sc.L)
    (hId : LemmaFiveOneIdentity D) (h3 : SigmaDegreeTwoSidedBoundOfGap D) (hgap : ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
      ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3)))
    (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ) (hA : DataA D sc C0 CY Δ w) (u : D.what₂.Word) :
    lowS D sc w ≤ logXuD D u := by
  let _ := D.host.cmStar
  obtain ⟨hB, r1, r2, r3, r4, r5, r6, -, -⟩ := hA
  have hk := D.R.k_ge
  have hm := D.R.two_le_m
  have hL := scale_one_le_L sc
  have hx0 : 0 < sc.x := lt_trans one_pos sc.one_lt_alt
  have hpi : Real.pi ≤ D.host.v := hB.1
  have hv0 : 0 < D.host.v := lt_of_lt_of_le Real.pi_pos hpi
  have er : D.R.r = D.R.k + (D.R.m - 1) := by have := D.R.r_eq; omega
  have hF : (1 : ℝ) ≤ D.R.f := by exact_mod_cast (degree_pos_alt D)
  have hM : (44 : ℝ) ≤ D.R.m := by exact_mod_cast r3
  have hMK : (D.R.m : ℝ) ≤ D.R.k := by exact_mod_cast r4
  have hK0 : (0 : ℝ) ≤ D.R.k := Nat.cast_nonneg _

  have he : Real.exp (-(D.R.r : ℝ)) ≤ 1 / 3 := by
    have hr : (2 : ℝ) ≤ D.R.r := by exact_mod_cast (by omega : 2 ≤ D.R.r)
    have h1 : (D.R.r : ℝ) + 1 ≤ Real.exp (D.R.r : ℝ) := Real.add_one_le_exp _
    rw [Real.exp_neg, one_div]
    exact inv_anti₀ (by norm_num) (by linarith)
  have hd : ∀ ρ, (2 / 3 : ℝ) * dimV (rowLam D ρ) ≤ D.dsig ρ := by
    intro ρ
    have := (h3 (1 / 3) he (by norm_num) ρ
      (fun a b hab => le_trans (explicit_gap_le_general_gap D 8192 (1 / 3) le_rfl) (hgap Δ w hB ρ a b hab))).1
    have e : (1 - 1 / 3 : ℝ) = 2 / 3 := by norm_num
    rwa [e] at this

  have hSL : -((D.R.f : ℝ) * ((D.R.m : ℝ) - 1)) ≤
      ∑ M ∈ Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) := by
    have e1 : ∀ M ∈ Ioc D.R.k D.R.r, -(D.R.f : ℝ) ≤ Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) := by
      intro M hM
      have hM2 : 2 ≤ M := by have := (Finset.mem_Ioc.1 hM).1; omega
      have a := massIdentity_holds D M hM2
      have b := Formalism.LogVandermondeBounds.StandardLattice.log_zetaR_le_one M hM2
      rw [← zetaR_eq] at b
      have c : (D.R.f : ℝ) * Real.log (zetaR M) ≤ D.R.f * 1 := mul_le_mul_of_nonneg_left b (by linarith)
      have := (abs_le.1 a).1
      linarith
    have e2 := Finset.card_nsmul_le_sum _ _ _ e1
    rw [Nat.card_Ioc, nsmul_eq_mul] at e2
    have e3 : ((D.R.r - D.R.k : ℕ) : ℝ) = (D.R.m : ℝ) - 1 := by
      rw [er, Nat.add_sub_cancel_left, Nat.cast_sub (by omega : 1 ≤ D.R.m)]
      simp
    rw [e3] at e2
    linarith

  have hSG : -2 ≤ ∑ i : Fin 2, ∑ j ∈ Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
    have e1 : ∀ i : Fin 2, -1 ≤ ∑ j ∈ Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
      intro i
      have hg2 : 2 ≤ D.host.g i := (D.host.g_prime i).two_le
      rw [← Real.log_prod (fun j hj => (one_sub_inv_pow_pos _ hg2 j (by have := (Finset.mem_Ioc.1 hj).1; omega)).ne')]
      have hs := piN_split D.R.k (D.R.m - 1) (D.host.g i)
      rw [← er] at hs
      have hp := piN_pos D.R.k (D.host.g i) hg2
      have hq := ((local_index_formulas_and_bounds D).1 i).2.2.1
      rw [hs, mul_div_cancel_left₀ _ hp.ne'] at hq
      have hg4 : (4 : ℝ) ≤ (D.host.g i : ℝ) ^ (D.R.k + 1) := by
        have h2 : (2 : ℝ) ≤ D.host.g i := by exact_mod_cast hg2
        calc (4 : ℝ) = 2 ^ 2 := by norm_num
          _ ≤ 2 ^ (D.R.k + 1) := pow_le_pow_right₀ (by norm_num) (by omega)
          _ ≤ _ := pow_le_pow_left₀ (by norm_num) h2 _
      have hinv : ((D.host.g i : ℝ) ^ (D.R.k + 1))⁻¹ ≤ (4 : ℝ)⁻¹ := inv_anti₀ (by norm_num) hg4
      have hhalf : (1 / 2 : ℝ) ≤ ∏ j ∈ Ioc D.R.k D.R.r, (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
        norm_num at hinv ⊢
        linarith
      have h5 := Real.log_le_log (by norm_num) hhalf
      have l3 : -1 ≤ Real.log (1 / 2 : ℝ) := by
        rw [one_div, Real.log_inv]
        have := Real.log_two_lt_d9
        linarith
      linarith
    rw [Fin.sum_univ_two]
    linarith [e1 0, e1 1]

  have l23 : -1 ≤ Real.log (2 / 3 : ℝ) := by
    rw [Real.le_log_iff_exp_le (by norm_num), Real.exp_neg]
    have h1 : (1 : ℝ) + 1 ≤ Real.exp 1 := Real.add_one_le_exp _
    have : (Real.exp 1)⁻¹ ≤ (2 : ℝ)⁻¹ := inv_anti₀ (by norm_num) (by linarith)
    norm_num at this ⊢
    linarith
  have hSPW : (D.R.f : ℝ) * (-1 - 5 * D.R.k * sc.L - ((D.R.k : ℝ) + 2 * D.R.k * sc.L)) ≤
      (∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ))) -
        (D.R.k : ℝ) * ∑ ρ, ∑ j ∈ range D.R.m, Real.log (w j ρ) := by
    have e1 : ∀ ρ ∈ (Finset.univ : Finset D.what₂.Tau),
        (-1 - 5 * D.R.k * sc.L - ((D.R.k : ℝ) + 2 * D.R.k * sc.L)) ≤
        Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) -
          (D.R.k : ℝ) * ∑ j ∈ range D.R.m, Real.log (w j ρ) := by
      intro ρ _
      have a := place_dimension_lower_bound D sc C0 Δ w hB r6 hx u ρ (hd ρ)
      have b : (D.R.k : ℝ) * ∑ j ∈ range D.R.m, Real.log (w j ρ) -
          ((D.R.k : ℝ) - 1) * ∑ j ∈ range D.R.m, Real.log (bN D ρ j) ≤
          (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x + 2 * sc.L) := by
        rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
        have := Finset.sum_le_card_nsmul (range D.R.m) _ _
          (fun j hj => log_weight_minus_log_b_bound D sc C0 Δ w hB ρ j (Finset.mem_range.1 hj))
        rwa [Finset.card_range, nsmul_eq_mul] at this
      have c : (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x + 2 * sc.L) ≤ (D.R.k : ℝ) + 2 * D.R.k * sc.L := by
        have c0 : (D.R.m : ℝ) / sc.x ≤ 1 := (div_le_one hx0).2 r5
        have c1 : (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x) ≤ D.R.k := by
          calc (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x) = (D.R.k : ℝ) * ((D.R.m : ℝ) / sc.x) := by ring
            _ ≤ (D.R.k : ℝ) * 1 := mul_le_mul_of_nonneg_left c0 hK0
            _ = D.R.k := mul_one _
        have c2 : (D.R.m : ℝ) * (2 * sc.L) ≤ (D.R.k : ℝ) * (2 * sc.L) :=
          mul_le_mul_of_nonneg_right hMK (by linarith)
        linarith
      linarith
    have e2 := Finset.card_nsmul_le_sum _ _ _ e1
    rw [Finset.card_univ, D.what₂.card_Tau, nsmul_eq_mul, Finset.sum_sub_distrib, ← Finset.mul_sum] at e2
    exact e2

  have hg0 : ∀ i, (0 : ℝ) < (D.host.g i : ℝ) := fun i => by exact_mod_cast (D.host.g_prime i).pos
  have eG : Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) = ∑ i : Fin 2, Real.log (D.host.g i : ℝ) := by
    rw [Fin.sum_univ_two, Real.log_mul (hg0 0).ne' (hg0 1).ne']
  have hid := hId u
  rw [eG] at hid

  have hFne : (D.R.f : ℝ) ≠ 0 := by linarith
  have hlo : (D.R.f : ℝ) * D.R.k * lowS D sc w =
      (D.R.k : ℝ) * (∑ ρ, ∑ j ∈ range D.R.m, Real.log (w j ρ)) +
        (D.R.f : ℝ) * D.R.k * D.R.m * Real.log (D.host.v / Real.pi) +
        (D.R.f : ℝ) * D.R.k * D.R.m * (∑ i : Fin 2, Real.log (D.host.g i : ℝ)) -
        11 * (D.R.f : ℝ) * D.R.k * sc.L := by
    have e1 : ∀ j ∈ range D.R.m, (1 / (D.R.f : ℝ)) * ∑ ρ, Real.log (w j ρ * D.host.v / Real.pi) =
        (1 / (D.R.f : ℝ)) * (∑ ρ, Real.log (w j ρ)) + Real.log (D.host.v / Real.pi) := by
      intro j hj
      have hj' := Finset.mem_range.1 hj
      have e0 : ∀ ρ ∈ (Finset.univ : Finset D.what₂.Tau), Real.log (w j ρ * D.host.v / Real.pi) =
          Real.log (w j ρ) + Real.log (D.host.v / Real.pi) := by
        intro ρ _
        have hw : 0 < w j ρ := lt_of_lt_of_le one_pos (weights_ge_one_section_B D sc C0 Δ w hB ρ j hj')
        rw [mul_div_assoc, Real.log_mul hw.ne' (div_pos hv0 Real.pi_pos).ne']
      rw [Finset.sum_congr rfl e0, Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
        D.what₂.card_Tau, nsmul_eq_mul]
      field_simp
    unfold lowS
    rw [Finset.sum_congr rfl e1, Finset.sum_add_distrib, Finset.sum_const, Finset.card_range, nsmul_eq_mul,
      ← Finset.mul_sum, Finset.sum_comm]
    field_simp
  have hlv0 : 0 ≤ Real.log (D.host.v / Real.pi) :=
    Real.log_nonneg ((one_le_div Real.pi_pos).2 hpi)
  have hlv : Real.log (D.host.v / Real.pi) ≤ sc.L := by
    rw [Real.log_div hv0.ne' Real.pi_pos.ne']
    have : 0 ≤ Real.log Real.pi := Real.log_nonneg (by have := Real.pi_gt_three; linarith)
    linarith [hB.2.1]
  have hG : 0 ≤ ∑ i : Fin 2, Real.log (D.host.g i : ℝ) :=
    Finset.sum_nonneg fun i _ => Real.log_nonneg (by exact_mod_cast (D.host.g_prime i).one_lt.le)
  exact log_X_lower_arithmetic _ _ _ _ _ _ _ _ _ _ _ _ _ hF hM hMK hL hlv0 hlv r1 hG hSL hSG hSPW hid hlo

theorem rh_int_lower_eventual (eps C0 CY : ℝ) (heps : 0 < eps) :
    ∃ x0 : ℝ, ∀ (D : D7) (sc : Scale), sc.eps = eps → x0 ≤ sc.x → LemmaFiveOneIdentity D → SigmaDegreeTwoSidedBoundOfGap D →
      (∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
        ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3))) → ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataA D sc C0 CY Δ w → ∀ u : D.what₂.Word,
        lowS D sc w ≤ logXuD D u := by
  have h1 := (isLittleO_log_rpow_atTop heps).bound (show (0 : ℝ) < 1 / 4 by norm_num)
  have h2 := (tendsto_rpow_atTop heps).eventually_ge_atTop (4 * (Real.log 8 + 1))
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 (h1.and h2)
  refine ⟨x0, fun D sc he hx hId h3 h4B Δ w hA u => ?_⟩
  obtain ⟨a, b⟩ := hx0 sc.x hx
  have hL : sc.L = sc.x ^ eps := by unfold Scale.L; rw [he]
  have hpos : 0 ≤ sc.x ^ eps := Real.rpow_nonneg (lt_trans one_pos sc.one_lt_alt).le _
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg hpos] at a
  have a' := le_trans (le_abs_self _) a
  exact rh_int_lower D sc C0 CY (by rw [hL]; linarith) hId h3 h4B Δ w hA u

theorem rh_int_upper_eventual (eps C0 CY : ℝ) (heps : 0 < eps) :
    ∃ x0 : ℝ, ∀ (D : D7) (sc : Scale), sc.eps = eps → x0 ≤ sc.x → LemmaFiveOneIdentity D → SigmaDegreeTwoSidedBoundOfGap D →
      (∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
        ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3))) → ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataA D sc C0 CY Δ w → ∀ u : D.what₂.Word,
        logXuD D u ≤ (15 + 3 * CY) * D.R.m * sc.L := by
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 ((tendsto_rpow_atTop heps).eventually_ge_atTop 9)
  refine ⟨x0, fun D sc he hx hId h3 h4B Δ w hA u => ?_⟩
  let _ := D.host.cmStar
  have hL9 : 9 ≤ sc.L := by unfold Scale.L; rw [he]; exact hx0 sc.x hx
  obtain ⟨hB, r1, r2, r3, r4, r5, r6, -, -⟩ := hA
  have hgap := h4B Δ w hB
  have id := hId u
  have hkN := D.R.k_ge
  have hmN := D.R.two_le_m
  have er : D.R.r = D.R.k + D.R.m - 1 := rfl
  have hk5 : (5 : ℝ) ≤ D.R.k := by exact_mod_cast hkN
  have hm44 : (44 : ℝ) ≤ D.R.m := by exact_mod_cast r3
  have hmk : (D.R.m : ℝ) ≤ D.R.k := by exact_mod_cast r4
  have hf : (0 : ℝ) < D.R.f := by exact_mod_cast degree_pos_alt D
  have hv := host_v_pos D
  have hpi := hB.1
  have hpi3 : (3 : ℝ) < Real.pi := Real.pi_gt_three

  have hlv0 : 0 ≤ Real.log (D.host.v / Real.pi) := Real.log_nonneg ((one_le_div Real.pi_pos).2 hpi)
  have hlv : Real.log (D.host.v / Real.pi) ≤ sc.L := by
    refine le_trans (Real.log_le_log (div_pos hv Real.pi_pos) ?_) hB.2.1
    rw [div_le_iff₀ Real.pi_pos]; nlinarith
  have h2v0 : 0 ≤ Real.log (2 * D.host.v) := Real.log_nonneg (by linarith)

  have hcard : ((Finset.Ioc D.R.k D.R.r).card : ℝ) ≤ D.R.m := by
    rw [Nat.card_Ioc]; exact_mod_cast (by omega : D.R.r - D.R.k ≤ D.R.m)
  have hSL : ∑ M ∈ Finset.Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) ≤ (D.R.f : ℝ) * D.R.m := by
    have h1 : ∀ M ∈ Finset.Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) ≤ (D.R.f : ℝ) := by
      intro M hM
      have hM2 : 2 ≤ M := by have := (Finset.mem_Ioc.1 hM).1; omega
      have a := massIdentity_holds D M hM2
      have b := Formalism.LogVandermondeBounds.StandardLattice.log_zetaR_le_one M hM2
      rw [← zetaR_eq] at b
      have c := mul_le_mul_of_nonneg_left b hf.le
      linarith [le_abs_self (Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M))]
    have h2 := Finset.sum_le_card_nsmul _ _ _ h1
    rw [nsmul_eq_mul] at h2
    have h3 := mul_le_mul_of_nonneg_right hcard hf.le
    linarith

  have hg1 : ∀ i, (1 : ℝ) ≤ (D.host.g i : ℝ) := fun i => by exact_mod_cast (D.host.g_prime i).one_lt.le
  have elg : Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) =
      Real.log (D.host.g 0 : ℝ) + Real.log (D.host.g 1 : ℝ) :=
    Real.log_mul (by linarith [hg1 0]) (by linarith [hg1 1])
  have hlg0 : 0 ≤ Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) := by
    rw [elg]; linarith [Real.log_nonneg (hg1 0), Real.log_nonneg (hg1 1)]
  have hlg : Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) ≤ 2 * CY * sc.L := by
    rw [elg]; linarith [r2 0, r2 1]
  have hS5 : ∑ i : Fin 2, ∑ j ∈ Finset.Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) ≤ 0 := by
    refine Finset.sum_nonpos fun i _ => Finset.sum_nonpos fun j hj => ?_
    have hj1 : 1 ≤ j := by have := (Finset.mem_Ioc.1 hj).1; omega
    have p := one_sub_inv_pow_pos (D.host.g i) (D.host.g_prime i).two_le j hj1
    refine Real.log_nonpos p.le ?_
    have : 0 ≤ ((D.host.g i : ℝ) ^ j)⁻¹ := by positivity
    linarith

  have hl3 : Real.log 3 ≤ 2 := by
    have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < 3 by norm_num); linarith
  have hrR : (D.R.r : ℝ) ≤ 2 * D.R.k := by
    have : D.R.r ≤ 2 * D.R.k := by omega
    exact_mod_cast this
  have hr1 : (1 : ℝ) ≤ D.R.r := by exact_mod_cast (by omega : 1 ≤ D.R.r)
  have hlr : Real.log (D.R.r : ℝ) ≤ sc.L := le_trans (Real.log_le_log (by linarith) hrR) r6
  have hlr0 : 0 ≤ Real.log (D.R.r : ℝ) := Real.log_nonneg hr1
  have hrlr : (D.R.r : ℝ) * Real.log (D.R.r : ℝ) ≤ 2 * D.R.k * sc.L :=
    mul_le_mul hrR hlr hlr0 (by linarith)
  have hrk : ((D.R.r - D.R.k : ℕ) : ℝ) ≤ D.R.m := by exact_mod_cast (by omega : D.R.r - D.R.k ≤ D.R.m)
  have hS6 : ∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) ≤
      (D.R.f : ℝ) * ((D.R.k : ℝ) * D.R.m * (2 + 5 * sc.L + 5 * sc.L + 10) + D.R.m * (2 * D.R.k * sc.L)) := by
    have h1 : ∀ ρ ∈ (Finset.univ : Finset D.what₂.Tau),
        Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) ≤
          (D.R.k : ℝ) * D.R.m * (2 + 5 * sc.L + 5 * sc.L + 10) + D.R.m * (2 * D.R.k * sc.L) := by
      intro ρ _
      have hdim := dim_weyl_pos_of_strictAnti _ (column_param_strictAnti D u ρ)
      have hV : 0 < vand (uColR D u ρ) := by
        unfold dimV at hdim
        exact (div_pos_iff_of_pos_right (facProd_pos' _)).1 hdim
      have e1 : Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) =
          (Real.log (D.dsig ρ) - Real.log (dimV (uColR D u ρ))) +
            (Real.log (facProd D.R.r) - Real.log (facProd D.R.k)) := by
        unfold dimV
        rw [Real.log_div (mul_pos (D.dsig_pos ρ) (facProd_pos' _)).ne' hV.ne',
          Real.log_mul (D.dsig_pos ρ).ne' (facProd_pos' _).ne',
          Real.log_div hV.ne' (facProd_pos' _).ne']
        ring
      rw [e1]
      have a := place_dimension_upper_bound D sc C0 Δ w hB h3 hgap u ρ
      have b := log_factorial_product_difference D.R.k D.R.r (by omega) (by omega)
      have hkm : 0 ≤ (D.R.k : ℝ) * D.R.m := by positivity
      have a' : (D.R.k : ℝ) * D.R.m * (Real.log 3 + 5 * Real.log (2 * D.R.k) + 5 * sc.L + 10) ≤
          (D.R.k : ℝ) * D.R.m * (2 + 5 * sc.L + 5 * sc.L + 10) :=
        mul_le_mul_of_nonneg_left (by linarith) hkm
      have b' : ((D.R.r - D.R.k : ℕ) : ℝ) * ((D.R.r : ℝ) * Real.log (D.R.r : ℝ)) ≤
          D.R.m * (2 * D.R.k * sc.L) :=
        mul_le_mul hrk hrlr (mul_nonneg (by linarith) hlr0) (by linarith)
      linarith
    have h2 := Finset.sum_le_card_nsmul _ _ _ h1
    rw [Finset.card_univ, D.what₂.card_Tau, nsmul_eq_mul] at h2
    exact h2
  exact log_X_upper_arithmetic (D.R.f : ℝ) D.R.k D.R.m sc.L CY _ _ _ _ _ _ _ hf hk5 hm44 hmk hL9 hlv0 hlv h2v0 hSL hlg0 hlg hS5
    hS6 id

theorem rh_int_count_of_endpoint {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) (hEnd : flipTwoThree.fam0 Fm RHIntegrationMassEndpoint)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) : FamilyVandermondeCountExplicit Fm := by
  intro C0 CY
  have heps : 0 < eps := by
    obtain ⟨i⟩ := Fm.Ix_zero
    rw [← Fm.L_eps 0 i]; exact (Fm.L 0 i).sc.eps_pos
  obtain ⟨xa, ha⟩ := rh_int_lower_eventual eps C0 CY heps
  obtain ⟨xb, hb⟩ := rh_int_upper_eventual eps C0 CY heps
  obtain ⟨xg, hg⟩ := gapB_ev eps 8192 C0 heps
  obtain ⟨x1, hEnd⟩ := hEnd
  obtain ⟨x3, h3⟩ := h3
  refine ⟨max (max xa xb) (max xg (max x1 x3)), fun x hx hxx i => ?_⟩
  have ea : xa ≤ x := le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) hx
  have eb : xb ≤ x := le_trans (le_trans (le_max_right _ _) (le_max_left _ _)) hx
  have eg : xg ≤ x := le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) hx
  have e1 : x1 ≤ x := le_trans (le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) (le_max_right _ _)) hx
  have e3 : x3 ≤ x :=
    le_trans (le_trans (le_trans (le_max_right _ _) (le_max_right _ _)) (le_max_right _ _)) hx
  have hsx : (Fm.L x i).sc.x = x := Fm.L_x x i hxx
  have gap := hg (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i) (by rw [hsx]; exact eg)
  have h5 : Conclusion5Sharp (Fm.D x i) (Fm.L x i).sc C0 CY := fun Δ w hA u =>
    ⟨ha (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i) (by rw [hsx]; exact ea) (rh_int_global_identity _ (hEnd x e1 hxx i)) (h3 x e3 hxx i)
        gap Δ w hA u,
      hb (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i) (by rw [hsx]; exact eb) (rh_int_global_identity _ (hEnd x e1 hxx i)) (h3 x e3 hxx i)
        gap Δ w hA u⟩
  exact part_five_explicit_of_propositions _ _ C0 CY h5 (vandermonde_variation_holds _ _ C0 CY)

theorem rh_int_identity_replay (D : D7) (hEnd : RHIntegrationMassEndpoint D) :
    LemmaFiveOneIdentity D := by
  first
  | (rh_reduce 3 using [rh_int_global_identity]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh_int_global_identity D hEnd

theorem rh_int_original_family_bridge {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)
    (h2b : flipTwoThree.fam0 Fm MassRatio₂)
    (h2v : flipTwoThree.fam0 Fm BaseVolumeEqualsMass)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) :
    FamilyVandermondeCountExplicit Fm := by
  apply rh_int_count_of_endpoint Fm _ h3
  obtain ⟨x1, h1⟩ := h2b
  obtain ⟨x2, h2⟩ := h2v
  refine ⟨max x1 x2, fun x hx hxx i => ?_⟩
  exact rh_int_endpoint_of_original _ (h1 x (le_trans (le_max_left _ _) hx) hxx i)
    (h2 x (le_trans (le_max_right _ _) hx) hxx i)

rh_scan family_of_global_statements limit 2000
rh_scan rh_int_global_identity limit 2000
rh_scan division_level_prime_family limit 2000
rh_scan rh_int_count_of_endpoint limit 2000
rh_prune rh_int_global_identity as RHIntegrationIdentityPruned
rh_prune rh_int_count_of_endpoint as RHIntegrationCountPruned
#print axioms family_of_global_statements
#print axioms division_level_prime_family
#print axioms rh_int_global_identity
#print axioms rh_int_count_of_endpoint
#print axioms rh_int_original_family_bridge
end Formalism.MainNotions.StandardLattice
