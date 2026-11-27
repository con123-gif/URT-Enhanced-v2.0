import New.Filling.CrudeEnergy
import Mathlib.Tactic


-- Exact mathematical elaboration options from the pinned compact lakefile.
set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000
set_option pp.fullNames true

/-!
Active 27-November caller replacement, PREPARED until local Lean execution.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Reuse Landau RUN77 a62382a8 (blob d8a0c983b313036f4d9ccb80c6277cf368e32151)
for the exact outer index/count bridge; these two helper proofs are copied
with new names, not claimed as new mathematics. Replace the original
inline outer divisor in BlockBound.sum_pairWeight_le by that named bridge.
Factor the source's actual inner saturation construction into a named
same-right-class bridge as well, reusing RUN74's geometry. The remaining
support overcount, class averaging and scale hypotheses are retained.
No appeal to the original sum_pairWeight_le occurs in the replacement body.
This is a native caller-substitution candidate, not a complete B2/RH proof.
-/

open AddSubgroup Module DoubleCoset ENNReal Fintype MatMul Matrix MeasureTheory Submodule
open Pointwise Set

namespace Filling

section Bridges

variable {E : Type} [Field E] [CMType E] [StablyUnram E]
  {𝔰 : Shape} {S : Filling E 𝔰} [S.IsAdmissible]
  {c : S.Classes} {j : Fin (𝔰.ϱ + 2)}

/-- Exact outer divisor, using only positivity of the selected-row index. -/
theorem b2_active_outer_frameValueIndex_dvd (p : S.Classes × S.G E)
    (V : Submodule E (𝔰.κ → E))
    (hidx : 1 ≤ S.xRowsIndex j (S.termElem c p)) :
    S.frameValueIndex c (S.termElem c p) S.gIdele V ∣
      submoduleIndex (S.gIdele • intVectors (Ô E) (IndexBelow j))
        (intVectors ..) * S.frameValueIndex c (S.termElem c p) 1 V := by
  exact (relIndex_dvd_of_le_left _ inf_le_left).trans ((
    relIndex_inf_mul_relIndex _ (toAddSubgroup _) _).symm.dvd.trans
    (mul_dvd_mul ((submoduleIndex_dvd_of_le (K' := _ ⊓ _) .id le_rfl
      (by simp)).trans ((submoduleIndex_gIdele_smul hidx
      (colLattice_le (col_mem_colLattice ·.1))).dvd.trans
      (submoduleIndex_dvd_of_le _ (fun | _, ⟨v, h, rfl⟩ => ⟨_, ⟨_, h, rfl⟩, by simp⟩)
        le_sup_left))) dvd_rfl))

/-- Actual outer weighted sum in sum_pairWeight_le, with its original support. -/
theorem b2_active_outer_count {t : S.reducedImage besselS}
    {A : Set (S.Classes × S.G E)} (s : ℕ)
    (hA : A ⊆ {p | S.IsLabelledTerm j c t p})
    (V : Submodule E (𝔰.κ → E))
    (hV : 𝔰.k ≤ finrank E V + s) :
    ∑' p : A, S.invPowWeight c
      (submoduleIndex (S.gIdele • intVectors (Ô E) (IndexBelow j))
        (intVectors ..) * S.frameValueIndex c · 1 V) p ≤
      .ofReal (S.b ^ (2000 * 𝔰.n ^ 6 * (s + 1) * numInfPlaces E)) := by
  apply tsum_invPowWeight_le_of_codim_le s hA V ?_ hV
  intro p hp
  have h := hA hp
  exact b2_active_outer_frameValueIndex_dvd p V
    (one_le_xRowsIndex_and_saturationIndex h.2.choose_spec.1 h.1.2).1

/-- Actual inner divisor. Both congruence witnesses use y.1, independently
of the right class carried by the outer labelled term. Geometry is the
source's common-link positivity argument factored into its exact context. -/
theorem b2_active_inner_frameValueIndex_dvd (γ : S.G E)
    (y : S.Classes × S.G E) (T : Submodule E (𝔰.κ → E))
    (hcong : S.CongruentTerms c y.1 γ y.2)
    (f : commonLink γ y.2 = T) :
    S.frameValueIndex c (S.termElem c y) S.gIdele
      (T ⊓ (frameMiddle γ.1.1).toRows₁ᴴ.mulVecLin.ker) ∣
        S.saturationIndex (S.termElem c y) := by
  rcases hcong with ⟨s, ⟨k, rk, ek⟩, k', rk', ek'⟩
  refine
    submoduleIndex_dvd_of_le (S.gIdele • ((frameImage (S.termElem c y).1.1)ᴴ *
    (S.latMiddle (𝔸f E)).splitGram).mulVecLin) (colLattice_le (Sum.rec (⟨_, col_mem_colLattice ·, by
    ext1; simp [frameGram, splitGram, mulVec_eq_sum, mul_apply, Units.smul_def]⟩) fun a ↦
    ⟨0, by simp, congrArg _ (funext fun i ↦ .trans (by cases i using Fin.lastCases <;> simp)
    (congrFun₂ (termElem ..).2 ..).symm)⟩)) (le_sup_of_le_left ?_)
  · set L := T ⊓ (frameMiddle γ.1.1).toRows₁ᴴ.mulVecLin.ker; obtain ⟨_, ⟨hb, -⟩, p, a, -, hp, rfl⟩ := sublatticeBasis _ L
    rintro _ ⟨r, hy, rfl⟩
    let P : Matrix 𝔰.BesselIndex .. := fromRows 0 ((p.fromRows 0).fromRows 0)
    have φ : (frameImage γ.1.1)ᴴ * S.ratGram * P = 0 := .trans (by simp [P, splitGram, entrywise,
      middleGram]) (mul_eq_zero_of_range_le_ker (hp.le.trans inf_le_right))
    obtain ⟨w, hw⟩ := exists_mul_eq_of_col_mem_range (x := isotropicFramePair y.2) (y :=
      y.2.1.1 * (γ⁻¹.1.1 * P) - P) fun i ↦ by
      obtain ⟨z, ⟨⟨h, h'⟩, hq⟩, e⟩ := f.ge (hp.le ⟨_, p.mulVec_single_one i⟩).1
      obtain ⟨w, a, e'⟩ := congr(($(U.form_mul_inv_eq _) *ᵥ _) ∘ 𝔰.besselFrame).trans congr($φᵀ i),
        mem_link.1 h'
      rw [← mulVec_mulVec] at w; set u := γ⁻¹.1.1 *ᵥ _
      simp [funext_iff, middleGram, splitGram, mulVec_eq_sum, Fin.forall_fin_succ'] at hq e w
      have l := (link γ).sub_mem ⟨_, isotropicFramePair_mulVec_eq_zero_iff.2 ⟨fun _ ↦ rfl, w.1⟩,
        rfl⟩ h
      have f := by simpa [funext_iff] using
        eq_zero_of_ratMiddle_form_eq_zero (u ∘ .inr ∘ .inl - z ∘ .inr) (by simp [*]) (by
        simpa [-Finset.sum_add_distrib, dot_mulVec_eq_sum_sum, u, P, *, ← neg_add,
          -neg_add_rev] using mem_link_iff_orthogonal.1 l _ l)
      use (y.2.1.1 *ᵥ (a ⊕ᵥ (z ∘ .inr ⊕ᵥ 0))) ∘ .inl ⊕ᵥ (u ∘ .inl - a); show _ = _ *ᵥ u - _
      simp [funext_iff, mulVec_eq_sum, sub_mul, P, w.1] at e' ⊢; grind-linarith only
    refine ⟨_, ⟨((S.principalLevel_eq_unitaryLevel.le ⟨k' * k⁻¹, by simp [*], rfl⟩).2.mul (N :=
      S.classCoord c * (finAdeleMat P * a.1)) (by simpa [IsIntMatrix, P,
      classCoord_eq_fromBlocks] using hb)).neg.mulVec hy, -(S.gIdele⁻¹ • finAdeleMat w * a.1) *ᵥ r,
      ?_⟩, ?_⟩ <;> simp [-sub_mulVec, ← smul_mulVec, -coe_units_inv] <;> congr
    simpa [↓← classCoord_mul_isotropicFramePair, ek, ek', coe_termPosition, Matrix.map_sub,
      classCoord, ← (classBasis _).1.mul_assoc, -coe_units_inv]
      using! congr(S.classCoord c * finAdeleMat ($hw) * a.1)
    simp [← ek', by simpa [↓← frameImage_mul] using congr($((U.gram_invariant (k' * k⁻¹).1
      (frameImage k) (S.classCoord c * finAdeleMat P)).trans (by erw [ek, frameImage_termPosition,
      classCoord_gram, φ])) * a.1)]
    simp [entrywise, P, classCoord_eq_fromBlocks, splitGram]

end Bridges

section Caller

-- Match the original declaration's complete binder order as well as its goal.
variable {E : Type} [Field E] [CMType E] {𝔰 : Shape}
  {j : Fin (𝔰.ϱ + 2)} [StablyUnram E] {S : Filling E 𝔰} [S.IsAdmissible]

theorem b2_active_sum_pairWeight_le : ∑ c, ∑ c', ∑' (γ) (γ'), S.pairWeight j c c' γ γ' ≤
  .ofReal (2 * S.tailScale ^ 2) := by
  apply S.of_size_bounds; intros; apply ((tsum_fiberwise (fun (⟨i, t, c, T, q, p⟩ : Σ i t c, Σ (T :
    {T : Submodule E (𝔰.κ → E) // finrank E T + i = 𝔰.k}) (q : ofPred (S.IsLabelledTerm j c t)),
    {p | S.IsLabelledTerm j c t p ∧ S.CongruentTerms c p.1 q.1.2 p.2 ∧ commonLink q.1.2 p.2 = T}) ↦
    S.termWeight j i c q p T) fun ⟨_, _, c, _, q, p⟩ ↦ (c, p.1.1, q.1.2, p.1.2)).trans_le ?_).trans'
  · simp -iota [pairWeight]; gcongr; split_ifs with h; have ⟨h@⟨s, o, o'⟩, m, m'⟩ := h
    exact .trans (by rfl) (ENNReal.le_tsum ⟨⟨_, _, _, ⟨commonLink .., by simp [(finrank_le
      _).trans]⟩, ⟨(_, _), m, s, o, rfl⟩, (_, _), ⟨m', s, o', rfl⟩, h, rfl⟩, rfl⟩)
    simp
  simp [ENNReal.tsum_sigma', termWeight]
  grw [ENNReal.tsum_le_tsum (g := (.ofReal <| 2⁻¹ ^ · * S.tailScale ^ 2)) fun m ↦ ?_]
  simp [-inv_pow]
  grw [tsum_invPowWeight_le_of_codim_le (m + 𝔰.ϱ + 1) (by exact inf_le_left) ?T ?A ?C, ENNReal.tsum_mul_right.le,
    tsum_invPowWeight_le_of_codim_le m (by rfl) _ (by
      intro p hp
      exact b2_active_outer_frameValueIndex_dvd p _
        (one_le_xRowsIndex_and_saturationIndex hp.2.choose_spec.1 hp.1.2).1) (by exact a.2.ge)]
  case T T => exact T.1 ⊓ (frameMiddle a.1.2.1).toRows₁ᴴ.mulVecLin.ker
  case' C T => rw [← map_comap_subtype, ← LinearMap.ker_domRestrict]
  · set N := (mulVecLin _).domRestrict T.1
    obtain ⟨e : _ = _⟩ := T.2, N.finrank_range_add_finrank_ker, N.range.finrank_le
    simp_all [SubmoduleElem]; omega
  case A c _ T =>
    intro y hy
    exact b2_active_inner_frameValueIndex_dvd _ y T.1 hy.2.1 hy.2.2
  conv_lhs => simp [ENat.card_eq_coe_natCard, ← Finset.sum_mul]
  grw [sum_latticeDisc_inv_le, ← ofReal_natCast]
  simp (disch := positivity) only [mul_pow, ← ofReal_mul, ofReal_le_ofReal_iff, inv_pow, field]
  rw [← pow_succ, sq S.tailScale, mul_pow]; nth_grw 3 [← pow_le_tailScale le_rfl]
  simp [← pow_mul, mul_assoc, ← pow_add]; gcongr; lia


#print axioms Filling.b2_active_outer_frameValueIndex_dvd
#print axioms Filling.b2_active_outer_count
#print axioms Filling.b2_active_inner_frameValueIndex_dvd
#print axioms Filling.b2_active_sum_pairWeight_le
#check @b2_active_outer_frameValueIndex_dvd
#check @b2_active_inner_frameValueIndex_dvd
#check @b2_active_sum_pairWeight_le

-- Pointwise original-statement bridge, using the replacement proof.
example : ∑ c, ∑ c', ∑' (γ) (γ'), S.pairWeight j c c' γ γ' ≤
    .ofReal (2 * S.tailScale ^ 2) := b2_active_sum_pairWeight_le

-- Inspect the actual elaborated caller, not just its source text.
run_cmd do
  let info ← Lean.getConstInfo ``Filling.b2_active_sum_pairWeight_le
  let original ← Lean.getConstInfo ``Filling.sum_pairWeight_le
  let sameType ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq original.type info.type
  unless sameType do
    Lean.throwError "B2 replacement has a different original declaration type"
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "B2 replacement has no inspectable proof value"
  let deps := value.getUsedConstants
  if deps.contains ``Filling.sum_pairWeight_le then
    Lean.throwError "B2 replacement calls the original target theorem"
  unless deps.contains ``Filling.b2_active_outer_frameValueIndex_dvd do
    Lean.throwError "B2 caller did not consume the outer bridge"
  unless deps.contains ``Filling.b2_active_inner_frameValueIndex_dvd do
    Lean.throwError "B2 caller did not consume the inner bridge"
  Lean.logInfo "B2_ACTIVE_CALLER: original declaration type matches; both bridges consumed; original target absent from direct proof dependencies"

end Caller

end Filling


set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000
set_option pp.fullNames true

/-!
Prepared actual energy consumer of the active pair-weight replacement.
Not replayed until a native result says otherwise. Exact original source
and all quantitative, level, same-data, measure and positivity premises retained.
Only the final pair-weight supplier is replaced. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

open Fin Classical ENNReal Matrix MeasureTheory MulAction Set

variable {E : Type} [Field E] [CMType E] {𝔰 : Shape} {S : Filling E 𝔰}

attribute [-instance] IdemSemiring.toCanonicallyOrderedAdd IdemSemiring.toMulLeftMono
  IdemSemiring.toMulRightMono
attribute [local instance high] Side.cut
attribute [local irreducible] Filling.classGauge Filling.mainEnergy Filling.saturationIndex
  Filling.termPosition Filling.frameValueIndex link

variable [StablyUnram E]
variable [ok : S.IsAdmissible] {C w : ℝ} (hC : 0 ≤ C) {Ω : Set _} {T X} (hT : S.IsStable T)
  (h₁ : (∃ γ ∈ T, ∃ c c', ∃ s ∈ Ω, γ ∈ S.termsOver c s c' ∧ IsNormalForm 0 γ) →
  S.tailScale ^ 20 * S.besselEnergy ≤ C)
  (hx : X ≠ 0) (hq : ∀ s ∈ Ω, S.FixesNormAtLeast s X) (hw : 0 ≤ w) (hz : S.besselEnergy ≤ C)
include hC hT h₁ hx hq hw hz

lemma Filling.b2_active_energy_le_of_level_pairs j R (hc : ∀ γ ∈ T, S.HasLevel j γ) (h₂ : 𝔰.ϱ < j →
  (∃ Λ, Λ ∉ R) → S.tailScale ^ 12 / X ^
  𝔰.k * S.mainEnergy ≤ C) (h : linkEnergy T Ω R ≤ .ofReal (w * S.unipCovolume ^ 2)) : energy
  (S.amplitudeSum T) Ω ≤ w + C / S.b ^ 30 / 4 ^ j.rev.1 := S.of_size_bounds fun g t u z v y ↦ by
  intros; simp_rw [energy, ← Finset.sum_div]; grw [div_le_iff₀, ← ofReal_le_ofReal_iff, add_mul,
    ofReal_add, ← h, ← (?_ : ∑ c, ∑ c', ∑' (a) (b),
    .ofReal (C / S.tailScale ^ 3 * S.unipCovolume ^ 2) * (S.pairWeight j c
    c' b a + S.pairWeight j c c' a b) ≤ .ofReal _), linkEnergy] <;> try positivity
  simp (disch := intros; positivity) [← Finset.sum_subtype_eq_sum_filter, ofReal_sum_of_nonneg]
  have m {α β : Type} (f : α → ℝ≥0∞) g : tsum f * tsum g = ∑' p : α × β, f p.1 * g p.2 := by simp
  have B Λ := enorm_amplitudeSum_le_classSize (T :=
    T ∩ link ⁻¹' {Λ}) (by grind [IsStable, link_besselU_mul]) (hc · ·.1)
  simp_rw [amplitudeSum, ← ((summable_amplitude T ..).hasSum.tsum_fiberwise (link ∘ (·.1))).tsum_eq]
  grw [enorm_tsum_le_tsum_enorm]; simp_rw [← tsum_image _ injOn_subtype_val, tsum_subtype
    (_ '' _), preimage_comp, Subtype.image_preimage_coe, T.inter_right_comm _ (_ ⁻¹' _),
    ← tsum_subtype, ← amplitudeSum.eq_1, sq, m, ← ENNReal.summable.tsum_add_tsum_compl
    (s := Function.diag '' R) (by simp), Finset.sum_add_distrib]
  gcongr; exact ((Equiv.Set.image _ R fun _ _ ↦ by simp).tsum_eq _).ge
  grw [ENNReal.sum_le_tsum, B, B]; simp_rw [m, ← ENNReal.tsum_mul_left, ← ENNReal.tsum_sigma]
  refine (ENNReal.tsum_le_tsum fun ⟨s, π, ⟨γ, ⟨⟨m, e⟩, a⟩, n⟩, γ', ⟨⟨m', e'⟩, a'⟩, _⟩ ↦ ?_).trans
    (tsum_comp_le_tsum_of_injective (f := fun ⟨_, _, a, b⟩ ↦ ⟨a, b⟩) ?_ _);
  (iterate 2 rintro ⟨⟨⟩, ⟨⟨⟩⟩, ⟨_, ⟨⟨⟨_, ⟨⟩⟩, ⟨⟩, ⟨⟩, ⟨⟩⟩⟩⟩, _, ⟨⟨⟨_, ⟨⟩⟩⟩⟩⟩); rintro ⟨⟩; rfl; dsimp
  have k := hc _ m; apply hc at m'; specialize hq _ s.2; obtain ⟨⟨i, r, l, L⟩, ⟨-, ⟨d⟩⟩, ⟨-, ⟨d'⟩⟩,
    ⟨⟨_, p⟩, -⟩, ⟨⟨-, q⟩⟩⟩ := pairInvariant_mul_le n.1 a k hq a' m',
    one_le_xRowsIndex_and_saturationIndex a k, one_le_xRowsIndex_and_saturationIndex a' m',
    exists_link_split_le_classGauge n.1 a k hq γ', exists_link_split_le_classGauge n.1 a' m' hq γ
  unfold pairWeight termWeight invPowWeight pairInvariant commonLink classSize countWeight at *; set
    D := ite (𝔰.ϱ < j) S.mainEnergy _
  have H : S.tailScale ^ 4 * D * (2 * S.tailScale ^ 2) ^ (j - 𝔰.ϱ) * S.codimFactor ^ i / ite
    (𝔰.ϱ < j ∧ i = 0) X 1 ^ 𝔰.k ≤ C / S.tailScale ^ 3
  · clear * - t u v y h₂ h₁ l k m a e e' hz
    induction' j using lastCases with j <;> simp [Nat.sub_eq_zero_of_le, D, is_le, ← not_le]
    · cases i; · grw [← h₂ (by simp) ⟨π.1.1, by grind⟩, t]; simp [field]; bound
      grw [pow_le_of_le_one _ codimFactor_le_one, ← hz, ← ok.mainEnergy_le,
        t] <;> simp [field] <;> bound
    grw [codimFactor_le_one]; rcases j with ⟨⟨⟩⟩
    · grw [← h₁ ⟨_, m, _, _, _, s.2, a, k.1⟩]; simp [field]
    grw [← hz, ← le_self_pow₀] <;> simp [field] <;> bound
  repeat rw [ite_eq_left (by simp [*]; use s)]
  rw [inf_comm (link γ')] at *; have M := L; grw [z] at L
  nth_grw 1 [← show 1 ≤ ite _ X 1 by lia, ← d, ← d', ← g, ← p, ← q] at M; grw [tsub_le_iff_left.2
    (r.trans_eq (add_assoc ..)), ← H, mul_add, ← (ENNReal.pow_le_pow_left_iff (by simp)).1 (.trans
    ?_ ((mul_le_mul' le_self_add le_add_self).trans (sq _).ge))]; simp (disch := positivity) only
    [D, ← ofReal_mul, ← ofReal_pow, ← div_le_iff₀'] at *; nth_grw 2 [pow_succ _ 𝔰.k, ← M]
  grw +useKAbstract [← L]; simp (disch := positivity) only [mul_pow, div_pow, Real.sq_sqrt,
    (submoduleIndex ..).cast_mul, submoduleIndex_smul_intVectors S.gIdele_mem, Fintype.card_subtype,
    card_filter_val_lt, S.gIdele_val ▸
    genIndex_natCast _]; congr! 1; field; any_goals nlinarith only [t]
  simp [ENNReal.tsum_add, ← Finset.mul_sum]
  grw [ENNReal.tsum_comm.le, b2_active_sum_pairWeight_le]
  simp (disch := positivity) only [← ofReal_mul, ← ofReal_add, ofReal_le_ofReal_iff, field]
  ring_nf; grw +useKAbstract [show 4 ≤ S.b by linarith, ← pow_le_tailScale (e := 𝔰.ϱ + 1 - j + 31)
    (le_mul_of_le_of_one_le (by lia) NeZero.one_le)]; ring_nf; rfl

#print axioms Filling.b2_active_energy_le_of_level_pairs
#check @Filling.b2_active_energy_le_of_level_pairs

run_cmd do
  let info ← Lean.getConstInfo ``Filling.b2_active_energy_le_of_level_pairs
  let original ← Lean.getConstInfo ``Filling.energy_le_of_level_pairs
  let sameType ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq original.type info.type
  unless sameType do
    Lean.throwError "Energy replacement has a different original declaration type"
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "Energy replacement has no inspectable proof value"
  let deps := value.getUsedConstants
  if deps.contains ``Filling.energy_le_of_level_pairs then
    Lean.throwError "Energy replacement calls its original target"
  if deps.contains ``Filling.sum_pairWeight_le then
    Lean.throwError "Energy replacement calls the old pair-weight theorem"
  unless deps.contains ``Filling.b2_active_sum_pairWeight_le do
    Lean.throwError "Energy replacement does not consume the new pair-weight caller"
  Lean.logInfo "B2_ACTIVE_ENERGY: original declaration type matches; replacement pair bound consumed; original targets absent from direct proof dependencies"

/-!
Prepared full CrudeEnergy consumer extension. Append after the authenticated
pair and level-energy fragments, retaining their exact variable context.
Original source and all level, positivity, cutoff and scale premises retained.
Only the pair/level energy suppliers are replaced. Native replay pending.
-/

omit hw in
/-- Letters as in `Filling.energy_le_of_level_pairs`.
T stable, all s ∈ Ω fixing X ≥ 1; C ≥ 𝖽₁, and ≥ τ²⁰𝖽₁ if a term has `IsNormalForm` 0. If each γ
∈ T with `Filling.CharsAgree` has a level below n ≤ ϱ+1, the cut energy is ≤ C/(b³⁰4^(ϱ+1−n)). -/
lemma Filling.b2_active_energy_le_of_level_lt n (h : ∀ γ ∈ T, S.CharsAgree γ → ∃ j < n, S.HasLevel j γ) :
    energy (S.amplitudeSum T) Ω ≤ C / S.b ^ 30 / 4 ^ n.rev.1 := by
  induction' n using induction with j ih generalizing T
  · simp [energy, amplitudeSum_eq_zero_of_not_charsAgree hT (by grind)]; positivity
  grw [amplitudeSum_split _ {γ | S.HasLevel j.castSucc γ}, energy_add_le one_pos, ih,
    b2_active_energy_le_of_level_pairs hC _ _ hx _ le_rfl _ j.castSucc ∅ (h := by simp [linkEnergy])]
  simp [rev_castSucc, pow_succ, field]; all_goals grind [IsStable, S.isStable_hasLevel j.castSucc]

/-- Crude estimate (letters as in `Filling.energy_le_of_level_pairs`):
T stable, all s ∈ Ω fixing X ≥ 1; C ≥ 𝖽₁, ≥ τ²⁰𝖽₁ if a term has `IsNormalForm`
0, ≥ τ¹²𝖽/X^|κ| if R omits a link. If cut `Filling.linkEnergy` (𝗀 ≠ 0) ≤ wν², the full energy
is ≤ (1+b⁻⁴)²w + b⁻¹²C.

Incoherent and degenerate pairs are negligible. -/
lemma Filling.b2_active_energy_le_of_linkEnergy_le R (h₂ : (∃ Λ, Λ ∉ R) →
  S.tailScale ^ 12 / X ^ 𝔰.k * S.mainEnergy ≤ C)
  (h : linkEnergy (T ∩ {γ | S.termDisc γ ≠ 0}) Ω R ≤ .ofReal (w * S.unipCovolume ^ 2)) :
  energy (S.amplitudeSum (σ := .full) T) Ω ≤ (1 + (S.b ^ 4)⁻¹) ^ 2 * w + (S.b ^ 12)⁻¹ * C := by
  obtain ⟨⟨y, _, e⟩, p⟩ := exists_nonneg_add_of_le S.thousand_le_b,
    (by bound [S.thousand_le_b] : 0 < S.b ^ 4)
  grw [← sub_add_cancel (S.amplitudeSum (σ := _) T) (S.amplitudeSum T), energy_add_le p,
    energy_sub_cut_le, amplitudeSum_split, energy_add_le p, b2_active_energy_le_of_level_pairs hC _ _ hx _ _ _
    (last _) R _ _ h, b2_active_energy_le_of_level_lt hC _ _ hx _ _ (last _), hz, ← e, ← sub_nonneg]
  simp [field, -sub_nonneg]; ring_nf; positivity
  all_goals grind [CharsAgree.exists_hasLevel, HasLevel, IsStable, frameDisc_frameGram_besselU_mul,
    hasLevel_last]

#print axioms Filling.b2_active_energy_le_of_level_lt
#print axioms Filling.b2_active_energy_le_of_linkEnergy_le

run_cmd do
  let pairs := #[(``Filling.energy_le_of_level_lt, ``Filling.b2_active_energy_le_of_level_lt),
                 (``Filling.energy_le_of_linkEnergy_le, ``Filling.b2_active_energy_le_of_linkEnergy_le)]
  for (old, replacement) in pairs do
    let original ← Lean.getConstInfo old
    let info ← Lean.getConstInfo replacement
    let sameType ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq original.type info.type
    unless sameType do
      Lean.throwError "Full energy replacement has a different original declaration type"
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "Full energy replacement has no inspectable proof"
    let deps := value.getUsedConstants
    for forbidden in #[``Filling.energy_le_of_level_pairs, ``Filling.energy_le_of_level_lt,
                        ``Filling.energy_le_of_linkEnergy_le, ``Filling.sum_pairWeight_le] do
      if deps.contains forbidden then
        Lean.throwError "Full energy replacement calls an original energy/pair target"
    unless deps.contains ``Filling.b2_active_energy_le_of_level_pairs do
      Lean.throwError "Full energy replacement did not consume the new level-pair bound"
    if replacement == ``Filling.b2_active_energy_le_of_linkEnergy_le then
      unless deps.contains ``Filling.b2_active_energy_le_of_level_lt do
        Lean.throwError "Full link-energy replacement did not consume the new lower-level bound"
  Lean.logInfo "B2_ACTIVE_FULL_ENERGY: original declaration types match; all three energy callers consume replacements; original targets absent from direct proof dependencies"
