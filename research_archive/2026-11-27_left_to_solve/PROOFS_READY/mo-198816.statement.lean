import Mathlib

/-!
# Spectral radius after a rank-one perturbation of a stochastic matrix

Source: vansy, MathOverflow question 198816, March 2, 2015.
https://mathoverflow.net/questions/198816
Original question text: CC BY-SA 3.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

"Diagonally dominant" is read in its usual row sense, with non-strict
dominance. Irreducibility uses Mathlib's nonnegative-matrix definition.
The spectral radius of a real matrix is taken over its complexification,
so nonreal eigenvalues are included. The entrywise perturbation below is
exactly P - (P * 1) * w^T, where 1 is the all-ones column vector.
-/

namespace OMA.S_mo_198816

open scoped BigOperators

def perturbation {n : ℕ} (P : Matrix (Fin n) (Fin n) ℝ) (w : Fin n → ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  fun i j => P i j - (∑ k, P i k) * w j

theorem main : ∀ n : ℕ, 0 < n → ∀ P : Matrix (Fin n) (Fin n) ℝ,
    P.IsIrreducible → (∀ j, ∑ i, P i j = 1) →
    (∀ i, ∑ j ∈ Finset.univ.erase i, |P i j| ≤ |P i i|) →
    ∀ w : Fin n → ℝ, (∀ i, 0 < w i) → (∑ i, w i = 1) →
      spectralRadius ℂ ((perturbation P w).map Complex.ofReal) < 1 := by
  sorry

end OMA.S_mo_198816
