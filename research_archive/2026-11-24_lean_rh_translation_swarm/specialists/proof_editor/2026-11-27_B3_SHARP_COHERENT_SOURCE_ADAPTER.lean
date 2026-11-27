import B3TwoLinkIntegerCaller

/-!
# Lane 15 — restore a single exact source supplier for the two-link caller
27 November 2026. SOURCE-MATCHED / PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Pinned Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f, Setup.lean
622e7ebe5c04b7ae87652e460762da7fb2e40727.
Previous two-link module blob 2f4400d2497e89ad9d9bed72f05f90822378bc6f; stage as B3TwoLinkIntegerCaller
with its integer-induction dependency. Both previously UNRUN.
Peer RUN87 feba40b3 queues the six-root B3 chart verification (not this
module); the C1 shared run 46055305146 was in_progress at inspection;
B3 direct-chart status on state branch returned 404. No duplicate build.

## Human proof and actual source path

The original energy_fixingSet_le already contains a proof of the needed
coherent supplier, after its invocation of energy_le_of_linkEnergy_le.
Extract that proof tail, retaining its exact restricted link set
R_A={Λ | A ≠ univ}, not incorrectly replacing R_A by univ at A=univ.
The native link estimate is
 L_A <= (1+b^-4) E b^(-6ka) nu²
for a=|A|, E=mainEnergy, nu=unipCovolume. The extracted proof uses the
actual coset amplitude sums, finite sieve system, topKernel, global
sieve and convergence, not the old full energy conclusion as a premise.
This is an extant native proof fragment, not a new independent proof of
the analytical primitives; replay is necessary to validate extraction.

For b>=1000 and k>=2000, set j=floor(23k/4). For a>=1,
j*a+1 <= 6*k*a, so b^(6ka) >= b*b^(ja) >= 4*b^(ja).
Since 1+b^-4<=2, this gives
 (1+b^-4)b^(-6ka) <= (1/2)b^(-ja).
For a=0, 1+b^-4 <= 1+b^-2/4.
For small fixing sets 4a<3f, A is necessarily proper (a=f if A=univ).
For the empty case, f>0 makes it proper; native tailScale>=2 implies
f>0, since f=0 gives tailScale=1. These guards permit R_A=univ exactly
where the two-link lemma needs it. For large A use the already prepared
crude omission branch, not this coherent proof.
Thus ONE existing normalized link supplier suffices for both local
bounds in the prior actual rank caller. There is no division by E or
nu, and zero mainEnergy is included. This avoids independently deriving
two analytic bounds and makes the remaining work audit/replay and
human exposition of the existing source suppliers. It does not remove
their dependencies. The stricter original supplier is the fallback,
not the weakest mathematical target.

Original path: rank -> sum_le_of_positive_type -> energy_fixingSet_le
-> coherent tail and crude theorem. Candidate: integer rank -> two-link
adapter -> extracted coherent tail (proper sets) + crude omission.
Keep B1-B4, A/C, ramification, first moments, original/reduced graphs
and all primitive quantitative obligations. No full RH or root closure.

Actual source checks: fetched pinned Moments, CrudeEnergy and Setup,
matched the exact lemma boundaries and original link-set anchor, copied
its proof tail byte-for-byte; extracted the exact prior Fits signature
after its two hypotheses. Native Lean unavailable in this run; no
rh_scan/prune/reduce/auto/frontier, native axiom or CI PASS. No numerical
surrogate or claimed URT improvement. This module's original proof
tail and arithmetic adapters require actual elaboration. Zero root
obligations retired.

RESUME HERE: in the existing compact B3/B4 workspace compile the prior
integer induction and two-link module, then this extracted tail and
caller; check the first actual diagnostic and compare constructor-
inclusive graphs and axiom reports. No duplicate cold build.
HANDOFF TO integration / B3 / kernel / audit.
-/

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling

variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok : S.IsAdmissible]

lemma editor_sharp_coherent_link [WeilData E] (Sg : Finset (S.chosenPlaces 0)) D :
    linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet Sg D)
      {_Λ | Sg ≠ univ} ≤
      ENNReal.ofReal (((1 + (S.b ^ 4)⁻¹) * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #Sg * S.mainEnergy) *
        S.unipCovolume ^ 2) := S.of_size_bounds (by
  intros
  set y : ℝ := (S.b ^ (6 * 𝔰.k))⁻¹ ^ #Sg
  obtain ⟨⟨x, u, e⟩, a, c⟩ := exists_nonneg_add_of_le S.thousand_le_b, S.ϱ_le_k,
    S.card_chosenPlaces 0 ▸ Sg.card_le_univ
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
  obtain ⟨Y, hm, K⟩ := hG.exists_finite_sieveSystem Sg D
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

lemma editor_empty_link_scalar (b : ℝ) (hb : 1000 ≤ b) :
    1 + (b^4)⁻¹ ≤ 1 + (b^2)⁻¹/4 := by
  have hp : 0 < b := by linarith
  have h4 : 4 ≤ b^2 := by nlinarith
  have H : 4*b^2 ≤ b^4 := by
    nlinarith only [mul_nonneg (sq_nonneg b) (sub_nonneg.mpr h4)]
  field_simp [ne_of_gt hp]
  nlinarith

lemma editor_small_link_scalar (b : ℝ) (hb : 1000 ≤ b) (k a : ℕ)
    (hk : 2000 ≤ k) (ha : 1 ≤ a) :
    (1+(b^4)⁻¹)*(b^(6*k))⁻¹^a ≤ (b^(23*k/4))⁻¹^a/2 := by
  have hp : 0 < b := by linarith
  have h1 : 1 ≤ b := by linarith
  have hgap : (23*k/4)*a+1 ≤ (6*k)*a := calc
    _ ≤ (23*k/4)*a+a := Nat.add_le_add_left ha _
    _ = (23*k/4+1)*a := by ring
    _ ≤ _ := Nat.mul_le_mul_right a (by omega)
  have H : 4*b^((23*k/4)*a) ≤ b^((6*k)*a) := calc
    _ ≤ b*b^((23*k/4)*a) := by gcongr <;> linarith
    _ = b^((23*k/4)*a+1) := by rw [pow_succ]; ring
    _ ≤ _ := pow_le_pow_right₀ h1 hgap
  have hc : (b^4)⁻¹ ≤ 1 := by bound
  calc
    _ ≤ 2*(b^(6*k))⁻¹^a := by gcongr <;> linarith
    _ ≤ _ := by
      simp only [inv_pow, ← pow_mul]
      field_simp [ne_of_gt hp]
      nlinarith only [H]

lemma editor_infPlaces_pos : 0 < numInfPlaces E := S.of_size_bounds (by
  intros
  by_contra! h
  have hzero : numInfPlaces E = 0 := by omega
  have ht : S.tailScale = 1 := by simp [tailScale, hzero]
  have h2 : 2 ≤ S.tailScale := by assumption
  linarith)

lemma editor_sharp_coherent_empty [WeilData E] D :
    linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0})
      (fixingSet (∅ : Finset (S.chosenPlaces 0)) D) Set.univ ≤
      ENNReal.ofReal ((1 + (S.b ^ 2)⁻¹ / 4) * S.mainEnergy * S.unipCovolume ^ 2) := by
  have hp : (∅ : Finset (S.chosenPlaces 0)) ≠ univ := by
    intro h
    have hc := congrArg Finset.card h
    rw [Finset.card_empty, Finset.card_univ, S.card_chosenPlaces 0] at hc
    exact (ne_of_gt (editor_infPlaces_pos (S := S))) hc.symm
  have H := editor_sharp_coherent_link (S := S) ∅ D
  simp only [hp, Set.setOf_true, Finset.card_empty, pow_zero, mul_one] at H
  exact H.trans (ENNReal.ofReal_le_ofReal (by
    have h := editor_empty_link_scalar S.b S.thousand_le_b
    gcongr))

lemma editor_sharp_coherent_small [WeilData E] (A : Finset (S.chosenPlaces 0)) D
    (hA : A ≠ ∅) (hsmall : 4 * #A < 3 * numInfPlaces E) :
    linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet A D) Set.univ ≤
      ENNReal.ofReal (((S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A * S.mainEnergy / 2) *
        S.unipCovolume ^ 2) := by
  have hp : A ≠ univ := by
    intro h
    subst A
    rw [Finset.card_univ, S.card_chosenPlaces 0] at hsmall
    omega
  have hk : 2000 ≤ 𝔰.k := by have := S.ϱ_le_k; omega
  have ha : 1 ≤ #A := Finset.card_pos.mpr (Finset.nonempty_iff_ne_empty.mpr hA)
  have H := editor_sharp_coherent_link (S := S) A D
  simp only [hp, Set.setOf_true] at H
  apply H.trans (ENNReal.ofReal_le_ofReal ?_)
  have hs := editor_small_link_scalar S.b S.thousand_le_b 𝔰.k #A hk ha
  calc
    _ ≤ (((S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A / 2) * S.mainEnergy) *
        S.unipCovolume ^ 2 := by gcongr
    _ = _ := by ring

variable {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma Fits.editor_exists_translate_finrank_comap_le_coherent [WeilData E] {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + (S.b ^ 2)⁻¹ / 2) :=
  Fits.editor_exists_translate_finrank_comap_le_two_links
    (editor_sharp_coherent_empty (S := S)) (editor_sharp_coherent_small (S := S))
    hρ hQ hg hb hc hD

#print axioms editor_sharp_coherent_link
#print axioms editor_empty_link_scalar
#print axioms editor_small_link_scalar
#print axioms editor_infPlaces_pos
#print axioms editor_sharp_coherent_empty
#print axioms editor_sharp_coherent_small
#print axioms Fits.editor_exists_translate_finrank_comap_le_coherent
end Filling
