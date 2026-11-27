import Mathlib

/-!
OEIS A329813, the arbitrary-seed conjecture in the comments (Andres Cicuttin,
2019). The same conjecture occurs in A329654; it is one mathematical problem.
Sources: https://oeis.org/A329813 and https://oeis.org/A329654
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT
(GPT-6 Codex; the exact model variant is not exposed in this interface).
The scheduled NumberTheoryBot identified the source and first proof candidate;
the campaign independently audited the source and repaired and checked the proof.

For any nonzero real initial values, the underlying real recurrence B is
conjectured to have six finite, pairwise distinct normalized residue limits.
The statement concerns B, rather than its integer numerator or denominator.
The recurrence starts at index two, as specified in the source comments.
The fixed seed (1,1) is a special case, not the entire arbitrary-seed claim.
-/

namespace OMA.S_oeis_a329813

open Filter Topology

def recurrence (b : ℕ → ℝ) : Prop :=
  ∀ n : ℕ, b (n+2) = ((n : ℝ)+2) * b (n+1) / b n

def limitCycle (b : ℕ → ℝ) (c : ℕ → ℝ) : Prop :=
  (∀ i : ℕ, 0 < i → i < 7 →
    Tendsto (fun n : ℕ => b (6*n+i) / ((6*n+i : ℕ) : ℝ)) atTop (𝓝 (c i))) ∧
  (∀ i j : ℕ, 0 < i → i < j → j < 7 → c i ≠ c j)

theorem main :
    ∀ b : ℕ → ℝ, b 0 ≠ 0 → b 1 ≠ 0 → recurrence b → ∃ c, limitCycle b c := by
  sorry

end OMA.S_oeis_a329813
