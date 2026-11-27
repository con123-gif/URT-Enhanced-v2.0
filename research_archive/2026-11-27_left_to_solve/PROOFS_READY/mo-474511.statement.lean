import Mathlib

/-!
# Approximation of an unbounded asymptotically commuting curve

Source: Ayman Moussa, MathOverflow question 474511, July 5, 2024.
https://mathoverflow.net/questions/474511
Original question text: CC BY-SA 4.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

The source's nonnegative real time domain is represented by NNReal. The
commutator tends to zero jointly as both times tend to infinity. Matrix
convergence is in the usual finite-dimensional topology. The matrix size
is fixed for each curve, with no boundedness assumption on that curve.
-/

namespace OMA.S_mo_474511

open Filter Topology
open scoped NNReal

/-- Joint asymptotic commutation on the nonnegative real time domain. -/
def asymptoticallyCommutes {n : ℕ}
    (A : ℝ≥0 → Matrix (Fin n) (Fin n) ℝ) : Prop :=
  Tendsto (fun p : ℝ≥0 × ℝ≥0 => A p.1 * A p.2 - A p.2 * A p.1)
    (atTop ×ˢ atTop) (𝓝 0)

theorem main : ∀ n : ℕ, ∀ A : ℝ≥0 → Matrix (Fin n) (Fin n) ℝ,
    Continuous A → asymptoticallyCommutes A →
    ∃ B : ℝ≥0 → Matrix (Fin n) (Fin n) ℝ,
      Continuous B ∧ (∀ t s, B t * B s = B s * B t) ∧
      Tendsto (fun t => A t - B t) atTop (𝓝 0) := by
  sorry

end OMA.S_mo_474511
