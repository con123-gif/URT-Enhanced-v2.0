import New.Rows.RealMatching
import Mathlib.Tactic

/-! The standard and empty-space specialization of the existing real matching.
Explicit model types prevent a blockSigns abbreviation from leaking through
the implicit-transparency boundary in the actual determinant consumer.
This is a proposed typed interface until its kernel replay has completed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Fintype Matrix Space

variable {E n : Type} [Field E] [NumberField E] [Fintype n]
    (ι : NumberField.InfinitePlace E → Type) [∀ τ, Fintype (ι τ)]

lemma c2_real_matching_standard :
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
  simpa only [posFockVector, Fintype.card_empty, Nat.cast_zero, zero_sub] using!
    (real_matching (E := E) (Equiv.sumEmpty Empty Empty) (Equiv.sumEmpty n Empty)
      (Equiv.emptySum Empty n) (ι := ι) rfl)

lemma c2_real_determinant_invariant
    (η : ∀ τ, ι τ → Matrix Empty n ℂ) :
    ∀ u : GInf E (1 : n → ℤˣ),
      realPairWeil (s := (1 : n → ℤˣ)) (s' := (1 : n → ℤˣ))
        (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, u)
        (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ)))
          (renameRowsCols id ((Equiv.sumEmpty n Empty) ∘ Sum.inl)
            (stackedDetProd (Equiv.emptySum Empty n) η))) =
        polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ)))
          (renameRowsCols id ((Equiv.sumEmpty n Empty) ∘ Sum.inl)
            (stackedDetProd (Equiv.emptySum Empty n) η)) := by
  simpa [posFockVector, -Prod.forall] using!
    (realPairWeil_stackedDetProd (E := E) (Equiv.sumEmpty n Empty)
      (Equiv.emptySum Empty n) (ι := ι) rfl η 1)

#print axioms c2_real_matching_standard
#print axioms c2_real_determinant_invariant

run_cmd do
  let env ← Lean.getEnv
  for forbidden in #[`exchange_theorem, `exchange_of_partners, `explicit_matching,
                       `stdClassSum_det_modKernel_eq] do
    if env.contains forbidden then
      Lean.throwError "Typed real interface imports an original general target"
  for (candidate, supplier) in
      #[(``c2_real_matching_standard, ``real_matching),
        (``c2_real_determinant_invariant, ``realPairWeil_stackedDetProd)] do
    let info ← Lean.getConstInfo candidate
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "Missing typed real-matching proof"
    unless value.getUsedConstants.contains supplier do
      Lean.throwError "Typed real interface misses its original real supplier"
    for forbidden in #[`exchange_theorem, `exchange_of_partners, `explicit_matching,
                         `stdClassSum_det_modKernel_eq] do
      if value.getUsedConstants.contains forbidden then
        Lean.throwError "Typed real interface calls original general target"
  Lean.logInfo "C2_REAL_STANDARD: original real matching and determinant invariance specialized at explicit models"
