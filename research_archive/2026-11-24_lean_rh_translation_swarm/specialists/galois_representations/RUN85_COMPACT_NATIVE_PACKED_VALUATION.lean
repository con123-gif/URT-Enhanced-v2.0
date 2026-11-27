import New.Selmer.FitTwistsExist

open Finset Real Data

/-!
RUN85, 27 November 2026 — source-matched native valuation candidate.
C1 remains OPEN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Read current mission/spine/ledger, RUN83 blob e0142c5ccb5503d1e97256584a7f68eb5d0f625d,
RUN84 split blob 3cbb1e320a0eb2bae1f45efbd4f72d78f6191cb0 and runner
4ec1f89444fd6e779595ed83c601c2a5ebca2560. Latest lane directory has no RUN85.
Shared job rh-compact-c1-fit-budget-replay-20261127 status.json AND
outputs/c1_native_results.json returned 404 on cathedral-research-state.
Do not infer execution or failure from missing receipts. No duplicate job.

RUN83 only prepared the real scalar rearrangement, not the valuation of the
actual positive integer with native parameters. This file fills that interface
with a candidate for native verification, rather than repeating the scalar test.
The finite-budget criterion is conditional on the exact remaining log bound.
It is not asserted to supply fit_budget_run84 without the scale proof and
second budget. The original proof and all of its local dependencies remain.

Source blobs checked:
New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18 (rowBudget);
New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df (loss, lambdaLoss);
New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c (crudeUnit);
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
(original finite-prime log-factorization bound and caller);
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
(nonzero SAME chosen integer);
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834 (gProd deriving NeZero);
New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3
(chosenGroupOrder deriving NeZero);
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e (k_pos).
Pinned Mathlib/NumberTheory/Padics/PadicVal/Basic.lean explicitly supplies
padicValNat.mul : a ≠ 0 → b ≠ 0 → v(a*b)=v(a)+v(b)
and padicValNat.pow (a n : Nat) : v(a^n)=n*v(a), under Fact l.Prime.
Pinned Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean
supplies prod_pos. These signatures were read, not elaborated.

Mathematical proof: every i in Ioc has i>0 even when the lower endpoint
is truncated to zero; hence the factorial-times-product F is positive,
including an empty interval. The native M,G have NeZero instances;
X is nonzero by choose_spec.1 of the very same existential in rowBudget.
Thus for every prime l the four product/power rewrites yield
v_l(Z)=k H^27(v_l(M)+v_l(X))+4*10^6*f*m(b*v_l(G)+v_l(F)).
In the real-valued rowBudget, division is real (not Nat.div). Divide
by k>0 and use the actual definitions to cancel. The finite prime
sum is then split before taking bounds; coefficient 1/k is nonnegative.
The only bound used on the integer is the original finite-prime
log-factorization inequality, applied ONCE to Z. No Z is evaluated.
No assumption that l does not divide k. Zero X/G/M cannot be allowed:
padicValNat l 0 = 0, so valuation additivity would fail, e.g.
v_2(0*2)=0 but v_2(0)+v_2(2)=1.
All original row selection, twist, denominator, inverse height,
period-ring, odd-Sha, local scale premises remain. No root theorem import.

Source-visible graph delta:
  original: rowBudget -> separate valuation sums -> scale guards
  candidate: rowBudget -> exact native integer valuation -> one valuation sum
             -> SAME scale guards
  actual C1 caller: exists_isFitFamily_of_budget_run84 (both budgets needed).
The log bound in run85_budget_of_payment is the retained, unresolved
numerical premise for this candidate; do not treat it as independently
proved just because the original bound is known in Lean.
No original/reduced elaborated graph or axiom evidence discarded.
No local Lean/lake (checked with command -v); 30 GB free scratch below
existing runner 35 GB guard. Native engine calls, axiom probes and actual
candidate elaboration NOT RUN. Old-pin native PASS is not compact evidence.
No URT comparison attempted; no claimed performance advantage.

RESUME HERE: inspect the existing C1 shared-job receipt; if it passes,
add this file to that same compact cache for native replay and audit
run85_budget_of_payment before proving its retained log premise from the
source scale guards. If the receipt fails, repair its first error before
adding this file. No new compute job submitted this run.
HANDOFF TO: integration/editor, kernel/audit, Galois.
-/

namespace RHGaloisRun85

noncomputable def shaInteger {P} (D : Data P) : ℕ :=
  (exists_length_shaOdd_le _ D.t _ D.algebraMap_mem_cycloField).choose

def lossInteger {P} (D : Data P) : ℕ :=
  (2 * D.b₁).factorial *
    (∏ i ∈ Ioc (D.b₁ - 30 * D.h₂ ^ 3) (D.b₁ + 30 * D.h₂ ^ 3), i) ^ D.h₂ ^ 3

noncomputable def payment {P} (D : Data P) : ℕ :=
  (D.chosenGroupOrder * shaInteger D) ^ (D.k * D.h₂ ^ 27) *
  (D.gProd ^ D.b₁ * lossInteger D) ^ (4 * 10 ^ 6 * D.f * D.m)

lemma shaInteger_ne_zero {P} (D : Data P) : shaInteger D ≠ 0 := by
  exact (exists_length_shaOdd_le _ D.t _ D.algebraMap_mem_cycloField).choose_spec.1

lemma lossInteger_ne_zero {P} (D : Data P) : lossInteger D ≠ 0 := by
  unfold lossInteger
  apply mul_ne_zero (Nat.factorial_ne_zero _)
  apply pow_ne_zero
  exact Nat.ne_of_gt (Finset.prod_pos fun i hi =>
    lt_of_le_of_lt (Nat.zero_le _) (Finset.mem_Ioc.mp hi).1)

lemma payment_ne_zero {P} (D : Data P) : payment D ≠ 0 := by
  unfold payment
  exact mul_ne_zero
    (pow_ne_zero _ (mul_ne_zero (NeZero.ne _) (shaInteger_ne_zero D)))
    (pow_ne_zero _ (mul_ne_zero (pow_ne_zero _ (NeZero.ne _)) (lossInteger_ne_zero D)))

lemma payment_valuation {P} (D : Data P) (l : ℕ) (hp : Nat.Prime l) :
    padicValNat l (payment D) =
      (D.k * D.h₂ ^ 27) *
        (padicValNat l D.chosenGroupOrder + padicValNat l (shaInteger D)) +
      (4 * 10 ^ 6 * D.f * D.m) *
        (D.b₁ * padicValNat l D.gProd + padicValNat l (lossInteger D)) := by
  letI : Fact l.Prime := ⟨hp⟩
  have hM : D.chosenGroupOrder ≠ 0 := NeZero.ne _
  have hG : D.gProd ≠ 0 := NeZero.ne _
  have hX := shaInteger_ne_zero D
  have hF := lossInteger_ne_zero D
  unfold payment
  rw [padicValNat.mul (pow_ne_zero _ (mul_ne_zero hM hX))
    (pow_ne_zero _ (mul_ne_zero (pow_ne_zero _ hG) hF))]
  simp only [padicValNat.pow, padicValNat.mul hM hX,
    padicValNat.mul (pow_ne_zero _ hG) hF]

lemma rowBudget_eq_payment {P} (D : Data P) (l : ℕ) (hp : Nat.Prime l) :
    (rowBudget D l : ℝ) =
      (D.k : ℝ)⁻¹ * (padicValNat l (payment D) : ℝ) +
        (D.h₂ : ℝ)^27 * (1/2 : ℝ)^l := by
  have hk : (D.k : ℝ) ≠ 0 := by exact_mod_cast D.k_pos.ne'
  rw [payment_valuation D l hp]
  simp only [rowBudget, crudeUnit, _root_.loss, lambdaLoss, shaInteger, lossInteger]
  push_cast
  field_simp [hk] <;> ring

/-- The actual first finite-prime budget, reduced to one scalar log premise.
The second original budget is intentionally not supplied by this theorem. -/
lemma run85_budget_of_payment {P} (D : Data P) (T : Finset ℕ)
    (hT : ∀ l ∈ T, Nat.Prime l)
    (hpay : (D.k : ℝ)⁻¹ * log⁺ (payment D : ℝ) +
      (D.h₂ : ℝ)^27 * (∑ l ∈ T, (1/2 : ℝ)^l * log l) ≤ D.B₀) :
    ∑ l ∈ T, rowBudget D l * log l ≤ D.B₀ := by
  have L {a : ℕ} : ∑ l ∈ T, padicValNat l a * log l ≤ log⁺ a := by
    grw [log_of_nat_eq_posLog, log_nat_eq_sum_factorization,
      Finsupp.sum_of_support_subset _ subset_union_right, ← T.subset_union_left]
      <;> simp_all [Nat.factorization_def]
  calc
    _ = ∑ l ∈ T, ((D.k : ℝ)⁻¹ * (padicValNat l (payment D) : ℝ) * log l +
        (D.h₂ : ℝ)^27 * ((1/2 : ℝ)^l * log l)) := by
          apply sum_congr rfl
          intro l hl
          rw [rowBudget_eq_payment D l (hT l hl)]
          ring
    _ = (D.k : ℝ)⁻¹ * (∑ l ∈ T, padicValNat l (payment D) * log l) +
        (D.h₂ : ℝ)^27 * (∑ l ∈ T, (1/2 : ℝ)^l * log l) := by
          simp only [mul_assoc, sum_add_distrib, mul_sum]
    _ ≤ _ := (add_le_add_right
      (mul_le_mul_of_nonneg_left (L (a := payment D)) (by positivity)) _).trans hpay

#print axioms payment_ne_zero
#print axioms payment_valuation
#print axioms rowBudget_eq_payment
#print axioms run85_budget_of_payment

end RHGaloisRun85
