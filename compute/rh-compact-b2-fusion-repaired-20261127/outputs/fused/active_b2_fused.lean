import Lean
import active_b2_energy
import New.Filling.CrudeEnergy
import Mathlib.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000
set_option pp.fullNames true
set_option debug.skipKernelTC false

/-! Generated from pinned source and checked B2 proofs. PREPARED until its
fresh compiler/type/axiom/dependency receipts pass. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. No global dependency deletion or RH claim. -/

section LabelBridge

namespace Filling.RHPositivityRun78

open Fin ENNReal Finset MatMul Matrix Pointwise Submodule

attribute [-simp] MulMemClass.coe_mul Nat.cast_mul Subgroup.coe_mul

attribute [local simp] gIdele_val mulVec Matrix.mul_apply splitGram frameGram middleGram
  Units.smul_def dotProduct funext_iff mul_pow

variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} {c}

theorem canonical_label_frame_unique [S.IsAdmissible]
    {t : S.reducedImage besselS} {p p' : S.Classes × S.G E} {u u'}
    (hu : u ∈ S.classUnip₀ c) (hu' : u' ∈ S.classUnip₀ c) :
    ((DoubleCoset.mk (S.classUnip₀ c) (S.classUnip₀ p.1) p.2).out = p.2 ∧
      ∃ s, p.2 ∈ S.termsOver c s p.1 ∧
        (Subgroup.groupEquivQuotientProdSubgroup s).2 = t) →
    ((DoubleCoset.mk (S.classUnip₀ c) (S.classUnip₀ p'.1) p'.2).out = p'.2 ∧
      ∃ s, p'.2 ∈ S.termsOver c s p'.1 ∧
        (Subgroup.groupEquivQuotientProdSubgroup s).2 = t) →
    frameImage (u * p.2).1.1 = frameImage (u' * p'.2).1.1 → p = p' := by
  rintro ⟨o, s, h, rfl⟩ ⟨o', r, g, e⟩ f
  obtain ⟨⟨k, rfl, a⟩, k', rfl, a'⟩ := one_mul s ▸ termsOver.mul hu.1.2 h,
    one_mul r ▸ termsOver.mul hu'.1.2 g
  refine (termsOver.eq_and_mem_classUnip₀ ⟨k, rfl, a⟩ ⟨_, Equiv.injective _
    (Prod.ext (QuotientGroup.eq.2 ?_) e), a'⟩ f).rec fun e x ↦ Prod.ext e (by rw [← o,
    (DoubleCoset.eq (b := p'.2)).2 ⟨_, mul_mem (inv_mem hu') hu, _, x, by group⟩, e, o'])
  use k'⁻¹ * k, mem_besselS_iff_frameImage.2 (by erw [frameImage_inv_mul_eq_iff.2] <;> simp [*,
    frameImage_termPosition]), by simp

theorem labelled_frame_unique [S.IsAdmissible]
    {j t p p' u u'} (hu : u ∈ S.classUnip₀ c) (hu' : u' ∈ S.classUnip₀ c) :
    S.IsLabelledTerm j c t p → S.IsLabelledTerm j c t p' →
    frameImage (u * p.2).1.1 = frameImage (u' * p'.2).1.1 → p = p' := by
  intro h h' f
  exact canonical_label_frame_unique hu hu' ⟨h.1.1.2, h.2⟩ ⟨h'.1.1.2, h'.2⟩ f

end Filling.RHPositivityRun78

end LabelBridge

/-!
RUN80 — labelled canonical uniqueness at the fused count-to-energy interface.
27 November 2026. PREPARED, not native verified. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
live spine 30924a758e7dc18f58e424b5e54c7d21f4b060e2,
ledger 7a20a39bd945378ed2daab0953e9b65571d0a196.
Peer input: integration/2026-11-27_fused_b2_prepared/active_b2_fused.lean
blob 6f2691b2ccddf695aa604c9fe9a67b864259565e, commit 3660c6794c829109712a5172fd82209512ebd83a.
LabelBridge is copied unchanged from RUN79_LABELLED_COUNT_REPLACEMENT.lean
blob b4d893b63a89b0e095aec8807cba4ac195496cc3, commit 78abe2eae5f3ebff6df46299ac5df3d081fe399f.
Original BlockBound blob 6c68e80e3b1ea2b7983696716305493a37f2b1fd.
The prior helper/consumer is reused; the only new mathematical integration
is the joint local skew + labelled uniqueness substitution in the same count
supplier, propagated by the peer's unchanged checked-expression transport.

Premises: same common finite label, both termsOver reductions and canonical
double-coset representatives, both left corrections in classUnip0(c), equal
corrected frame images. Nearness and level are not needed for the final
uniqueness lemma but remain necessary for deriving corrections. All original
count/pair/energy statement premises retained. No change to tail exponents.
Local source graph: count -> old uniqueness; new count -> labelled bridge
-> canonical bridge -> same primitive quotient/termsOver facts. New count
also retains named skew correction. Both original graph and peer fused source
remain immutable. Direct guards are not recursive graph proof.

Actual verification inspected on run 46006832164 (record 2026-11-27 13:51Z):
primary seven callers exit 0, all standard axioms, exact guards; skew/count
and sum_pairWeight replacement exit 0 in 60.18 s, axiom audit true
(skew_caller_results.json blob 0a97756bf091ef0c331b53f4533dcbde217fc132).
Recursive graph FAILED: getUsedConstants disagrees with independent traversal
(local_b2_graph.log blob ae8303ac742f9ce634b34966617e8b0e18e5269c).
Overall shared job status ERROR (blob 9459c0acbb3e68b78e7f46ebb36a45a25ee7647d).
The independent seven-caller receipt is still valid, but neither native
fusion nor the new joint label/skew integration has passed.
Peer proof-retarget core test timed out at 120s; unchanged here.
RUN79 standalone inspector requires allowOpaque := true and pp.fullNames true;
this integrated variant uses both, and retains debug.skipKernelTC false.

Static preparation actually executed against both fetched pinned blobs:
three unique anchors checked; exactly two helpers inserted, one old caller
invocation replaced, one guard block inserted; reversing all three changes
recovered peer input byte-for-byte, and its entire retargeting suffix was
unchanged. No Lean/lake available in this run; no native engine execution
or URT comparison. The historical 45577239749 and 45576756833 engine checks
are old-pin evidence only. All unresolved root obligations preserved.
Do not compile this together with the peer fused file in one environment
(they use the same candidate names); it is an alternative input, not an import.

RESUME HERE: on existing authenticated compact cache and checked
active_b2_energy.olean, use this file as the label-enabled variant of the
peer fusion only after its core transport compatibility is established.
lake env lean --tstack=400000 -R <module-dir> -o <module-dir>/RUN80_LabelFused.olean <module-dir>/RUN80_LabelFused.lean
with LEAN_PATH including the checked active_b2_energy module directory.
Require exit 0, both new label guards, existing five type comparisons and
supplier guards, eleven named axiom reports (standard names only), and then
separately the repaired recursive graph. Do not rebuild the dependency tree
or rerun successful skew or seven-caller batches. Keep failed log if any.
HANDOFF TO integration/editor and kernel graph audit. RH remains OPEN.
-/

seal Finset.univ Finset.sum Finset.prod
open AddSubgroup Module DoubleCoset ENNReal Fintype MatMul Matrix MeasureTheory Submodule

namespace RHB2Fusion

-- Rectangular matrix cancellation in the two native branches.
-- No star-specific simplification is needed once T^*P=-VX is supplied.
theorem skew_correction_mul {a b : Type*} [Fintype a]
    [DecidableEq a] [Fintype b] [DecidableEq b]
    {R : Type*} [CommRing R]
    (T U V : Matrix a a R) (P X : Matrix a b R) (d e : R)
    (h : U * P = -(V * X))
    (hc : T * P = d • X ∨ V = e • (1 : Matrix a a R)) :
    (e • T - d • U - V*T) * P = (e*d) • X := by
  rcases hc with ht | hv
  · simp only [Matrix.sub_mul, Matrix.smul_mul, Matrix.mul_assoc, ht, h,
      Matrix.mul_smul, smul_smul]
    module
  · simp only [Matrix.sub_mul, Matrix.smul_mul, Matrix.mul_assoc, h, hv,
      Matrix.one_mul, smul_smul]
    module

end RHB2Fusion


namespace Filling

variable {E : Type} [Field E] [CMType E] {𝔰 : Shape} {S : Filling E 𝔰}

variable [S.IsAdmissible] {c} {γ : ↥(S.G E)} {j : Fin (𝔰.ϱ + 2)} {A : Set (S.Classes × S.G E)}

section

open Norms.L2Operator

attribute [-simp] MulMemClass.coe_mul Nat.cast_mul Prod.forall Subgroup.coe_mul sup_of_le_right

attribute [local simp ←] pow_add pow_mul pow_succ'

attribute [local simp] Finset.mul_sum IsIntMatrix Matrix.mul_apply splitGram funext_iff inclMatrix
  mul_assoc mul_pow sub_mul

lemma b2_fused_tsum_invPowWeight_le_of_codim_le [StablyUnram E]
    {t} s (h : A ⊆ {p | S.IsLabelledTerm j c t p}) T {n : _ → ℕ}
    (hQ : ∀ p ∈ A, S.frameValueIndex c (S.termElem c p) S.gIdele T ∣ n (S.termElem c p)) (hT : 𝔰.k ≤
  finrank E T + s) : ∑' p : A, S.invPowWeight c n p ≤
  .ofReal (S.b ^ (2000 * 𝔰.n ^ 6 * (s + 1) * numInfPlaces E)) := S.of_size_bounds fun _ _ _ o ↦ by
  cases' T.finrank_le.dest with l hl; simp at hl
  intros; have K {p} a := (@h p a).2.choose_spec.1
  grw [tsum_le_of_encard_range_le (R := (S.frameProducts ·.2 = S.frameProducts ·.2)) _
    (encard_integral_le Function.uncurry (by bound) (Set.forall_mem_range.2 fun p i ↦
    ⟨isIntegral_frameProducts (K p.2) .., ((h p.2).1.1.1.norm_frameProducts_le · ..)⟩)
    Function.uncurry_injective.injOn) (by tauto) fun A hA p₀ h₀ e ↦ ?_]; rotate_right
  obtain ⟨⟨⟨⟨N⟩, -, D⟩⟩, F⟩ := h (hA h₀), fun {p} a ↦ And.intro (h (hA a)) (e p a _ h₀)
  let O := (Ô E).comap (algebraMap E _)
  have : IsStarStable O := ⟨(by simpa [O] using star_mem_Ô ·)⟩
  let Y := paddedLeading j (S.frameProducts p₀.2)
  have iY :
    IsIntMatrix O Y := by simp [O, Y, paddedLeading, ite_mem, isIntegral_frameProducts (K (hA h₀))]
  let M := S.levelPrime 0 ^ 𝔰.n ^ 4
  have iy := nsmul_mem (iY.mul iY.isInt_conjTranspose).det_mem S.g
  have n0 : M • S.g • (Y * Yᴴ).det ≠ 0 := by simp [M, Y, D]
  let d := principalIdele n0.isUnit.unit
  have hd : ↑d ∈ Ô E := nsmul_mem iy M
  have nd : genIndex d.1 ≤ _ := (genIndex_algebraMap _).trans_le (by
    simp [M, Y, abs_norm_eq_prod_norm_sq, ← sq]; grw [g_le_b_pow, N.norm_map_leadingMinor_le,
      levelPrime_le])
  have := genIndex_pos d; simp [frameValueIndex, frameGram_termPosition, invPowWeight] at hQ ⊢
  grw [tsum_inv_index_pow_le_of_congr hd (fun p ↦ (frameMiddle (S.termElem c p).1.1)ᴴ)
    (fun p h _ _ ↦ (termsOver.isIntMatrix_termPosition (K (hA h))).isInt_conjTranspose
    _ _) ((isPrimitiveMatrix_iff.2 S.isUnimodular_latMiddle.2).mul_iff.2
    (sublatticeBasis (gram_classCoordX₀ c) T).2.1) (equivOfCardEq
    (by simp [← hl, add_assoc]; rfl)) (le_sup_of_le_right _) (n <| S.termElem c ·) (fun p h ↦ .trans
    (submoduleIndex_dvd_of_le .id le_sup_left (by simp)) ((F h).2 ▸ hQ p (hA h))) _ (by simp [← hl])
    fun B hB p₁ h₁ e ↦ (F (hB h₁)).elim fun G' f ↦ ?_, nd]
  rotate_left 2
  choose! u hu eu using fun p h ↦ (@F p (hB h)).elim fun a b ↦
    (a.1.2.exists_frameImage_toRows₂_eq_add (.refl _) (by simp) G'.1.2 (b ▸ f)
    (by simpa [b] using! e _ h₁ p h <| col_mem_colLattice ·)).elim fun l i ↦ show ∃ u ∈ S.classUnip₀
    c, ∀ i a, (u * p.2).1 (.inr i) (𝔰.besselFrame a) = p₁.2.1 (.inr i) (𝔰.besselFrame a) from
    (S.exists_mem_classUnip c id (-fromRows 0 ((l.fromRows 0).fromRows 0)) 0 (by simp) (by simp) (by
    simpa [classCoord_eq_fromBlocks] using i.1) (by simp) rfl).imp (by clear * - i; simp_all
    [middleGram, Fin.forall_fin_succ', Subgroup.coe_mul, ← ext_iff, frameGram])
  grw [tsum_le_of_colouring (fun p ↦ (frameImage (S.termPosition c p.1 (u p * p.2)).1.1).toRows₁)
    (submoduleIndex_smul_ne_zero hd) (fun _ a _ _ ↦ termsOver.isIntMatrix_termPosition
    (.mul (hu _ a).1.2 (K (hA (hB a)))) _ _) (fun _ ↦ 1) 1, submoduleIndex_smul_intVectors hd, nd]
  simp; norm_cast; simp [Set.encard_le_one_iff]
  intro C hC _ _ H' p q a b
  let ξ := (frameImage (u q * q.2) - frameImage (u p * p.2).1.1).toRows₁
  have ⟨X, x, iX⟩ : ∃ X, ξ = _ • X ∧ IsIntMatrix O X := ⟨_, (smul_inv_smul₀ n0 _).symm, (by
    simpa [ξ, O, d, frameImage_termPosition, classCoord_eq_fromBlocks, Units.smul_def,
      intVectors] using Set.mem_smul_set_iff_inv_smul_mem (a := d).1 <| H' _ b _ a ·)⟩
  grw [hC] at a b
  let P := xRows (S.frameProducts p₁.2)
  let α := (xRows Y.adjugateᵀ)ᵀ
  let T := X * α
  have s : Tᴴ * P = -(P * α)ᴴ * X := (smul_right_inj n0).1 (by
    simpa [x, T, mul_comm Y.det] using congr(αᴴ * $((by
    linear_combination (norm := (ext; simp [ξ, P, eu, a, b, frameGram, mul_sub]; ring))
      congr(submatrix $((u q * q.2).2.trans (u p * p.2).2.symm) 𝔰.besselFrame 𝔰.besselFrame) :
      ξᴴ * P = Pᴴ * -ξ))))
  have z i k (J : ↑j ≤ k.1) : (X * Y.adjugate) i k = 0 := (mul_eq_zero_iff_left (by simp [Y, D])).1
    (eq_zero_of_norm_Φ (algebraMap_mem_Ô.1 ((iX.mul iY.adjugate).smul iy i k)) fun v ↦ by
    have t p h := (F (hB h)).2 ▸ HasLevel.norm_shared_vector_lt ((F (hB h)).1.1.imp And.left id) (hu
      p h).2 J rfl v i
    have := congr(‖Φ v (($x * Y.adjugate) i k)‖).ge
    simp [ξ, Y, M, inv_def, entrywise, D, ← Finset.mul_sum] at *
    by_contra! h; grw [← h, norm_sub_le] at this
    linarith [t _ b, t _ a])
  let σ := (M : E) • (Yᴴ.det • T - Y.det • Tᴴ - (P * α)ᴴ * T)
  have hbranches : P * α = Y.det • 1 ∨ T * P = X * Y.adjugate * Y :=
    ((lt_or_ge 𝔰.ϱ j).imp (by simpa [P, α, Y, ← ext_iff, paddedLeading,
    f, ·.trans'] using (congr(submatrix $Y.mul_adjugate Fin.castSucc Fin.castSucc))) fun J ↦
    Matrix.ext fun a b ↦ sum_of_injective _ Fin.castSuccEmb.2 _ _ (by simp +contextual [z, J.trans])
    fun c ↦ mul_eq_mul_left_iff.2 ((em' _).imp (by simp +contextual [Y, P, paddedLeading, f]) (z a
    _)))
  have hcase : T * P = Y.det • X ∨ (P * α)ᴴ = Yᴴ.det • 1 := by
    rcases hbranches with hp | ht
    · right
      simp [hp, Matrix.det_conjTranspose]
    · left
      rw [ht, Matrix.mul_assoc, Matrix.adjugate_mul, Matrix.mul_smul, Matrix.mul_one]
  have hcore := RHB2Fusion.skew_correction_mul T Tᴴ (P * α)ᴴ P X Y.det Yᴴ.det
    (by simpa only [Matrix.neg_mul] using s) hcase
  have hσ : σ * P = (M : E) • ((Yᴴ.det * Y.det) • X) := by
    simp only [σ, Matrix.smul_mul, hcore]
  have k : S.g • (σ * P) = ξ := by
    rw [hσ, x]
    simp [Matrix.det_mul, smul_smul, mul_comm, mul_left_comm, mul_assoc] <;> module
  have ⟨r, _, hr, τ, er⟩ := S.exists_mem_classUnip c id 0 _ (by simp) (by simp [σ, s]; module)
    (by simp) (show IsIntMatrix O σ by apply_rules (transparency := .reducible) [IsIntMatrix.smul,
    IsIntMatrix.sub, IsIntMatrix.mul, IsIntMatrix.isInt_conjTranspose, IsIntMatrix.det_mem] <;>
    simp [α, iY.adjugate _, O, P, isIntegral_frameProducts (K (hA h₀)), f]) rfl
  apply RHPositivityRun78.labelled_frame_unique (mul_mem (hr (by simp)) (hu _ a)) (hu _ b)
    (F (hB a)).1 (F (hB b)).1
  simpa [↓frameImage_mul (s := r), ← ext_iff, er, eu, a, b, P, frameGram, ξ,
    eq_sub_iff_add_eq'] using k
  grw [one_le_two, add_le_mul le_rfl, o, o]
  simp (disch := bound); gcongr; simpa; grw [show l ≤ s by lia]; lia; bound
  rintro _ ⟨v, h, rfl⟩
  simpa [d, Y, preimageLattice, inv_def, smul_smul, D, mul_left_comm _⁻¹, -map_mul] using
    (iY.adjugate.isInt_conjTranspose.smul (nsmul_mem iY.det_mem M)).mulVec (M := finAdeleMat _) h

end
end Filling

-- Verify the new local uniqueness edge before transporting the caller chain.
run_cmd do
  let n ← Lean.getConstInfo ``Filling.b2_fused_tsum_invPowWeight_le_of_codim_le
  let some body := n.value? (allowOpaque := true) |
    Lean.throwError "Labelled fused count has no inspectable body"
  let deps := body.getUsedConstants
  unless deps.contains ``Filling.RHPositivityRun78.labelled_frame_unique do
    Lean.throwError "Fused count did not consume labelled uniqueness"
  unless deps.contains ``RHB2Fusion.skew_correction_mul do
    Lean.throwError "Fused count did not retain skew correction"
  if deps.contains ``Filling.IsLabelledTerm.eq_of_frameImage_eq ||
      deps.contains ``Filling.tsum_invPowWeight_le_of_codim_le then
    Lean.throwError "Fused count retained old direct target"
  let b ← Lean.getConstInfo ``Filling.RHPositivityRun78.labelled_frame_unique
  let some v := b.value? (allowOpaque := true) |
    Lean.throwError "No inspectable label bridge"
  unless v.getUsedConstants.contains ``Filling.RHPositivityRun78.canonical_label_frame_unique do
    Lean.throwError "Label bridge did not consume canonical uniqueness"
  if v.getUsedConstants.contains ``Filling.IsLabelledTerm.eq_of_frameImage_eq then
    Lean.throwError "Label bridge retained old uniqueness"
  Lean.logInfo "RUN80_LABEL_FUSED: both local supplier guards accepted"
#print axioms Filling.RHPositivityRun78.canonical_label_frame_unique
#print axioms Filling.RHPositivityRun78.labelled_frame_unique

set_option Elab.async false in
run_cmd do
  let substitutions : Array (Lean.Name × Lean.Name) := #[
    (``Filling.tsum_invPowWeight_le_of_codim_le, `Filling.b2_fused_tsum_invPowWeight_le_of_codim_le),
    (``Filling.b2_active_outer_frameValueIndex_dvd, `Filling.b2_fused_outer_frameValueIndex_dvd),
    (``Filling.b2_active_outer_count, `Filling.b2_fused_outer_count),
    (``Filling.b2_active_inner_frameValueIndex_dvd, `Filling.b2_fused_inner_frameValueIndex_dvd),
    (``Filling.b2_active_sum_pairWeight_le, `Filling.b2_fused_sum_pairWeight_le),
    (``Filling.b2_active_energy_le_of_level_pairs, `Filling.b2_fused_energy_le_of_level_pairs),
    (``Filling.b2_active_energy_le_of_level_lt, `Filling.b2_fused_energy_le_of_level_lt),
    (``Filling.b2_active_energy_le_of_linkEnergy_le, `Filling.b2_fused_energy_le_of_linkEnergy_le) ]
  -- Compare the new count before using it in any transported proof.
  let originalCount ← Lean.getConstInfo ``Filling.tsum_invPowWeight_le_of_codim_le
  let replacementCount ← Lean.getConstInfo ``Filling.b2_fused_tsum_invPowWeight_le_of_codim_le
  unless (← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq originalCount.type replacementCount.type) do
    Lean.throwError "Fused count changed its original statement type"
  for (old, replacement) in substitutions.toList.drop 1 do
    let .thmInfo info ← Lean.getConstInfo old |
      Lean.throwError "Transport source is not a checked theorem"
    let proof := info.value.replace fun expression =>
      match expression with
      | .const name levels =>
        match substitutions.find? (fun pair => pair.1 == name) with
        | some (_, target) => some (.const target levels)
        | none => none
      | _ => none
    -- Lean.addDecl invokes the ordinary kernel checker. Do not replace this
    -- with Environment.add/unchecked insertion or enable skipKernelTC.
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := replacement
      levelParams := info.levelParams
      type := info.type
      value := proof
    })
    let some value := (← Lean.getConstInfo replacement).value? (allowOpaque := true) |
      Lean.throwError "Missing newly checked proof value"
    let dependencies := value.getUsedConstants
    for (forbidden, _) in substitutions do
      if dependencies.contains forbidden then
        Lean.throwError "A transported proof retained an old supplier"
  let comparisons : Array (Lean.Name × Lean.Name) := #[
    (``Filling.tsum_invPowWeight_le_of_codim_le, `Filling.b2_fused_tsum_invPowWeight_le_of_codim_le),
    (``Filling.sum_pairWeight_le, `Filling.b2_fused_sum_pairWeight_le),
    (``Filling.energy_le_of_level_pairs, `Filling.b2_fused_energy_le_of_level_pairs),
    (``Filling.energy_le_of_level_lt, `Filling.b2_fused_energy_le_of_level_lt),
    (``Filling.energy_le_of_linkEnergy_le, `Filling.b2_fused_energy_le_of_linkEnergy_le) ]
  for (old, replacement) in comparisons do
    let original ← Lean.getConstInfo old
    let candidate ← Lean.getConstInfo replacement
    unless (← Lean.Elab.Command.liftTermElabM do
        Lean.Meta.isDefEq original.type candidate.type) do
      Lean.throwError "Fused caller changed its original statement type"
  let required : Array (Lean.Name × Lean.Name) := #[
    (`Filling.b2_fused_outer_count, `Filling.b2_fused_tsum_invPowWeight_le_of_codim_le),
    (`Filling.b2_fused_sum_pairWeight_le, `Filling.b2_fused_tsum_invPowWeight_le_of_codim_le),
    (`Filling.b2_fused_sum_pairWeight_le, `Filling.b2_fused_outer_frameValueIndex_dvd),
    (`Filling.b2_fused_sum_pairWeight_le, `Filling.b2_fused_inner_frameValueIndex_dvd),
    (`Filling.b2_fused_energy_le_of_level_pairs, `Filling.b2_fused_sum_pairWeight_le),
    (`Filling.b2_fused_energy_le_of_level_lt, `Filling.b2_fused_energy_le_of_level_pairs),
    (`Filling.b2_fused_energy_le_of_linkEnergy_le, `Filling.b2_fused_energy_le_of_level_pairs),
    (`Filling.b2_fused_energy_le_of_linkEnergy_le, `Filling.b2_fused_energy_le_of_level_lt)]
  for (caller, supplier) in required do
    let some proof := (← Lean.getConstInfo caller).value? (allowOpaque := true) |
      Lean.throwError "Missing fused caller proof"
    unless proof.getUsedConstants.contains supplier do
      Lean.throwError "Fused caller did not consume its required supplier"
  Lean.logInfo "B2_FUSED: five original statement types match; checked proof retargeting and direct supplier guards passed"

#print axioms RHB2Fusion.skew_correction_mul
#print axioms Filling.b2_fused_tsum_invPowWeight_le_of_codim_le
#print axioms Filling.b2_fused_outer_frameValueIndex_dvd
#print axioms Filling.b2_fused_outer_count
#print axioms Filling.b2_fused_inner_frameValueIndex_dvd
#print axioms Filling.b2_fused_sum_pairWeight_le
#print axioms Filling.b2_fused_energy_le_of_level_pairs
#print axioms Filling.b2_fused_energy_le_of_level_lt
#print axioms Filling.b2_fused_energy_le_of_linkEnergy_le
