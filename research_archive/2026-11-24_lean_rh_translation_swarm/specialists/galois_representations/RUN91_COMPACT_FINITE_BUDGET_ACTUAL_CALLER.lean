import C1FiniteTailHeightBridge
import C1LateBudgetC2Fusion
import Lean

open Submodule Data Polynomial Multiset Finset Real

/-!
RUN91, 28 November 2026 — source-matched candidate; native replay OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484. AGENTS, continuity, swarm,
handoff, expansion read. Peers through 3da4db5a; editor 7613a6b1
restores native squared C witness, integration fcca937a joins shell
rank routes. Do not duplicate either caller transport.

New result at actual C1 arithmetic supplier: RUN87 only gave a finite
tail helper and a second budget with explicit scale premise. Use its
already derived finite prime logarithmic bound to replace the two
infinite-series rewrite steps in RUN89's complete TWO-budget theorem.
The native remaining scale proof is unchanged, including exact same
class number, odd-Sha witness, factorial and interval, B0 and x.
No extra scale guard, choice, premise or use of original fit theorem.
This is a parallel shorter route to the finite-budget theorem while
RUN85–86's packed valuation and native scale adapters remain open.
No claim that it implements the packed valuation.

Exact math: for finite T of primes, sigma_T = sum_(l in T)
(1/2)^l log l <= 3/4 by RUN87 (finite telescope, excluding 1).
Hence sigma_T <= (1/2)/(1-1/2)^2 = 2. The last expression is
INTENTIONALLY the same bound as the original infinite geometric
rewrite, to retain the existing scale instance search. The native
factorization estimate L and all other inequalities stay unchanged.
Both budgets hold for the same D and T, without the explicit new
scalar premises of RUN85/87. This closes the human interface by a
finite comparison, not the foundational odd-Sha/crystalline premises.

Sources: New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14,
RUN89 f740d8573ec78961509f55ea27b59615b7923a50 and RUN87
5b10ddea56708e4155e7a4f68b66f7a4e.
Pinned Mathlib Analysis/SpecificLimits/Normed.lean declares
hasSum_coe_mul_geometric_of_norm_lt_one with RHS r/(1-r)^2.
Executed connector JS: exact unique three-anchor source substitution;
inverse transformation reproduces RUN89 budget body byte-for-byte;
all five missing/duplicate/already-edited anchor controls rejected.
These are static source checks, not native proof or graph checks.

Shared C1/C2 run 46055305146 accepted C2 scopes only, failed RUN84 fit
replacement. RUN89 and RUN90 still lack accepted native receipts.
Current run 46092027436 is the prime endpoint replay (jobs API read);
not a C1 replay. Existing C1 job registered; no duplicate cold build.
No native compilation/engine execution in this run. Original/reduced
graph and axiom evidence retained; only source-visible delta:
  fit_budget_run89 -> geometric HasSum + sum_le_hasSum
  fit_budget_finite_run91 -> finite_prime_log_tail + same scale proof
  exists_isFitFamily_fused_run89 -> budget supplier replaced exactly.
Whether old dependencies disappear transitively is NOT established.

RESUME HERE: authenticate retained compact cache artifact 15234434421
from 46055305146 and replay existing RUN89 first; in same environment
compile RUN87 as C1FiniteTailHeightBridge, then THIS file. Require
both exact theorem statements, standard axiom reports, all guards and
strict constructor-inclusive graph audit of both original/revised
budget and fit-family roots. If RUN87 or RUN89 fails, repair first
actual diagnostic, do not use its olean. If accepted, hand new fit
supplier to integration for the shorter squared C junction and latest
common star. No new cold build; do not edit protected workflows.
HANDOFF TO integration/editor, kernel/audit and Galois.
C1/C2/star/RH remain OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

lemma fit_budget_finite_run91 {P} (D : Data P) (T : Finset ℕ)
    (hT : ∀ l ∈ T, Nat.Prime l) :
    ∑ l ∈ T, rowBudget D l * log l ≤ D.B₀ ∧
      ∑ l ∈ T, 9 * crudeUnit l D * log l ≤ D.x ^ 999 := by
  clear * - hT
  have L {a} : ∑ l ∈ T, padicValNat l a * log l ≤ log⁺ a := by grw [log_of_nat_eq_posLog,
    log_nat_eq_sum_factorization, Finsupp.sum_of_support_subset _ subset_union_right,
    ← T.subset_union_left] <;> simp_all [Nat.factorization_def]
  have htail : (∑ l ∈ T, (1 / 2 : ℝ)^l * log l) ≤
      (1 / 2 : ℝ) / (1 - 1 / 2)^2 := by
    calc
      _ ≤ (3/4 : ℝ) := RHGaloisRun87.finite_prime_log_tail T hT
      _ ≤ _ := by norm_num
  push_cast [rowBudget, _root_.loss, lambdaLoss, crudeUnit, add_mul, @mul_assoc ℝ,
    sum_add_distrib, ← mul_sum]
  grw [L, htail, L, (exists_length_shaOdd_le
    ..).choose_spec.2.1, classNumber_le, L, L, prod_le_prod' (by simp; tauto), prod_const,
    Nat.card_Ioc, tsub_tsub_le_tsub_add, add_tsub_cancel_left]
  push_cast [↓log_of_nat_eq_posLog, sub_half, Nat.cast_natAbs, abs_discr_eq_rootDiscr_pow,
    finrank_eq_two_mul_card_infinitePlace]
  any_goals exact neg_one_lt_zero.le.trans (Nat.cast_nonneg _)
  exacts [⟨add_halves D.B₀ ▸ add_le_add D.le_of_hasLogBound D.le_of_hasLogBound,
    D.le_of_hasLogBound⟩, D.nat_le_of_hasLogBound, D.algebraMap_mem_cycloField]

open Lean in
run_cmd do
  let a := ``fit_budget_run89
  let b := ``fit_budget_finite_run91
  let oldRoot := ``exists_isFitFamily_fused_run89
  let newRoot := `exists_isFitFamily_finite_budget_run91
  let ai ← getConstInfo a
  let bi ← getConstInfo b
  let eqType ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
  unless ai.levelParams == bi.levelParams && eqType do
    throwError "RUN91 budget statement changed"
  let .thmInfo budget ← getConstInfo b | throwError "RUN91 missing budget proof"
  let budgetDeps := budget.value.getUsedConstants
  unless budgetDeps.contains ``RHGaloisRun87.finite_prime_log_tail do
    throwError "RUN91 finite tail missing"
  for forbidden in #[a, ``hasSum_coe_mul_geometric_of_norm_lt_one, ``sum_le_hasSum, ``sorryAx] do
    if budgetDeps.contains forbidden then
      throwError m!"RUN91 unwanted direct budget dependency: {forbidden}"
  let .thmInfo orig ← getConstInfo oldRoot | throwError "RUN91 missing original fused proof"
  let before := orig.value.getUsedConstants
  unless before.contains a && !before.contains b && !orig.type.getUsedConstants.contains a do
    throwError "RUN91 missing distinct proof-only budget edge"
  let value := orig.value.replace fun e =>
    match e with
    | .const n us => if n == a then some (.const b us) else none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := newRoot, levelParams := orig.levelParams, type := orig.type, value := value })
  let .thmInfo fresh ← getConstInfo newRoot | throwError "RUN91 missing replacement"
  let expected := before.map fun n => if n == a then b else n
  let got := fresh.value.getUsedConstants
  unless fresh.type == orig.type && fresh.levelParams == orig.levelParams &&
      expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) &&
      got.contains ``c2_exists_mFoldTwist_selmerLengthLe && !got.contains a &&
      !got.contains oldRoot do
    throwError "RUN91 fit statement or direct graph changed unexpectedly"
  for root in #[b, newRoot] do
    let axs ← collectAxioms root
    unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
      throwError m!"RUN91 nonstandard axiom in {root}"
  logInfo "RUN91_FINITE_C1_BUDGET_DIRECT_GUARDS_OK"

#print axioms fit_budget_finite_run91
#print axioms exists_isFitFamily_finite_budget_run91
