import New.Rows.RealMatching
import Mathlib.Tactic

/-! Direct definite-square determinant line, without the general real_matching
theorem. Proposed native continuation of the archived rank-zero argument.
The polynomial step retains the native Fischer polarisation supplier.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

noncomputable section

open Fintype Matrix MvPolynomial Finset NumberField Space ComplexOrder

variable {E n : Type} [Field E] [NumberField E] [Fintype n]
    (ι : InfinitePlace E → Type) [∀ τ, Fintype (ι τ)]

def c2_det_poly : MvPolynomial (InfinitePlace E × n × n) ℂ :=
  ∏ τ, letterMinor τ id id ^ card (ι τ)

lemma c2_det_polynomial_line
    (M : MvPolynomial (InfinitePlace E × n × n) ℂ →ₗ[ℂ] ℂ)
    (h : ∀ u : InfinitePlace E → USign (1 : n → ℤˣ), ∀ P,
      M (aeval (fun (τ, j, k) ↦ ∑ i, (u τ).1.1 i j • X (τ, i, k)) P) =
        (∏ τ, (u τ).1.1.det ^ card (ι τ)) * M P)
    (P : MvPolynomial (InfinitePlace E × n × n) ℂ) :
    fockPairing ℂ P (c2_det_poly (n := n) ι) * M (c2_det_poly (n := n) ι) =
      M P * fockPairing ℂ (c2_det_poly (n := n) ι) (c2_det_poly (n := n) ι) := by
  have H := fockPairing_polarisation
    (Y := fun τ i k ↦ (X (τ, i, k) : MvPolynomial (InfinitePlace E × n × n) ℂ))
    (η := fun τ (_ : ι τ) ↦ (1 : Matrix n n ℂ)) M (r := id) P
    ((M P) • c2_det_poly (n := n) ι) (fun u ↦ by
      simpa [c2_det_poly, letterMinor, map_det, mul_comm] using h u P)
  simpa [c2_det_poly, pairedDetProd, letterMinor, ← C_mul', mul_comm] using H

#print axioms c2_det_polynomial_line

run_cmd do
  let declaration ← Lean.getConstInfo ``c2_det_polynomial_line
  let some value := declaration.value? (allowOpaque := true) |
    Lean.throwError "Fixed-line polynomial proof body missing"
  unless value.getUsedConstants.contains ``fockPairing_polarisation do
    Lean.throwError "Fixed-line polynomial proof lost its retained Fischer supplier"
  for forbidden in #[`real_matching, `explicit_matching, `exchange_theorem,
                       `stdClassSum_det_modKernel_eq] do
    if value.getUsedConstants.contains forbidden then
      Lean.throwError "Fixed-line polynomial proof retained the general matching target"
  Lean.logInfo "C2_FIXED_LINE: direct polynomial determinant line; general real matching absent directly"
