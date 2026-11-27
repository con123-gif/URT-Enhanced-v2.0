import OMAStatements.S_oeis_a383062

-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Prior fairness method: Sebastian Karlsson and N. J. A. Sloane for A342042.

namespace OMA.S_oeis_a383062

private lemma no_bounded_injection (f : ℕ → ℕ) (M : ℕ)
    (hb : ∀ n, f n ≤ M) (hi : Function.Injective f) : False := by
  have hs : (Finset.range (M + 2)).image f ⊆ Finset.range (M + 1) := by
    intro x hx
    obtain ⟨n, hn, rfl⟩ := Finset.mem_image.mp hx
    exact Finset.mem_range.mpr (by have := hb n; omega)
  have hc := Finset.card_le_card hs
  rw [Finset.card_image_of_injective _ hi, Finset.card_range, Finset.card_range] at hc
  omega

def connector (j : ℕ) : ℕ := 10^(j+1) * 2

private lemma connector_digits (j : ℕ) :
    Nat.digits 10 (connector j) = List.replicate (j + 1) 0 ++ [2] := by
  unfold connector
  rw [Nat.digits_base_pow_mul (by decide : 1 < 10) (by decide : 0 < 2)]
  rfl

private lemma connector_first (j : ℕ) : firstDigit (connector j) = 2 := by
  unfold firstDigit
  rw [connector_digits, List.reverse_append, List.reverse_replicate]
  simp

private lemma connector_admissible (j : ℕ) : admissible (connector j) := by
  unfold admissible
  rw [connector_digits, List.reverse_append, List.reverse_replicate]
  change (2 :: List.replicate (j+1) 0).IsChain digitStep
  apply List.IsChain.cons_of_ne_nil (by simp)
  · exact List.isChain_replicate_of_rel _ (by norm_num [digitStep])
  · simp [List.replicate_succ, digitStep]

private lemma connector_injective : Function.Injective connector := by
  intro i j hij
  have hh := congrArg (fun n => (Nat.digits 10 n).length) hij
  simp only [connector_digits, List.length_append, List.length_replicate,
    List.length_singleton] at hh
  omega

private lemma follows_connector {n : ℕ} (_hn : admissible n) (j : ℕ) :
    follows n (connector j) := by
  intro he
  rw [connector_first] at he
  norm_num at he

private lemma connector_follows (j m : ℕ) : follows (connector j) m := by
  intro he
  have hpositive : 0 < firstDigit m := by omega
  simpa [lastDigit, connector_digits, List.replicate_succ] using hpositive

private lemma connector_unused (used : Finset ℕ) : ∃ j, connector j ∉ used := by
  by_contra hn
  have hm : ∀ j, connector j ∈ used := by simpa using hn
  exact no_bounded_injection connector (used.sup id)
    (fun j => Finset.le_sup (f := id) (hm j)) connector_injective

private lemma next_mem (used : Finset ℕ) (previous : ℕ) (hp : admissible previous) :
    admissible (next used previous) ∧ next used previous ∉ used ∧
      follows previous (next used previous) := by
  obtain ⟨j, hj⟩ := connector_unused used
  exact Nat.sInf_mem
    (s := {m : ℕ | admissible m ∧ m ∉ used ∧ follows previous m})
    ⟨connector j, connector_admissible j, hj, follows_connector hp j⟩

private lemma next_le (used : Finset ℕ) (previous m : ℕ)
    (hm : admissible m) (hu : m ∉ used) (he : follows previous m) :
    next used previous ≤ m := Nat.sInf_le ⟨hm, hu, he⟩

private lemma state_admissible (n : ℕ) : admissible (state n).2 := by
  induction n with
  | zero =>
    change ([] : List ℕ).IsChain digitStep
    exact List.isChain_nil
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

private lemma connector_occurs (j : ℕ) : ∃ n : ℕ, a n = connector j := by
  by_contra hnever
  have hu (n : ℕ) : connector j ∉ (state n).1 := by
    intro hm
    obtain ⟨i, hi, he⟩ := (mem_state n (connector j)).mp hm
    exact hnever ⟨i, he⟩
  have hb (n : ℕ) : a n ≤ connector j :=
    next_le (state n).1 (state n).2 (connector j) (connector_admissible j) (hu n)
      (follows_connector (state_admissible n) j)
  exact no_bounded_injection a (connector j) hb a_injective

noncomputable def connectorIndex (j : ℕ) : ℕ := Nat.find (connector_occurs j)

private lemma connectorIndex_spec (j : ℕ) : a (connectorIndex j) = connector j :=
  Nat.find_spec (connector_occurs j)

private lemma connectorIndex_injective : Function.Injective connectorIndex := by
  intro i j he
  apply connector_injective
  rw [← connectorIndex_spec i, ← connectorIndex_spec j, he]

private lemma admissible_occurs {m : ℕ} (hm : admissible m) : ∃ n : ℕ, a n = m := by
  by_contra hnever
  have hu (n : ℕ) : m ∉ (state n).1 := by
    intro hx
    obtain ⟨i, hi, he⟩ := (mem_state n m).mp hx
    exact hnever ⟨i, he⟩
  have hb (j : ℕ) : a (connectorIndex j + 1) ≤ m := by
    apply next_le (state (connectorIndex j + 1)).1 (state (connectorIndex j + 1)).2 m hm
      (hu (connectorIndex j + 1))
    change follows (a (connectorIndex j)) m
    rw [connectorIndex_spec]
    exact connector_follows j m
  have hi : Function.Injective (fun j => a (connectorIndex j + 1)) := by
    intro i j he
    apply connectorIndex_injective
    have hh := a_injective he
    omega
  exact no_bounded_injection (fun j => a (connectorIndex j + 1)) m hb hi

theorem checkedMain : Function.Injective a ∧
    ∀ m : ℕ, (∃ n : ℕ, a n = m) ↔ admissible m := by
  refine ⟨a_injective, fun m => ⟨?_, ?_⟩⟩
  · rintro ⟨n, rfl⟩
    exact a_admissible n
  · exact admissible_occurs

end OMA.S_oeis_a383062

theorem OMA.solution : type_of% @OMA.S_oeis_a383062.main := by
  exact OMA.S_oeis_a383062.checkedMain
