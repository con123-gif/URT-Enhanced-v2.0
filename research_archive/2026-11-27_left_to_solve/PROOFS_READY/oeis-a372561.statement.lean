import Mathlib

/-!
OEIS A372561, conjectures by Antti Karttunen, May 2024.
Sources: A372561 (comments), A372560, A371094, A372443 and A372555.
A372561's displayed table uses the GREEDY count A265745. The selected
three conjectures explicitly use the GLOBAL MINIMUM count A372555,
represented by `minCoins` below, on the raw array A372560 (`grid`).
The thirteenth upward antidiagonal has n+k=14 and begins233,933,...;
the thirtieth has n+k=31 and begins911,58325,... . The first two
claims omit the first entry of their respective antidiagonal. The third
is symmetry of the minimum-count array away from the first row/column.
Jacobsthal index1 duplicates index2; zero coins and duplicate index1
can be omitted from globally minimum-cardinality representations.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/
namespace OMA.S_oeis_a372561

def jac : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => jac (n + 1) + 2 * jac n

def value (m : Multiset ℕ) : ℕ := (m.map jac).sum

def represents (n : ℕ) (m : Multiset ℕ) : Prop :=
  (∀ i ∈ m, 2 ≤ i) ∧ value m = n

noncomputable def minCoins (n : ℕ) : ℕ :=
  sInf {r : ℕ | ∃ m : Multiset ℕ, represents n m ∧ m.card = r}

def valuation (n : ℕ) : ℕ := padicValNat 2 (3 * n + 1)

def reduced (n : ℕ) : ℕ := (3 * n + 1) / 2 ^ valuation n

def lift (e y : ℕ) : ℕ := 4 ^ e * y + (4 ^ e - 1) / 3

def stretch (n : ℕ) : ℕ :=
  (3 * n + 1) * 2 ^ valuation n + (4 ^ valuation n - 1) / 3

def grid (n k : ℕ) : ℕ :=
  (stretch^[n - 1]) ((reduced^[k - 1]) 27)

theorem main :
    (∀ n k : ℕ, 2 ≤ n → 1 ≤ k → n + k = 14 → minCoins (grid n k) = 7) ∧
    (∀ n k : ℕ, 2 ≤ n → 1 ≤ k → n + k = 31 → minCoins (grid n k) = 9) ∧
    (∀ n k : ℕ, 1 < n → 1 < k → minCoins (grid n k) = minCoins (grid k n)) := by
  sorry

end OMA.S_oeis_a372561
