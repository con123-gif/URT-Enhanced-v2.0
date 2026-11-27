import New.Filling.Moments

/-!
# Lane 15: empty fixing-set specialization at actual B3 energy caller

27 November 2026. PREPARED native candidate and source-matched human
argument, not kernel verified. RH remains OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969,
c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Exact source paths under grh-compact/src/New/Filling:
FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9,
FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444.
Also read Setup, SchurTest, CrudeBoundDefs, CrudeEnergy, OneDeterminant.

## Actual consumer and reason

After editor 055cbd4a, reject Bessel-only PSD main term route.
Integration 73e689b8 derives relaxed full energy at eta=b^-2 with
the original A/C proof and 40091ec1 DEFICIT; peer dbcfaee8 splits
empty, small nonempty, large fixing sets with J=b^(23k/4) and
eta=b^(-5/4) (the latter needs extra C_exact proof). The same split
works at eta=b^-2 WITHOUT altering C: all the large/small-set
coherent link allowances and omitted-link guards are independent
of eta, and the empty-set overhead is at most eta/2.
For b>=1000 set delta=b^-4, e=b^-2, J=b^(23k/4).
At the normalized mass maximum for Theta(s)=||P* rho(s)P||_HS^2,
the finite determinant bound gives escape <=3b^-9 times the mass,
exactly as peer dbcfaee8. Use the same Gram representation, the same
level, frame, finite places, normalization and energy (one division
by unipCovolume squared, not two). If empty fixing-set energy is
<= (1+e/2) mainEnergy and nonempty energy <=mainEnergy/J^|A|, then
global energy <= (1+e) mainEnergy because
3b^-9(1+e)<=e/2. Original DEFICIT budget e/2+6e^2+e^4<=e.
For large 3f<=4|A| peer crude estimate with empty link set applies;
for small nonempty retain coarse link target. These are retained
conditional suppliers, not proved by this certificate. Original
sharp energy fallback is sufficient and retains all its dependencies.

## Concrete change at the EMPTY producer

When A=empty, take Z=K (the full integral unitary group).
The required inclusion of the image of every lattice-stabilizer
element is immediate from range(toPlaces)=K, proved by exactly the
same two lines as FixedLines.exists_intermediateGroup_one_prime.
The normalized floor-zero comparison now reads the identity
  floorZeroForm(K) * measure(K) * b^(6k*0)
    = floorZeroForm(K) * measure(K).
No product over chosen places, one-prime fixed-vector index,
local Haar product factor, or rare-vector suppression estimate
is needed for this caller. This is exact cancellation before norms.
The other SieveSystem properties remain as in the original proof:
the same finite measure, cut, frequency/head bounds, one-vector
Siegel comparison, topKernel positivity and phase integrals.
The following three declarations connect the specialized group
witness through the actual finite system and actual regular-cell
energy declaration, without importing Main or claimed RH. Their
hypothesis hEmpty is discharged at the intended caller by rfl.
Nonempty branches still require their original or weakened suppliers.
No global deletion is asserted; imported original declarations are
available but the two direct target references are replaced.

Static execution in connector JS: extracted 2 complete source
declarations, performed 6 targeted edits (name, explicit empty
binder, caller reference for each), and both inverse edits restored
the original declaration texts byte-for-byte after trimEnd.
New group witness copied range proof from actual one-prime branch.
No local Lean execution, no new CI output or axiom/dependency report.
Native rh_scan/prune/reduce/auto/frontier remain unexecuted here.
Keep old graphs and all open B1–B4/A/C obligations. A source-visible
caller substitution is not a verified kernel edge deletion.
No new standalone synthetic tests or URT performance claim.
Context: same compact pin, same S, P, R, level, T, F, empty Sg, d,
same kernel and Haar normalization.

RESUME HERE: compile these three actual declarations in the existing
shared compact runner; inspect axioms and constructor-inclusive
dependency graph against originals (direct and recursive old target
absence, preserve any alternate paths). Attach the empty energy
lemma to the existing extremal mass proof, with nonempty coarse
supplier kept explicit; do not repeat the rejected Bessel shortcut.
HANDOFF TO integration / B3 / kernel / audit. RH remains OPEN.
-/

section EmptyGroup
open Pi Subgroup Classical ENNReal Finset Fintype Matrix MeasureTheory IntegralPlace
namespace Filling
variable {E 𝔰} [Field E] [CMType E] {S : Filling E 𝔰} [S.IsAdmissible] {T T₀ :
  Finset (FinPlace E)} [fT : T.StarStable] [P : IntegralPlace (LocProd T)] {F} [h :
  S.IsFillingLevel T F] (Sg : Finset (S.chosenPlaces 0))

lemma IsFillingLevel.editor_exists_intermediateGroup_lines_empty [WeilData E]
    d (hEmpty : Sg = ∅) [hT : Fact (↑S.gIdele⁻¹ ∈ integralOff T)] :
  ∃ Z : F.IntermediateGroup,
  (∀ k, S.reduction k ∈ S.fixingSet Sg d → S.toPlaces T k ∈ Z.1) ∧ let K := unitaryLevel R 1 _
  F.floorZeroForm Z * F.groupMeasure K * .ofReal (S.b ^ (6 * 𝔰.k)) ^ #Sg ≤
    F.floorZeroForm K * F.groupMeasure Z := by
  let p := (S.toPlaces T).comp S.latStabilizer.subtype
  have r : p.range = unitaryLevel R 1 _ :=
    ext (exists_toPlaces_eq · |>.elim (by simp [p, mem_latStabilizer_iff (T := T)]; aesop))
  use ⟨_, unitaryLevel_le_unitaryLevel_one, le_rfl⟩
  simp [← r, p, hEmpty]

end Filling
end EmptyGroup

section EmptyFiniteSystem
seal Finset.univ Finset.sum Finset.prod
open Complex ENNReal Filter Finset Matrix MeasureTheory NNReal OpenAddSubgroup IntegralPlace
  Topology IsStdLevel ComplexOrder Level

lemma Filling.IsFillingLevel.editor_exists_finite_sieveSystem_empty {E 𝔰} [Field E] [CMType E] [WeilData E] {S :
  Filling E 𝔰} [S.IsAdmissible] {T : Finset _} [T.StarStable] {P : IntegralPlace (LocProd T)} {F}
  (hF : S.IsFillingLevel T F) (Sg : Finset (S.chosenPlaces 0)) d (hEmpty : Sg = ∅) [Fact (↑S.gIdele⁻¹ ∈ integralOff T)] : ∃ Z, (∀
  k, S.reduction k ∈ S.fixingSet Sg d → S.toPlaces T k ∈ Z.1) ∧ ∀ L : OpenAddSubgroup (LocProd T),
  IsCompact L.carrier → SieveSystem unitOrOne (ratToPlaces T S.g⁻¹ * ·⁻¹.1) 𝔰.ϱ (fun j p q ↦ (if j ≤
  𝔰.ϱ then F.floorForm j p q Z.besselVector 1 else F.topKernel L Z p q / volume.real L.carrier) /
  Z.massRatio.toReal) (S.charOnPlaces T) ((1 + S.b⁻¹ ^ 6) / (S.b ^ (6 * 𝔰.k)) ^ #Sg) (finHeadWeight
  (𝔰.n ^ 6)) (S.frequencyGain T) := (hF.editor_exists_intermediateGroup_lines_empty Sg d hEmpty).imp fun Z ⟨hm, hk⟩ ↦ by
  obtain ⟨n, _, _, Γ, C⟩ := S.pow_chain, S.k_le_f, S.one_le_b, hF.gauge, isCut_besselVector Z
  have N {x : ℂ} {D} d h : ‖x / Z.massRatio.toReal‖ ≤ _ :=
    (toReal_mono d (@ENNReal.div_le_of_le_mul' ‖x‖ₑ Z.massRatio D h)).trans' (by simp)
  have Er {j p q ξ ω} hj (k : IsUnit ξ) H : ‖F.floorForm j p q _ ω / _‖ ≤ S.frequencyGain T ξ * _ :=
    .trans' (by
    simp (disch := positivity) [-Nat.cast_mul, md_g, frequencyGain, finHeadWeight, -map_prod]
    gcongr _ * ?_ * _
    grw [g_le_b_pow, (by linarith [S.thousand_le_b] : 2 ≤ S.b), pow_add _ 6 3, mul_assoc, pow_mul',
      ← pow_mul, ← pow_mul, ← pow_succ']
    gcongr; grw [Shape.n, ← S.ϱ_le]; omega) (N (by simp [denomIndex_ne_zero, mul_eq_top,
    div_eq_top]) (IsStdLevel.enorm_floorForm_le (ξ := k.unit) Z _ hj (by omega) n.1 H))
  refine hF.psi_eq ▸ ⟨hm, fun L hl ↦ ⟨by simp, fun j p q ξ a ↦ ?_, by
    simp [div_eq_inv_mul, ← mul_assoc]
    exact fun a t e ↦ .smul (α := ℂ) ⟨.ext (by simp [topKernel, ← integral_conj, e]),
      fun x ↦ by simpa [x.sum_fintype, mul_right_comm] using!
      (lintegral_energy_le_topKernel Z _ L.2 (Matrix.posSemidef_vecMulVec_star_self
      x) e).1⟩ (by positivity), by simpa [div_div] using! (continuous_topKernel ..).div_const _,
    fun p q ↦ (N ofReal_ne_top ?_).trans_eq (toReal_ofReal (by positivity)), fun j p q a ↦
    (ite_eq_left a ▸ Er a · (.inr ⟨j, rfl, rfl, hF.g_eq ▸ (mul_sub ..).symm⟩))⟩⟩
  split_ifs with b <;> [simp_rw [div_eq_inv_mul] at *; simp_rw [← mul_div_assoc, integral_div]]
  exact (Γ.integral_floorForm_succ C ⟨j, b⟩ _ ξ (hF.lintegral_formMajorant_ne_top Z 0 a
    (by omega))).rec fun i s ↦ s.symm ▸ ⟨i, (by simp [·, Pi.one_def]), (Er a · (.inl rfl))⟩
  -- the top floor is the integral of the top kernel, up to the mean of ψ over L
  obtain ⟨rfl, ⟨i, e⟩, o⟩ := a.eq_of_not_lt' b, hF.1.floorForm_top_eq_integral Z p q ξ,
    L.2.measurableSet
  have ⟨I, s⟩ := integral_skew_product (volume.map_sub_left_eq_self <|
    (S.latMiddle _).frameGram ·⁻¹.1 𝔰.top 𝔰.top) (i.mul_prod (((by fun_prop : ContinuousOn
    (P.ψ <| -ξ * ·) L).integrableOn_compact hl).integrable_indicator o)) (by fun_prop [frameGram])
  refine (fun k ↦ ⟨((I.congr k).div_const _).div_const _, .symm ⟨fun u ↦ ?_, ?_⟩⟩)
    (P.ae_isUnit.mono fun | _, ⟨t, rfl⟩ => ?_)
  any_goals simp_rw [← integral_congr_ae k, s, integral_const_mul, integral_mul_const, ← e]
  grw [div_right_comm, mul_div_right_comm, norm_div, norm_mul, norm_integral_le_integral_norm,
    Er a u (by left; rfl)]
  iterate 2 simp +contextual [norm_indicator_eq_indicator_norm, o, Pi.one_def, finHeadWeight,
    Measure.real, toReal_eq_zero_iff, hl.measure_ne_top, L.2.measure_ne_zero _ ⟨0, L.zero_mem⟩]
  erw [topKernel, ← integral_indicator (o.preimage (by fun_prop [frameGram]))]
  simp [← integral_const_mul, Set.indicator, mul_sub, mul_right_comm _ _ (P.ψ _),
    ← P.ψ.map_add_eq_mul, correlation, Level.headDensity, prod_range, ne_of_lt]
  grw [ite_eq_left zero_le, ofReal_div_of_pos (by bound), IntermediateGroup.massRatio,
    ← ENNReal.mul_div_mul_comm, ENNReal.le_div_iff_mul_le (by simp; left; bound),
    ← ENNReal.mul_le_mul_iff_left (P.unitaryLevel_open_compact.1.measure_ne_zero _ ?_)
    (hF.groupMeasure_ne_top le_rfl), ← mul_assoc, Level.enorm_floorForm_le, Level.headDensity,
    prod_range_zero, one_mul, lintegral_mul_const_le, (?_ : lintegral .. ≤ F.floorZeroForm
    Z), mul_right_comm, ENNReal.ofReal_pow (by bound), ← hk.ge, floorZeroForm_le_main_term ⟨_,
    P.unitaryLevel_le_unitaryLevel_one, le_rfl⟩ 0 (by omega), sdiff_le, SemilocalField.volume_O,
    ← hF.box_eq.2.1, add_le_add_left hF.groupMeasure_boxSet_le, ← pow_six_le]
  any_goals simp [ENNReal.ofReal_add, pow_succ, add_assoc, ← mul_add, inv_two_add_inv_two, -inv_pow,
    mul_eq_top]
  ring; rfl
  simp [Level.floorZeroForm, enorm_integral_phase_eq_upperPairing, formModulus, descConv.eq_1,
    weylRatio, ← formIntegrandOne_eq Γ C, formIntegrandOne, ← sq, mul_pow]

end EmptyFiniteSystem

section EmptyEnergy
open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module
namespace Filling
variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok :
  S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma editor_energy_fixingSet_le_empty [WeilData E] {𝔰} {S : Filling E 𝔰} [S.IsAdmissible] (Sg : Finset (S.chosenPlaces 0)) D (hEmpty : Sg = ∅) :
  energy (S.amplitudeSum .univ) (fixingSet Sg D) ≤ (1 - (S.b ^ 4)⁻¹) *
  ((1 + 9 / S.b ^ 4) * S.mainEnergy * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #Sg) := S.of_size_bounds (by
  intros; set y : ℝ := _ ^ #Sg
  obtain ⟨⟨x, u, e⟩, a, c⟩ := exists_nonneg_add_of_le S.thousand_le_b, S.ϱ_le_k,
    S.card_chosenPlaces 0 ▸ Sg.card_le_univ
  have hy : S.tailScale ^ 20 * S.besselEnergy ≤ y * S.mainEnergy := by
    grw [← IsAdmissible.besselEnergy_le]; simp [y, field]; grw [c, pow_mul _ 4 6,
      tailScale_pow_four]; ring_nf; rfl; bound
  grw [energy_le_of_linkEnergy_le _ (by tauto) (by tauto) (by simp) (fun s k ↦ ⟨Sg.image
    fun w ↦ (⟨0, w⟩, (D w).1), (prod_image (by simp)).ge, forall_mem_image.2 (⟨_, k.1 · ·⟩)⟩)
    (w := (1 + (S.b ^ 4)⁻¹) * y * S.mainEnergy) _ (by grw [← hy, ← ‹2 ≤ S.tailScale›]; bound)
    {_Λ | Sg ≠ univ} (by
    simp; intro; grw [← le_levelPrime, pow_mul _ 4 3, tailScale_pow_four]; simp [y, field,
      S.card_chosenPlaces, *]
    ring_nf; gcongr; lia), ← e, ← sub_nonneg]; field_simp; ring_nf; any_goals positivity
  simp_rw [linkEnergy, Set.univ_inter, ← ENNReal.tsum_prod]
  refine (tsum_subtype_support _).ge.trans (ENNReal.summable.tsum_le_of_sum_le fun F ↦ ?_)
  choose t σ n ht L H H' using fun j : F ↦ S.exists_hasSum_cosetAmplitude (j.1.2 ∘ sq_eq_zero_iff.2
    ∘ enorm_eq_zero.2) fun _ ⟨k, r, f⟩ l e ↦ j.1.1.2.2.1.2.2.elim j.1.1.2.2.2.2 fun ⟨w, z⟩ ↦ z l (by
    erw [← r, leadingMinor, submatrix_submatrix, ← map_splitGram_latMiddle (reduceAt _),
      ← Matrix.map_mul, submatrix_map,
      ← RingHom.map_det, Subtype.ext (((Ô E).subtype.map_det _).trans _), map_zero]
    erw [RingHom.mapMatrix_apply, ← submatrix_map, Matrix.map_mul, map_splitGram_latMiddle,
      ← submatrix_submatrix, ← frameGram, congr(frameGram _ ($f).1.1), frameGram_termPosition,
      submatrix_map, ← RingHom.map_det]; simpa)
  simp (disch := bound) only [← ofReal_norm, ← ENNReal.ofReal_pow, ← F.sum_coe_sort,
    ← ENNReal.ofReal_sum_of_nonneg]; gcongr; cases' hk : 𝔰.k with k; omega
  let r := (∏ v, √𝔰.openCellConst * ∏ a : Fin 𝔰.n,
    S.frameScaleSq v a ^ (k + 2 * a.rev)) / Fintype.card S.BesselCoord
  have c0 := 𝔰.openCellConst_pos; choose τ hτ using (Real.range_exp.ge <| S.frameScaleSq_pos · ·)
  refine le_of_tendsto_of_frequently (tendsto_finsetSum _ fun j _ ↦ (H j).norm.pow 2)
    (Filter.frequently_atTop.2 fun A ↦ let T₀ := A.biUnion univ.image ∪ univ.image t
    ⟨univ.map (.arrowCongrRight (.subtype (· ∈ T₀))), fun p h ↦ mem_map.2 ⟨(⟨p ·, by grind⟩),
    by simp, rfl⟩, le_of_mul_le_mul_left (a := r ^ 2) ?_ (by simp [r, ← hτ]; positivity)⟩)
  apply le_of_tendsto_of_frequently ((tendsto_finsetSum _ fun j _ ↦ (tendsto_finsetSum _ fun p _ ↦
    H' j p).norm.pow 2).const_mul _) ((S.exists_places_integralOff T₀).mp (.mono _ _)); rotate_right
  rintro T (o : ∀ i j, _ ∧ _) ⟨_, h₀, g, hT⟩; obtain ⟨P, G, hG⟩ := S.exists_isFillingLevel T
  obtain ⟨Y, hm, K⟩ := hG.editor_exists_finite_sieveSystem_empty Sg D hEmpty
  apply ((Filter.Eventually.all fun i ↦ hG.sum_blocks_le_topKernel hT (j := {j // t j = t i}) _ (ht
    · |>.1) (fun j ↦ (ht j).2.1.trans congr($(j.2))) (ht i).2.2.1 (fun j ↦ hm (n j) (by simp [ht]))
    (o i · |>.1) ⟨i, rfl⟩ («π» := .cut) _ _ (o i · |>.2)
    ).exists_mem_basis_of_smallSets Metric.nhds_basis_closedBall).elim
  rintro ε ⟨p, M⟩; let V := IsUltrametricDist.closedBall_openAddSubgroup (LocProd T) p
  apply ((mul_le_mul_of_nonneg_left (S.sieve T h₀ g.1 (K V (isCompact_closedBall ..))
    le_sup_right) _).trans _).trans'
  · rw [mul_sum, ← sum_fiberwise_of_maps_to fun i ↦ mem_image_of_mem t, re_sum, mul_sum]
    use sum_le_sum (forall_mem_image.2 fun i _ ↦ by
      simpa only [← sum_subtype_eq_sum_filter, ht, subtype_univ, Subtype.prop (p := (t · = _)),
        sum_map, Nat.not_succ_le_self] using! M i ⟨V.2, isCompact_closedBall .., zero_mem V⟩)
  · unfold packetConst siegelConst; positivity
  · obtain D := ‹0 ≤ S.mainEnergy›, S.besselDegree_pos, volÔ_ne_zero (E := E)
    simp [prod_range]
    grw [← besselDegree, prod_comm, IsAdmissible.packetConst_mul_mass_le, ← sq_sqrt c0.le,
      (?_ : (1 + _) ^ _ ≤ 1 + S.b⁻¹ ^ 9), ← c]
    simp only [y, frameScaleProd, hk, pow_add, prod_mul_distrib, prod_pow, fieldLe, ← e, inv_pow,
      ← hτ, card_univ, prod_const, Fin.val_rev, Nat.succ_sub_succ, pow_mul]
    clear * - u D; rw [← sub_nonneg]; ring_nf; positivity
    grw [add_comm, add_one_le_exp, ← Real.exp_nat_mul, S.f_le_b, Real.exp_bound' _ _ one_pos] <;>
      simp [field] <;> bound
  intro i j l e; ext <;> simp only [ht, by simpa [ht] using e]; swap
  · -- the correlation integrals of the product vector are the products of the local ones
    intro i j; ext
    rw [Finset.prod_congr rfl fun v _ ↦
      (S.besselSys v).band_limits.2 _ ((ht j).1.ratToInf_mem_unitriangularOn v) _ _ ?_ ?_]
    simp_rw [normCorrelation, gram_apply, inner_smul_left_eq_smul, inner_smul_right_eq_smul,
      real_smul]
    simp only [inner, besselFn, besselCorrelation, Pi.mul_apply, Pi.inv_apply, star_def,
      prod_univ_sum, ratToInf_weylElem_mul, prod_mul_distrib, ← map_prod, sum_prod_type,
      ← integral_fintype_prod_volume_eq_prod, ← ofReal_prod]; rfl'
    repeat simp [ht, frameScaleSq, padTuple, unitOrOne, j.2]
  · intro i p
    simp [frameScaleSq.eq_1 S _ 𝔰.ϱ, div_pow, div_mul_eq_mul_div, div_sub_one, -one_div, hk,
      mul_add, unitOrOne, ↓Fin.prod_univ_castSucc, mul_pow, abs_of_pos, pow_add, Fin.rev_castSucc,
      padTuple, prod_pow, prod_range, (S.frameScaleSq_pos ..).ne', Level.headDensity,
      P.md_evalPlaces_rpow_half (h₀ _ (p _).2), @prod_comm (Fin 𝔰.ϱ), prod_eq_zero_iff, field]
    simp [sqrt_eq_rpow, rpow_pow_comm, finsetProd_rpow, ((ht i).2.2.1 _).le, prod_nonneg]
  simp [↓Filter.eventually_all, eventually_isIntegralOff, -Filter.eventually_atTop])

end Filling
end EmptyEnergy

#print axioms Filling.IsFillingLevel.editor_exists_intermediateGroup_lines_empty
#print axioms Filling.IsFillingLevel.editor_exists_finite_sieveSystem_empty
#print axioms Filling.editor_energy_fixingSet_le_empty
