import OMAStatements.S_oeis_a329813
import Mathlib

/-!
Disproof of the universal arbitrary-seed six-distinct-limits conjecture,
OEIS A329813 / A329654 (one conjecture), due to Andres Cicuttin (2019).
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT
(GPT-6 Codex; the exact model variant is not exposed in this interface).
The scheduled NumberTheoryBot supplied the first proof candidate; the campaign
independently reviewed the entire source history, repaired its Lean proof, and
executed the pinned kernel check. The six-periodic seed-scaling law is already
stated in the OEIS comments; no novelty is claimed for that law.

Assume all allowed seeds give distinct residue limits. Scaling the first
seed by t multiplies residue limits by (1,1/t,1/t,1,t,t). Distinctness
ensures one of two selected pairs is nonzero. Choosing t as their ratio
forces a collision, contradicting the universal claim. No asymptotic
formula or numerical estimate for a limit is needed. The existence-only
claim and the fixed unit-seed distinctness claim are not refuted.
-/

noncomputable section

open Filter Topology
namespace A329813

def base : ℕ → ℝ
  | 0 => 1
  | 1 => 1
  | n+2 => ((n : ℝ)+2) * base (n+1) / base n

def recurrence (b : ℕ → ℝ) : Prop :=
  ∀ n : ℕ, b (n+2) = ((n : ℝ)+2) * b (n+1) / b n

def limitCycle (b : ℕ → ℝ) (c : ℕ → ℝ) : Prop :=
  (∀ i : ℕ, 0 < i → i < 7 →
    Tendsto (fun n : ℕ => b (6*n+i) / ((6*n+i : ℕ) : ℝ)) atTop (𝓝 (c i))) ∧
  (∀ i j : ℕ, 0 < i → i < j → j < 7 → c i ≠ c j)

def conjecture : Prop :=
  ∀ b : ℕ → ℝ, b 0 ≠ 0 → b 1 ≠ 0 → recurrence b → ∃ c, limitCycle b c

def scale (t : ℝ) (n : ℕ) : ℝ :=
  if n % 6 = 0 then t else
  if n % 6 = 1 then 1 else
  if n % 6 = 2 then t⁻¹ else
  if n % 6 = 3 then t⁻¹ else
  if n % 6 = 4 then 1 else t

lemma scale_ne (t : ℝ) (ht : t ≠ 0) (n : ℕ) : scale t n ≠ 0 := by
  unfold scale
  split_ifs <;> simp_all

lemma scale_mul (t : ℝ) (ht : t ≠ 0) (n : ℕ) :
    scale t (n+2) * scale t n = scale t (n+1) := by
  have hn : n % 6 < 6 := Nat.mod_lt _ (by decide)
  have h1 : (n+1)%6 = (n%6+1)%6 := by omega
  have h2 : (n+2)%6 = (n%6+2)%6 := by omega
  unfold scale
  rw [h1,h2]
  interval_cases h : n % 6 <;> norm_num [h, ht] <;> field_simp

def scaled (t : ℝ) (n : ℕ) : ℝ := scale t n * base n

lemma scaled_rec (t : ℝ) (ht : t ≠ 0) : recurrence (scaled t) := by
  intro n
  unfold scaled
  rw [base]
  have hs := scale_ne t ht n
  have hf : scale t (n+2) = scale t (n+1) / scale t n :=
    (eq_div_iff hs).2 (scale_mul t ht n)
  rw [hf]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

lemma scale_period (t : ℝ) (i n : ℕ) :
    scale t (6*n+i) = scale t i := by
  have h : (6*n+i)%6 = i%6 := by omega
  simp only [scale,h]

lemma scaled_limit (t : ℝ) (c : ℕ → ℝ) (hc : limitCycle base c)
    (i : ℕ) (hi : 0 < i) (hi' : i < 7) :
    Tendsto (fun n : ℕ => scaled t (6*n+i) / ((6*n+i : ℕ) : ℝ))
      atTop (𝓝 (scale t i * c i)) := by
  convert (tendsto_const_nhds.mul (hc.1 i hi hi')) using 1
  funext n
  rw [scaled, scale_period]
  ring

lemma scaled_constants (H : conjecture) (c : ℕ → ℝ) (hc : limitCycle base c)
    (t : ℝ) (ht : t ≠ 0) :
    ∃ d : ℕ → ℝ, limitCycle (scaled t) d ∧
      ∀ i : ℕ, 0 < i → i < 7 → d i = scale t i * c i := by
  have h0 : scaled t 0 ≠ 0 := by simpa [scaled,scale,base] using ht
  have h1 : scaled t 1 ≠ 0 := by norm_num [scaled,scale,base]
  obtain ⟨d,hd⟩ := H (scaled t) h0 h1 (scaled_rec t ht)
  refine ⟨d,hd,?_⟩
  intro i hi hi'
  exact tendsto_nhds_unique (hd.1 i hi hi') (scaled_limit t c hc i hi hi')

theorem disproof : ¬ conjecture := by
  intro H
  have hr : recurrence base := by intro n; rfl
  obtain ⟨c,hc⟩ := H base (by norm_num [base]) (by norm_num [base]) hr
  have hpair : c 1 ≠ 0 ∧ c 2 ≠ 0 ∨ c 4 ≠ 0 ∧ c 5 ≠ 0 := by
    by_cases h1 : c 1 = 0
    · right
      constructor
      · intro h4; exact hc.2 1 4 (by decide) (by decide) (by decide) (h1.trans h4.symm)
      · intro h5; exact hc.2 1 5 (by decide) (by decide) (by decide) (h1.trans h5.symm)
    · by_cases h2 : c 2 = 0
      · right
        constructor
        · intro h4; exact hc.2 2 4 (by decide) (by decide) (by decide) (h2.trans h4.symm)
        · intro h5; exact hc.2 2 5 (by decide) (by decide) (by decide) (h2.trans h5.symm)
      · exact Or.inl ⟨h1,h2⟩
  rcases hpair with ⟨h1,h2⟩ | ⟨h4,h5⟩
  · let t := c 2 / c 1
    have ht : t ≠ 0 := div_ne_zero h2 h1
    obtain ⟨d,hd,he⟩ := scaled_constants H c hc t ht
    apply hd.2 1 2 (by decide) (by decide) (by decide)
    rw [he 1 (by decide) (by decide),he 2 (by decide) (by decide)]
    norm_num [scale,t]
    field_simp
  · let t := c 4 / c 5
    have ht : t ≠ 0 := div_ne_zero h4 h5
    obtain ⟨d,hd,he⟩ := scaled_constants H c hc t ht
    apply hd.2 4 5 (by decide) (by decide) (by decide)
    rw [he 4 (by decide) (by decide),he 5 (by decide) (by decide)]
    norm_num [scale,t]
    field_simp

end A329813

theorem OMA.disproof : ¬ (type_of% @OMA.S_oeis_a329813.main) := by
  change ¬ A329813.conjecture
  exact A329813.disproof
