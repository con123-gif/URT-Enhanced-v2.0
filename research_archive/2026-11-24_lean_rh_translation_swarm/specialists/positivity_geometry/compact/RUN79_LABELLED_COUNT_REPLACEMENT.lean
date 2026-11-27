import New.Filling.BlockBound
import Mathlib.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000

/-!
# RUN79 — actual labelled uniqueness substitution at the weighted-count caller
27 November 2026. PREPARED / source-matched, not native-verified.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original BlockBound blob 6c68e80e3b1ea2b7983696716305493a37f2b1fd; VolumeKernel blob
fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0; NearTerms
bd8a969f8d1bda48ca0468c28a8a62bc78e280ce.
RUN78 bridge b6d6dce7e31225ae44e6fc44577b1147abfd34f3, commit 584ce30e11abdcdee841d2f26651bb5421cddc4b.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7;
live spine f62d03bdcd987268e70657298702a238335fb3e6;
live ledger b24ae883acc131f657241e944d523013ac5432a9;
read AGENTS, protocol, queue, expansion, continuity and active B2 caller work.

Source-visible root path: enough_forms -> ramifiedColumns_fill_rows ->
Fits.exists_translate_finrank_comap_le -> energy_fixingSet_le ->
energy_le_of_linkEnergy_le -> energy_le_of_level_pairs ->
sum_pairWeight_le -> tsum_invPowWeight_le_of_codim_le.
At the actual final colour fibre, the two left corrections lie in
classUnip₀(c), and their corrected frame images agree. The common
finite label is supplied separately by each IsLabelledTerm witness.
The canonical out conditions are h.1.1.2 and h'.1.1.2. The new
lemma does not use nearness or level once these witnesses are given.
It retains admissibility, both reductions, and the common label.
This is local premise weakening, not removal of near/level from the
full count: those conditions remain necessary to derive the
middle-row and integral skew corrections. Quotient equality alone
cannot imply equality of reductions: the second component is essential.

Original local graph: count -> old IsLabelledTerm.eq_of_frameImage_eq
-> termsOver.eq_and_mem_classUnip₀ + quotient decomposition + canonical out.
Candidate local graph: count replacement -> labelled_frame_unique ->
canonical_label_frame_unique -> same retained primitives. All other
original count proof steps are copied verbatim, including rank, class,
lattice, norm, integrality and scale conditions. The whole original
source is pinned and preserved; no claim of transitive deletion before
a constructor-inclusive graph replay. Cache key: pin, S, j, c, t, A,
T, n, same frame and both canonical representative witnesses.

The actual complete count theorem below has the same statement as
the original. Only its name and final uniqueness invocation differ.
Static preparation actually executed: fetched both exact blobs,
selected original count declaration, checked unique anchor, substituted
it once, reversed name+call substitution and recovered original text
byte-for-byte. RUN78 helper body reused unchanged; its local simp
environment restored from VolumeKernel. The count section also restores
the actual BlockBound local simp environment.
The existing peer reversible skew/count patch (blob
4c942de0145e223298b3441b6c814a23ae946434) substitutes the different
local k algebra, not this label supplier. Do not duplicate that
job or assume the two substitutions jointly replayed.

Active repair input manifest 9e7fa94c2b21c368dcc87ddb454581948ccf5c6e, Actions run 45998845682:
pick completed; run (rh-compact-b2-energy-repair-20261127) in progress
when inspected; status.json not published (404). No new PASS.
Previous full pair attempt 45994173721 ERROR, inner divisor accepted,
outer bridge layout error. Previous eight-helper run 45986308748 PASS
for those helpers only, six ORIGINAL axiom probes separate.
Old-pin engine CI 45577239749 and 45576756833 remain historical
baseline only. Lean/lake/elan absent in current execution PATH;
no new native commands executed. No new rh_prune/rh_scan/rh_reduce/
rh_auto/rh_auto_frontier result, no URT comparison. This file is a
prepared original-statement replacement and dependency guard.

Replay using EXISTING built compact workspace/cache, not a new cold build:
lake env lean --tstack=400000 /absolute/path/RUN79_LABELLED_COUNT_REPLACEMENT.lean
Require exit zero, standard axiom subset only (propext, Classical.choice,
Quot.sound), exact-type guards and both direct dependencies below.
Inspect actual log; if fails preserve it and repair first error.
Neither a checked helper nor a checked count would close full B2 or RH.

RESUME HERE: after active shared repair receipt, compile this exact
new count file from its retained native cache; preserve stdout and
exit code; check all three named axioms and both direct-dependency
guards before any caller integration. Do not rerun the eight-helper
batch. No full root claim; remaining B1-B4, A, C and analytic
root obligations retained in LIVE_OBLIGATIONS.
HANDOFF TO integration/editor/native audit.
-/

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

section CountCaller

seal Finset.univ Finset.sum Finset.prod

open AddSubgroup Module DoubleCoset ENNReal Fintype MatMul Matrix MeasureTheory Submodule

namespace Filling

variable {E : Type} [Field E] [CMType E] {𝔰 : Shape} {S : Filling E 𝔰}
variable [S.IsAdmissible] {c} {γ : ↥(S.G E)} {j : Fin (𝔰.ϱ + 2)} {A : Set (S.Classes × S.G E)}

open Norms.L2Operator

attribute [-simp] MulMemClass.coe_mul Nat.cast_mul Prod.forall Subgroup.coe_mul sup_of_le_right

attribute [local simp ←] pow_add pow_mul pow_succ'

attribute [local simp] Finset.mul_sum IsIntMatrix Matrix.mul_apply splitGram funext_iff inclMatrix
  mul_assoc mul_pow sub_mul

lemma run79_tsum_invPowWeight_le_of_codim_le [StablyUnram E]
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
  have k : S.g • (σ * P) =
    ξ := by cases ((lt_or_ge 𝔰.ϱ j).imp (by simpa [P, α, Y, ← ext_iff, paddedLeading,
    f, ·.trans'] using (congr(submatrix $Y.mul_adjugate Fin.castSucc Fin.castSucc))) fun J ↦
    Matrix.ext fun a b ↦ sum_of_injective _ Fin.castSuccEmb.2 _ _ (by simp +contextual [z, J.trans])
    fun c ↦ mul_eq_mul_left_iff.2 ((em' _).imp (by simp +contextual [Y, P, paddedLeading, f]) (z a
    _)) : P * α = Y.det • 1 ∨ T * P = X * Y.adjugate * Y) <;> simp [σ, adjugate_mul, *] <;> module
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


end Filling
end CountCaller

#print axioms Filling.RHPositivityRun78.canonical_label_frame_unique
#print axioms Filling.RHPositivityRun78.labelled_frame_unique
#print axioms Filling.run79_tsum_invPowWeight_le_of_codim_le

run_cmd do
  let old ← Lean.getConstInfo ``Filling.tsum_invPowWeight_le_of_codim_le
  let new ← Lean.getConstInfo ``Filling.run79_tsum_invPowWeight_le_of_codim_le
  let same ← Lean.Elab.Command.liftTermElabM do Lean.Meta.isDefEq old.type new.type
  unless same do Lean.throwError "RUN79 full count type mismatch"
  let some body := new.value? | Lean.throwError "RUN79 count has no proof value"
  let deps := body.getUsedConstants
  if deps.contains ``Filling.tsum_invPowWeight_le_of_codim_le then
    Lean.throwError "RUN79 count calls original target"
  if deps.contains ``Filling.IsLabelledTerm.eq_of_frameImage_eq then
    Lean.throwError "RUN79 count retains original uniqueness call"
  unless deps.contains ``Filling.RHPositivityRun78.labelled_frame_unique do
    Lean.throwError "RUN79 count did not consume replacement"
  let bridge ← Lean.getConstInfo ``Filling.RHPositivityRun78.labelled_frame_unique
  let some value := bridge.value? | Lean.throwError "RUN79 bridge has no proof value"
  let bdeps := value.getUsedConstants
  unless bdeps.contains ``Filling.RHPositivityRun78.canonical_label_frame_unique do
    Lean.throwError "RUN79 bridge did not consume weakened lemma"
  if bdeps.contains ``Filling.IsLabelledTerm.eq_of_frameImage_eq then
    Lean.throwError "RUN79 bridge calls old uniqueness"
  Lean.logInfo "RUN79: exact count type and both direct dependency guards accepted"
