import OMAStatements.S_mo_487180

/-
Counterexample to BPP's floor-sum unique-minimum conjecture.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
The four functions have positive integer lists
(2,2,2,3), (1,2,3,3), (1,2,2,4), (1,1,3,4).
Two floor differences have disjoint supports, forcing equal-valued pairs
at every real argument. Standard floor-add inequalities prove this
globally, including all discontinuities, without a finite search.
-/

namespace OMA.MO487180

open OMA.S_mo_487180

noncomputable section

def f0 (x : ℝ) : ℤ := 3 * ⌊2 * x⌋ + ⌊3 * x⌋
def f1 (x : ℝ) : ℤ := ⌊x⌋ + ⌊2 * x⌋ + 2 * ⌊3 * x⌋
def f2 (x : ℝ) : ℤ := ⌊x⌋ + 2 * ⌊2 * x⌋ + ⌊4 * x⌋
def f3 (x : ℝ) : ℤ := 2 * ⌊x⌋ + ⌊3 * x⌋ + ⌊4 * x⌋

theorem disjoint_floor_differences (x : ℝ) :
    ⌊3 * x⌋ - 2 * ⌊2 * x⌋ + ⌊x⌋ = 0 ∨
      ⌊4 * x⌋ - ⌊3 * x⌋ - ⌊2 * x⌋ + ⌊x⌋ = 0 := by
  have h20 := Int.le_floor_add x x
  have h21 := Int.le_floor_add_floor x x
  have h30 := Int.le_floor_add (2 * x) x
  have h31 := Int.le_floor_add_floor (2 * x) x
  have h40 := Int.le_floor_add (3 * x) x
  have h41 := Int.le_floor_add_floor (3 * x) x
  have h40' := Int.le_floor_add (2 * x) (2 * x)
  have h41' := Int.le_floor_add_floor (2 * x) (2 * x)
  rw [show x + x = 2 * x by ring] at h20 h21
  rw [show 2 * x + x = 3 * x by ring] at h30 h31
  rw [show 3 * x + x = 4 * x by ring] at h40 h41
  rw [show 2 * x + 2 * x = 4 * x by ring] at h40' h41'
  omega

theorem pair_ties (x : ℝ) :
    (f0 x = f1 x ∧ f2 x = f3 x) ∨ (f0 x = f2 x ∧ f1 x = f3 x) := by
  rcases disjoint_floor_differences x with h | h
  · left
    constructor <;> simp only [f0, f1, f2, f3] <;> omega
  · right
    constructor <;> simp only [f0, f1, f2, f3] <;> omega

theorem f0_ne_f1 : f0 ≠ f1 := by
  intro h
  have hh := congrArg (fun f : ℝ → ℤ => f (1 / 3)) h
  norm_num [f0, f1] at hh

theorem f0_ne_f2 : f0 ≠ f2 := by
  intro h
  have hh := congrArg (fun f : ℝ → ℤ => f (1 / 4)) h
  norm_num [f0, f2] at hh

theorem f0_ne_f3 : f0 ≠ f3 := by
  intro h
  have hh := congrArg (fun f : ℝ → ℤ => f (1 / 4)) h
  norm_num [f0, f3] at hh

theorem f1_ne_f2 : f1 ≠ f2 := by
  intro h
  have hh := congrArg (fun f : ℝ → ℤ => f (1 / 4)) h
  norm_num [f1, f2] at hh

theorem f1_ne_f3 : f1 ≠ f3 := by
  intro h
  have hh := congrArg (fun f : ℝ → ℤ => f (1 / 4)) h
  norm_num [f1, f3] at hh

theorem f2_ne_f3 : f2 ≠ f3 := by
  intro h
  have hh := congrArg (fun f : ℝ → ℤ => f (1 / 3)) h
  norm_num [f2, f3] at hh

theorem f0_floorSum : isFloorSum f0 := by
  refine ⟨[2, 2, 2, 3], by simp, ?_⟩
  funext x
  simp [floorSum, f0] <;> ring

theorem f1_floorSum : isFloorSum f1 := by
  refine ⟨[1, 2, 3, 3], by simp, ?_⟩
  funext x
  simp [floorSum, f1] <;> ring

theorem f2_floorSum : isFloorSum f2 := by
  refine ⟨[1, 2, 2, 4], by simp, ?_⟩
  funext x
  simp [floorSum, f2] <;> ring

theorem f3_floorSum : isFloorSum f3 := by
  refine ⟨[1, 1, 3, 4], by simp, ?_⟩
  funext x
  simp [floorSum, f3] <;> ring

theorem counterexample : ¬ (type_of% @OMA.S_mo_487180.main) := by
  classical
  intro h
  let S : Finset (ℝ → ℤ) := {f0, f1, f2, f3}
  have hS : ∀ f ∈ S, isFloorSum f := by
    intro f hf
    simp only [S, Finset.mem_insert, Finset.mem_singleton] at hf
    rcases hf with rfl | rfl | rfl | rfl
    · exact f0_floorSum
    · exact f1_floorSum
    · exact f2_floorSum
    · exact f3_floorSum
  obtain ⟨x, hx, f, hf, hmin⟩ := h S (by simp [S]) hS
  have hf' : f = f0 ∨ f = f1 ∨ f = f2 ∨ f = f3 := by
    simpa only [S, Finset.mem_insert, Finset.mem_singleton] using hf
  rcases hf' with rfl | rfl | rfl | rfl
  all_goals rcases pair_ties x with hp | hp
  · exact (ne_of_lt (hmin f1 (by simp [S]) f0_ne_f1.symm)) hp.1
  · exact (ne_of_lt (hmin f2 (by simp [S]) f0_ne_f2.symm)) hp.1
  · exact (ne_of_lt (hmin f0 (by simp [S]) f0_ne_f1)) hp.1.symm
  · exact (ne_of_lt (hmin f3 (by simp [S]) f1_ne_f3.symm)) hp.2
  · exact (ne_of_lt (hmin f3 (by simp [S]) f2_ne_f3.symm)) hp.2
  · exact (ne_of_lt (hmin f0 (by simp [S]) f0_ne_f2)) hp.1.symm
  · exact (ne_of_lt (hmin f2 (by simp [S]) f2_ne_f3)) hp.2.symm
  · exact (ne_of_lt (hmin f1 (by simp [S]) f1_ne_f3)) hp.2.symm

end

end OMA.MO487180

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_487180.main) :=
  OMA.MO487180.counterexample
