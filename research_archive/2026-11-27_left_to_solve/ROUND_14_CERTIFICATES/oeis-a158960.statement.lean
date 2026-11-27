import Mathlib

/-!
OEIS A158960: denominator of the physicists' Hermite polynomial H_n at 1/5.
Source: https://oeis.org/A158960
M. F. Hasler, February 16, 2014, conjectured that the reduced denominator is 5^n.
The source uses physicists' Hermite polynomials (DLMF Table 18.9.1),
H_0(x)=1, H_1(x)=2x, H_(n+2)(x)=2x H_(n+1)(x)-2(n+1)H_n(x).
Mathlib's Polynomial.hermite is the probabilists' normalization. The
rational recurrence here evaluates the source's physicists' normalization
at x=1/5, reproducing 1,2/5,-46/25,-292/125,... . The index starts at zero.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/

namespace OMA.S_oeis_a158960

def hermiteAtOneFifth : ℕ → ℚ
  | 0 => 1
  | 1 => 2 / 5
  | n + 2 => (2 / 5) * hermiteAtOneFifth (n + 1) -
      2 * (n + 1) * hermiteAtOneFifth n

theorem main : ∀ n : ℕ, (hermiteAtOneFifth n).den = 5 ^ n := by
  sorry

end OMA.S_oeis_a158960
