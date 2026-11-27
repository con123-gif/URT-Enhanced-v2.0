import Mathlib

/-!
OEIS A385478, Felix Huber (2025).
Contribution: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
Model: GPT-6 (exact serving variant not exposed by this runtime).
The selected conjecture says that every divisor of sigma(n) appearing for
the first time at index n is a multiple of the smallest such divisor.
The finite set below implements exactly the set difference in A385467.
Source audit: complete official OEIS mirror revision 7 and related entries
read; interactive history and b-file returned HTTP 403 and remain unread.
No worldwide priority claim is made.
-/

namespace OMA.S_oeis_a385478

/-- Sum of all positive divisors. -/
def sigma (n : ℕ) : ℕ := ∑ d ∈ n.divisors, d

/-- Divisors of sigma(n) absent from all earlier positive indices. -/
noncomputable def freshDivisors (n : ℕ) : Finset ℕ := by
  classical
  exact (sigma n).divisors.filter fun d =>
    ∀ k ∈ Finset.Ico 1 n, ¬ d ∣ sigma k

/-- A385478(n), with the source's zero convention for an empty set. -/
noncomputable def term (n : ℕ) : ℕ := by
  classical
  exact if h : (freshDivisors n).Nonempty then (freshDivisors n).min' h else 0

theorem main :
    ∀ n : ℕ, 0 < n → ∀ d ∈ freshDivisors n, term n ∣ d := by
  sorry

end OMA.S_oeis_a385478
