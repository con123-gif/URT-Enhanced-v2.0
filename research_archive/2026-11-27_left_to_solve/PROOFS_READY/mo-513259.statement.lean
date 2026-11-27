import Mathlib

/-!
Source: joro, MathOverflow question 513259, July 15, 2026.
https://mathoverflow.net/questions/513259
Original question text: CC BY-SA 4.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT
(GPT-6 Codex; the exact model variant is not exposed in this interface).

These are the two explicitly named conjectures for simple graph adjacency
matrices. A matrix is invertible modulo the modulus precisely when its
determinant is a unit in the corresponding ZMod ring. Matrix's usual inverse
then is its unique two-sided modular inverse. Entries remain zero or one, the
matrix is symmetric, and its diagonal is zero, exactly as in the source.
The empty graph is allowed and gives the trivial identities 1=1 and 0=0.

The source's final tentative extension to arbitrary even diagonal is distinct
from these graph conjectures and is not silently substituted for them.
Both optional extensions admit small counterexamples, which can accompany a
proof of the two graph assertions without counting as additional problems.
-/

namespace OMA.S_mo_513259

def IsGraphMatrix {n modulus : ℕ}
    (A : Matrix (Fin n) (Fin n) (ZMod modulus)) : Prop :=
  A.IsSymm ∧ (∀ i, A i i = 0) ∧ ∀ i j, A i j = 0 ∨ A i j = 1

theorem main :
    (∀ n : ℕ, ∀ A : Matrix (Fin n) (Fin n) (ZMod 8),
      IsGraphMatrix A → IsUnit A.det → (A⁻¹).permanent = 1) ∧
    (∀ n : ℕ, ∀ A : Matrix (Fin n) (Fin n) (ZMod 24),
      IsGraphMatrix A → IsUnit A.det →
      2 * A.permanent + (A⁻¹).permanent - 3 = 0) := by
  sorry

end OMA.S_mo_513259
