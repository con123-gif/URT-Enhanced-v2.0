import C2ValueFamilyTransport
import New.Selmer.FitTwistsExist
import Lean

/-!
RUN92, 28 November 2026 — PREPARED / static source audit, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, protocol, handoff, expansion read. Peers: character RUN91 39e0f825
isolates squared C; integration 77afc792 joins finite shell and one-sided
star; editor 1c21daa8 removes absolute remainder guard; prime 557eeda77
reports conditional endpoint. No duplication of those transports.

Specific replay obstruction: RUN91 imports both the complete RUN87 module
(including an unused explicit-scale crude budget adapter) and RUN89's
alternative infinite-series arithmetic proof and fit-family elaboration.
The preferred finite route need not wait for either superseded candidate.
This single file copies ONLY the four finite tail lemmas from RUN87,
the complete two-budget proof from RUN91, and the late-budget row/twist
selection body from RUN89; then transports the original twist supplier
to the already native-checked C2 supplier. No new scale premise, no
change in D,T, row, twist, witness, denominator or final statement.
For finite primes T, sigma_T <= 3/4 <= 2, with all native size premises
unchanged. The actual row and twist selection precede insertion of the
budget, so the failed RUN84 early nonlinear context is not recreated.
This is an independent compile target, not a new arithmetic theorem.

Exact source blobs: RUN87 5b10ddea56708e4155e7a4f68b66f7aafcd7517b,
RUN89 f740d8573ec78961509f55ea27b59615b7923a50,
RUN91 dee78e05c11ce6c36809efb707ffc1873cc4cdca; native
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14.
Executed connector JS: exact original fit body comparison after only
renaming and replacing the complete late budget block; three reversible
source-section substitutions; five negative controls rejected (duplicate
anchor, absent anchor, already edited, conflicting target, out of order).
These are source checks, not Lean checks.

Actual shared receipt read: artifact 15234434421 unexpired, outer ZIP
900881325 bytes SHA256 45b0ae825e3f7c58ee5f78e9178e60d906e20294afff1c6fc04650e5af47cd33;
inner native archive SHA256
63bbe26668b47f81149ef5f5e06033168489076b68eb22509fa40bcc518a9603.
Wrapper blob 2146cd28915a80aa467d64de6ecd0f659e71f389; C2 pipeline
413058eacfda8683f5fb28c68148fd45d1bf1770 checked C2 scope only;
RUN84 remains failed. Local lean/lake/elan/gh absent, git DNS failed.
No new native execution, rh_scan/prune/reduce/auto/frontier or graph
receipt here. Existing full graphs and failed routes preserved. Do not
infer global disappearance of infinite series from direct source edges.

RESUME HERE: reuse character RUN89_C2_RESTORED_STAR_REPLAY.py's
authenticated source/cache and C2 object roster, fresh lake env, and
stage THIS file as C1FiniteBudgetMinimal (no extra LongForms build).
Replay it independently of RUN87, RUN89, RUN91 compiled objects.
Require exit 0, RUN92_C1_MINIMAL_OK, all eight printed standard axiom
reports and strict constructor-inclusive graph for original
exists_isFitFamily, c2_exists_isFitFamily, new finite budget,
new late fit and new fused fit. Record old/new supplier reachability
and retain every foundation. First real diagnostic if failure; otherwise
handoff exact new fit supplier to integration's squared C. No duplicate
cold build, no protected workflow change. C1/C2/star/RH OPEN.
HANDOFF TO integration/kernel/audit, character boxes.
-/

open Submodule Data Polynomial Multiset Finset Real
set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

namespace RHGaloisRun92

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

end RHGaloisRun92

lemma fit_budget_finite_run92 {P} (D : Data P) (T : Finset ℕ)
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
      _ ≤ (3/4 : ℝ) := RHGaloisRun92.finite_prime_log_tail T hT
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

lemma exists_isFitFamily_finite_late_run92 {P} (D : Data P) : ∃ θ, D.IsFitFamily θ := by
  choose R' F' using fun {ℓ} {_ : ThePrime ℓ} {ι : PadicIso ℓ} (p : {p : D.Pair × D.LiftIndex //
    p.1.IsRankOne p.2}) ↦ exists_row_for_all_twists ι (isApt_rank_one 1 p.2) 1 (fun _ ↦ {0}) 1 (by
    have := (@isFiniteTypeAt_char ℓ _ _ D.E _ _ · 1 Unit _ _ continuous_one (by simp))
    simp_rw [← C_1]
    use! continuous_one <;> simp_all [IsTraceNondeg, Matrix.trace, ← Matrix.ext_iff, IsLabelledAt,
      ↓aroots_X_sub_C, isGoodAt_iff]) (by simp) (by use ?_, ?_, ⟨p.1.2, ?_⟩ <;> simp [← cons_zero,
         countP_cons] <;> grind [Pair.IsRankOne,
    Int.units_natAbs, !(D.nat_lt_of_hasLogBound : 2 * D.h₂ ^ 2 + D.t < D.w _ _)])
  choose R F using fun {ℓ} {_ : ThePrime ℓ} {ι} (a : _ × (D.finite_eigenPart _
    (D.goodForms _)).toFinset) ↦ exists_hasRow_auxPair ι ((Set.Finite.mem_toFinset _).1 a.2.2) a.1
  choose τ H using fun κ : PrimePadicIso ↦ @exists_mFoldTwist_selmerLengthLe _ D κ.1 ⟨⟩ ⟨κ.2⟩ _ _
    (·.getRight?.map 0 |> @RowBlockIndex _ 1) _
    (Sum.rec _ _) (Sum.rec (⟨_, F · |>.1⟩) (⟨_, F' · |>.1⟩)) ⌊D.r * rowBudget D κ.1⌋₊.succ
  choose s s' using fun T (hT : ∀ l ∈ T, Nat.Prime l) ↦ fit_budget_finite_run92 D T hT
  use τ, fun κ ↦ (@coprime_q_of_isAuxiliary _ _ _ ⟨⟩ _ (H κ ⟨1, .refl,
    D.nat_le_of_hasLogBound⟩).1.1).1, fun j ↦ ⟨_, s, fun κ ↦
    have := ThePrime.mk; ⟨denominatorLe_rowBudget _ _ (H ..).1 (D.range_goodLift_le fun q y a c k
      m ↦ dite (y = 0) (by simp [·]) (subset_span ⟨⟨⟨y, a.1⟩, rfl⟩,
      ⟨c, m, isApt_auxPair D _ j k, D.range_tupleIdem_le k⟩, _, D.lifts_auxLift _ a.2, _, _,
      F ⟨j, q, by simpa using mt (D.goodForms_inf_eigenPart_eq_bot (D.hasRigidLabels_spaceW j)
      (D.hasRigidLabels_spaceW ⟨_, D.nat_le_of_hasLogBound, .refl⟩) · |>.le a) ·⟩, by simp [auxPair,
      liftChar, twist_one_spec], (H ..).2.1 (.inl _)⟩)), fun p h ↦ denominatorLe_rowBudget _ _
      (H ..).1 (span_mono (forall_eq.2 ⟨by simp, ⟨_, trivialLift_mem_range_tupleProj_rank_one _ h,
      isApt_rank_one _ h, le_rfl⟩, _, LValueData.auxPair_lifts_trivialLift _, _, _, F' ⟨(p, j),
      h⟩, by simp [twist_one_spec], (H ..).2.1 (.inr _)⟩))⟩⟩, (.of_le s' fun _ ↦ H _ · |>.2.2 · · ·)

open Lean in
run_cmd do
  let original ← getConstInfo ``exists_isFitFamily
  let control ← getConstInfo ``c2_exists_isFitFamily
  let .thmInfo source ← getConstInfo ``exists_isFitFamily_finite_late_run92 |
    throwError "RUN92 missing late proof"
  let oldName := ``exists_mFoldTwist_selmerLengthLe
  let newName := ``c2_exists_mFoldTwist_selmerLengthLe
  let budgetName := ``fit_budget_finite_run92
  let freshName := `exists_isFitFamily_finite_fused_run92
  let ai ← getConstInfo oldName
  let bi ← getConstInfo newName
  let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
  unless same && ai.levelParams == bi.levelParams do
    throwError "RUN92 twist supplier type or universe mismatch"
  for i in #[original, control] do
    let eq ← Elab.Command.liftTermElabM do Meta.isDefEq i.type source.type
    unless eq && i.levelParams == source.levelParams do
      throwError "RUN92 fit statement changed"
  let .thmInfo budget ← getConstInfo budgetName |
    throwError "RUN92 missing arithmetic budget"
  let bd := budget.value.getUsedConstants
  unless bd.contains ``RHGaloisRun92.finite_prime_log_tail do
    throwError "RUN92 finite arithmetic tail missing"
  for n in #[`fit_budget_run89, `hasSum_coe_mul_geometric_of_norm_lt_one,
      `sum_le_hasSum, ``sorryAx] do
    if bd.contains n then throwError "RUN92 unwanted direct budget dependency: {n}"
  let before := source.value.getUsedConstants
  unless before.contains oldName && before.contains budgetName &&
      !before.contains newName && !source.type.getUsedConstants.contains oldName do
    throwError "RUN92 missing proof-only supplier"
  let revised := source.value.replace fun e =>
    match e with
    | .const n us => if n == oldName then some (.const newName us) else none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := freshName, levelParams := source.levelParams, type := source.type,
    value := revised })
  let .thmInfo result ← getConstInfo freshName |
    throwError "RUN92 missing inserted theorem"
  let expected := before.map fun n => if n == oldName then newName else n
  let got := result.value.getUsedConstants
  unless result.type == source.type && result.levelParams == source.levelParams &&
      expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) &&
      got.contains newName && got.contains budgetName && !got.contains oldName do
    throwError "RUN92 unexpected proof dependency change"
  for n in #[``exists_isFitFamily, ``c2_exists_isFitFamily, ``sorryAx,
      `fit_budget_run89, `exists_isFitFamily_fused_run89,
      `RHGaloisRun87.crude_budget_of_log_bound] do
    if got.contains n then throwError "RUN92 unwanted fit alias: {n}"
  for root in #[``RHGaloisRun92.finite_weighted_range,
      ``RHGaloisRun92.finite_prime_weighted, ``RHGaloisRun92.log_le_half_of_two_le,
      ``RHGaloisRun92.finite_prime_log_tail, budgetName,
      ``exists_isFitFamily_finite_late_run92, freshName, ``c2_exists_isFitFamily] do
    let axs ← collectAxioms root
    unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
      throwError "RUN92 nonstandard axiom in {root}"
  logInfo "RUN92_C1_MINIMAL_OK"

#print axioms RHGaloisRun92.finite_weighted_range
#print axioms RHGaloisRun92.finite_prime_weighted
#print axioms RHGaloisRun92.log_le_half_of_two_le
#print axioms RHGaloisRun92.finite_prime_log_tail
#print axioms fit_budget_finite_run92
#print axioms exists_isFitFamily_finite_late_run92
#print axioms exists_isFitFamily_finite_fused_run92
#print axioms c2_exists_isFitFamily
