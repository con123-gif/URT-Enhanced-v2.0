import Mathlib

/-
Source: BPP, MathOverflow question 487180, February 4, 2025.
https://mathoverflow.net/questions/487180
Cross-post: https://math.stackexchange.com/questions/5029508
Question and comments licensed CC BY-SA 4.0.
Adaptation: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).

Each function is an integer-valued finite sum of floors; comparison of
these integers is the same as comparison of their real values. Lists retain
repeated positive integers, as permitted explicitly in the cross-post's
comments. Different functions may have different numbers of summands.
The finite family is assumed nonempty, making the intended existence
question meaningful. The disproof uses four distinct functions, each with
four summands, and is independent of this empty-family convention.
-/

namespace OMA.S_mo_487180

noncomputable def floorSum (a : List ℕ) (x : ℝ) : ℤ :=
  (a.map (fun n => ⌊(n : ℝ) * x⌋)).sum

def isFloorSum (f : ℝ → ℤ) : Prop :=
  ∃ a : List ℕ, (∀ n ∈ a, 0 < n) ∧ f = floorSum a

theorem main :
    ∀ S : Finset (ℝ → ℤ), S.Nonempty →
      (∀ f ∈ S, isFloorSum f) →
      ∃ x : ℝ, 0 < x ∧ ∃ f ∈ S,
        ∀ g ∈ S, g ≠ f → f x < g x := by
  sorry

end OMA.S_mo_487180
