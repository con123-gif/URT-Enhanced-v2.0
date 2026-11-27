import C2ValueFamilyTransport
import New.Selmer.FitTwistsExist
import Lean

open Submodule Data Polynomial Multiset Finset Real

/-!
RUN89 — C1/C2 fusion at actual fit-family supplier, 27 Nov 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine
40aaf0afcc897a74d688bd6e9bae708428ffdabd; obligations
579ecc1cafdb28eae7d1c97565700c571dfa7484.

Retain failed RUN84 and pending RUN88. Instead of passing the extra
universal arithmetic hypothesis to the early rank-one proof (which
failed in RUN84), extract the original budget as a separate theorem
and invoke it ONLY at the original late choose s s' site. Thus early
row and twist selection has the original context; no clear tactic
is required. This also creates an exact-statement arithmetic supplier
that can eventually be swapped at proof-term level once RUN85–87 size
adapters are natively established. No mathematical premise weakened here.

Executed source comparisons: pinned original blob
da769eba595af2f883eed9b82dbd322a521aea14; RUN88 blob
4cefb91e5c178b677a2d424e9ee7cc1360ade4a7. Original early proof
equals RUN88 early proof after removal of the two clear-budget commands
and restoration of original whitespace. Final witness suffix is
byte-identical to pinned original. Only the budget block is abstracted.
No native witnesses changed.

Verified existing C2 peer receipts fetched from run 46055305146:
value_family_pipeline_results.json blob 413058eacfda8683f5fb28c68148fd45d1bf1770, all checks true;
interface_graph_summary.json blob b281ea4b5a96ccd9a10d0353deee520d1b483bc2, 12 roots, missing=0;
supplier_reachability.json blob 5150c752f79e41df980fbb85920bf315b3edce4e, all 82 guards true.
C2ValueFamilyTransport source blob 7e912b212aa0a365106cca2e7a0c30a17eb65ff6,
compiler exit 0 (8.53 s), four standard axiom reports, olean SHA256
df09a2527a08d97db0c9ee168e5585ed30491c6bbe853ef5c4d60df0e788f2c2.
Do not reprove the checked determinant/twist chain.

Final run_cmd uses the exact-type proof-value substitution pattern
from the checked C2 transport, replacing the original twist supplier
in the new late-budget proof with its checked C2 counterpart. Both
local improvements then feed one original-statement fit-family
declaration, not an alias of original fit-family theorem. Direct
guards are not a full transitive audit.

Local lean/lake absent (checked), scratch ~30 GB. No native execution
of RUN89, rh_scan/prune/reduce/auto/frontier; no old-pin PASS transferred.
C1, root C2, RH and packed scalar native size adapters remain OPEN.
Original graphs, failed routes and all arithmetic premises retained.

RESUME HERE: restore authenticated artifact 15234434421 of run
46055305146 (not expired when checked), original C1 archive SHA256
63bbe26668b47f81149ef5f5e06033168489076b68eb22509fa40bcc518a9603,
and all C2 module dependencies from value_family_results.json.
Replay this file in restored pinned workspace with authenticated
C2 module dirs on LEAN_PATH as in replay_c2_standard_exchange.py.
Require exit 0, all 3 standard axiom reports, direct guard marker,
then independent constructor-inclusive audit of original and fused roots.
Coordinate with RUN88 replay; no duplicate original source build.
If failure, record first actual error. No protected workflow edit.
HANDOFF TO integration/editor, kernel/audit and Galois.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

lemma fit_budget_run89 {P} (D : Data P) (T : Finset ℕ)
    (hT : ∀ l ∈ T, Nat.Prime l) :
    ∑ l ∈ T, rowBudget D l * log l ≤ D.B₀ ∧
      ∑ l ∈ T, 9 * crudeUnit l D * log l ≤ D.x ^ 999 := by
  clear * - hT
  have L {a} : ∑ l ∈ T, padicValNat l a * log l ≤ log⁺ a := by grw [log_of_nat_eq_posLog,
    log_nat_eq_sum_factorization, Finsupp.sum_of_support_subset _ subset_union_right,
    ← T.subset_union_left] <;> simp_all [Nat.factorization_def]
  push_cast [rowBudget, _root_.loss, lambdaLoss, crudeUnit, add_mul, @mul_assoc ℝ,
    sum_add_distrib, ← mul_sum]
  grw [L, sum_le_sum fun _ _ ↦ by grw [mul_comm, log_le_self (by simp)], sum_le_hasSum _ (by simp)
    (hasSum_coe_mul_geometric_of_norm_lt_one (by bound)), L, (exists_length_shaOdd_le
    ..).choose_spec.2.1, classNumber_le, L, L, prod_le_prod' (by simp; tauto), prod_const,
    Nat.card_Ioc, tsub_tsub_le_tsub_add, add_tsub_cancel_left]
  push_cast [↓log_of_nat_eq_posLog, sub_half, Nat.cast_natAbs, abs_discr_eq_rootDiscr_pow,
    finrank_eq_two_mul_card_infinitePlace]
  any_goals exact neg_one_lt_zero.le.trans (Nat.cast_nonneg _)
  exacts [⟨add_halves D.B₀ ▸ add_le_add D.le_of_hasLogBound D.le_of_hasLogBound,
    D.le_of_hasLogBound⟩, D.nat_le_of_hasLogBound, D.algebraMap_mem_cycloField]

lemma exists_isFitFamily_late_budget_run89 {P} (D : Data P) : ∃ θ, D.IsFitFamily θ := by
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
  choose s s' using fun T (hT : ∀ l ∈ T, Nat.Prime l) ↦ fit_budget_run89 D T hT
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

run_cmd do
  let original ← Lean.getConstInfo ``exists_isFitFamily
  let source ← Lean.getConstInfo ``exists_isFitFamily_late_budget_run89
  let oldSupplier ← Lean.getConstInfo ``exists_mFoldTwist_selmerLengthLe
  let newSupplier ← Lean.getConstInfo ``c2_exists_mFoldTwist_selmerLengthLe
  unless original.levelParams == source.levelParams do
    Lean.throwError "RUN89 fit universe parameters changed"
  unless oldSupplier.levelParams == newSupplier.levelParams do
    Lean.throwError "RUN89 twist universe parameters changed"
  let sameType ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq original.type source.type
  unless sameType do Lean.throwError "RUN89 original fit statement changed"
  let sameSupplier ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq oldSupplier.type newSupplier.type
  unless sameSupplier do Lean.throwError "RUN89 twist statement changed"
  let some value := source.value? (allowOpaque := true) |
    Lean.throwError "RUN89 late-budget body missing"
  let deps := value.getUsedConstants
  unless deps.contains ``fit_budget_run89 && deps.contains ``exists_mFoldTwist_selmerLengthLe do
    Lean.throwError "RUN89 expected direct suppliers absent"
  if deps.contains ``exists_isFitFamily || deps.contains ``sorryAx then
    Lean.throwError "RUN89 prohibited direct dependency"
  let replaced := value.replace fun expression ↦
    match expression with
    | .const name levels =>
        if name == ``exists_mFoldTwist_selmerLengthLe then
          some (.const ``c2_exists_mFoldTwist_selmerLengthLe levels)
        else none
    | _ => none
  let newDeps := replaced.getUsedConstants
  unless newDeps.contains ``fit_budget_run89 &&
      newDeps.contains ``c2_exists_mFoldTwist_selmerLengthLe do
    Lean.throwError "RUN89 fusion lost named supplier"
  for forbidden in #[``exists_isFitFamily, ``exists_mFoldTwist_selmerLengthLe, ``sorryAx] do
    if newDeps.contains forbidden then
      Lean.throwError "RUN89 fusion kept forbidden direct supplier"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `exists_isFitFamily_fused_run89
    levelParams := source.levelParams
    type := source.type
    value := replaced
  })
  Lean.logInfo "C1_C2_RUN89_DIRECT_GUARDS_OK"

#print axioms fit_budget_run89
#print axioms exists_isFitFamily_late_budget_run89
#print axioms exists_isFitFamily_fused_run89
