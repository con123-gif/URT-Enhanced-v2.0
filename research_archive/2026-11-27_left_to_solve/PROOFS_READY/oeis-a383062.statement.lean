import Mathlib

/-!
OEIS A383062, conjecture by Paolo Xausa (2025).
Sources: https://oeis.org/A383062 and https://oeis.org/A383059.
The source is NONNEGATIVE and starts with zero. There are no forbidden
single digits. The connector integers2*10^(j+1) establish infinite
extendibility after every finite admissible prefix.
`digitStep` reads the two decimal digits from left to right. The first
number has no previous-digit constraint; the chosen seed below has the
same unrestricted behavior on every admissible initial integer.
The greedy recursion uses precisely the source's least-unused rule.
The zero-based function a represents source term n+1. For integer zero,
empty Nat.digits with headD0 gives the same boundary digit and vacuous
internal condition as the usual one-digit representation of zero.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/

namespace OMA.S_oeis_a383062

def digitStep (d e : ℕ) : Prop := e % 2 = 1 → d < e

def admissible (n : ℕ) : Prop :=
  ((Nat.digits 10 n).reverse).IsChain digitStep

def firstDigit (n : ℕ) : ℕ := (Nat.digits 10 n).reverse.headD 0

def lastDigit (n : ℕ) : ℕ := (Nat.digits 10 n).headD 0

def follows (n m : ℕ) : Prop := digitStep (lastDigit n) (firstDigit m)

noncomputable def next (used : Finset ℕ) (previous : ℕ) : ℕ :=
  sInf {m : ℕ | admissible m ∧ m ∉ used ∧ follows previous m}

noncomputable def state : ℕ → Finset ℕ × ℕ
  | 0 => (∅, 0)
  | n + 1 =>
    let m := next (state n).1 (state n).2
    (insert m (state n).1, m)

noncomputable def a (n : ℕ) : ℕ := next (state n).1 (state n).2

theorem main : Function.Injective a ∧
    ∀ m : ℕ, (∃ n : ℕ, a n = m) ↔ admissible m := by
  sorry

end OMA.S_oeis_a383062
