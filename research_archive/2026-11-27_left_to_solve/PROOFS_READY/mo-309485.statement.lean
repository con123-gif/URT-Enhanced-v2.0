import Mathlib

/-!
Source: T. Amdeberhan, MathOverflow question309485, August31,2018.
https://mathoverflow.net/questions/309485
Question and comments licensed CC BY-SA4.0.
Adaptation: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6.
Exact serving variant not exposed.

The question asks whether zero is an eigenvalue of this integer-entry
matrix. Its complete natural-index answer includes the boundary: M0=[3],
while zero is an eigenvalue for every positive n. Thus main gives the
entire classification, without silently discarding n=0 or merely using
that boundary as a counterexample to the positive-index phenomenon.

The binomial with lower index j-i equals zero when j<i. The explicit
guard preserves that convention; natural subtraction alone would not.
Eigenvalues are taken over the complex numbers.

Philipp Lampe proposed a left nullvector for odd n in source comment771010.
MTyson proposed a right nullvector for even n in source comment771562.
These proposals remain explicitly conjectural in the source comments;
they are credited as proposed witnesses, not claimed as our inventions.
-/

namespace OMA.S_mo_309485

def matrix (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ :=
  fun i j =>
    (Nat.choose i.val j.val : ℂ) +
      (if i.val ≤ j.val then
        (Nat.choose (2 * n + 1 - i.val) (j.val - i.val) : ℂ)
      else 0) +
      (Nat.choose (2 * n + 1 - i.val) j.val : ℂ)

theorem main : ∀ n : ℕ,
    Module.End.HasEigenvalue (Matrix.toLin' (matrix n)) (0 : ℂ) ↔ 0 < n := by
  sorry

end OMA.S_mo_309485
