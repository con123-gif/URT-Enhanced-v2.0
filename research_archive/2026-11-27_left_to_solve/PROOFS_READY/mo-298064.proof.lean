import OMAStatements.S_mo_298064
import Mathlib

/-!
For size and rank 1 over the field with two elements, the trace-zero family
is empty and the trace-one family contains the identity matrix. This refutes
the full inequality in Singh's question, without changing its quantifiers.
-/

namespace OMA.S_mo_298064

private theorem trace_zero_family_empty :
    IsEmpty (traceRankFamily (ZMod 2) 1 1 0) := by
  constructor
  rintro ⟨M, hsymm, hrank, htrace⟩
  have hentry : M 0 0 = 0 := by
    simpa only [Matrix.trace_fin_one] using htrace
  have hzero : M = 0 := by
    ext i j
    fin_cases i
    fin_cases j
    exact hentry
  rw [hzero, Matrix.rank_zero] at hrank
  exact Nat.zero_ne_one hrank

private theorem trace_one_family_nonempty :
    Nonempty (traceRankFamily (ZMod 2) 1 1 1) := by
  refine ⟨⟨1, Matrix.isSymm_one, ?_, ?_⟩⟩
  · simp
  · simp [Matrix.trace_fin_one]

theorem conjecture_false : ¬ (∀ (F : Type) [Field F] [Fintype F]
    (m t : ℕ) (a : F), a ≠ 0 → Nat.card (traceRankFamily F m t a) ≤
      Nat.card (traceRankFamily F m t 0)) := by
  intro h
  letI : IsEmpty (traceRankFamily (ZMod 2) 1 1 0) := trace_zero_family_empty
  letI : Nonempty (traceRankFamily (ZMod 2) 1 1 1) := trace_one_family_nonempty
  letI : Finite (traceRankFamily (ZMod 2) 1 1 1) := by
    unfold traceRankFamily
    infer_instance
  have hzero : Nat.card (traceRankFamily (ZMod 2) 1 1 0) = 0 :=
    Nat.card_of_isEmpty
  have hpos : 0 < Nat.card (traceRankFamily (ZMod 2) 1 1 1) := Nat.card_pos
  have hle := h (ZMod 2) 1 1 1 (by decide)
  omega

end OMA.S_mo_298064

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_298064.main) := by
  exact OMA.S_mo_298064.conjecture_false
