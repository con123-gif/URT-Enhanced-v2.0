import C2DeterminantContinuousLine
import C2RealMatchingStandard
import Mathlib.Tactic

/-! Complete canonical empty-space real matching from the direct determinant
line. The general real_matching proof is used only as an original type to
compare against, never as a proof supplier. Proposed until kernel replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

noncomputable section

open Fintype Matrix MvPolynomial Finset NumberField Space

variable {E n : Type} [Field E] [NumberField E] [Fintype n]
    (ι : InfinitePlace E → Type) [∀ τ, Fintype (ι τ)]

lemma c2_empty_stacked_determinant
    (η : ∀ τ, ι τ → Matrix Empty n ℂ) :
    renameRowsCols id ((Equiv.sumEmpty n Empty) ∘ Sum.inl)
      (stackedDetProd (Equiv.emptySum Empty n) η) = c2_det_poly (n := n) ι := by
  classical
  have hs τ k : stackedDet τ (η τ k) (Equiv.emptySum Empty n) = letterMinor τ id id := by
    unfold stackedDet letterMinor
    rw [← det_reindex_self (Equiv.emptySum Empty n).symm]
    congr 1
    funext i j
    cases i with
    | inl i => cases i
    | inr i =>
      cases j with
      | inl j => cases j
      | inr j => rfl
  change (MvPolynomial.rename id) (stackedDetProd (Equiv.emptySum Empty n) η) =
    c2_det_poly (n := n) ι
  simp [stackedDetProd, hs, c2_det_poly]

lemma c2_empty_matched_polynomial
    (η : ∀ τ, ι τ → Matrix Empty n ℂ) :
    matchedPoly (ι := ι) (Equiv.sumEmpty Empty Empty) (Equiv.sumEmpty n Empty) η = 1 := by
  classical
  simp [matchedPoly, pairedDetProd, letterMinor]

lemma c2_direct_real_matching :
    ∃ Q₀ : MvPolynomial (NumberField.InfinitePlace E × n × Empty) ℂ,
      ∀ v : PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ), ∃ κ : ℂ,
      ∀ (ℓ : GInf E (1 : n → ℤˣ) →
          PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ) →L[ℂ] ℂ)
        (ℓ' : MvPolynomial (NumberField.InfinitePlace E × n × Empty) ℂ →ₗ[ℂ] ℂ),
        (∀ g x w, ℓ g (realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 x w) =
          ℓ (g * x.1) w) →
        (∀ x Q, realPairWeil (s := (1 : Empty → ℤˣ)) (s' := (1 : n → ℤˣ))
            (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, x)
            (polyVector (realSigns E (homSigns (1 : Empty → ℤˣ) (1 : n → ℤˣ))) Q₀) =
            polyVector (realSigns E (homSigns (1 : Empty → ℤˣ) (1 : n → ℤˣ))) Q →
          ℓ x v = ℓ' Q) →
        ∀ η, κ * ℓ 1
          (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ)))
            (renameRowsCols id ((Equiv.sumEmpty n Empty) ∘ Sum.inl)
              (stackedDetProd (Equiv.emptySum Empty n) η))) =
          ℓ' (matchedPoly (ι := ι) (Equiv.sumEmpty Empty Empty) (Equiv.sumEmpty n Empty) η) := by
  refine ⟨1, fun v ↦ ?_⟩
  obtain ⟨κ, hκ⟩ := c2_continuous_determinant_line ι v
  refine ⟨κ, fun ℓ ℓ' hℓ hQ η ↦ ?_⟩
  have hinv : ∀ u w, ℓ 1 (realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, u) w) = ℓ 1 w := by
    intro u w
    simpa using hℓ 1 (1, u) w
  have hline := hκ (ℓ 1) hinv
  have hbase : ℓ 1 v = ℓ' 1 := hQ 1 1 (by simp)
  rw [c2_empty_stacked_determinant ι η, c2_empty_matched_polynomial ι η]
  exact hline.symm.trans hbase

#print axioms c2_empty_stacked_determinant
#print axioms c2_empty_matched_polynomial
#print axioms c2_direct_real_matching

run_cmd do
  let old ← Lean.getConstInfo ``c2_real_matching_standard
  let new ← Lean.getConstInfo ``c2_direct_real_matching
  unless old.levelParams == new.levelParams do
    Lean.throwError "Direct real matching universe parameters changed"
  let same ← Lean.Elab.Command.liftTermElabM do Lean.Meta.isDefEq old.type new.type
  unless same do Lean.throwError "Direct real matching changed the complete canonical statement"
  let some value := new.value? (allowOpaque := true) |
    Lean.throwError "Missing direct real matching proof"
  for required in #[``c2_continuous_determinant_line, ``c2_empty_stacked_determinant,
                      ``c2_empty_matched_polynomial] do
    unless value.getUsedConstants.contains required do
      Lean.throwError "Direct real matching lost a checked line/model supplier"
  for forbidden in #[`real_matching, `c2_real_matching_standard, `explicit_matching,
                       `exchange_theorem, `stdClassSum_det_modKernel_eq] do
    if value.getUsedConstants.contains forbidden then
      Lean.throwError "Direct real matching calls a general matching target"
  Lean.logInfo "C2_DIRECT_REAL: entire canonical statement preserved; direct determinant line replaces general real matching"
