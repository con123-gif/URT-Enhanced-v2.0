import OMAStatements.S_oeis_a343311
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Robert Israel's source Maple program already tests the unequal-factor
-- triple (a,b,ab-a-b). This proof completes it universally, treats equal
-- factors, and proves all required exclusions.

namespace A343311Certificate
open OMA.S_oeis_a343311

lemma composite_of_represented (n : ℕ) (h : represented n) :
    1 < n ∧ ¬ Nat.Prime n := by
  obtain ⟨x, y, z, hx, hy, hz, hxy, hxz, hyz, hs, hd⟩ := h
  refine ⟨by omega, ?_⟩
  intro hp
  rcases hp.dvd_mul.mp hd with hxy' | hz'
  · rcases hp.dvd_mul.mp hxy' with hx' | hy'
    · exact (Nat.not_dvd_of_pos_of_lt hx (by omega)) hx'
    · exact (Nat.not_dvd_of_pos_of_lt hy (by omega)) hy'
  · exact (Nat.not_dvd_of_pos_of_lt hz (by omega)) hz'

set_option maxHeartbeats 2000000 in
lemma exceptions (n : ℕ) (hn : n = 4 ∨ n = 8 ∨ n = 9 ∨ n = 25) :
    ¬ represented n := by
  rcases hn with rfl | rfl | rfl | rfl
  all_goals
    rintro ⟨x, y, z, hx, hy, hz, hxy, hxz, hyz, hs, hd⟩
    have hxb : x ≤ 24 := by omega
    have hyb : y ≤ 24 := by omega
    interval_cases x <;> interval_cases y <;> omega

lemma unequal_factors (u v : ℕ) (hne : u ≠ v)
    (h8 : (u + 2) * (v + 2) ≠ 8) :
    represented ((u + 2) * (v + 2)) := by
  have hz : 0 < u * v + u + v := by omega
  have hxz : u + 2 ≠ u * v + u + v := by
    intro h
    have hv : v ≤ 2 := by nlinarith [Nat.zero_le (u * v)]
    interval_cases v
    · nlinarith
    · have hu : u = 1 := by nlinarith
      exact hne (by omega)
    · have hu : u = 0 := by nlinarith
      subst u
      norm_num at h8
  have hyz : v + 2 ≠ u * v + u + v := by
    intro h
    have hu : u ≤ 2 := by nlinarith [Nat.zero_le (u * v)]
    interval_cases u
    · nlinarith
    · have hv : v = 1 := by nlinarith
      exact hne (by omega)
    · have hv : v = 0 := by nlinarith
      subst v
      norm_num at h8
  refine ⟨u + 2, v + 2, u * v + u + v, by omega, by omega, hz,
    by omega, hxz, hyz, ?_, ?_⟩
  · ring
  · refine ⟨u * v + u + v, ?_⟩
    ring

lemma large_square (t : ℕ) : represented ((t + 6) * (t + 6)) := by
  refine ⟨t + 6, 2 * (t + 6), (t + 6) * (t + 3),
    by omega, by omega, by positivity, ?_, ?_, ?_, ?_, ?_⟩
  · omega
  · nlinarith
  · nlinarith
  · ring
  · refine ⟨2 * (t + 6) * (t + 3), ?_⟩
    ring

lemma sixteen : represented 16 := by
  refine ⟨2, 6, 8, by decide, by decide, by decide,
    by decide, by decide, by decide, by decide, ?_⟩
  norm_num

lemma complete (n : ℕ) (hn : 1 < n) (hp : ¬ Nat.Prime n)
    (h4 : n ≠ 4) (h8 : n ≠ 8) (h9 : n ≠ 9) (h25 : n ≠ 25) :
    represented n := by
  obtain ⟨a, b, han, hbn, hab⟩ :=
    (Nat.not_prime_iff_exists_mul_eq (by omega : 2 ≤ n)).mp hp
  have ha : 2 ≤ a := by
    by_contra h
    have hsmall : a = 0 ∨ a = 1 := by omega
    rcases hsmall with rfl | rfl <;> simp at hab <;> omega
  have hb : 2 ≤ b := by
    by_contra h
    have hsmall : b = 0 ∨ b = 1 := by omega
    rcases hsmall with rfl | rfl <;> simp at hab <;> omega
  by_cases heq : a = b
  · subst b
    by_cases ha6 : 6 ≤ a
    · obtain ⟨t, ht⟩ : ∃ t : ℕ, a = t + 6 := ⟨a - 6, by omega⟩
      rw [← hab, ht]
      exact large_square t
    · have ha4 : a = 4 := by
        interval_cases a <;> norm_num at hab <;> omega
      rw [ha4] at hab
      norm_num at hab
      simpa [← hab] using sixteen
  · obtain ⟨u, hu⟩ : ∃ u : ℕ, a = u + 2 := ⟨a - 2, by omega⟩
    obtain ⟨v, hv⟩ : ∃ v : ℕ, b = v + 2 := ⟨b - 2, by omega⟩
    rw [← hab, hu, hv]
    exact unequal_factors u v (by omega) (by simpa [← hu, ← hv, hab] using h8)

end A343311Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a343311.main := by
  intro n
  constructor
  · intro h
    obtain ⟨hn, hp⟩ := A343311Certificate.composite_of_represented n h
    exact ⟨hn, hp,
      fun h4 => A343311Certificate.exceptions n (Or.inl h4) h,
      fun h8 => A343311Certificate.exceptions n (Or.inr (Or.inl h8)) h,
      fun h9 => A343311Certificate.exceptions n (Or.inr (Or.inr (Or.inl h9))) h,
      fun h25 => A343311Certificate.exceptions n (Or.inr (Or.inr (Or.inr h25))) h⟩
  · rintro ⟨hn, hp, h4, h8, h9, h25⟩
    exact A343311Certificate.complete n hn hp h4 h8 h9 h25
