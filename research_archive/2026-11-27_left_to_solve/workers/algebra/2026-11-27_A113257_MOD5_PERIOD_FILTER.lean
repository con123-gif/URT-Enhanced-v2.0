import Mathlib

open BigOperators

namespace A113257Mod5Run21

def a (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.Icc 1 n, (i ^ 2) ^ ((n - i + 1) ^ 2)

lemma sq_cast_mod_five (i : ℕ) :
    ((i ^ 2 : ℕ) : ZMod 5) =
      if i % 5 = 0 then 0 else if i % 5 = 1 ∨ i % 5 = 4 then 1 else 4 := by
  have hi : i = 5 * (i / 5) + i % 5 := by omega
  have himod : i % 5 < 5 := Nat.mod_lt _ (by norm_num)
  interval_cases hr : i % 5
  · rw [if_pos rfl, hi]
    push_cast
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    ring
  · rw [if_neg (by omega), if_pos (by omega), hi]
    push_cast
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    ring
  · rw [if_neg (by omega), if_neg (by omega), hi]
    push_cast
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    ring_nf
  · rw [if_neg (by omega), if_neg (by omega), hi]
    push_cast
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    simpa only [zero_mul, zero_add] using (by decide : (3 : ZMod 5) ^ 2 = 4)
  · rw [if_neg (by omega), if_pos (by omega), hi]
    push_cast
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    simpa only [zero_mul, zero_add] using (by decide : (4 : ZMod 5) ^ 2 = 1)

lemma four_pow_even (e : ℕ) (he : Even e) : (4 : ZMod 5) ^ e = 1 := by
  have hfour : (4 : ZMod 5) = -1 := by decide
  calc
    (4 : ZMod 5) ^ e = (-1 : ZMod 5) ^ e := by rw [hfour]
    _ = 1 := he.neg_one_pow

lemma four_pow_odd (e : ℕ) (he : Odd e) : (4 : ZMod 5) ^ e = 4 := by
  have hfour : (4 : ZMod 5) = -1 := by decide
  calc
    (4 : ZMod 5) ^ e = (-1 : ZMod 5) ^ e := by rw [hfour]
    _ = -1 := he.neg_one_pow
    _ = 4 := hfour.symm

lemma term_cast_mod_five (n i : ℕ) (hi : i ∈ Finset.Icc 1 n) :
    ((((i ^ 2) ^ ((n - i + 1) ^ 2) : ℕ) : ZMod 5)) =
      if i % 5 = 0 then 0
      else if (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1) then 4 else 1 := by
  have hpos : 0 < n - i + 1 := by
    have := (Finset.mem_Icc.mp hi).2
    omega
  have hexp : (n - i + 1) ^ 2 ≠ 0 := by positivity
  rw [Nat.cast_pow, sq_cast_mod_five]
  have himod : i % 5 < 5 := Nat.mod_lt _ (by norm_num)
  interval_cases hr : i % 5
  · simp [hr, zero_pow hexp]
  · simp [hr]
  · simp only [hr, OfNat.ofNat_ne_zero, false_or, if_false, true_or, true_and]
    norm_num
    rcases Nat.even_or_odd (n - i + 1) with he | ho
    · have he' : Even ((n - i + 1) ^ 2) :=
        he.pow_of_ne_zero (by norm_num)
      rw [four_pow_even _ he']
      simp [Nat.not_odd_iff_even.mpr he]
    · have ho' : Odd ((n - i + 1) ^ 2) := Odd.pow ho
      rw [four_pow_odd _ ho']
      simp [ho]
  · simp only [hr, OfNat.ofNat_ne_zero, false_or, if_false, or_true, true_and]
    norm_num
    rcases Nat.even_or_odd (n - i + 1) with he | ho
    · have he' : Even ((n - i + 1) ^ 2) :=
        he.pow_of_ne_zero (by norm_num)
      rw [four_pow_even _ he']
      simp [Nat.not_odd_iff_even.mpr he]
    · have ho' : Odd ((n - i + 1) ^ 2) := Odd.pow ho
      rw [four_pow_odd _ ho']
      simp [ho]
  · simp [hr]

lemma nonmultiple_indicator_sum (n : ℕ) :
    (∑ i ∈ Finset.Icc 1 n,
      if i % 5 = 0 then (0 : ZMod 5) else 1) =
        (((n - n / 5 : ℕ) : ZMod 5)) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ n + 1)]
      rw [ih]
      by_cases hmod : (n + 1) % 5 = 0
      · rw [if_pos hmod, add_zero]
        have hcount : (n + 1) - (n + 1) / 5 = n - n / 5 := by omega
        rw [hcount]
      · rw [if_neg hmod]
        have hcount : (n + 1) - (n + 1) / 5 = (n - n / 5) + 1 := by omega
        rw [hcount]
        push_cast
        ring

lemma residue_indicator_sum (n c : ℕ) (hc1 : 1 ≤ c) (hc10 : c < 10) :
    (∑ i ∈ Finset.Icc 1 n,
      if i % 10 = c then (1 : ZMod 5) else 0) =
        ((((n + (10 - c)) / 10 : ℕ) : ZMod 5)) := by
  induction n with
  | zero =>
      have hlt : 10 - c < 10 := by omega
      norm_num [Nat.div_eq_of_lt hlt]
  | succ n ih =>
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ n + 1)]
      rw [ih]
      by_cases hmod : (n + 1) % 10 = c
      · rw [if_pos hmod]
        have hcount :
            (n + 1 + (10 - c)) / 10 = (n + (10 - c)) / 10 + 1 := by omega
        rw [hcount]
        push_cast
        ring
      · rw [if_neg hmod, add_zero]
        have hcount :
            (n + 1 + (10 - c)) / 10 = (n + (10 - c)) / 10 := by omega
        rw [hcount]

lemma odd_offset_iff_same_parity (n i : ℕ) (hi : i ≤ n) :
    Odd (n - i + 1) ↔ (Even n ↔ Even i) := by
  have heq : n - i + 1 = (n + 1) - i := by omega
  rw [heq]
  grind

lemma bad_residues_even (n i : ℕ) (hi : i ≤ n) (hn : Even n) :
    ((i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)) ↔
      (i % 10 = 2 ∨ i % 10 = 8) := by
  rw [odd_offset_iff_same_parity n i hi]
  simp only [hn, iff_true]
  rw [Nat.even_iff]
  have h5 : i % 5 = (i % 10) % 5 :=
    (Nat.mod_mod_of_dvd i (by norm_num : 5 ∣ 10)).symm
  have h2 : i % 2 = (i % 10) % 2 :=
    (Nat.mod_mod_of_dvd i (by norm_num : 2 ∣ 10)).symm
  rw [h5, h2]
  have hmod : i % 10 < 10 := Nat.mod_lt _ (by norm_num)
  interval_cases hr : i % 10 <;> norm_num

lemma bad_residues_odd (n i : ℕ) (hi : i ≤ n) (hn : Odd n) :
    ((i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)) ↔
      (i % 10 = 3 ∨ i % 10 = 7) := by
  rw [odd_offset_iff_same_parity n i hi]
  have hn' : ¬ Even n := Nat.not_even_iff_odd.mpr hn
  simp only [hn', false_iff, Nat.not_even_iff_odd]
  rw [Nat.odd_iff]
  have h5 : i % 5 = (i % 10) % 5 :=
    (Nat.mod_mod_of_dvd i (by norm_num : 5 ∣ 10)).symm
  have h2 : i % 2 = (i % 10) % 2 :=
    (Nat.mod_mod_of_dvd i (by norm_num : 2 ∣ 10)).symm
  rw [h5, h2]
  have hmod : i % 10 < 10 := Nat.mod_lt _ (by norm_num)
  interval_cases hr : i % 10 <;> norm_num

def badCount (n : ℕ) : ℕ :=
  if Even n then (n + 8) / 10 + (n + 2) / 10
  else (n + 7) / 10 + (n + 3) / 10

lemma bad_indicator_sum (n : ℕ) :
    (∑ i ∈ Finset.Icc 1 n,
      if (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)
      then (1 : ZMod 5) else 0) = (badCount n : ZMod 5) := by
  by_cases hn : Even n
  · rw [badCount, if_pos hn]
    calc
      (∑ i ∈ Finset.Icc 1 n,
        if (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)
        then (1 : ZMod 5) else 0) =
          ∑ i ∈ Finset.Icc 1 n,
            ((if i % 10 = 2 then (1 : ZMod 5) else 0) +
             (if i % 10 = 8 then (1 : ZMod 5) else 0)) := by
              apply Finset.sum_congr rfl
              intro i hi
              simp only [bad_residues_even n i (Finset.mem_Icc.mp hi).2 hn]
              by_cases h2 : i % 10 = 2 <;> by_cases h8 : i % 10 = 8 <;> simp [h2, h8]
      _ = (∑ i ∈ Finset.Icc 1 n, if i % 10 = 2 then (1 : ZMod 5) else 0) +
          (∑ i ∈ Finset.Icc 1 n, if i % 10 = 8 then (1 : ZMod 5) else 0) := by
            simp only [Finset.sum_add_distrib]
      _ = (((n + 8) / 10 : ℕ) : ZMod 5) + (((n + 2) / 10 : ℕ) : ZMod 5) := by
            rw [residue_indicator_sum n 2 (by omega) (by omega),
              residue_indicator_sum n 8 (by omega) (by omega)]
      _ = (((n + 8) / 10 + (n + 2) / 10 : ℕ) : ZMod 5) := by push_cast; ring
  · have hnodd : Odd n := Nat.not_even_iff_odd.mp hn
    rw [badCount, if_neg hn]
    calc
      (∑ i ∈ Finset.Icc 1 n,
        if (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)
        then (1 : ZMod 5) else 0) =
          ∑ i ∈ Finset.Icc 1 n,
            ((if i % 10 = 3 then (1 : ZMod 5) else 0) +
             (if i % 10 = 7 then (1 : ZMod 5) else 0)) := by
              apply Finset.sum_congr rfl
              intro i hi
              simp only [bad_residues_odd n i (Finset.mem_Icc.mp hi).2 hnodd]
              by_cases h3 : i % 10 = 3 <;> by_cases h7 : i % 10 = 7 <;> simp [h3, h7]
      _ = (∑ i ∈ Finset.Icc 1 n, if i % 10 = 3 then (1 : ZMod 5) else 0) +
          (∑ i ∈ Finset.Icc 1 n, if i % 10 = 7 then (1 : ZMod 5) else 0) := by
            simp only [Finset.sum_add_distrib]
      _ = (((n + 7) / 10 : ℕ) : ZMod 5) + (((n + 3) / 10 : ℕ) : ZMod 5) := by
            rw [residue_indicator_sum n 3 (by omega) (by omega),
              residue_indicator_sum n 7 (by omega) (by omega)]
      _ = (((n + 7) / 10 + (n + 3) / 10 : ℕ) : ZMod 5) := by push_cast; ring

theorem cast_a_mod_five (n : ℕ) :
    (a n : ZMod 5) = ((n - n / 5 : ℕ) : ZMod 5) + 3 * (badCount n : ZMod 5) := by
  simp only [a, Nat.cast_sum]
  calc
    (∑ i ∈ Finset.Icc 1 n,
      ((((i ^ 2) ^ ((n - i + 1) ^ 2) : ℕ) : ZMod 5))) =
        ∑ i ∈ Finset.Icc 1 n,
          ((if i % 5 = 0 then (0 : ZMod 5) else 1) +
           3 * (if (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)
             then (1 : ZMod 5) else 0)) := by
              apply Finset.sum_congr rfl
              intro i hi
              rw [term_cast_mod_five n i hi]
              by_cases h0 : i % 5 = 0
              · simp [h0]
              · rw [if_neg h0]
                by_cases hbad : (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)
                <;> norm_num [h0, hbad]
    _ = (∑ i ∈ Finset.Icc 1 n, if i % 5 = 0 then (0 : ZMod 5) else 1) +
        3 * (∑ i ∈ Finset.Icc 1 n,
          if (i % 5 = 2 ∨ i % 5 = 3) ∧ Odd (n - i + 1)
          then (1 : ZMod 5) else 0) := by
            simp only [Finset.sum_add_distrib, Finset.mul_sum]
    _ = ((n - n / 5 : ℕ) : ZMod 5) + 3 * (badCount n : ZMod 5) := by
          rw [nonmultiple_indicator_sum, bad_indicator_sum]

lemma cast_a_mod_fifty_block (q r : ℕ) (hr : r < 50) :
    (a (50 * q + r) : ZMod 5) = (a r : ZMod 5) := by
  rw [cast_a_mod_five, cast_a_mod_five]
  have hparity : Even (50 * q + r) ↔ Even r := by grind
  unfold badCount
  by_cases he : Even r
  · rw [if_pos he, if_pos (hparity.mpr he)]
    have h1 : (50 * q + r) - (50 * q + r) / 5 =
        40 * q + (r - r / 5) := by omega
    have h2 : (50 * q + r + 8) / 10 = 5 * q + (r + 8) / 10 := by omega
    have h3 : (50 * q + r + 2) / 10 = 5 * q + (r + 2) / 10 := by omega
    rw [h1, h2, h3]
    push_cast
    rw [show (40 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 40 5).mpr (by norm_num)]
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    ring
  · rw [if_neg he, if_neg (fun h ↦ he (hparity.mp h))]
    have h1 : (50 * q + r) - (50 * q + r) / 5 =
        40 * q + (r - r / 5) := by omega
    have h2 : (50 * q + r + 7) / 10 = 5 * q + (r + 7) / 10 := by omega
    have h3 : (50 * q + r + 3) / 10 = 5 * q + (r + 3) / 10 := by omega
    rw [h1, h2, h3]
    push_cast
    rw [show (40 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 40 5).mpr (by norm_num)]
    rw [show (5 : ZMod 5) = 0 from
      (ZMod.natCast_eq_zero_iff 5 5).mpr (by norm_num)]
    ring

lemma cast_a_add_twentyfive_small (r : ℕ) (hr : r < 25) :
    (a (r + 25) : ZMod 5) = (a r : ZMod 5) := by
  interval_cases r <;>
    rw [cast_a_mod_five, cast_a_mod_five] <;>
    norm_num [badCount, Nat.even_iff] <;>
    decide

-- The source-derived closed formula is constant on each class modulo 25.
lemma cast_a_mod_twentyfive_block (q r : ℕ) (hr : r < 25) :
    (a (25 * q + r) : ZMod 5) = (a r : ZMod 5) := by
  rcases Nat.even_or_odd q with hq | hq
  · obtain ⟨k, rfl⟩ := hq
    convert cast_a_mod_fifty_block k r (by omega) using 1 <;> ring
  · obtain ⟨k, rfl⟩ := hq
    calc
      (a (25 * (2 * k + 1) + r) : ZMod 5) = a (r + 25) := by
        convert cast_a_mod_fifty_block k (r + 25) (by omega) using 1 <;> ring
      _ = a r := cast_a_add_twentyfive_small r hr

lemma zmod_five_square_cases :
    ∀ z : ZMod 5, IsSquare z → z = 0 ∨ z = 1 ∨ z = 4 := by
  decide

theorem square_index_mod_twentyfive (n : ℕ) (hsquare : IsSquare (a n)) :
    n % 25 = 0 ∨ n % 25 = 1 ∨ n % 25 = 2 ∨ n % 25 = 3 ∨
    n % 25 = 9 ∨ n % 25 = 10 ∨ n % 25 = 11 ∨ n % 25 = 12 ∨
    n % 25 = 13 ∨ n % 25 = 14 ∨ n % 25 = 15 ∨ n % 25 = 17 ∨
    n % 25 = 21 ∨ n % 25 = 23 ∨ n % 25 = 24 := by
  obtain ⟨m, hm⟩ := hsquare
  have hcast_square : IsSquare ((a n : ℕ) : ZMod 5) := by
    refine ⟨(m : ZMod 5), ?_⟩
    simpa using congrArg (fun x : ℕ ↦ (x : ZMod 5)) hm
  have hs := zmod_five_square_cases _ hcast_square
  have hrlt : n % 25 < 25 := Nat.mod_lt _ (by norm_num)
  have hdecomp : n = 25 * (n / 25) + n % 25 := by omega
  have ha := cast_a_mod_twentyfive_block (n / 25) (n % 25) hrlt
  have har := cast_a_mod_five (n % 25)
  rw [← hdecomp] at ha
  interval_cases hr : n % 25
  all_goals try omega
  all_goals norm_num [badCount, Nat.even_iff] at har
  all_goals rw [ha, har] at hs
  all_goals exfalso
  all_goals revert hs
  all_goals decide

#print axioms cast_a_mod_five
#print axioms cast_a_mod_fifty_block
#print axioms cast_a_mod_twentyfive_block
#print axioms square_index_mod_twentyfive

end A113257Mod5Run21
