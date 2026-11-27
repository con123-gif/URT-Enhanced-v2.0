import Mathlib

open BigOperators

namespace A113257Mod3Run20

def a (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.Icc 1 n, (i ^ 2) ^ ((n - i + 1) ^ 2)

lemma odd_sq_cast (i : ℕ) (hi : Odd i) : ((i ^ 2 : ℕ) : ZMod 8) = 1 := by
  obtain ⟨k, rfl⟩ := hi
  rcases Nat.even_or_odd' k with ⟨m, hm | hm⟩
  · subst k
    push_cast
    ring_nf
    rw [show (8 : ZMod 8) = 0 from
      (ZMod.natCast_eq_zero_iff 8 8).mpr (by norm_num)]
    rw [show (16 : ZMod 8) = 0 from
      (ZMod.natCast_eq_zero_iff 16 8).mpr (by norm_num)]
    simp
  · subst k
    push_cast
    ring_nf
    rw [show (24 : ZMod 8) = 0 from
      (ZMod.natCast_eq_zero_iff 24 8).mpr (by norm_num)]
    rw [show (16 : ZMod 8) = 0 from
      (ZMod.natCast_eq_zero_iff 16 8).mpr (by norm_num)]
    simp only [mul_zero, add_zero]
    calc
      (9 : ZMod 8) = 8 + 1 := by norm_num
      _ = 0 + 1 := by
        rw [show (8 : ZMod 8) = 0 from
          (ZMod.natCast_eq_zero_iff 8 8).mpr (by norm_num)]
      _ = 1 := by ring

lemma even_sq_sq_cast_zero (i : ℕ) (hi : Even i) :
    ((((i ^ 2) ^ 2 : ℕ) : ZMod 8)) = 0 := by
  obtain ⟨k, rfl⟩ := hi
  push_cast
  ring_nf
  rw [show (16 : ZMod 8) = 0 from
    (ZMod.natCast_eq_zero_iff 16 8).mpr (by norm_num)]
  simp

lemma even_sq_pow_cast_zero (i e : ℕ) (hi : Even i) (he : 2 ≤ e) :
    ((((i ^ 2) ^ e : ℕ) : ZMod 8)) = 0 := by
  have heq : e = 2 + (e - 2) := by omega
  rw [heq, pow_add]
  rw [Nat.cast_mul, even_sq_sq_cast_zero i hi]
  simp

lemma term_cast (n i : ℕ) (hi : i ∈ Finset.Icc 1 n) :
    ((((i ^ 2) ^ ((n - i + 1) ^ 2) : ℕ) : ZMod 8)) =
      (if Odd i then 1 else if i = n then (i : ZMod 8) ^ 2 else 0) := by
  by_cases hodd : Odd i
  · simp only [hodd, if_true]
    rw [Nat.cast_pow, odd_sq_cast i hodd]
    simp
  · have heven : Even i := Nat.not_odd_iff_even.mp hodd
    by_cases hin : i = n
    · subst i
      simp [hodd]
    · have hil : i < n := lt_of_le_of_ne (Finset.mem_Icc.mp hi).2 hin
      have hbase : 2 ≤ n - i + 1 := by omega
      have hexp : 2 ≤ (n - i + 1) ^ 2 := by nlinarith
      rw [even_sq_pow_cast_zero i ((n - i + 1) ^ 2) heven hexp]
      simp [hodd, hin]

lemma odd_indicator_sum (n : ℕ) :
    (∑ i ∈ Finset.Icc 1 n, if Odd i then (1 : ZMod 8) else 0) =
      (((n + 1) / 2 : ℕ) : ZMod 8) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ n + 1)]
      rw [ih]
      by_cases hodd : Odd (n + 1)
      · simp only [hodd, if_true]
        obtain ⟨k, hk⟩ := hodd
        have hdiv : (n + 2) / 2 = (n + 1) / 2 + 1 := by omega
        rw [hdiv]
        push_cast
        ring
      · simp only [hodd, if_false, add_zero]
        have heven : Even (n + 1) := Nat.not_odd_iff_even.mp hodd
        obtain ⟨k, hk⟩ := heven
        have hdiv : (n + 2) / 2 = (n + 1) / 2 := by omega
        rw [hdiv]

lemma terminal_even_sum (n : ℕ) :
    (∑ i ∈ Finset.Icc 1 n,
      if ¬ Odd i ∧ i = n then (i : ZMod 8) ^ 2 else 0) =
        (if Even n then (n : ZMod 8) ^ 2 else 0) := by
  classical
  by_cases hn : n = 0
  · subst n
    norm_num
  · have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hn
    rw [Finset.sum_eq_single n]
    · simp [Nat.not_odd_iff_even]
    · intro b hb hbn
      simp [hbn]
    · intro hnot
      exact (hnot (Finset.mem_Icc.mpr ⟨hn1, le_rfl⟩)).elim

lemma even_sq_cast_formula (n : ℕ) (hn : Even n) :
    (n : ZMod 8) ^ 2 = if n % 4 = 2 then 4 else 0 := by
  obtain ⟨k, rfl⟩ := hn
  rcases Nat.even_or_odd' k with ⟨m, hm | hm⟩
  · subst k
    have hmod : (2 * m + 2 * m) % 4 ≠ 2 := by omega
    rw [if_neg hmod]
    push_cast
    ring_nf
    rw [show (16 : ZMod 8) = 0 from
      (ZMod.natCast_eq_zero_iff 16 8).mpr (by norm_num)]
    simp
  · subst k
    have hmod : (2 * m + 1 + (2 * m + 1)) % 4 = 2 := by omega
    rw [if_pos hmod]
    push_cast
    ring_nf
    rw [show (16 : ZMod 8) = 0 from
      (ZMod.natCast_eq_zero_iff 16 8).mpr (by norm_num)]
    simp

theorem cast_a_mod_eight (n : ℕ) :
    (a n : ZMod 8) =
      (((n + 1) / 2 : ℕ) : ZMod 8) +
        if n % 4 = 2 then 4 else 0 := by
  simp only [a, Nat.cast_sum]
  calc
    (∑ x ∈ Finset.Icc 1 n,
      ((((x ^ 2) ^ ((n - x + 1) ^ 2) : ℕ) : ZMod 8))) =
        ∑ x ∈ Finset.Icc 1 n,
          ((if Odd x then 1 else 0) +
            (if ¬ Odd x ∧ x = n then (x : ZMod 8) ^ 2 else 0)) := by
              apply Finset.sum_congr rfl
              intro i hi
              rw [term_cast n i hi]
              by_cases hodd : Odd i <;> simp [hodd]
    _ = (∑ x ∈ Finset.Icc 1 n, if Odd x then (1 : ZMod 8) else 0) +
        (∑ x ∈ Finset.Icc 1 n,
          if ¬ Odd x ∧ x = n then (x : ZMod 8) ^ 2 else 0) := by
            simp only [Finset.sum_add_distrib]
    _ = (((n + 1) / 2 : ℕ) : ZMod 8) +
        (if Even n then (n : ZMod 8) ^ 2 else 0) := by
          rw [odd_indicator_sum, terminal_even_sum]
    _ = (((n + 1) / 2 : ℕ) : ZMod 8) +
        if n % 4 = 2 then 4 else 0 := by
          by_cases hn : Even n
          · rw [if_pos hn, even_sq_cast_formula n hn]
          · have hmod : n % 4 ≠ 2 := by
              intro h
              have : Even n := by
                rw [even_iff_two_dvd]
                exact Nat.dvd_of_mod_eq_zero (by omega)
              exact hn this
            simp [hn, hmod]

lemma cast_a_mod_sixteen_block (q r : ℕ) (hr : r < 16) :
    (a (16 * q + r) : ZMod 8) =
      (((r + 1) / 2 : ℕ) : ZMod 8) +
        if r % 4 = 2 then 4 else 0 := by
  rw [cast_a_mod_eight]
  have hhalf : (16 * q + r + 1) / 2 = 8 * q + (r + 1) / 2 := by omega
  have hmod : (16 * q + r) % 4 = r % 4 := by omega
  rw [hhalf, hmod]
  push_cast
  rw [show (8 : ZMod 8) = 0 from
    (ZMod.natCast_eq_zero_iff 8 8).mpr (by norm_num)]
  ring

lemma zmod_eight_square_cases :
    ∀ z : ZMod 8, IsSquare z → z = 0 ∨ z = 1 ∨ z = 4 := by
  decide

theorem square_index_mod_sixteen (n : ℕ) (hsquare : IsSquare (a n)) :
    n % 16 = 0 ∨ n % 16 = 1 ∨ n % 16 = 7 ∨
      n % 16 = 8 ∨ n % 16 = 10 ∨ n % 16 = 15 := by
  obtain ⟨m, hm⟩ := hsquare
  have hcast_square : IsSquare ((a n : ℕ) : ZMod 8) := by
    refine ⟨(m : ZMod 8), ?_⟩
    simpa using congrArg (fun x : ℕ ↦ (x : ZMod 8)) hm
  have hs := zmod_eight_square_cases _ hcast_square
  have hrlt : n % 16 < 16 := Nat.mod_lt _ (by norm_num)
  have hdecomp : n = 16 * (n / 16) + n % 16 := by omega
  have ha := cast_a_mod_sixteen_block (n / 16) (n % 16) hrlt
  rw [← hdecomp] at ha
  interval_cases hr : n % 16
  · omega
  · omega
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((5 : ZMod 8) = 0 ∨ (5 : ZMod 8) = 1 ∨
      (5 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((2 : ZMod 8) = 0 ∨ (2 : ZMod 8) = 1 ∨
      (2 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((2 : ZMod 8) = 0 ∨ (2 : ZMod 8) = 1 ∨
      (2 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((3 : ZMod 8) = 0 ∨ (3 : ZMod 8) = 1 ∨
      (3 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((7 : ZMod 8) = 0 ∨ (7 : ZMod 8) = 1 ∨
      (7 : ZMod 8) = 4)) hs
  · omega
  · omega
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((5 : ZMod 8) = 0 ∨ (5 : ZMod 8) = 1 ∨
      (5 : ZMod 8) = 4)) hs
  · omega
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((6 : ZMod 8) = 0 ∨ (6 : ZMod 8) = 1 ∨
      (6 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((6 : ZMod 8) = 0 ∨ (6 : ZMod 8) = 1 ∨
      (6 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((7 : ZMod 8) = 0 ∨ (7 : ZMod 8) = 1 ∨
      (7 : ZMod 8) = 4)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((11 : ZMod 8) = 0 ∨ (11 : ZMod 8) = 1 ∨
      (11 : ZMod 8) = 4)) hs
  · omega

#print axioms cast_a_mod_eight
#print axioms square_index_mod_sixteen

end A113257Mod3Run20

namespace A113257Mod3Run20

lemma sq_cast_mod_three (i : ℕ) :
    ((i ^ 2 : ℕ) : ZMod 3) = if i % 3 = 0 then 0 else 1 := by
  have hi : i = 3 * (i / 3) + i % 3 := by omega
  have himod : i % 3 < 3 := Nat.mod_lt _ (by norm_num)
  interval_cases hr : i % 3
  · rw [if_pos rfl, hi]
    push_cast
    rw [show (3 : ZMod 3) = 0 from
      (ZMod.natCast_eq_zero_iff 3 3).mpr (by norm_num)]
    ring
  · rw [if_neg (by omega), hi]
    push_cast
    rw [show (3 : ZMod 3) = 0 from
      (ZMod.natCast_eq_zero_iff 3 3).mpr (by norm_num)]
    ring
  · rw [if_neg (by omega), hi]
    push_cast
    rw [show (3 : ZMod 3) = 0 from
      (ZMod.natCast_eq_zero_iff 3 3).mpr (by norm_num)]
    ring_nf
    calc
      (4 : ZMod 3) = 3 + 1 := by norm_num
      _ = 0 + 1 := by
        rw [show (3 : ZMod 3) = 0 from
          (ZMod.natCast_eq_zero_iff 3 3).mpr (by norm_num)]
      _ = 1 := by ring

lemma term_cast_mod_three (n i : ℕ) (hi : i ∈ Finset.Icc 1 n) :
    ((((i ^ 2) ^ ((n - i + 1) ^ 2) : ℕ) : ZMod 3)) =
      if i % 3 = 0 then 0 else 1 := by
  have hpos : 0 < n - i + 1 := by
    have := (Finset.mem_Icc.mp hi).2
    omega
  have hexp : (n - i + 1) ^ 2 ≠ 0 := by positivity
  rw [Nat.cast_pow, sq_cast_mod_three]
  by_cases hmod : i % 3 = 0
  · rw [if_pos hmod, zero_pow hexp]
  · rw [if_neg hmod, one_pow]

lemma indicator_sum_mod_three (n : ℕ) :
    (∑ i ∈ Finset.Icc 1 n,
      if i % 3 = 0 then (0 : ZMod 3) else 1) =
        (((n - n / 3 : ℕ) : ZMod 3)) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ n + 1)]
      rw [ih]
      by_cases hmod : (n + 1) % 3 = 0
      · rw [if_pos hmod, add_zero]
        have hcount : (n + 1) - (n + 1) / 3 = n - n / 3 := by omega
        rw [hcount]
      · rw [if_neg hmod]
        have hcount : (n + 1) - (n + 1) / 3 = (n - n / 3) + 1 := by
          omega
        rw [hcount]
        push_cast
        ring

theorem cast_a_mod_three (n : ℕ) :
    (a n : ZMod 3) = (((n - n / 3 : ℕ) : ZMod 3)) := by
  simp only [a, Nat.cast_sum]
  calc
    (∑ x ∈ Finset.Icc 1 n,
      ((((x ^ 2) ^ ((n - x + 1) ^ 2) : ℕ) : ZMod 3))) =
        ∑ x ∈ Finset.Icc 1 n,
          if x % 3 = 0 then (0 : ZMod 3) else 1 := by
            apply Finset.sum_congr rfl
            intro i hi
            exact term_cast_mod_three n i hi
    _ = (((n - n / 3 : ℕ) : ZMod 3)) := indicator_sum_mod_three n

lemma cast_a_mod_nine_block (q r : ℕ) :
    (a (9 * q + r) : ZMod 3) = (((r - r / 3 : ℕ) : ZMod 3)) := by
  rw [cast_a_mod_three]
  have hcount :
      (9 * q + r) - (9 * q + r) / 3 = 6 * q + (r - r / 3) := by
    omega
  rw [hcount]
  push_cast
  rw [show (6 : ZMod 3) = 0 from
    (ZMod.natCast_eq_zero_iff 6 3).mpr (by norm_num)]
  ring

lemma zmod_three_square_cases :
    ∀ z : ZMod 3, IsSquare z → z = 0 ∨ z = 1 := by
  decide

theorem square_index_mod_nine (n : ℕ) (hsquare : IsSquare (a n)) :
    n % 9 = 0 ∨ n % 9 = 1 ∨ n % 9 = 4 ∨
      n % 9 = 5 ∨ n % 9 = 6 ∨ n % 9 = 8 := by
  obtain ⟨m, hm⟩ := hsquare
  have hcast_square : IsSquare ((a n : ℕ) : ZMod 3) := by
    refine ⟨(m : ZMod 3), ?_⟩
    simpa using congrArg (fun x : ℕ ↦ (x : ZMod 3)) hm
  have hs := zmod_three_square_cases _ hcast_square
  have hrlt : n % 9 < 9 := Nat.mod_lt _ (by norm_num)
  have hdecomp : n = 9 * (n / 9) + n % 9 := by omega
  have ha := cast_a_mod_nine_block (n / 9) (n % 9)
  rw [← hdecomp] at ha
  interval_cases hr : n % 9
  · omega
  · omega
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((2 : ZMod 3) = 0 ∨ (2 : ZMod 3) = 1)) hs
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((2 : ZMod 3) = 0 ∨ (2 : ZMod 3) = 1)) hs
  · omega
  · omega
  · omega
  · norm_num [hr] at ha
    rw [ha] at hs
    exfalso
    exact (by decide : ¬ ((5 : ZMod 3) = 0 ∨ (5 : ZMod 3) = 1)) hs
  · omega

theorem square_index_filters (n : ℕ) (hsquare : IsSquare (a n)) :
    (n % 16 = 0 ∨ n % 16 = 1 ∨ n % 16 = 7 ∨
      n % 16 = 8 ∨ n % 16 = 10 ∨ n % 16 = 15) ∧
    (n % 9 = 0 ∨ n % 9 = 1 ∨ n % 9 = 4 ∨
      n % 9 = 5 ∨ n % 9 = 6 ∨ n % 9 = 8) := by
  exact ⟨square_index_mod_sixteen n hsquare,
    square_index_mod_nine n hsquare⟩

#print axioms cast_a_mod_three
#print axioms square_index_mod_nine
#print axioms square_index_filters

end A113257Mod3Run20

