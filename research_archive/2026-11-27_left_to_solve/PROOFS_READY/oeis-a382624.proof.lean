import OMAStatements.S_oeis_a382624

-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Prior fairness method: Sebastian Karlsson and N. J. A. Sloane for A342042.

namespace OMA.S_oeis_a382624

private lemma no_bounded_injection (f : ℕ → ℕ) (M : ℕ)
    (hb : ∀ n, f n ≤ M) (hi : Function.Injective f) : False := by
  have hs : (Finset.range (M + 2)).image f ⊆ Finset.range (M + 1) := by
    intro x hx
    obtain ⟨n, hn, rfl⟩ := Finset.mem_image.mp hx
    exact Finset.mem_range.mpr (by have := hb n; omega)
  have hc := Finset.card_le_card hs
  rw [Finset.card_image_of_injective _ hi, Finset.card_range, Finset.card_range] at hc
  omega

def repunit (j : ℕ) : ℕ := Nat.ofDigits 10 (List.replicate (j + 1) 9)

private lemma repunit_digits (j : ℕ) :
    Nat.digits 10 (repunit j) = List.replicate (j + 1) 9 := by
  apply Nat.digits_ofDigits 10 (by decide)
  · intro d hd
    have he : d = 9 := List.eq_of_mem_replicate hd
    omega
  · intro h
    have he : (List.replicate (j + 1) (9 : ℕ)).getLast h = 9 := by
      simpa using List.getLast_replicate_succ j (9 : ℕ)
    omega

private lemma repunit_pos (j : ℕ) : 0 < repunit j := by
  simp only [repunit, List.replicate_succ, Nat.ofDigits_cons]
  omega

private lemma repunit_first (j : ℕ) : firstDigit (repunit j) = 9 := by
  unfold firstDigit
  rw [repunit_digits, List.reverse_replicate]
  simp [List.replicate_succ]

private lemma repunit_admissible (j : ℕ) : admissible (repunit j) := by
  refine ⟨repunit_pos j, ?_⟩
  rw [repunit_digits, List.reverse_replicate]
  exact List.isChain_replicate_of_rel _ (by norm_num [digitStep])

private lemma repunit_injective : Function.Injective repunit := by
  intro i j hij
  have hh := congrArg (fun n => (Nat.digits 10 n).length) hij
  simp only [repunit_digits, List.length_replicate] at hh
  omega

private lemma firstDigit_lt_ten (m : ℕ) : firstDigit m < 10 := by
  cases hd : (Nat.digits 10 m).reverse with
  | nil => simp [firstDigit, hd]
  | cons d ds =>
    have hm : d ∈ (Nat.digits 10 m).reverse := by simp [hd]
    have hb : d < 10 := Nat.digits_lt_base (by decide) (List.mem_reverse.mp hm)
    simpa [firstDigit, hd] using hb

private lemma follows_repunit {n : ℕ} (_hn : admissible n) (j : ℕ) :
    follows n (repunit j) := by
  intro he
  rw [repunit_first] at he
  norm_num at he

private lemma repunit_follows (j m : ℕ) : follows (repunit j) m := by
  intro he
  have hb := firstDigit_lt_ten m
  have hsmall : firstDigit m < 9 := by omega
  simpa [lastDigit, repunit_digits, List.replicate_succ] using hsmall

private lemma repunit_unused (used : Finset ℕ) : ∃ j, repunit j ∉ used := by
  by_contra hn
  have hm : ∀ j, repunit j ∈ used := by simpa using hn
  exact no_bounded_injection repunit (used.sup id)
    (fun j => Finset.le_sup (f := id) (hm j)) repunit_injective

private lemma next_mem (used : Finset ℕ) (previous : ℕ) (hp : admissible previous) :
    admissible (next used previous) ∧ next used previous ∉ used ∧
      follows previous (next used previous) := by
  obtain ⟨j, hj⟩ := repunit_unused used
  exact Nat.sInf_mem
    (s := {m : ℕ | admissible m ∧ m ∉ used ∧ follows previous m})
    ⟨repunit j, repunit_admissible j, hj, follows_repunit hp j⟩

private lemma next_le (used : Finset ℕ) (previous m : ℕ)
    (hm : admissible m) (hu : m ∉ used) (he : follows previous m) :
    next used previous ≤ m := Nat.sInf_le ⟨hm, hu, he⟩

private lemma state_admissible (n : ℕ) : admissible (state n).2 := by
  induction n with
  | zero =>
    change (0 : ℕ) < 9 ∧ ([9] : List ℕ).IsChain digitStep
    exact ⟨by decide, List.isChain_singleton 9⟩
  | succ n ih => exact (next_mem (state n).1 (state n).2 ih).1

private lemma a_admissible (n : ℕ) : admissible (a n) :=
  (next_mem (state n).1 (state n).2 (state_admissible n)).1

private lemma a_fresh (n : ℕ) : a n ∉ (state n).1 :=
  (next_mem (state n).1 (state n).2 (state_admissible n)).2.1

private lemma mem_state (n x : ℕ) :
    x ∈ (state n).1 ↔ ∃ i : ℕ, i < n ∧ a i = x := by
  induction n with
  | zero => simp [state]
  | succ n ih =>
    change x ∈ insert (a n) (state n).1 ↔ _
    rw [Finset.mem_insert, ih]
    constructor
    · rintro (hx | ⟨i, hi, hx⟩)
      · exact ⟨n, by omega, hx.symm⟩
      · exact ⟨i, by omega, hx⟩
    · rintro ⟨i, hi, hx⟩
      by_cases he : i = n
      · left
        simpa [he] using hx.symm
      · right
        exact ⟨i, by omega, hx⟩

private lemma a_injective : Function.Injective a := by
  intro i j he
  by_contra hne
  rcases lt_or_gt_of_ne hne with hij | hji
  · have hm := (mem_state j (a i)).mpr ⟨i, hij, rfl⟩
    rw [he] at hm
    exact a_fresh j hm
  · have hm := (mem_state i (a j)).mpr ⟨j, hji, rfl⟩
    rw [← he] at hm
    exact a_fresh i hm

private lemma repunit_occurs (j : ℕ) : ∃ n : ℕ, a n = repunit j := by
  by_contra hnever
  have hu (n : ℕ) : repunit j ∉ (state n).1 := by
    intro hm
    obtain ⟨i, hi, he⟩ := (mem_state n (repunit j)).mp hm
    exact hnever ⟨i, he⟩
  have hb (n : ℕ) : a n ≤ repunit j :=
    next_le (state n).1 (state n).2 (repunit j) (repunit_admissible j) (hu n)
      (follows_repunit (state_admissible n) j)
  exact no_bounded_injection a (repunit j) hb a_injective

noncomputable def repunitIndex (j : ℕ) : ℕ := Nat.find (repunit_occurs j)

private lemma repunitIndex_spec (j : ℕ) : a (repunitIndex j) = repunit j :=
  Nat.find_spec (repunit_occurs j)

private lemma repunitIndex_injective : Function.Injective repunitIndex := by
  intro i j he
  apply repunit_injective
  rw [← repunitIndex_spec i, ← repunitIndex_spec j, he]

private lemma admissible_occurs {m : ℕ} (hm : admissible m) : ∃ n : ℕ, a n = m := by
  by_contra hnever
  have hu (n : ℕ) : m ∉ (state n).1 := by
    intro hx
    obtain ⟨i, hi, he⟩ := (mem_state n m).mp hx
    exact hnever ⟨i, he⟩
  have hb (j : ℕ) : a (repunitIndex j + 1) ≤ m := by
    apply next_le (state (repunitIndex j + 1)).1 (state (repunitIndex j + 1)).2 m hm
      (hu (repunitIndex j + 1))
    change follows (a (repunitIndex j)) m
    rw [repunitIndex_spec]
    exact repunit_follows j m
  have hi : Function.Injective (fun j => a (repunitIndex j + 1)) := by
    intro i j he
    apply repunitIndex_injective
    have hh := a_injective he
    omega
  exact no_bounded_injection (fun j => a (repunitIndex j + 1)) m hb hi

theorem checkedMain : Function.Injective a ∧
    ∀ m : ℕ, (∃ n : ℕ, a n = m) ↔ admissible m := by
  refine ⟨a_injective, fun m => ⟨?_, ?_⟩⟩
  · rintro ⟨n, rfl⟩
    exact a_admissible n
  · exact admissible_occurs

end OMA.S_oeis_a382624

theorem OMA.solution : type_of% @OMA.S_oeis_a382624.main := by
  exact OMA.S_oeis_a382624.checkedMain
