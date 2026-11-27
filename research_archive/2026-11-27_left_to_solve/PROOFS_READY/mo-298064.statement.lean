import Mathlib

/-!
# Trace of symmetric matrices of fixed rank over a finite field

Source: https://mathoverflow.net/questions/298064
Original question: Singh, 17 April 2018, CC BY-SA 3.0.
Translation: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6.

The source imposes no restriction on the characteristic or on the matrix size.
Its parenthetical clarification permits every nonzero trace value, not only 1.
Natural-number sizes and ranks include the harmless empty and impossible-rank
cases; the intended positive-size, admissible-rank instances are all included.
-/

namespace OMA.S_mo_298064

/-- The matrices called `S_a(t,m)` in the source. -/
def traceRankFamily (F : Type) [Field F] (m t : ℕ) (a : F) :=
  {M : Matrix (Fin m) (Fin m) F // M.IsSymm ∧ M.rank = t ∧ M.trace = a}

theorem main : ∀ (F : Type) [Field F] [Fintype F] (m t : ℕ) (a : F),
    a ≠ 0 → Nat.card (traceRankFamily F m t a) ≤
      Nat.card (traceRankFamily F m t 0) := by
  sorry

end OMA.S_mo_298064
