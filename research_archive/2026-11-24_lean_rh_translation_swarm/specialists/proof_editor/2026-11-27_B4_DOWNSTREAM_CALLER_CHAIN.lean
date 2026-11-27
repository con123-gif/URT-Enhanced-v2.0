import New.Endgame.LongForms
import EditorB4RankOnly

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000

/-!
27 November 2026 — B4 actual downstream caller chain, lane 15.
Status: PREPARED / source-matched; no new native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7;
live spine blob see branch at run; ledger b24ae883acc131f657241e944d523013ac5432a9.
Exact source blobs:
 ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a
 LongForms 9eff36cf003ac398fbd24361e80e95a03d0b0e05
 Main 198ed5bf26aa294898931e0649bc2b88f1389f65
 Prior B4 candidate b4a1117b3c29e1b67ad37d8f5deee3da3144ab5e
 (commit c1dc4f8bb9116c2cf5a83a8a6af8ce29f76e75f0).
This is NOT a new unconditional RH proof. No Main import.

At the actual downstream callers there are TWO paths from the original
rank/spread result: the enough_forms route (also using positive row
dimension), and an independent positive-dimension call in star_inequality.
Merely replacing the filling theorem or the family theorem leaves the
second path untouched. Replace both, keeping original A, C and all scale
hypotheses; no shortness dependency is retired from the global root.

The human bridge uses the SAME seesaw scalar c and translate family t.
If E maps onto U=ramifiedColumns, then im(T_s c E)=im(T_s c inclusion_U).
For each phi in U, take an actual preimage under E; for the converse take
E(v) in U. No claim that E is invertible. The native enough_forms uses
only the forward range inclusion, already sufficient. It retains d>0,
v>0, HasLogBound positivity and the original few-translates theorem.
Short_forms gives q>0, B_s=q projectedPoincare_s and a single S spanning U.
Thus span(union_{s in t} B_s(S))=sum_{s in t} im(projectedPoincare_s).
Extract an independent basis of this exact space. Index and Hadamard
use the SAME t, S, B, y and q. No independent re-selection.
Negative control: if q=0, V=W=C, T=id, S={1}, the scaled span is zero,
not W; retain q>0. If d=0, division in the star deduction is invalid;
retain the positive-dimension caller even though d is total in Lean.

The last equation is unchanged: d(H-3L) <= n h+2 delta, h=H-mR+L,
(d-n)(-h)<=4 d x^99, then divide by d>0 and cancel H.
All original statements below are exact source text except declaration
names and the identified caller substitutions. Source extraction and
unique occurrence checks were executed in JS on fetched pinned texts.
No Lean/lake on PATH in this session. Native reducers unavailable in this
workspace; no new PASS or global dependency retirement. B2 repair receipt
was not yet present at the checked state paths. Previous 45986308748
helper success is not evidence for these candidates.

Source-visible graph delta (not a constructor-inclusive kernel graph):
 original enough_forms -> ramifiedColumns_fill_rows, finrank_rows_ne_zero;
 new enough -> editor_ramifiedColumns_fill_rows, editor_finrank_rows_ne_zero;
 original family -> short_forms, enough_forms;
 new family -> short_forms, editor_enough_forms;
 original star -> family, finrank_rows_ne_zero, integral_forms_long;
 new star -> editor_family, editor_finrank_rows_ne_zero, integral_forms_long.
All other source edges retained. The old graph and candidate are retained
separately. The guards below test exact types for the two imported original
targets and direct named proof dependencies, not full transitive closure.
The star type is copied exactly from the pinned source without importing
Main; independent original-type comparison belongs in a separate audit
workspace, not in this proof module.

RESUME HERE: in the shared compact pinned workspace (after current B2
repair; avoid another cold build), stage the preceding B4 file as
EditorB4RankOnly.lean and compile its olean on LEAN_PATH. Then compile this
file, with pinned options, checking all six named axiom reports and the
three direct-edge guards. Example from compact root:
  lake build +New.Endgame.LongForms:olean
  mkdir -p .lake/build/lib/lean
  lake env lean --tstack=400000 -o .lake/build/lib/lean/EditorB4RankOnly.olean EditorB4RankOnly.lean
  lake env lean --tstack=400000 EditorB4Downstream.lean
Use actual compiler receipts; if compilation fails, report first failure.
Run constructor-inclusive old/new reachability separately; no global
deletion claim from direct deps. HANDOFF TO integration/kernel/audit.
-/

open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm

variable {P} (D : Data P)

lemma Data.editor_enough_forms : 0 < finrank ℂ D.Column ∧ 0 < D.rowDim ∧
  ∃ t, #t * finrank ℂ D.Column ≤ 5 * D.rowDim * log (1 + D.b ^ 2) ∧ (1 - 4 / D.b ^ 2) * D.rowDim ≤
  finrank ℂ ↥(⨆ s ∈ t, (D.projectedPoincare s).range) := have := D.columnCoords.nontrivial
  ⟨finrank_pos, D.editor_finrank_rows_ne_zero.pos, (exists_few_translates (W :=
    D.rows) (HasLogBound.pos D) (D.editor_ramifiedColumns_fill_rows _)).imp fun _ ↦ .imp (by simp)
    (·.trans (mod_cast finrank_mono (iSup₂_mono fun _ _ _ ⟨φ, e⟩ ↦ ⟨⟨_, φ, rfl⟩, e⟩)))⟩

open LinearMap

lemma Data.editor_exists_family_covolumeSq_le (D : Data P) : ∃ n, ∃ y : Fin n → _, LinearIndependent ℂ y ∧
    (1 - 4 / D.b ^ 2) * D.rowDim ≤ n ∧
  (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧ ∀ σ,
  covolumeSq (D.Θ 1 ∘ y) σ ≤ exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.short_forms, D.editor_enough_forms
  -- the family: a basis among the translates
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  -- index and length
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

open Data

lemma editor_star_inequality {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.editor_exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.editor_finrank_rows_ne_zero.pos
  -- `d` is the dimension, `L = f a log⁴ b` the unit of error, `exp h` the bound per form
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - 3 * L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ := (integral_forms_long i big I short).trans_eq (by ring)
                    -- the missing dimensions are a share `4 / b²`, and the index is small
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  -- divide by `d`; `h_main` cancels
  calc D.m * D.remainder ≤ 4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget := by
        linarith [le_of_mul_le_mul_left both d0]
    _ ≤ _ := D.le_of_hasLogBound

#print axioms Data.editor_ramifyingOp_rank_only
#print axioms Data.editor_ramifiedColumns_fill_rows
#print axioms Data.editor_finrank_rows_ne_zero
#print axioms Data.editor_enough_forms
#print axioms Data.editor_exists_family_covolumeSq_le
#print axioms editor_star_inequality

run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_enough_forms
  let orig ← Lean.getConstInfo ``Data.enough_forms
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "B4 enough type mismatch"
  let some value := info.value? | Lean.throwError "B4 enough missing value"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_ramifiedColumns_fill_rows &&
      deps.contains ``Data.editor_finrank_rows_ne_zero do
    Lean.throwError "B4 enough does not use both replacement suppliers"
  if deps.contains ``Data.enough_forms || deps.contains ``Data.ramifiedColumns_fill_rows ||
      deps.contains ``Data.finrank_rows_ne_zero then
    Lean.throwError "B4 enough has original edge"
  Lean.logInfo "B4_ENOUGH: type and direct edge guard completed"

run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_exists_family_covolumeSq_le
  let orig ← Lean.getConstInfo ``Data.exists_family_covolumeSq_le
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "B4 family type mismatch"
  let some value := info.value? | Lean.throwError "B4 family missing value"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_enough_forms && deps.contains ``Data.short_forms do
    Lean.throwError "B4 family missing A or replacement B"
  if deps.contains ``Data.enough_forms || deps.contains ``Data.exists_family_covolumeSq_le then
    Lean.throwError "B4 family has original edge"
  Lean.logInfo "B4_FAMILY: type and direct edge guard completed"

run_cmd do
  let info ← Lean.getConstInfo ``editor_star_inequality
  let some value := info.value? | Lean.throwError "B4 star missing value"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_exists_family_covolumeSq_le &&
      deps.contains ``Data.editor_finrank_rows_ne_zero &&
      deps.contains ``Data.integral_forms_long do
    Lean.throwError "B4 star missing family, dimension or C"
  if deps.contains ``Data.exists_family_covolumeSq_le || deps.contains ``Data.finrank_rows_ne_zero then
    Lean.throwError "B4 star has original edge"
  Lean.logInfo "B4_STAR: both replacement edges and C consumed"
