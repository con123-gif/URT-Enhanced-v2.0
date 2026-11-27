import Mathlib

/-!
OEIS A381423, Mike Sheppard (2025), full signed Hermite mode characterization.
Source: https://oeis.org/A381423 ; coefficient normalization DLMF18.5.13.
All orders include zero; coefficients are compared with their signs.
The independent 1 or -3 difference assertion was previously proved by the
TrureTuring project. The target here retains that fact and addresses the
source's remaining fine blocks, spacing, growth and signed uniqueness.
The original informal spacing sentence is made precise by an exact formula
for EVERY negative-jump index, linear runs inside each slab, and a period8
quadratic law for the five-block endpoints. The explicit closed mode formula
is stronger than the source's growth observation. No bounded cutoff is used.
The sequence itself is the least signed maximizer of the actual physicists
Hermite polynomial, not a formula substituted without a source bridge.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.S_oeis_a381423

def signedCoeff (n j : ℕ) : ℚ :=
  if j ≤ n ∧ (n - j) % 2 = 0 then
    (-1 : ℚ) ^ ((n - j) / 2) * n.factorial * 2 ^ j /
      (((n - j) / 2).factorial * j.factorial)
  else 0

noncomputable def physicistsHermite (n : ℕ) : Polynomial ℚ :=
  ∑ k ∈ Finset.range (n / 2 + 1), Polynomial.monomial (n - 2 * k)
    ((-1 : ℚ) ^ k * n.factorial * 2 ^ (n - 2 * k) /
      (k.factorial * (n - 2 * k).factorial))

def IsSmallestMax (n j : ℕ) : Prop :=
  j ≤ n ∧
    (∀ k, k ≤ n → (physicistsHermite n).coeff k ≤ (physicistsHermite n).coeff j) ∧
    ∀ k, k ≤ n → (physicistsHermite n).coeff k = (physicistsHermite n).coeff j → j ≤ k

noncomputable def a (n : ℕ) : ℕ := sInf {j : ℕ | IsSmallestMax n j}

def IsUniqueMax (n j : ℕ) : Prop :=
  j ≤ n ∧ ∀ k, k ≤ n → k ≠ j →
    (physicistsHermite n).coeff k < (physicistsHermite n).coeff j

def cutoff (n : ℕ) : ℕ := (1 + Nat.sqrt (8 * n + 17)) / 2

def modeFormula (n : ℕ) : ℕ := cutoff n - ((cutoff n - n % 4) % 4)

def intervalStart (q : ℕ) : ℕ := q.choose 2 - 2

def intervalOffset (q : ℕ) : ℕ :=
  (q % 4 + 4 - intervalStart q % 4) % 4

def fiveEnd (q : ℕ) : ℕ := intervalStart q + intervalOffset q

def fourCount (q : ℕ) : ℕ := (q - 2 - intervalOffset q) / 4

def isDrop (n : ℕ) : Prop := a (n + 1) + 3 = a n

theorem main :
    (∀ n : ℕ, IsUniqueMax n (a n) ∧ a n = modeFormula n) ∧
    (∀ n : ℕ, (a (n + 1) : ℤ) - (a n : ℤ) = 1 ∨
      (a (n + 1) : ℤ) - (a n : ℤ) = -3) ∧
    (∀ n : ℕ, isDrop n ↔ ∃ q : ℕ, 4 ≤ q ∧
      ∃ r : ℕ, r ≤ fourCount q ∧ n = fiveEnd q + 4 * r) ∧
    (∀ q : ℕ, 4 ≤ q →
      fiveEnd (q + 1) = fiveEnd q + 4 * fourCount q + 5 ∧
      fiveEnd (q + 8) = fiveEnd q + 8 * q + 28 ∧
      fourCount (q + 8) = fourCount q + 2) ∧
    (∀ n : ℕ, Nat.sqrt (2 * n) ≤ a n + 3 ∧
      a n ≤ Nat.sqrt (2 * n) + 2) := by
  sorry

end OMA.S_oeis_a381423
