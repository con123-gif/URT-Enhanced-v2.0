import Mathlib

/-!
OEIS A383246, conjecture by Paolo Xausa, April 20, 2025.
Source: https://oeis.org/A383246 and https://oeis.org/A342043.
A342043 greedily appends the least unused positive integer whose decimal
digits, including the boundary with the previous term, satisfy "an even
digit is followed by a smaller digit", without creating a dead end.
A zero digit would create a dead end, including a final zero. Thus the
eligible individual terms are exactly `admissible` below. Repunits give
continuations after every admissible term, so this local eligibility test
also suffices for infinite extendibility. The seed previous term is 1,
whose odd final digit imposes no initial restriction. The function `a`
is indexed from zero, with a(0) representing the source's first term 1.
The conjecture says that its range is precisely A383246's defining set;
injectivity records the source's no-repetition convention.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/

namespace OMA.S_oeis_a383246

def digitStep (d e : ℕ) : Prop := d % 2 = 0 → e < d

def admissible (n : ℕ) : Prop :=
  0 < n ∧ 0 ∉ Nat.digits 10 n ∧
    ((Nat.digits 10 n).reverse).IsChain digitStep

def firstDigit (n : ℕ) : ℕ := (Nat.digits 10 n).reverse.headD 0

def lastDigit (n : ℕ) : ℕ := (Nat.digits 10 n).headD 0

def follows (n m : ℕ) : Prop := digitStep (lastDigit n) (firstDigit m)

noncomputable def next (used : Finset ℕ) (previous : ℕ) : ℕ :=
  sInf {m : ℕ | admissible m ∧ m ∉ used ∧ follows previous m}

noncomputable def state : ℕ → Finset ℕ × ℕ
  | 0 => (∅, 1)
  | n + 1 =>
    let m := next (state n).1 (state n).2
    (insert m (state n).1, m)

noncomputable def a (n : ℕ) : ℕ := next (state n).1 (state n).2

theorem main : Function.Injective a ∧
    ∀ m : ℕ, (∃ n : ℕ, a n = m) ↔ admissible m := by
  sorry

end OMA.S_oeis_a383246
