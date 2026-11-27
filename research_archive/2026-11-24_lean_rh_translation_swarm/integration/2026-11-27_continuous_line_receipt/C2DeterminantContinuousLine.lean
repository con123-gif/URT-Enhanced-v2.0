import C2DeterminantFixedLine
import C2DeterminantWeilAction
import Mathlib.Tactic

/-! One common coefficient for every invariant continuous Fock functional.
Extend the exact polynomial determinant line through polynomial density and
a closed one-dimensional scalar range. This proposed source is not accepted
until normal-kernel replay; neither general real_matching nor its circular
projection argument is used.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

noncomputable section

open Fintype Matrix MvPolynomial Finset NumberField Space ComplexOrder

variable {E n : Type} [Field E] [NumberField E] [Fintype n]
    (ι : InfinitePlace E → Type) [∀ τ, Fintype (ι τ)]

lemma c2_continuous_determinant_line
    (v : PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ)) :
    ∃ κ : ℂ, ∀ (ℓ : PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ) →L[ℂ] ℂ),
      (∀ u w, ℓ (realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, u) w) = ℓ w) →
      ℓ v = κ * ℓ (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ)))
        (c2_det_poly (n := n) ι)) := by
  classical
  let D : MvPolynomial (InfinitePlace E × n × n) ℂ := c2_det_poly ι
  let vD := polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))) D
  let S := {ℓ : PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ) →L[ℂ] ℂ //
    ∀ u w, ℓ (realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, u) w) = ℓ w}
  have hD : D ≠ 0 := by
    change (∏ τ, letterMinor τ (id : n → n) id ^ card (ι τ)) ≠ 0
    exact Finset.prod_ne_zero_iff.mpr fun τ _ ↦
      pow_ne_zero _ (letterMinor_ne_zero τ id id Function.injective_id Function.injective_id)
  have hstar : MvPolynomial.map (starRingEnd ℂ) D = D := by
    simp [D, c2_det_poly, letterMinor, det_apply]
  have hden : fockPairing ℂ D D ≠ 0 := by
    simpa only [hstar] using (fockPairing_star_self_pos (p := D) hD).ne'
  have H : ∀ w : PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ),
      (fun ℓ : S ↦ ℓ.1 w) ∈ Set.range (fun κ : ℂ ↦ κ • (fun ℓ : S ↦ ℓ.1 vD)) := by
    apply isClosed_property denseRange_polyVector
      ((isClosedMap_smul_left (fun ℓ : S ↦ ℓ.1 vD)).isClosed_range.preimage_of_continuous
        (f := fun w ℓ ↦ ℓ.1 w) (by
          apply continuous_pi
          intro ℓ
          exact ℓ.1.continuous))
    intro P
    use fockPairing ℂ P D / fockPairing ℂ D D
    ext ℓ
    have hp := c2_det_polynomial_line ι
      (ℓ.1.toLinearMap ∘ₗ polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))))
      (fun u Q ↦ c2_weil_polynomial_covariance ι ℓ.1 ℓ.2 u Q) P
    change (fockPairing ℂ P D / fockPairing ℂ D D) * ℓ.1 vD =
      ℓ.1 (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))) P)
    change fockPairing ℂ P D * ℓ.1 vD =
      ℓ.1 (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))) P) *
        fockPairing ℂ D D at hp
    rw [div_mul_eq_mul_div]
    exact (div_eq_iff hden).mpr hp
  obtain ⟨κ, hκ⟩ := H v
  refine ⟨κ, fun ℓ hℓ ↦ ?_⟩
  exact (congrFun hκ (⟨ℓ, hℓ⟩ : S)).symm

#print axioms c2_continuous_determinant_line

run_cmd do
  let declaration ← Lean.getConstInfo ``c2_continuous_determinant_line
  let some value := declaration.value? (allowOpaque := true) |
    Lean.throwError "Missing continuous determinant-line proof"
  for required in #[``c2_det_polynomial_line, ``c2_weil_polynomial_covariance] do
    unless value.getUsedConstants.contains required do
      Lean.throwError "Continuous determinant line lost its exact polynomial/action supplier"
  for forbidden in #[`real_matching, `c2_real_matching_standard, `explicit_matching,
                       `exchange_theorem, `stdClassSum_det_modKernel_eq] do
    if value.getUsedConstants.contains forbidden then
      Lean.throwError "Continuous determinant line calls a general matching target"
  Lean.logInfo "C2_CONTINUOUS_LINE: one common coefficient for all invariant functionals; general matching absent directly"
