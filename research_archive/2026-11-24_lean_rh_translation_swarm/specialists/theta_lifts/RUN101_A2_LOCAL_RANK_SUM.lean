import New.Columns.ChainValuation
import Lean

/-!
RUN101 — localize the actual ramification rank loss to the sum of individual
kernel dimensions, and separate its replay from unavailable Filling modules.
28 November 2026. HUMAN DERIVATION / SOURCE-MATCHED, Lean PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read protocols, AGENTS, prior RUN94/95/96/98/99/100 and recent peers:
426d7f70 (kernel A1 diagnostics), a20fc159 (B spread weakening),
5bde193f (prime endpoint), distinct scopes. Do not alter their work.

Actual source ChainValuation.lean blob 19e853dfa8c645bfcdf3b3e21183f9b432620ef7,
Data.ramifyingOp, finrank_ker_one_sub_centralGen_le, and
ramifyingOp_finrank_comap_and_short. RUN94 blob e95b401fff71040ada447d8c821428b07c25c448.
RUN94 uses uniform bound k=dim(Column)/(N-1) in every induction step.
Instead retain actual individual losses k_w=dim ker(1-z_w). For finite
s and any subspace F of the SAME finite-dimensional Column V, let
T_s=prod_{w in s}(1-z_w), with the native representation/product order.
The exact identity (AB)^(-1)(F)=B^(-1)(A^(-1)(F)) and rank-nullity on
A restricted to A^(-1)(F) give
  dim T_s^(-1)(F) <= dim F + sum_{w in s} k_w.
For empty s this is equality. In the insert/cons step use
T_{w+s}=(1-z_w)T_s and the induction hypothesis at (1-z_w)^(-1)(F),
then add k_w. No congruence, level freeness, uniform k estimate or
shortness needed by this abstract rank argument; the SAME native
representation and its finite dimensionality remain. Individual
kernel dimensions are not assumed independent; no equality asserted.
The old bound follows by termwise comparison k_w <= k and finite sum.
It needs the original arithmetic/freeness supplier only once at the
adapter. No stronger numerical spread claimed without proving new
bounds on the actual k_w. All A/B/C and analytic obligations preserved.

The new local declarations import ChainValuation, already present
in authenticated artifact 15236761794 (RUN96), not FillingTheorem
which requires downstream objects. This is an independent native
verification unit, unlike RUN94's full caller module. Original graph:
joint -> one-factor bound AND shortness; RUN94 rank -> one-factor bound.
Candidate: sum rank -> rank-nullity + native product; uniform adapter
-> sum rank + original one-factor bound. This is source-level only;
do not claim global absence, especially since types/definitions may
retain unrelated paths. Explicit direct value guards below, and exact
first-conjunct type comparison under a fixed D, s, F via a bridge.
The existing RUN94 actual spread and positivity callers are unchanged;
after replay transport only the rank supplier into them.

Actual preflight: fetched pinned source and RUN94; six unique anchors
and 12/12 removed/duplicated-anchor negatives checked in connector JS.
Local container has no lean/lake. No native PASS, graph/prune result
or performance claim. Shared compute run 46125697285 has selected
actual rh-compact-a2-leaf-repair-20261128; job 140919734306 in progress
at read, status and leaf receipt state paths not published (404).
No duplicate queue registration and no protected workflow edit.

RESUME HERE: consume actual RUN98 native receipt from run 46125697285
first. In that retained authenticated workspace compile this local
file as an external module ThetaRankSumRun101.olean with
lake env lean --tstack=400000 -R OUT -o OUT/ThetaRankSumRun101.olean PATH.
Require exit 0, THETA101_LOCAL_RANK_GUARDS_OK and standard axioms.
Then use existing RUN26_COMPACT_GRAPH exporter + independent audit
and RHProofTermPrune engine (same method as RUN99) on the original
joint, sum rank and uniform adapter roots; preserve all masks and
run rh_scan/rh_prune on those actual roots. Only after that transport
the uniform adapter into the RUN94 spread caller when its imports
are available. If compilation fails preserve actual diagnostics.
HANDOFF kernel/integration/acceleration/audit. A2/B4/RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Module Finset Fintype Matrix MvPolynomial NumberField Representation Space Submodule Valued

namespace Data
variable {P} (D : Data P)

/-- Keep heterogeneous rank losses until the actual arithmetic caller. -/
lemma ramifyingOp_finrank_comap_sum_run101 (s : Finset D.piPlaces)
    (p : Submodule ℂ D.Column) :
    (finrank ℂ (Submodule.comap (D.ramifyingOp s) p) : ℝ) ≤
      (finrank ℂ p : ℝ) +
      ∑ w ∈ s, (finrank ℂ (1 - D.centralRep (D.centralGen w)).ker : ℝ) := by
  classical
  induction' s using cons_induction with w s hw a generalizing p
  · rw [(by simp [ramifyingOp] : D.ramifyingOp ∅ = 1)]; simp
  · erw [sum_cons, ramifyingOp, prod_cons, map_mul, map_sub, map_one, asAlgebraHom_of,
      p.comap_comp (D.ramifyingOp s)]
    grw [a _, (by simpa [↓← finrank_eq_rank, ← Nat.cast_add] using
      (1 - D.centralRep (D.centralGen w)).lift_rank_comap_le :), Nat.cast_add]
    grind

/-- Same uniform bound as the original first conjunct and RUN94. -/
lemma ramifyingOp_finrank_comap_uniform_run101 (s : Finset D.piPlaces)
    (p : Submodule ℂ D.Column) :
    (finrank ℂ (Submodule.comap (D.ramifyingOp s) p) : ℝ) ≤
      finrank ℂ p + #s * (D.N - 1 : ℝ)⁻¹ * finrank ℂ D.Column := by
  classical
  refine (D.ramifyingOp_finrank_comap_sum_run101 s p).trans ?_
  have h : (∑ w ∈ s, (finrank ℂ (1 - D.centralRep (D.centralGen w)).ker : ℝ)) ≤
      ∑ _w ∈ s, ((D.N - 1 : ℝ)⁻¹ * finrank ℂ D.Column) :=
    Finset.sum_le_sum fun w _ ↦ D.finrank_ker_one_sub_centralGen_le w
  have hh := add_le_add_left h (finrank ℂ p : ℝ)
  simpa [Finset.sum_const, nsmul_eq_mul, mul_assoc] using hh

end Data

#print axioms Data.ramifyingOp_finrank_comap_and_short
#print axioms Data.ramifyingOp_finrank_comap_sum_run101
#print axioms Data.ramifyingOp_finrank_comap_uniform_run101

run_cmd do
  let old := ``Data.ramifyingOp_finrank_comap_and_short
  let sum := ``Data.ramifyingOp_finrank_comap_sum_run101
  let uniform := ``Data.ramifyingOp_finrank_comap_uniform_run101
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[old,sum,uniform] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun x => allowed.contains x) do
      Lean.throwError m!"THETA101 unexpected axiom {n}: {ax}"
    let some v := (← Lean.getConstInfo n).value? (allowOpaque := true) |
      Lean.throwError m!"THETA101 missing value {n}"
    for d in v.getUsedConstants do
      Lean.logInfo m!"THETA101_VALUE_EDGE|{n}|{d}"
  let some sv := (← Lean.getConstInfo sum).value? (allowOpaque := true) |
    Lean.throwError "THETA101 missing sum"
  let some uv := (← Lean.getConstInfo uniform).value? (allowOpaque := true) |
    Lean.throwError "THETA101 missing uniform"
  let sd := sv.getUsedConstants
  let ud := uv.getUsedConstants
  unless !sd.contains old && !sd.contains ``Data.finrank_ker_one_sub_centralGen_le &&
      !sd.contains ``IsShort.sub_translate &&
      ud.contains sum && ud.contains ``Data.finrank_ker_one_sub_centralGen_le &&
      !ud.contains old do
    Lean.throwError "THETA101 local rank dependency guard"
  Lean.logInfo "THETA101_LOCAL_RANK_GUARDS_OK"
