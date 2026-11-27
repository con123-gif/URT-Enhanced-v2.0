import Mathlib

/-!
OEIS A390583, Charles L. Hohn (2025).
Source: https://oeis.org/A390583.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.

The source explicitly defines the primitive positive radius quadruples by
Descartes' displayed equation. Ordered radii with the largest two equal
are (x,y,R,R), with 0<x<=y<=R. Primitivity is gcd(x,y,R)=1,
equivalently Nat.Coprime (Nat.gcd x y) R. Because x<=y, the
source's absolute difference is the natural difference y-x.
The conjecture about chains in a separate comment is not this catalogue target.
-/

namespace OMA.S_oeis_a390583

def descartes (x y z w : ℕ) : Prop :=
  (1 / (x : ℚ) + 1 / (y : ℚ) + 1 / (z : ℚ) + 1 / (w : ℚ)) ^ 2 =
    2 * ((1 / (x : ℚ)) ^ 2 + (1 / (y : ℚ)) ^ 2 +
      (1 / (z : ℚ)) ^ 2 + (1 / (w : ℚ)) ^ 2)

theorem main : ∀ x y R : ℕ, 0 < x → x ≤ y → y ≤ R →
    Nat.Coprime (Nat.gcd x y) R → descartes x y R R →
    ∃ k : ℕ, y - x = k ^ 3 ∨ y - x = 2 * k ^ 3 := by
  sorry

end OMA.S_oeis_a390583
