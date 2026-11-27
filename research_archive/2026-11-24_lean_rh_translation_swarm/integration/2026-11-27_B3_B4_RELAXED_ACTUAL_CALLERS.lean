import New.Filling.FillingTheorem

/-!
# B3/B4: actual positive-type induction and rank caller under relaxed link estimate

27 November 2026. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969, c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
Previous integration 73e689b8720d745851bf701c1894eff6f173ed5d;
peer theta dfbe93b2 (A2), character boxes 055277b5 (C2 endgame),
integration peer c6879a3d (actual real-matching interface PASS; class-sum
consumer still pending). Do not redo those separate jobs.

Sources relative to grh-compact/src:
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444, lines 105–182, 226–257, 301–345.
- New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76, lines 22–40.
- New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f, 180–191.
- New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372, 172–213.
- New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7, 156–169, 235–293.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727, 276–318.

RESULT: source-visible conditional reduction, executable Lean CANDIDATE UNRUN.
Use the SAME admissible S, fixed frame D, set A, y=b^(-6k|A|),
M=mainEnergy, eta=b^-2, delta=eta². Moments 111–120 supplies the
old tail inequalities, including C=yM for the crude-energy caller.
Keep its tail, packing and fixed-frame premises; no change to unipCovolume.

The exact link target can be weakened from w <= (1+delta)yM
to w <= (1+eta/2)yM. Indeed CrudeEnergy 180–183 gives
E <= (1+delta)^2 w + delta^3 C. If C<=yM, then
  E <= [(1+eta²)^2(1+eta/2)+eta^6] yM
    <= (1-eta²)(1+eta)yM.
The last difference is eta/2 - 3eta² - 2eta³ - eta⁴ - eta⁵/2 - eta⁶,
nonnegative for 0<=eta<=1/1000 because the subtracted powers sum
to at most 7.5 eta². Actual eta<=10^-6. This transfers the
previous relaxed global energy goal to the genuine nondegenerate
linkEnergy supplier, preserving the exact normalization w*nu².
The earlier sharp supplier remains a fallback; no proof of a weaker
sieve from new primitive assumptions yet. In particular the actual
Bessel-only rank obstruction from editor 055cbd4a remains.

Instead of adding a Fourier spectral argument to the live proof,
the original Moments rank calculation can consume the relaxed estimate
directly. Replace the coefficient in the native positive-type induction
and use hLocal in place of the sharp local lemma. The original
contradiction and insertion step cancels that coefficient against hK.
At the actual Fits consumer replace 9delta by eta in the dyad estimate;
the unchanged first moment then yields candidate spread error 5delta+eta/2
rather than 19delta/2. In the original ramified caller retain the
ramification estimate, coordinate equalities and row upper bound;
the available margin is eta/2-5delta. The prior audited budget
eta/2+6delta+eta^4<=eta covers the retained ramification term.
This is a candidate source-level connection, not a native PASS.
The final tactic of the ramified caller may require the explicit scalar
budget rather than the original numerical automation; the inferred
shape exponent in hLocal is also not verified.

Source edit preflight executed on connector-fetched exact blobs:
9 unique substitutions and inverse round trips; 201 exact
integer comparisons of the displayed link-budget inequality at
b=1000..1200. An initial edit preflight rejected a duplicate inverse
anchor; edit order corrected before committing.
The comparison is regression evidence, not a proof over all reals;
the explicit polynomial argument supplies that proof.
Original graph: ramifiedColumns_fill_rows -> Fits.exists_translate_finrank_comap_le
-> sum_le_of_positive_type -> energy_fixingSet_le -> link/sieve/tail.
Candidate graph replaces these first three declarations, with hLocal
as explicit open premise; all unchanged edges/axiom evidence retained.
No claim of old-leaf absence in the full graph. No Lean or native
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier execution this run.

RESUME HERE: compile these actual three candidate declarations on
the existing authenticated compact Moments/FillingTheorem workspace;
repair elaboration of hLocal or final scalar guard if needed, inspect
all three axiom reports and extract constructor-inclusive original/new
graphs. Then prove the weaker normalized link estimate from actual
finite-sieve primitive bounds or retain the original sharp route.
Do not launch a redundant cold build or import New.Main. RH OPEN.
-/

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling

variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok :
  S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma sum_le_of_positive_type_relaxed [WeilData E] (hLocal : ∀ A D, energy (S.amplitudeSum .univ) (fixingSet A D) ≤
    (1 - (S.b ^ 4)⁻¹) * ((1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A)) {Θ : _ → ℝ} (h0 : ∀ s, 0 ≤ Θ s) (u : _ → V) (hu :
  ∀ a b, ⟪u a, u b⟫_ℂ = Θ (a⁻¹ * b)) A (D : ∀ _, _) (hB : ∀ Ω, ∑ s with s ∈ Ω, Θ s ≤ energy
  (S.amplitudeSum .univ) Ω) (hA : ∀ s, Θ s ≠ 0 → ∀ w ∈ A, s ∈ S.vectorFixer (i := 0) w (D w)) :
  ∑ s, Θ s ≤ (1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A := by
  induction' A using WellFoundedGT.induction with A ih generalizing V Θ D
  obtain ⟨hq, q, _⟩ := S.levelPrime_le 0, S.le_levelPrime 0, S.thousand_le_b, univ.sum_nonneg' h0,
    S.ϱ_le_k; by_contra! hK
  apply hK.not_ge
    (le_of_mul_le_mul_left (.trans _ (hLocal A D)) (by bound [@one_lt_pow₀ ℝ]))
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

lemma Fits.exists_translate_finrank_comap_le_relaxed [WeilData E] (hLocal : ∀ A D, energy (S.amplitudeSum .univ) (fixingSet A D) ≤
    (1 - (S.b ^ 4)⁻¹) * ((1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A)) {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + (S.b ^ 2)⁻¹ / 2) := by
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
  refine (exists_le_of_sum_le univ_nonempty (g := fun _ ↦ S.columnDim / 2 * (1 + (S.b ^ 2)⁻¹ +
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
    grw [sum_le_of_positive_type_relaxed hLocal (fun _ ↦ by unfold energy; positivity) _ ?H ∅ (fun _ ↦
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

#print axioms sum_le_of_positive_type_relaxed
#print axioms Fits.exists_translate_finrank_comap_le_relaxed

end Filling

section
open Filling Module Submodule
variable {P} (D : Data P) (c : ℂˣ)

lemma Data.ramifiedColumns_fill_rows_relaxed
    (hLocal : ∀ A d, energy (D.filling.amplitudeSum .univ) (fixingSet A d) ≤
      (1 - (D.filling.b ^ 4)⁻¹) * ((1 + (D.filling.b ^ 2)⁻¹) * D.filling.mainEnergy *
        (D.filling.b ^ (6 * _))⁻¹ ^ #A)) :
  IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (D.b ^ 2)⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound : D.b ^ 9 ≤ D.N - 1)
  have h := Fits.exists_translate_finrank_comap_le_relaxed hLocal (ρ :=
    .comp (D.principalRep _) (.mk' _ (by tauto))) (fun _ _ _ ↦ Space.inner_formRep ..) (fun _ ↦
    (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..))) (fun _ ↦
    isCentralProj_sum_tupleIdem) (fun i ↦ (bad_share_le (M := P.Mω D.s) (q := D.g i) _ (9 * D.logB)
    (card_resField_eq_levelPrime _ i) rfl (card_chosenPlaces _ i) D.nat_lt_of_hasLogBound
    D.nat_lt_of_hasLogBound D.le_of_hasLogBound le_rfl D.le_of_hasLogBound).trans
    (filling.eq_1 D ▸ D.le_of_hasLogBound)) (measureReal_pos_of_isLevel (K := D.chosenLevel))
  erw [(?_ : Representation.asAlgebraHom _ _ = (principalRep ..).asAlgebraHom D.e₀), Shape.r,
    card_rowIndex, ← Nat.card_congr (.piCurry _)] at h
  simp_rw [IsSpread, ← D.columnCoords.finrank_eq, ← (D.columnCoords.ofSubmodule' _).finrank_eq] at h
  refine fun F ↦ (h D.finrank_rows_le_mass F).imp' Sigma.uncurry fun _ h ↦
    .trans (mod_cast finrank_mono fun _ ↦ by simpa using!
    id) (((D.ramifyingOp_finrank_comap_and_short .univ _).1.trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling]; gcongr; use D.le_of_hasLogBound
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

#print axioms Data.ramifiedColumns_fill_rows_relaxed
end
