import OMAStatements.S_oeis_a372556

/-!
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
Conjecture: Antti Karttunen, OEIS A372556, May 10, 2024.
Jacobsthal identities and the local three-coin exchange are classical;
see A. F. Horadam, Jacobsthal Representation Numbers, Fibonacci Quarterly
34.1 (1996), 40-54. Carlitz, Scoville and Hoggatt (1972) study canonical
distinct-summand representations, which need not minimize cardinality.
The present proof uses a score-maximal minimum-cardinality representation
and an additional four-coin exchange to obtain the full largest-two-coin
conclusion. No claim of a new general method or global priority is made.
-/

namespace A372556Certificate
open OMA.S_oeis_a372556

@[simp] lemma value_zero : value 0 = 0 := rfl
@[simp] lemma value_add (a b : Multiset ℕ) : value (a + b) = value a + value b := by
  simp [value]
@[simp] lemma value_single (a : ℕ) : value {a} = jac a := by simp [value]
@[simp] lemma value_replicate (k a : ℕ) : value (Multiset.replicate k a) = k * jac a := by
  simp [value, Multiset.map_replicate, Multiset.sum_replicate, nsmul_eq_mul]

lemma alt_step (n : ℕ) :
    (n % 2 = 0 → jac (n + 1) = 2 * jac n + 1) ∧
    (n % 2 = 1 → 2 * jac n = jac (n + 1) + 1) := by
  induction n with
  | zero => norm_num [jac]
  | succ n ih =>
    have hr : jac (n + 2) = jac (n + 1) + 2 * jac n := rfl
    rcases Nat.mod_two_eq_zero_or_one n with h | h
    · have hh := ih.1 h
      constructor
      · intro hn
        omega
      · intro hn
        change 2 * jac (n + 1) = jac (n + 2) + 1
        rw [hr]
        omega
    · have hh := ih.2 h
      constructor
      · intro hn
        change jac (n + 2) = 2 * jac (n + 1) + 1
        rw [hr]
        omega
      · intro hn
        omega

lemma even_quad {i : ℕ} (hi : i % 2 = 0) : jac (i + 2) = 4 * jac i + 1 := by
  have h := (alt_step i).1 hi
  have hr : jac (i + 2) = jac (i + 1) + 2 * jac i := rfl
  omega

lemma jac_mono : Monotone jac := by
  apply monotone_nat_of_le_succ
  intro n
  cases n with
  | zero => norm_num [jac]
  | succ n =>
    change jac (n + 1) ≤ jac (n + 1) + 2 * jac n
    omega

lemma jac_pos {i : ℕ} (hi : 1 ≤ i) : 0 < jac i := by
  have h := jac_mono hi
  norm_num [jac] at h
  omega

lemma jac_strict {i : ℕ} (hi : 2 ≤ i) : jac i < jac (i + 1) := by
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le hi
  have hp := jac_pos (i := j + 1) (by omega)
  have hh : jac (j + 2) < jac (j + 3) := by
    have hr : jac (j + 3) = jac (j + 2) + 2 * jac (j + 1) := rfl
    omega
  convert hh using 1 <;> congr 1 <;> omega

lemma index_le (i : ℕ) : i ≤ jac i + 1 := by
  induction i with
  | zero => omega
  | succ i ih =>
    by_cases h : i < 2
    · interval_cases i <;> norm_num [jac]
    · have hs := jac_strict (i := i) (by omega)
      omega

lemma member_value_le {m : Multiset ℕ} {i : ℕ} (hi : i ∈ m) : jac i ≤ value m := by
  exact Multiset.single_le_sum (fun x _ => Nat.zero_le x) (jac i)
    (Multiset.mem_map.mpr ⟨i, hi, rfl⟩)

lemma represents_bound {n : ℕ} {m : Multiset ℕ} (hm : represents n m) {i : ℕ}
    (hi : i ∈ m) : i ≤ n + 1 := by
  have hv := member_value_le hi
  have hin := index_le i
  rw [hm.2] at hv
  omega

lemma represents_ones (n : ℕ) : represents n (Multiset.replicate n 2) := by
  constructor
  · intro i hi
    have he : i = 2 := (Multiset.mem_replicate.mp hi).2
    omega
  · simp [jac]

lemma exists_optimal (n : ℕ) : ∃ m, optimal n m := by
  classical
  let P : ℕ → Prop := fun k => ∃ m, represents n m ∧ m.card = k
  have hP : ∃ k, P k := ⟨n, Multiset.replicate n 2, represents_ones n, by simp⟩
  obtain ⟨m, hm, hcard⟩ := Nat.find_spec hP
  refine ⟨m, hm, ?_⟩
  intro r hr
  rw [hcard]
  exact Nat.find_min' hP ⟨r, hr, rfl⟩

def score (m : Multiset ℕ) : ℕ := (m.map fun i => 5 ^ i).sum
@[simp] lemma score_zero : score 0 = 0 := rfl
@[simp] lemma score_add (a b : Multiset ℕ) : score (a + b) = score a + score b := by
  simp [score]
@[simp] lemma score_single (a : ℕ) : score {a} = 5 ^ a := by simp [score]
@[simp] lemma score_replicate (k a : ℕ) : score (Multiset.replicate k a) = k * 5 ^ a := by
  simp [score, Multiset.map_replicate, Multiset.sum_replicate, nsmul_eq_mul]

lemma score_bound {n : ℕ} {m : Multiset ℕ} (hm : represents n m) (hc : m.card ≤ n) :
    score m ≤ n * 5 ^ (n + 1) := by
  have hx : ∀ x ∈ m.map (fun i => 5 ^ i), x ≤ 5 ^ (n + 1) := by
    intro x hx
    obtain ⟨i, hi, rfl⟩ := Multiset.mem_map.mp hx
    exact Nat.pow_le_pow_right (by omega) (represents_bound hm hi)
  have hs := Multiset.sum_le_card_nsmul (m.map fun i => 5 ^ i) (5 ^ (n + 1)) hx
  simp only [Multiset.card_map, nsmul_eq_mul] at hs
  exact hs.trans (Nat.mul_le_mul_right _ hc)

def best (n : ℕ) (m : Multiset ℕ) : Prop :=
  optimal n m ∧ ∀ r, represents n r → r.card ≤ m.card → score r ≤ score m

lemma exists_best (n : ℕ) : ∃ m, best n m := by
  classical
  obtain ⟨m, hm⟩ := exists_optimal n
  have hmn : m.card ≤ n := by
    simpa using hm.2 _ (represents_ones n)
  let P : ℕ → Prop := fun s => ∃ r, represents n r ∧ r.card ≤ m.card ∧ score r = s
  have hp : P (score m) := ⟨m, hm.1, le_rfl, rfl⟩
  have hs := score_bound hm.1 hmn
  obtain ⟨r, hr, hrc, hscore⟩ := Nat.findGreatest_spec hs hp
  refine ⟨r, ⟨hr, ?_⟩, ?_⟩
  · intro t ht
    exact hrc.trans (hm.2 t ht)
  · intro t ht htc
    by_contra hh
    have hts : Nat.findGreatest P (n * 5 ^ (n + 1)) < score t := by omega
    have htn : t.card ≤ n := htc.trans (hrc.trans hmn)
    have htsb := score_bound ht htn
    have htp : P (score t) := ⟨t, ht, htc.trans hrc, rfl⟩
    exact Nat.findGreatest_is_greatest hts htsb htp

lemma replacement_impossible {n : ℕ} {m old new : Multiset ℕ}
    (hm : best n m) (hle : old ≤ m) (hnew : ∀ i ∈ new, 2 ≤ i)
    (hv : value old = value new) (hc : new.card ≤ old.card)
    (hs : score old < score new) : False := by
  obtain ⟨r, hr⟩ := Multiset.le_iff_exists_add.mp hle
  have hrep : represents n (new + r) := by
    constructor
    · intro i hi
      rcases Multiset.mem_add.mp hi with hi | hi
      · exact hnew i hi
      · apply hm.1.1.1 i
        rw [hr]
        exact Multiset.mem_add.mpr (Or.inr hi)
    · have hn := hm.1.1.2
      rw [hr, value_add, hv] at hn
      simpa using hn
  have hcard : (new + r).card ≤ m.card := by
    rw [hr]
    simp only [Multiset.card_add]
    omega
  have hb := hm.2 _ hrep hcard
  rw [hr, score_add, score_add] at hb
  omega

end A372556Certificate

namespace A372556Certificate
open OMA.S_oeis_a372556

/-- An at-most-four-coin representation of one less than a denomination. -/
def predCoins (i : ℕ) : Multiset ℕ :=
  if i = 2 then 0 else
  if i % 2 = 1 then Multiset.replicate 2 (i - 1)
  else Multiset.replicate 4 (i - 2)

lemma predCoins_spec {i : ℕ} (hi : 2 ≤ i) :
    (∀ j ∈ predCoins i, 2 ≤ j) ∧ (predCoins i).card ≤ 4 ∧
      value (predCoins i) + 1 = jac i := by
  unfold predCoins
  split_ifs with h2 ho
  · subst i
    norm_num [jac]
  · have hh : 3 ≤ i := by omega
    have hp := (alt_step (i - 1)).1 (by omega)
    have he : i - 1 + 1 = i := by omega
    rw [he] at hp
    refine ⟨?_, by simp, ?_⟩
    · intro j hj
      have he := (Multiset.mem_replicate.mp hj).2
      omega
    · simp only [value_replicate]
      omega
  · have hh : 4 ≤ i := by omega
    have hp := even_quad (i := i - 2) (by omega)
    have he : i - 2 + 2 = i := by omega
    rw [he] at hp
    refine ⟨?_, by simp, ?_⟩
    · intro j hj
      have he := (Multiset.mem_replicate.mp hj).2
      omega
    · simp only [value_replicate]
      omega

lemma odd_count {n : ℕ} {m : Multiset ℕ} (hm : best n m)
    {i : ℕ} (hi : 2 ≤ i) (ho : i % 2 = 1) : m.count i ≤ 1 := by
  by_contra hh
  have hle : Multiset.replicate 2 i ≤ m :=
    Multiset.le_count_iff_replicate_le.mp (by omega)
  have hs : score (Multiset.replicate 2 i) < score ({i + 1} + {2}) := by
    simp only [score_replicate, score_add, score_single, pow_succ]
    have hp : 0 < 5 ^ i := by positivity
    norm_num
    omega
  apply replacement_impossible hm hle (new := {i + 1} + {2}) ?_ ?_ (by simp) hs
  · intro j hj
    simp only [Multiset.mem_add, Multiset.mem_singleton] at hj
    omega
  · simp only [value_replicate, value_add, value_single]
    have hp := (alt_step i).2 ho
    norm_num [jac]
    omega

lemma even_exchange {n : ℕ} {m : Multiset ℕ} (hm : best n m)
    {i l : ℕ} (hi : 2 ≤ i) (he : i % 2 = 0) (hl : 2 ≤ l) (hli : l ≤ i)
    (hle : Multiset.replicate 4 i + {l} ≤ m) : False := by
  have hp := predCoins_spec hl
  have hsold : score (Multiset.replicate 4 i + {l}) ≤ 5 * 5 ^ i := by
    simp only [score_add, score_replicate, score_single]
    have hh : 5 ^ l ≤ 5 ^ i := Nat.pow_le_pow_right (by omega) hli
    omega
  have hsnew : 5 ^ (i + 2) ≤ score ({i + 2} + predCoins l) := by
    simp only [score_add, score_single]
    omega
  have hpow : 5 ^ (i + 2) = 25 * 5 ^ i := by rw [pow_add]; norm_num; omega
  have hpos : 0 < 5 ^ i := by positivity
  have hs : score (Multiset.replicate 4 i + {l}) < score ({i + 2} + predCoins l) := by
    omega
  apply replacement_impossible hm hle (new := {i + 2} + predCoins l) ?_ ?_ ?_ hs
  · intro j hj
    rcases Multiset.mem_add.mp hj with hj | hj
    · have hj := Multiset.mem_singleton.mp hj
      omega
    · exact hp.1 j hj
  · simp only [value_add, value_replicate, value_single]
    have hq := even_quad he
    omega
  · simp only [Multiset.card_add, Multiset.card_replicate, Multiset.card_singleton]
    omega

lemma even_count {n : ℕ} {m : Multiset ℕ} (hm : best n m)
    {i : ℕ} (hi : 2 ≤ i) (he : i % 2 = 0) :
    m.count i ≤ 4 ∧ (m.count i = 4 → ∀ l, l < i → m.count l = 0) := by
  constructor
  · by_contra hh
    apply even_exchange hm hi he hi le_rfl
    apply Multiset.le_iff_count.mpr
    intro x
    by_cases hx : x = i
    · subst x
      simp only [Multiset.count_add, Multiset.count_replicate_self,
        Multiset.count_singleton_self]
      omega
    · simp [hx]
  · intro h4 l hli
    by_contra hh
    have hl : l ∈ m := Multiset.count_pos.mp (by omega)
    have hl2 := hm.1.1.1 l hl
    apply even_exchange hm hi he hl2 (by omega)
    apply Multiset.le_iff_count.mpr
    intro x
    by_cases hxi : x = i
    · subst x
      simp [show i ≠ l by omega, h4]
    · by_cases hxl : x = l
      · subst x
        simp only [Multiset.count_add, Multiset.count_singleton_self]
        simp [show l ≠ i by omega]
        omega
      · simp [hxi, hxl]

lemma adjacent_count {n : ℕ} {m : Multiset ℕ} (hm : best n m)
    {i : ℕ} (hi : 2 ≤ i) (hc : 2 ≤ m.count i) : m.count (i + 1) = 0 := by
  by_contra hh
  have hle : Multiset.replicate 2 i + {i + 1} ≤ m := by
    apply Multiset.le_iff_count.mpr
    intro x
    by_cases hxi : x = i
    · subst x
      simp [hc, show i ≠ i + 1 by omega]
    · by_cases hxi1 : x = i + 1
      · subst x
        simp [show i + 1 ≠ i by omega]
        omega
      · simp [hxi, hxi1]
  have hs : score (Multiset.replicate 2 i + {i + 1}) < score {i + 2} := by
    simp only [score_add, score_replicate, score_single]
    simp only [pow_add, pow_one]
    norm_num
    have hp : 0 < 5 ^ i := by positivity
    omega
  apply replacement_impossible hm hle (new := {i + 2}) ?_ ?_ (by simp) hs
  · intro j hj
    have he := Multiset.mem_singleton.mp hj
    omega
  · simp only [value_add, value_replicate, value_single]
    have hr : jac (i + 2) = jac (i + 1) + 2 * jac i := rfl
    omega

lemma low_count {n : ℕ} {m : Multiset ℕ} (hm : represents n m) {i : ℕ}
    (hi : i < 2) : m.count i = 0 := by
  apply Multiset.count_eq_zero.mpr
  intro hh
  have h := hm.1 i hh
  omega

def partialValue (m : Multiset ℕ) (h : ℕ) : ℕ :=
  ∑ i ∈ Finset.range (h + 1), m.count i * jac i

lemma partialValue_succ (m : Multiset ℕ) (h : ℕ) :
    partialValue m (h + 1) = partialValue m h + m.count (h + 1) * jac (h + 1) := by
  simp [partialValue, Finset.sum_range_succ, Nat.add_assoc]

lemma partialValue_bound {n : ℕ} {m : Multiset ℕ} (hm : best n m) (h : ℕ) :
    (h % 2 = 0 → partialValue m h + 1 ≤ jac (h + 2)) ∧
    (h % 2 = 1 → partialValue m h + 1 ≤ jac (h + 1)) := by
  induction h using Nat.strong_induction_on with
  | h h ih =>
    by_cases hlo : h < 2
    · have hc0 := low_count hm.1.1 (i := 0) (by omega)
      have hc1 := low_count hm.1.1 (i := 1) (by omega)
      interval_cases h <;> norm_num [partialValue, Finset.sum_range_succ, jac, hc0, hc1]
    · have hh : 2 ≤ h := by omega
      have hstep : partialValue m h = partialValue m (h - 1) + m.count h * jac h := by
        have heq : h - 1 + 1 = h := by omega
        simpa only [heq] using partialValue_succ m (h - 1)
      rcases Nat.mod_two_eq_zero_or_one h with he | ho
      · have hip := (ih (h - 1) (by omega)).2 (by omega)
        have heq : h - 1 + 1 = h := by omega
        rw [heq] at hip
        have hc := even_count hm hh he
        have hq := even_quad he
        have hres : partialValue m h + 1 ≤ jac (h + 2) := by
          by_cases h4 : m.count h = 4
          · have hz : partialValue m (h - 1) = 0 := by
              apply Finset.sum_eq_zero
              intro i hi
              have hil : i < h := by
                have hi := Finset.mem_range.mp hi
                omega
              rw [hc.2 h4 i hil]
              simp
            rw [hstep, hz, h4]
            omega
          · have hc3 : m.count h ≤ 3 := by omega
            have hmul := Nat.mul_le_mul_right (jac h) hc3
            omega
        exact ⟨fun _ => hres, by intro hbad; omega⟩
      · have hc := odd_count hm hh ho
        have hip := (ih (h - 1) (by omega)).1 (by omega)
        have heq : h - 1 + 2 = h + 1 := by omega
        rw [heq] at hip
        have hres : partialValue m h + 1 ≤ jac (h + 1) := by
          by_cases h0 : m.count h = 0
          · rw [hstep, h0]
            simpa using hip
          · have h1 : m.count h = 1 := by omega
            have hh3 : 3 ≤ h := by omega
            have ha : m.count (h - 1) ≤ 1 := by
              by_contra hbad
              have hc2 : 2 ≤ m.count (h - 1) := by omega
              have hadj := adjacent_count hm (i := h - 1) (by omega) hc2
              have heq : h - 1 + 1 = h := by omega
              rw [heq] at hadj
              omega
            have hi2 := (ih (h - 2) (by omega)).2 (by omega)
            have heq2 : h - 2 + 1 = h - 1 := by omega
            rw [heq2] at hi2
            have hstep2 : partialValue m (h - 1) =
                partialValue m (h - 2) + m.count (h - 1) * jac (h - 1) := by
              have heq : h - 2 + 1 = h - 1 := by omega
              simpa only [heq] using partialValue_succ m (h - 2)
            have hmul := Nat.mul_le_mul_right (jac (h - 1)) ha
            have hj : jac (h + 1) = jac h + 2 * jac (h - 1) := by
              have hr : jac ((h - 1) + 2) =
                  jac ((h - 1) + 1) + 2 * jac (h - 1) := rfl
              have heq1 : h - 1 + 1 = h := by omega
              have heq2 : h - 1 + 2 = h + 1 := by omega
              simpa only [heq1, heq2] using hr
            rw [hstep, hstep2, h1]
            omega
        exact ⟨by intro hbad; omega, fun _ => hres⟩

lemma value_eq_partialValue {m : Multiset ℕ} {h : ℕ} (hm : ∀ i ∈ m, i ≤ h) :
    value m = partialValue m h := by
  unfold value partialValue
  rw [Finset.sum_multiset_map_count]
  simp only [nsmul_eq_mul]
  apply Finset.sum_subset
  · intro i hi
    exact Finset.mem_range.mpr (by have hh := hm i (Multiset.mem_toFinset.mp hi); omega)
  · intro i hi hnot
    have hn : i ∉ m := by simpa using hnot
    rw [Multiset.count_eq_zero.mpr hn]
    simp

end A372556Certificate

namespace A372556Certificate
open OMA.S_oeis_a372556

lemma binary_formula (n : ℕ) :
    3 * jac n + (if n % 2 = 0 then 1 else 0) =
      2 ^ n + (if n % 2 = 1 then 1 else 0) := by
  induction n with
  | zero => norm_num [jac]
  | succ n ih =>
    rcases Nat.mod_two_eq_zero_or_one n with he | ho
    · have hn : (n + 1) % 2 = 1 := by omega
      have hs := (alt_step n).1 he
      simp only [he, hn, show ¬ (0 = 1) by decide, show ¬ (1 = 0) by decide,
        ↓reduceIte] at ih ⊢
      rw [pow_succ]
      omega
    · have hn : (n + 1) % 2 = 0 := by omega
      have hs := (alt_step n).2 ho
      simp only [ho, hn, show ¬ (0 = 1) by decide, show ¬ (1 = 0) by decide,
        ↓reduceIte] at ih ⊢
      rw [pow_succ]
      omega

lemma greedy_bounds {n : ℕ} (hn : 0 < n) :
    2 ≤ greedyIndex n ∧ jac (greedyIndex n) ≤ n ∧ n < jac (greedyIndex n + 1) := by
  have hn0 : 3 * n + 1 ≠ 0 := by omega
  have hg2 : 2 ≤ greedyIndex n := by
    apply (Nat.le_log_iff_pow_le (by decide : 1 < 2) hn0).2
    norm_num
    omega
  have hlo : 2 ^ greedyIndex n ≤ 3 * n + 1 :=
    (Nat.le_log_iff_pow_le (by decide : 1 < 2) hn0).1 le_rfl
  have hhi : 3 * n + 1 < 2 ^ (greedyIndex n + 1) :=
    (Nat.log_lt_iff_lt_pow (by decide : 1 < 2) hn0).1 (by unfold greedyIndex; omega)
  have ha := binary_formula (greedyIndex n)
  have hb := binary_formula (greedyIndex n + 1)
  rcases Nat.mod_two_eq_zero_or_one (greedyIndex n) with he | ho
  · have hs : (greedyIndex n + 1) % 2 = 1 := by omega
    simp [he, hs] at ha hb
    exact ⟨hg2, by omega, by omega⟩
  · have hs : (greedyIndex n + 1) % 2 = 0 := by omega
    simp [ho, hs] at ha hb
    exact ⟨hg2, by omega, by omega⟩

lemma fullMain : optimal 0 0 ∧ ∀ n : ℕ, 0 < n →
    ∃ m : Multiset ℕ, optimal n m ∧
      (greedyIndex n ∈ m ∨ greedyIndex n - 1 ∈ m) := by
  constructor
  · refine ⟨⟨by simp, rfl⟩, ?_⟩
    intro r hr
    simp
  · intro n hn
    obtain ⟨m, hm⟩ := exists_best n
    have hg := greedy_bounds hn
    refine ⟨m, hm.1, ?_⟩
    by_contra hh
    have hnot : greedyIndex n ∉ m ∧ greedyIndex n - 1 ∉ m := by tauto
    have hbound : ∀ i ∈ m, i ≤ greedyIndex n - 2 := by
      intro i hi
      have hv := member_value_le hi
      rw [hm.1.1.2] at hv
      have hig : i ≤ greedyIndex n := by
        by_contra hbad
        have hj := jac_mono (show greedyIndex n + 1 ≤ i by omega)
        omega
      have hni : i ≠ greedyIndex n := by intro he; subst i; exact hnot.1 hi
      have hni1 : i ≠ greedyIndex n - 1 := by intro he; subst i; exact hnot.2 hi
      omega
    have hp := value_eq_partialValue hbound
    rw [hm.1.1.2] at hp
    have hb := partialValue_bound hm (greedyIndex n - 2)
    rcases Nat.mod_two_eq_zero_or_one (greedyIndex n - 2) with he | ho
    · have hbs := hb.1 he
      have heq : greedyIndex n - 2 + 2 = greedyIndex n := by omega
      rw [heq] at hbs
      omega
    · have hbs := hb.2 ho
      have hj := jac_mono (show greedyIndex n - 2 + 1 ≤ greedyIndex n by omega)
      omega

end A372556Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a372556.main := by
  exact A372556Certificate.fullMain
