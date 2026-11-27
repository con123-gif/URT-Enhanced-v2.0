import New.Selmer.FitTwistsExist

open Finset Real Data

/-!
RUN87 — finite arithmetic telescope and the actual second C1 budget.
27 Nov 2026. Source-matched human derivation; native candidate NOT RUN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7; spine
40aaf0afcc897a74d688bd6e9bae708428ffdabd; LIVE_OBLIGATIONS read (C1/V1).
Peer head inspected 2e986ce9; RUN83–86 and actual source read.
Shared run 46055305146: pick succeeded, C1 job and Run job step in
progress, artifact upload pending; both state branch status.json and
outputs/c1_native_results.json returned 404. Do not duplicate build.
Local command -v lean/lake returned no paths; 30 GB free scratch.
No native rh_scan/prune/reduce/auto/frontier or axiom audit run here.

Sources (grh-compact/src):
 New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:
 both budgets, original sum_le_hasSum invocation, exact factorization L,
 same fit-family consumer.
 New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c:
 crudeUnit is NNReal, v_l(M)+2^(-l).
 New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3:
 M=chosenGroupOrder nonzero, log M upper exp(32 logX).
 New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834:
 scale, x.
 New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825:
 IsFitFamily, second height field.
 RUN83 and RUN86 already establish the numerical 3/4 bound and
 scale comparison in human mathematics. Do NOT treat those as native
 replay. New step: replace the infinite summability argument by a
 finite telescope at the actual finite-prime quantifier and prepare
 a native bridge to the previously unimplemented second budget.

For any N >= 0, put w(n)=n/2^n and
 F(N)=2-2(N+1)/2^N.
 Then F(0)=0 and F(N+1)-F(N)=w(N) exactly.
 Hence sum_(0<=n<N) w(n)=F(N)<=2. For a finite prime set T
 choose N>max(T union {1}); 1 is not prime, and all w(n)>=0.
 Therefore sum_T w(n)+w(1)<=F(N), so sum_T w(n)<=3/2.
 For every prime l>=2, log l=log(l/2)+log 2<=l/2 using
 log x<=x-1 for x>0 and log 2<=1. Thus
 sigma_T=sum_T 2^(-l) log l<=3/4.
 No infinite sum, convergence interchange, geometric-series API, or
 limiting index is needed. Empty T works with N=2. The exclusion of 1
 matters: at T={1,2,3,4,5,6,7,8}, sum w = 251/128? compute exactly
 by F(9)=2-20/512=251/128 > 3/2. This is a control for the finite
 majorant, NOT a claim that the logarithmic sum fails for this T.

For the SAME native D and M, the exact real-cast identity is
  sum_T 9*crudeUnit_l*log l
   =9*(sum_T v_l(M)*log l + sigma_T)
   <=9*(log^+ M+3/4).
 The native factorization inequality L is copied from the original
 supplier, not from its desired fit-family conclusion. RUN86 has
 the human scale inequality 9*(log M+3/4)<=x^999:
 U=logX>=100; log M<=exp(32U); 9(exp(32U)+3/4)<=exp(999U).
 M>0, log^+ M=log M. The final size premise remains explicit in
 this executable candidate; it must be supplied from the actual D
 at native replay. Together with RUN85/86's first budget, this
 connects exactly to the two inputs of exists_isFitFamily_of_budget_run84.
 No new witness, no altered row, no changed modulus.

Original source-visible edges: finite prime budget -> L and
 log_le_self -> sum_le_hasSum/geometric series -> native scales.
 Candidate: finite prime budget -> L and log tangent -> finite
 telescope + subset bound -> same scales. Only a local replacement;
 not a claim that analytic summability disappears from the whole
 kernel dependency closure. Keep original and reduced graphs, and
 all crystalline, odd-Sha, row, denominator and height suppliers.
 No original theorem used to prove a new budget. No RH import.
 No URT performance claim.

RESUME HERE: inspect the final shared C1 receipt and its first actual
 compiler failure if any; if RUN84 succeeds, concatenate RUN85–87
 candidates in the same authenticated compact cache and replay the
 exact two-budget adapter, retaining the explicit scale premises
 until their native adapters elaborate. No new queue entry this run.
 HANDOFF TO integration/editor, Galois, kernel/audit.
-/

namespace RHGaloisRun87

/-- Finite telescope, stronger than the bound needed by the caller. -/
lemma finite_weighted_range (N : ℕ) :
    (∑ n ∈ range N, (n : ℝ) * (1/2 : ℝ)^n) =
      2 - 2 * ((N : ℝ) + 1) * (1/2 : ℝ)^N := by
  induction N with
  | zero => norm_num
  | succ N ih =>
    rw [sum_range_succ, ih, pow_succ]
    push_cast
    ring

lemma finite_prime_weighted (T : Finset ℕ)
    (hT : ∀ l ∈ T, Nat.Prime l) :
    (∑ l ∈ T, (l : ℝ) * (1/2 : ℝ)^l) ≤ 3/2 := by
  have h1 : 1 ∉ T := fun h => Nat.not_prime_one (hT 1 h)
  let N := T.sup id + 2
  have hs : insert 1 T ⊆ range N := by
    intro n hn
    rw [mem_range]
    rcases mem_insert.mp hn with rfl | hn
    · dsimp [N]; omega
    · have hn' : n ≤ T.sup id := Finset.le_sup (f := id) hn
      dsimp [N]; omega
  have hsum := sum_le_sum_of_subset_of_nonneg hs
    (fun n _ _ => by positivity : ∀ n ∈ range N, n ∉ insert 1 T →
      0 ≤ (n : ℝ) * (1/2 : ℝ)^n)
  rw [sum_insert h1, finite_weighted_range] at hsum
  norm_num at hsum
  have hp : 0 ≤ 2 * ((N : ℝ) + 1) * (1/2 : ℝ)^N := by positivity
  linarith

lemma log_le_half_of_two_le (l : ℕ) (hl : 2 ≤ l) :
    log (l : ℝ) ≤ (l : ℝ)/2 := by
  have hl' : (2 : ℝ) ≤ (l : ℝ) := by exact_mod_cast hl
  have hp : 0 < (l : ℝ) := by linarith
  have hh := log_le_sub_one_of_pos (show 0 < (l : ℝ)/2 by positivity)
  have h2 := log_le_sub_one_of_pos (show (0 : ℝ) < 2 by norm_num)
  rw [log_div hp.ne' (by norm_num : (2 : ℝ) ≠ 0)] at hh
  linarith

lemma finite_prime_log_tail (T : Finset ℕ)
    (hT : ∀ l ∈ T, Nat.Prime l) :
    (∑ l ∈ T, (1/2 : ℝ)^l * log l) ≤ 3/4 := by
  calc
    _ ≤ ∑ l ∈ T, ((l : ℝ) * (1/2 : ℝ)^l)/2 := by
      apply sum_le_sum
      intro l hl
      calc
        _ ≤ (1/2 : ℝ)^l * ((l : ℝ)/2) :=
          mul_le_mul_of_nonneg_left (log_le_half_of_two_le l (hT l hl).two_le)
            (by positivity)
        _ = _ := by ring
    _ = (∑ l ∈ T, (l : ℝ) * (1/2 : ℝ)^l)/2 := by
      simp [div_eq_mul_inv, sum_mul]
    _ ≤ _ := by linarith [finite_prime_weighted T hT]

/-- Native second budget, with just the explicit scalar scale guard. -/
lemma crude_budget_of_log_bound {P} (D : Data P) (T : Finset ℕ)
    (hT : ∀ l ∈ T, Nat.Prime l)
    (hscale : 9 * (log⁺ (D.chosenGroupOrder : ℝ) + 3/4) ≤ D.x^999) :
    ∑ l ∈ T, 9 * crudeUnit l D * log l ≤ D.x^999 := by
  have L {a : ℕ} : ∑ l ∈ T, padicValNat l a * log l ≤ log⁺ a := by
    grw [log_of_nat_eq_posLog, log_nat_eq_sum_factorization,
      Finsupp.sum_of_support_subset _ subset_union_right, ← T.subset_union_left]
      <;> simp_all [Nat.factorization_def]
  calc
    _ = ∑ l ∈ T, (9 * ((padicValNat l D.chosenGroupOrder : ℝ) * log l) +
        9 * ((1/2 : ℝ)^l * log l)) := by
      apply sum_congr rfl
      intro l hl
      push_cast [crudeUnit]
      <;> ring
    _ = 9 * ((∑ l ∈ T, (padicValNat l D.chosenGroupOrder : ℝ) * log l) +
        (∑ l ∈ T, (1/2 : ℝ)^l * log l)) := by
      simp only [sum_add_distrib, ← mul_sum, mul_add]
    _ ≤ _ := (mul_le_mul_of_nonneg_left
      (add_le_add (L (a := D.chosenGroupOrder)) (finite_prime_log_tail T hT))
      (by norm_num : (0 : ℝ) ≤ 9)).trans hscale

#print axioms finite_weighted_range
#print axioms finite_prime_weighted
#print axioms finite_prime_log_tail
#print axioms crude_budget_of_log_bound

end RHGaloisRun87
