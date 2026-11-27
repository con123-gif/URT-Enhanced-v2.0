import Mathlib

/-!
OEIS A383248, conjecture by Paolo Xausa, April 25, 2025.
Sources: https://oeis.org/A383248 and https://oeis.org/A342044.
A342044 starts with zero and then greedily appends the least unused
positive integer whose concatenated digit stream has every odd digit
followed by a larger digit, without creating a dead end. A digit nine
would be a dead end, including a final nine. Conversely every locally
valid term avoiding nine admits an unused repunit of eights as a
continuation. The seed previous zero imposes no initial restriction;
the first minimum is zero, after which its exclusion enforces positive
later terms. Empty `Nat.digits 10 0` has the same internal rule and
boundary digits zero as the source's one-digit representation of zero.
The zero-based function a represents source term n+1.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/

namespace OMA.S_oeis_a383248

def digitStep (d e : ℕ) : Prop := d % 2 = 1 → d < e

def admissible (n : ℕ) : Prop :=
  9 ∉ Nat.digits 10 n ∧
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

end OMA.S_oeis_a383248
