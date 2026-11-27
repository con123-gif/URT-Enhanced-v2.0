import Mathlib

/-!
OEIS A181674: partitions of n into a primorial and a semiprime.
Conjecture by Charles R. Greathouse IV, May25,2011:
the average order is Theta(log log n).

Here "average order Theta(log log N)" has its standard summatory meaning:
the total number of these partitions of all positive integers <=N has order
Theta(N*log(log N)).  An unordered two-part partition is recorded by its
nondecreasing pair. Primorial values are counted once (Mathlib's argument
counts primes through a bound), and semiprime factors may be equal. Thus1
is a primorial and4 is a semiprime, as in the source examples.

Source: https://oeis.org/A181674
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.S_oeis_a181674

def IsPrimorial (m : ℕ) : Prop := ∃ t : ℕ, m = primorial t

def IsSemiprime (m : ℕ) : Prop :=
  ∃ p q : ℕ, p.Prime ∧ q.Prime ∧ m = p * q

noncomputable def summatory (N : ℕ) : ℕ := by
  classical
  exact (((Finset.range (N + 1)).product (Finset.range (N + 1))).filter
    fun z => z.1 ≤ z.2 ∧ z.1 + z.2 ≤ N ∧
      ((IsPrimorial z.1 ∧ IsSemiprime z.2) ∨
       (IsSemiprime z.1 ∧ IsPrimorial z.2))).card

def conjecture : Prop :=
  Asymptotics.IsTheta Filter.atTop (fun N : ℕ => (summatory N : ℝ))
    (fun N : ℕ => (N : ℝ) * Real.log (Real.log N))

theorem main : conjecture := by
  sorry

end OMA.S_oeis_a181674
