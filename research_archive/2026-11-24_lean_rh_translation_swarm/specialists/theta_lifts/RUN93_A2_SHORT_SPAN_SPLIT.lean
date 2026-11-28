import New.Columns.ChainValuation
import Lean

/-!
RUN93 — split the actual A2 short-span supplier from the unnecessary
ramified-rank branch. 28 November 2026. HUMAN SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, protocol, handoff, expansion. Peer kernel RUN66 eb147fce
downloaded the original cache artifact but could not inspect inner bytes;
reuse its authenticated intake. Peer acceleration 7ab99c38 and
integration 1d6a303d are separate endpoint/star work. No cold build.

Exact new caller reduction:
ChainValuation.lean blob 19e853dfa8c645bfcdf3b3e21183f9b432620ef7.
The original Data.ramifyingOp_finrank_comap_and_short s p combines
(a) dim T_s^{-1}(p) <= dim p + |s| dim(Column)/(N-1),
(b) IsShort B phi -> IsShort (4^|s| B) (T_s phi).
The actual Data.span_short_ramifiedColumns invokes ONLY (b), at p=bottom.
The joint proof is therefore an unnecessary rank dependency in this path.
Keep (a) and its native consumers unchanged; this is not a claim that
rank bounds are dispensable for the final B4 filling or for RH.

For the SAME D, the SAME central translations z_w and SAME T_s,
T_empty=1 and T_{insert w s}=(1-z_w)T_s (w notin s).
The actual scalarFin_centralGen_mem gives z_w in Kf, so IsShort.sub_translate
preserves every local integral lattice and bounds each conjugate squared
norm by 4 times the previous B (parallelogram inequality, no rank/count).
Induct on s: the output bound is 4^|s| B. No arbitrary adelic translations
or changed scalar support are allowed. No finite-order premise needed.

Given S of B-short columns spanning Column, T_univ(S) spans the range
of T_univ by linearity; the original span_isShort_eq_top supplies S
at B=exp(D.budget)/4^D.f. Thus all image generators are exp(D.budget)-short
using card_piPlaces and the original scale guard. The existing caller
uses comap of the SAME surjective rangeRestrict, so this is a drop-in
argument, not a new rank estimate. The original theorem type, local
integrality, freeness, different, Weyl basis, numerical bounds and
the common D remain. Original source-visible edges:
Data.short_forms -> span_short_ramifiedColumns ->
  ramifyingOp_finrank_comap_and_short -> finrank_ker_one_sub_centralGen_le
  AND IsShort.sub_translate; span also -> span_isShort_eq_top.
Candidate source-visible edges:
Data.short_forms (later transport) -> span_short_ramifiedColumns_run93 ->
  ramifyingOp_short_run93 -> IsShort.sub_translate, scalarFin_centralGen_mem;
  unchanged span_isShort_eq_top, free-level and scale suppliers.
Do not claim transitive absence until strict graph audit. Original/reduced
graphs and every other A/B/C/D/E/V premise remain. RUN84 transport of
rank branch remains useful to its own consumers; do not duplicate it.

Prior work checked: prime RUN67 6822e2d2, theta RUN57 1300ab28,
integration b1451de3 and RUN84 46b5bd88. Their rank/shortness human
proofs or transports remain intact; new work is the independent native
short-only supplier and exact original-statement span candidate.
Source preflight executed against actual connector contents: six unique
anchors in ChainValuation and 12/12 deleted/duplicated anchor controls
rejected. ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
actual Data.short_forms directly consumes D.span_short_ramifiedColumns.
Local shell found no lean or lake. No native execution of the code below,
nor rh_scan/prune/reduce/auto/frontier. Existing RUN92 native replay retained.
Latest A1 status still ERROR blob 9838f1d1c9d36c9906c2736d5d8d4f08fe98042f,
run 46075703055 (original build accepted, A1 candidate parser failed).
No native PASS or URT speed claim.

RESUME HERE: use RUN66 authenticated artifact intake and the original
pinned workspace for RUN92 leaf replay; after its actual result, in the
same environment compile this file (lake env lean --tstack=400000 PATH)
and require THETA93_SHORT_SPAN_GUARDS_OK, then substitute the accepted
span into the RUN85 actual Data.short_forms transport and audit the
original/reduced graph with exact premises. If first compiler diagnostic
fails, preserve it and repair it before using this candidate.
HANDOFF TO kernel/integration/acceleration/audit. A2/star/RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

noncomputable section
open Module Finset Fintype Matrix MvPolynomial NumberField Representation Space Submodule Valued

namespace Data
variable {P} (D : Data P)

/-- Only the shortness half, with no subspace or rank premise. -/
lemma ramifyingOp_short_run93 (s : Finset D.piPlaces) :
    ∀ B (φ : D.Column), IsShort B φ.1 →
      IsShort (4 ^ #s * B) (D.ramifyingOp s φ).1 := by
  classical
  induction' s using cons_induction with w s _ a
  · rw [(by simp [ramifyingOp] : D.ramifyingOp ∅ = 1)]
    intro B φ hφ
    simpa using hφ
  · erw [card_cons, ramifyingOp, prod_cons, map_mul, map_sub, map_one, asAlgebraHom_of]
    intro B φ hφ
    simpa [pow_succ', mul_assoc] using!
      ((a B φ hφ).sub_translate (scalarFin_centralGen_mem ..).1)

/-- Original span statement, using only shortness from the ramifying operator. -/
lemma span_short_ramifiedColumns_run93 :
    span ℂ {φ : D.ramifiedColumns | IsShort D.budget.exp φ.1.1} = ⊤ :=
  comap_injective_of_surjective (D.ramifyingOp _).surjective_rangeRestrict (eq_top_mono
  (span_le.2 fun φ h ↦ subset_span (by simpa [card_piPlaces, mul_div_cancel₀] using!
  D.ramifyingOp_short_run93 univ _ φ h))
  (span_isShort_eq_top D.classAut_columnLevel_eq_bot P.cycloConductor_mem_different (by grw [boxes,
  sum_height_mul_kappa_le]) (B := _ / 4 ^ D.f)
  (by simpa [le_div_iff₀', ↓card_X, n] using Real.le_exp_of_log_le D.le_of_hasLogBound)))

end Data

#print axioms Data.ramifyingOp_finrank_comap_and_short
#print axioms Data.ramifyingOp_short_run93
#print axioms Data.span_short_ramifiedColumns
#print axioms Data.span_short_ramifiedColumns_run93

run_cmd do
  let old := ``Data.span_short_ramifiedColumns
  let fresh := ``Data.span_short_ramifiedColumns_run93
  let a ← Lean.getConstInfo old
  let b ← Lean.getConstInfo fresh
  unless a.levelParams == b.levelParams do
    Lean.throwError "THETA93 universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "THETA93 original span statement changed"
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[old, fresh, ``Data.ramifyingOp_short_run93, ``Data.ramifyingOp_finrank_comap_and_short] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun x => allowed.contains x) do
      Lean.throwError m!"THETA93 unexpected axiom {n}: {ax}"
    let some v := (← Lean.getConstInfo n).value? (allowOpaque := true) |
      Lean.throwError "THETA93 missing proof value"
    for d in v.getUsedConstants do
      Lean.logInfo m!"THETA93_VALUE_EDGE|{n}|{d}"
  let some oldv := a.value? (allowOpaque := true) |
    Lean.throwError "THETA93 missing original"
  let some newv := b.value? (allowOpaque := true) |
    Lean.throwError "THETA93 missing replacement"
  let oldds := oldv.getUsedConstants
  let newds := newv.getUsedConstants
  unless oldds.contains ``Data.ramifyingOp_finrank_comap_and_short &&
      newds.contains ``Data.ramifyingOp_short_run93 &&
      !newds.contains ``Data.ramifyingOp_finrank_comap_and_short &&
      !newds.contains old do
    Lean.throwError "THETA93 expected span dependency replacement not found"
  let some shortv := (← Lean.getConstInfo ``Data.ramifyingOp_short_run93).value? (allowOpaque := true) |
    Lean.throwError "THETA93 missing short proof"
  let ds := shortv.getUsedConstants
  unless ds.contains ``IsShort.sub_translate &&
      !ds.contains ``Data.finrank_ker_one_sub_centralGen_le &&
      !ds.contains ``Data.ramifyingOp_finrank_comap_and_short do
    Lean.throwError "THETA93 short-only dependency check failed"
  Lean.logInfo "THETA93_SHORT_SPAN_GUARDS_OK"
