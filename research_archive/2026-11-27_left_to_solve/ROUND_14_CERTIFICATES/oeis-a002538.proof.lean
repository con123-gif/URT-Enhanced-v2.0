import OMAStatements.S_oeis_a002538

/-!
Source: https://oeis.org/A002538, R. J. Mathar's recurrence conjecture.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact serving variant not exposed).
The proof eliminates the inhomogeneous factorial term from the independent
first-order recurrence already recorded in the source. No novelty is claimed.
-/

theorem OMA.solution : type_of% @OMA.S_oeis_a002538.main := by
  intro n hn
  obtain ⟨m, hm⟩ : ∃ m : ℕ, n = m + 3 := ⟨n - 3, by omega⟩
  subst n
  have h1 : m + 3 - 1 = m + 2 := by omega
  have h2 : m + 3 - 2 = m + 1 := by omega
  have h3 : m + 3 - 3 = m := by omega
  simp only [h1, h2, h3]
  simp only [OMA.S_oeis_a002538.a, Nat.factorial_succ,
    Nat.cast_add, Nat.cast_one, Nat.cast_mul]
  ring
