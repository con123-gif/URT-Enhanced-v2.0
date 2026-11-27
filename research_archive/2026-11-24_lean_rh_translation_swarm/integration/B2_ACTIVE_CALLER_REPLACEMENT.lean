import New.Filling.BlockBound
import Mathlib.Tactic

-- Exact mathematical elaboration options from the pinned compact lakefile.
set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000

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
  let some value := info.value? |
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
