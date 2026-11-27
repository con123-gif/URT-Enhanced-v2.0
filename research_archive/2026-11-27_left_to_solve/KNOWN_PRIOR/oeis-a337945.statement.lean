import Mathlib

/-!
OEIS A337945, offset one. Peter Luschny's June8,2023 conjecture.
Source: https://oeis.org/A337945/internal
The source explicitly restates its generalized-Clausen formulation:
a positive integer belongs to the sequence iff it is not odd squarefree.
The existential condition below is the literal source definition, including
all bounds on s,t,k. Equality s=t is permitted. Zero is outside the source
positive-integer domain. Source sequence: Wesley Ivan Hurt.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a337945

def represented (m : ℕ) : Prop :=
  ∃ s t k : ℕ, 1 ≤ s ∧ s ≤ t ∧ 1 ≤ k ∧ k ≤ m - 1 ∧
    s + t = m ∧ s ^ 2 + t ^ 2 = k * m

theorem main : ∀ m : ℕ, 0 < m →
    (represented m ↔ ¬ (Odd m ∧ Squarefree m)) := by
  sorry

end OMA.S_oeis_a337945
