import Run99SmallCrudeRows
import New.Filling.FillingTheorem
import Lean

/-!
# Integration — exact local fixing-budget to weak-star caller
28 November 2026. SOURCE-MATCHED / PREPARED, NOT native compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM and HANDOFF read; latest peers include 1e1163106 (signed
sharp star), b9171026 (near-rank C), 5a6a94bb (pair packing),
59d15706 (A2 caller), 3aa72709 (isolated B3 convex leaf). The latter
already has its own queue entry f2f9ff47; do not duplicate it.

This implements the actual source substitution proposed in 73e689b8,
not another relaxed scalar certificate. It connects the previously
prepared global moment caller d8fe4185 to its actual upstream
positive-type induction, and then to the RUN99 C/rank-star caller.
Same D, filling, group, amplitude, normalization, h0/hu/hB/hA,
tensor child family, trace/complement terms, ramifying operator,
short columns, independent basis and reciprocal completion.
Write e=b^-4, M=mainEnergy, beta=b^(-6k).
The sole NEW B3 input (not established here) is, for every fixing
mask A and prescribed nonzero vectors D_A,
  energy(fullAmplitude)(fixingSet A D_A)
      <= (1-e)(1+zeta) M beta^|A|.
In the original contradiction proof, the child bound after ih and
hK is total mass times beta. The factor 1+zeta cancels exactly.
Thus the same native singular-minor escape calculation gives
  sum Theta <= (1+zeta) M beta^|A|.
No substitute for the actual all-subsets energy domination or
positive type; no new normalization of the energy.

The actual native Fits dyad proof at the empty mask retains the
positive-type construction and gives spread 5e+zeta/2 before
ramification. The Data caller adds f/(N-1). Choose zeta=eta=
1/(4 b x^200) and keep the existing scale check
5e+f/(N-1)<=eta/2. This local budget conditionally supplies the
RUN99 relaxed-star theorem, hence the identical governing inequality
mR<=logB^2 budget. Its tolerance compared to the original excess
9e is zeta/(9e)=b^3/(36 x^200). No computational speedup claimed.
This route keeps the original depth b^(-6k|A|); it does NOT yet
implement the separately proposed depth-discounted masks (1a08fa08,
32cb51c0), or the editor's signed near-rank variant. Do not conflate
their different C rank hypotheses, or infer all B3 gaps are solved.
The old local energy theorem is a fallback, not a dependency-free
proof of the weakened supplier. A/B/C source transports here are
not replacements for the verified original graph.

Sources: New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444;
CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18;
OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6;
FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76.
Prior Data caller blob 1baec7311082f60ca41629694068b30cc5760f59.
RUN99 source a88a3ac6c0bbcee65a5691ed64231fce161c4c37;
stage it as Run99SmallCrudeRows only after its dependencies replay.
No New.Main import. Source pin preserved.

Executed connector checks: 16 unique substitutions on four actual
declarations, each complete reverse transformation restored its
input exactly, 32 missing/duplicated-anchor negative controls
rejected. Earlier global-moment-only caller leaves hEnergy as a
premise; the new variant retains the original shared ?H Gram proof
at its two actual consumers, so avoids relying on that untested
metavariable change. The new hFix induction and caller must still
be kernel elaborated. No lean/lake/elan on local PATH. No new
rh_scan/prune/reduce/auto/frontier or native graph execution.
Fresh A2 receipt independently retrieved: run 46125697285,
compute/rh-compact-a2-leaf-repair-20261128/outputs/theta92/theta92_result.json
blob 492e6c7c2590f849ba59eae6f11517b646d72f44, native_verified=true,
graph_audited=true, prune_executed=true, caller_replacements_checked=false.
Scope is chosen-level freeness only; it does not verify this file.
No duplicate replay or alteration of protected workflows.
All original/reduced graphs, axioms and open obligations retained.

RESUME HERE: compile the four source-matched local fixing transports
in the authenticated compact cache (first isolate the Filling
induction/Fits declarations from the pending Run99SmallCrudeRows
import if necessary), then compile the star junction with the actual
RUN99 module. Require the explicit dependency/axiom guards below,
and audit the full original/new graphs. The first unresolved
mathematical supplier is IntegrationFixingBudget at the actual
fixingSet A D; retain the separate trace/complement requirements.
Do not count a source check or queue result as a native PASS.
HANDOFF integration / Landau / positivity / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling
variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok :
  S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

/-- The explicit relaxed local supplier. The mask and all its vector data
    range over the same native domains as energy_fixingSet_le. -/
abbrev IntegrationFixingBudget [WeilData E] (S : Filling E 𝔰) [S.IsAdmissible]
    (ζ : ℝ) : Prop :=
  ∀ (A : Finset (S.chosenPlaces 0)) (D : ∀ _, _),
    energy (S.amplitudeSum .univ) (S.fixingSet A D) ≤
      (1 - (S.b ^ 4)⁻¹) * ((1 + ζ) * S.mainEnergy *
        (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A)

lemma integration_sum_le_of_positive_type_relaxed [WeilData E] {ζ : ℝ}
    (hζ : 0 ≤ ζ) (hFix : S.IntegrationFixingBudget ζ) {Θ : _ → ℝ} (h0 : ∀ s, 0 ≤ Θ s) (u : _ → V) (hu :
  ∀ a b, ⟪u a, u b⟫_ℂ = Θ (a⁻¹ * b)) A (D : ∀ _, _) (hB : ∀ Ω, ∑ s with s ∈ Ω, Θ s ≤ energy
  (S.amplitudeSum .univ) Ω) (hA : ∀ s, Θ s ≠ 0 → ∀ w ∈ A, s ∈ S.vectorFixer (i := 0) w (D w)) :
  ∑ s, Θ s ≤ (1 + ζ) * S.mainEnergy * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A := by
  induction' A using WellFoundedGT.induction with A ih generalizing V Θ D
  obtain ⟨hq, q, _⟩ := S.levelPrime_le 0, S.le_levelPrime 0, S.thousand_le_b, univ.sum_nonneg' h0,
    S.ϱ_le_k; by_contra! hK
  apply hK.not_ge
    (le_of_mul_le_mul_left (.trans _ (hFix A D)) (by bound [@one_lt_pow₀ ℝ]))
  grw [← hB, one_sub_mul, sub_le_comm, ← sum_sdiff_eq_sub (by simp), ← sum_filter_ne_zero]
  obtain hw | ⟨w, hw⟩ := em' (Exists (· ∉ A))
  · rw [Finset.sum_eq_zero (by simp; grind [fixingSet])]; bound
  choose! L hL using fun s (e : s ∉ S.fixingSet A D) h ↦ by simpa using (e ⟨hA s h, .inr ⟨w, ·⟩⟩)
  grw [← Finset.sum_fiberwise _ L, sum_le_card_nsmul _ _ (3 * univ.sum Θ / S.b ^ 10)
    fun l _ ↦ let F b := frameImage (cond b (S.latMiddle (ResField w.1)).splitGram 1) *
      inclMatrix (ResField w.1) (Fin.castLE l.is_le)
    (le_div_iff₀' (by bound)).2 (.trans ?_ ((card_mul_sum_det_le (.mk' (· 0 w) (by simp)) F h0 hu
    (univ.sum Θ / S.b ^ (6 * 𝔰.k)) (by bound) fun b v hv ↦ by
    grw [sum_filter, ih _ (ssubset_insert hw) _ (fun a ↦
      basisFun _ ℂ (cond b invTransposeGL 1 (a 0 w) • F b *ᵥ v) ⊗ₜ[ℂ] u a) _
      (Function.update D w ⟨b, _, (map_ne_zero_iff _ (inclMatrix_mulVecLin_injective (Fin.castLEEmb
      l.is_le) _)).2 hv⟩) (.trans (by gcongr; bound) <| hB ·), ← hK] <;> simp
      [*, apply_ite ofReal, ite_nonneg, pow_succ, field, inner, smul_smul, ← eq_inv_smul_iff]
    · exact fun s h _ ↦ ⟨by cases b <;> simp [vectorFixer] <;> (repeat erw [mul_smul]) <;>
        simpa [F, ← mul_inclMatrix, ← mulVec_mulVec, inv_smul_eq_iff] using! h.symm, by grind⟩
    tauto).trans ?_))]
  · simp [field]; grw [← le_self_pow₀, ← k_le_b, ← S.ϱ_le_k] <;> push_cast <;> nlinarith
  · gcongr <;> simp [*, sum_nonneg', subset_iff, F, transpose_splitGram, mul_inclMatrix,
      ← inclMatrix.eq_1, card_eq_nat_card, ↓card_resField_eq_levelPrime]; bound
  grw [mul_div_left_comm, div_le_one_of_le₀]; linarith
  grw [← sq_le_sq₀, mul_pow, sq_sqrt, card_eq_nat_card, card_resField_eq_levelPrime, hq, hq]
  simp [← pow_mul, ← pow_add]; repeat bound [l.2]

lemma Fits.integration_spread_of_relaxed_fixing [WeilData E] {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) {ζ : ℝ} (hζ : 0 ≤ ζ) (hFix : S.IntegrationFixingBudget ζ) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + ζ / 2) := by
  set R := ρ.asAlgebraHom (piTensorElem g); intro F φ; apply S.of_size_bounds; intros
  obtain ⟨⟨t, ht⟩, G, B, o⟩ := (isSquare_iff.2 (mul_pos hc S.unipCovolume_pos).le).inv,
    IsCentralProj.piTensorElem hg, S.amplitudeSum_split .univ (S.ratMiddle E).besselSᶜ,
    (hg · |>.one_sub); let P := t • Q
  have hu a b x y : ⟪ρ b (P (.single y 1)), ρ a (P (.single x 1))⟫_ℂ =
      S.amplitudeSum .univ x.1 (a⁻¹ * b) y.1 (x.2, y.2) / S.unipCovolume := hρ a⁻¹ .. ▸ by
    simp [← End.mul_apply, ← map_mul, P, ← mul_assoc, ← ofReal_mul, ← ht, hQ, field, hc.ne']
  have pr {z} (hz : IsCentralProj z) y : ⟪_, _⟫_ℂ = _ :=
    (hz.self_adjoint ρ 1 (innerₛₗ ℂ) hρ y _).trans congr(⟪y, $(hz.1.map ρ.asAlgebraHom) y⟫_ℂ)
  have hb' i := add_le_add (S.re_trace_besselS_le (o i) (hb i)) ((sum_norm_amplitudeSum_le i
    (o i)).trans' (sum_le_sum fun a _ ↦ (PiLp.norm_apply_le _ a).trans' (re_le_norm _)))
  refine (exists_le_of_sum_le univ_nonempty (g := fun _ ↦ S.columnDim / 2 * (1 + ζ +
    φ)) ((sum_le_sum fun s _ ↦ finrank_sub_le_re_inner_dyadSum (stdOrthonormalBasis ..) (ρ s ∘ₗ P)
    (ρ.asAlgebraHom (1 - piTensorElem g)) (F.comap (R.rangeRestrict ∘ₗ ρ s ∘ₗ Q)) (F.map
    R.range.subtype) (Eq.trans_le ?_ (S.sum_norm_amplitudeSum_le 0 (.one_sub ⟨.zero, by simp⟩)))
    fun _ ↦ (⟨_, F.smul_mem t ·, by simp [P, R]⟩)).trans ?_)).imp fun s h ↦ ?_
  · congr! 2; ext; rw [← basisFun_inner]
    simp [inner_sub_right, LinearMap.adjoint_inner_right, inner_single_left, hu,
      amplitudeSum_besselS_one, ite_div, add_div, B, apply_ite, S.unipCovolume_pos.ne',
      Finsupp.single_apply, MonoidAlgebra.one_def]; grind
  · grw [← re_sum, ← sum_inner, re_le_norm, norm_inner_le_norm, ← sq_le_sq₀, mul_pow,
      @norm_sq_eq_re_inner ℂ, inner_sum_sum_eq_card_mul (energy (S.amplitudeSum .univ) {·}) ?H]
    simp [@norm_sq_eq_re_inner ℂ, ↓inner_dyadSum, apply_ite, ← Submodule.coe_inner, mul_pow,
      ← show φ *
      _ = _ from div_mul_cancel_of_imp (mod_cast by bound [F.finrank_le]), orthonormal_iff_ite.1]
    grw [integration_sum_le_of_positive_type_relaxed hζ hFix (fun _ ↦ by unfold energy; positivity) _ ?H ∅ (fun _ ↦
      ⟨⊤, 1, by simp⟩) _ nofun, hD, ← four_mul_le_sq_add]
    simp [mainEnergy]; field_simp [mass_pos, besselDegree_pos, ne_of_gt]; any_goals positivity
    repeat norm_num [energy, sum_filter, norm_sq_eq, sum_prod_type, sum_div, hu, div_pow,
      @sum_comm S.Classes _ S.BesselCoord, @sum_comm S.GRes]
  have k := univ.sum_nonneg' fun y ↦ pr (.piTensorElem o) (P (.single y 1)) ▸ inner_self_nonneg
  simp [add_div, show piTensorElem (1 - g ·) = ∑ i,
    piTensorElem (Pi.mulSingle i (1 - g i)) - (1 - piTensorElem g) by
    ext; simp [← map_one piTensorElem, -map_one]; ring, ↓@norm_sq_eq_re_inner ℂ, ↓hρ, columnDim,
    ↓pr G.one_sub, mul_add, mul_sum, @sum_comm (_ × _), asAlgebraHom_piTensorElem_mulSingle, B, (by
    simpa using congr(ρ.asAlgebraHom $(G.2.commute (.single s 1)) ·).symm),
    asAlgebraHom_eq_sum (ρ.comp _), by simpa using (hu · 1)] at *
  linarith

end Filling

open Filling Module Submodule
variable {P} (D : Data P) (c : ℂˣ)

lemma Data.integration_ramified_spread_of_relaxed_fixing {ζ η : ℝ} (hζ : 0 ≤ ζ)
    (hFix : D.filling.IntegrationFixingBudget ζ)
    (hbudget : 5 * (D.b ^ 4)⁻¹ + ζ / 2 +
      D.f * (D.N - 1 : ℝ)⁻¹ ≤ η) :
  IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) η := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound : D.b ^ 9 ≤ D.N - 1)
  have h := Fits.integration_spread_of_relaxed_fixing (ρ :=
    .comp (D.principalRep _) (.mk' _ (by tauto))) (fun _ _ _ ↦ Space.inner_formRep ..) (fun _ ↦
    (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..))) (fun _ ↦
    isCentralProj_sum_tupleIdem) (fun i ↦ (bad_share_le (M := P.Mω D.s) (q := D.g i) _ (9 * D.logB)
    (card_resField_eq_levelPrime _ i) rfl (card_chosenPlaces _ i) D.nat_lt_of_hasLogBound
    D.nat_lt_of_hasLogBound D.le_of_hasLogBound le_rfl D.le_of_hasLogBound).trans
    (filling.eq_1 D ▸ D.le_of_hasLogBound)) (measureReal_pos_of_isLevel (K := D.chosenLevel)) hζ hFix
  erw [(?_ : Representation.asAlgebraHom _ _ = (principalRep ..).asAlgebraHom D.e₀), Shape.r,
    card_rowIndex, ← Nat.card_congr (.piCurry _)] at h
  simp_rw [IsSpread, ← D.columnCoords.finrank_eq, ← (D.columnCoords.ofSubmodule' _).finrank_eq] at h
  refine fun F ↦ (h D.finrank_rows_le_mass F).imp' Sigma.uncurry fun _ h ↦
    .trans (mod_cast finrank_mono fun _ ↦ by simpa using!
    id) (((D.ramifyingOp_finrank_comap_and_short .univ _).1.trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling] at hbudget ⊢
  gcongr <;> linarith only [hbudget]
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

lemma Data.integration_run99_spread_of_relaxed_fixing
    (hFix : D.filling.IntegrationFixingBudget (4 * (D.b * D.x ^ 200))⁻¹) :
    IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ
      (c.1 • D.ramifyingOp .univ)) (4 * (D.b * D.x ^ 200))⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound :
    D.b ^ 9 ≤ D.N - 1)
  apply D.integration_ramified_spread_of_relaxed_fixing c
    (ζ := (4 * (D.b * D.x ^ 200))⁻¹) (by positivity) hFix
  have hb : 5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹ ≤
      (4 * (D.b * D.x ^ 200))⁻¹ / 2 := by
    exact D.le_of_hasLogBound
  linarith only [hb]

lemma Data.integration_star_of_relaxed_fixing
    (hFix : D.filling.IntegrationFixingBudget (4 * (D.b * D.x ^ 200))⁻¹) :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget := by
  apply RHAcceleration99.star_of_weak_spread D
  intro c
  simpa only [RHAcceleration99.weakEta, RHAcceleration99.slackScale] using
    D.integration_run99_spread_of_relaxed_fixing c hFix

#print axioms Filling.integration_sum_le_of_positive_type_relaxed
#print axioms Filling.Fits.integration_spread_of_relaxed_fixing
#print axioms Data.integration_ramified_spread_of_relaxed_fixing
#print axioms Data.integration_run99_spread_of_relaxed_fixing
#print axioms Data.integration_star_of_relaxed_fixing

open Lean in
run_cmd do
  for (root, req, forbid) in #[
    (``Filling.integration_sum_le_of_positive_type_relaxed,
      #[``card_mul_sum_det_le], #[``Filling.energy_fixingSet_le,``Filling.sum_le_of_positive_type]),
    (``Filling.Fits.integration_spread_of_relaxed_fixing,
      #[``Filling.integration_sum_le_of_positive_type_relaxed,``Filling.re_trace_besselS_le,
        ``Filling.sum_norm_amplitudeSum_le,``finrank_sub_le_re_inner_dyadSum],
      #[``Filling.Fits.exists_translate_finrank_comap_le,``Filling.sum_le_of_positive_type]),
    (``Data.integration_ramified_spread_of_relaxed_fixing,
      #[``Filling.Fits.integration_spread_of_relaxed_fixing,``Data.ramifyingOp_finrank_comap_and_short],
      #[``Data.ramifiedColumns_fill_rows]),
    (``Data.integration_run99_spread_of_relaxed_fixing,
      #[``Data.integration_ramified_spread_of_relaxed_fixing], #[``Data.ramifiedColumns_fill_rows]),
    (``Data.integration_star_of_relaxed_fixing,
      #[``Data.integration_run99_spread_of_relaxed_fixing,``RHAcceleration99.star_of_weak_spread],
      #[``Data.integral_forms_long,``Data.ramifiedColumns_fill_rows])] do
    let info ← getConstInfo root
    let some v := info.value? (allowOpaque := true) | throwError "missing proof {root}"
    let deps := v.getUsedConstants
    unless req.all (fun a => deps.contains a) && forbid.all (fun a => !deps.contains a) do
      throwError "INTEGRATION_RELAXED_FIXING direct dependency mismatch {root}"
    let axs ← collectAxioms root
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "INTEGRATION_RELAXED_FIXING unexpected axiom {root}: {axs}"
  logInfo "INTEGRATION_RELAXED_FIXING_STAR_GUARDS_OK"
