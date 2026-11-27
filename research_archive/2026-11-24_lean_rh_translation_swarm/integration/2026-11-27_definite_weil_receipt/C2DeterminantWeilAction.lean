import New.Rows.RealMatching
import Mathlib.Tactic

/-! The actual definite-square real Weil action at determinant weight.
Prepared native bridge for the direct fixed-line continuation; no claim of
acceptance until its complete local kernel replay. Retain the native Fock
action law, rather than assume polynomial covariance.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

noncomputable section

open Fintype Matrix MvPolynomial Finset NumberField Space

variable {E n : Type} [Field E] [NumberField E] [Fintype n]
    (ι : InfinitePlace E → Type) [∀ τ, Fintype (ι τ)]

lemma c2_definite_weil_polynomial
    (u : GInf E (1 : n → ℤˣ))
    (P : MvPolynomial (InfinitePlace E × n × n) ℂ) :
    realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, u)
      (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))) P) =
      (∏ τ, (u τ).1.1.det ^ card (ι τ))⁻¹ •
        polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ)))
          (aeval (fun (τ, j, k) ↦ ∑ i, (u τ).1.1 i j • X (τ, i, k)) P) := by
  classical
  simpa [Nat.card_eq_fintype_card, ← Finset.prod_inv_distrib] using!
    (realPairWeil_polyVector (γ := fun τ ↦ -(card (ι τ) : ℤ)) (γ' := 0)
      (x := (1 : GInf E (1 : n → ℤˣ))) (y := u)
      (fun _ ↦ by simp [mem_blockDiagAlg]) (fun _ ↦ by simp [mem_blockDiagAlg]) P)

lemma c2_weil_polynomial_covariance
    (ℓ : PairFock E (1 : n → ℤˣ) (1 : n → ℤˣ) →L[ℂ] ℂ)
    (hℓ : ∀ u w, ℓ (realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 (1, u) w) = ℓ w)
    (u : GInf E (1 : n → ℤˣ))
    (P : MvPolynomial (InfinitePlace E × n × n) ℂ) :
    ℓ (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ)))
        (aeval (fun (τ, j, k) ↦ ∑ i, (u τ).1.1 i j • X (τ, i, k)) P)) =
      (∏ τ, (u τ).1.1.det ^ card (ι τ)) *
        ℓ (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))) P) := by
  classical
  have H := hℓ u (polyVector (realSigns E (homSigns (1 : n → ℤˣ) (1 : n → ℤˣ))) P)
  rw [c2_definite_weil_polynomial ι] at H
  simp only [map_smul, RingHom.id_apply, smul_eq_mul] at H
  have hA : (∏ τ, (u τ).1.1.det ^ card (ι τ)) ≠ 0 := by
    exact Finset.prod_ne_zero_iff.mpr fun τ _ ↦ pow_ne_zero _ (u τ).1.det_ne_zero
  exact (inv_mul_eq_iff_eq_mul₀ hA).mp H

#print axioms c2_definite_weil_polynomial
#print axioms c2_weil_polynomial_covariance

run_cmd do
  for name in #[``c2_definite_weil_polynomial, ``c2_weil_polynomial_covariance] do
    let declaration ← Lean.getConstInfo name
    let some value := declaration.value? (allowOpaque := true) |
      Lean.throwError "Missing definite Weil proof"
    for forbidden in #[`real_matching, `explicit_matching, `exchange_theorem,
                         `stdClassSum_det_modKernel_eq] do
      if value.getUsedConstants.contains forbidden then
        Lean.throwError "Definite Weil bridge retained a general matching target"
  Lean.logInfo "C2_DEFINITE_WEIL: exact action and covariance; general real matching absent directly"
