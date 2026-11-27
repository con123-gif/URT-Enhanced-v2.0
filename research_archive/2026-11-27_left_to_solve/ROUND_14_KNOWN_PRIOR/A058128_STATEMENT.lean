import Mathlib

/-!
OEIS A058128, offset one: a(1)=1, a(n)=(n^n-n)/(n-1)^2 for n>=2.
Source: https://oeis.org/A058128/internal
Davide Rotondo's November6,2024 conjecture is for even source indices,
thus n>=2. Weak Fermat pseudoprime has its usual composite convention
b^m = b modulo m; it does not require the base coprime to m.
This is distinct from Mathlib's stronger Nat.FermatPsp predicate.
The closed form and sequence are prior mathematics of Dennis P. Walsh.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a058128

def a (n : ℕ) : ℕ := if n = 1 then 1 else (n ^ n - n) / (n - 1) ^ 2

def WeakFermatPseudoprime (m b : ℕ) : Prop :=
  1 < m ∧ ¬ m.Prime ∧ b ^ m ≡ b [MOD m]

theorem main : ∀ n : ℕ, 1 ≤ n → Even n →
    (a n).Prime ∨ WeakFermatPseudoprime (a n) n := by
  sorry

end OMA.S_oeis_a058128
