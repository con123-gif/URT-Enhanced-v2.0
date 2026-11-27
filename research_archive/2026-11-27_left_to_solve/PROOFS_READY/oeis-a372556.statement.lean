import Mathlib

/-!
OEIS A372556, conjecture by Antti Karttunen, May 10, 2024.
Source: https://oeis.org/A372556 (revision 14), with A372555 and A130249.
J_0=0, J_1=1, J_(i+2)=J_(i+1)+2J_i are the Jacobsthal numbers.
For positive n, the source's greedy index is floor(log_2(3n+1)).
The conjecture's explicit "in other words" formulation says that some
minimum-cardinality representation of n uses the largest available
Jacobsthal coin or the next-largest one. This is the statement below.
The duplicate denomination J_1=J_2=1 is represented using index 2;
this matches the source's largest-index convention. For n=0 the empty
representation is optimal, and the source a(0)=A130249(0)=0 separately.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a372556

def jac : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n + 2 => jac (n + 1) + 2 * jac n

def value (m : Multiset ℕ) : ℕ := (m.map jac).sum

def represents (n : ℕ) (m : Multiset ℕ) : Prop :=
  (∀ i ∈ m, 2 ≤ i) ∧ value m = n

def optimal (n : ℕ) (m : Multiset ℕ) : Prop :=
  represents n m ∧ ∀ r, represents n r → m.card ≤ r.card

def greedyIndex (n : ℕ) : ℕ := Nat.log 2 (3 * n + 1)

theorem main : optimal 0 0 ∧ ∀ n : ℕ, 0 < n →
    ∃ m : Multiset ℕ, optimal n m ∧
      (greedyIndex n ∈ m ∨ greedyIndex n - 1 ∈ m) := by
  sorry

end OMA.S_oeis_a372556
