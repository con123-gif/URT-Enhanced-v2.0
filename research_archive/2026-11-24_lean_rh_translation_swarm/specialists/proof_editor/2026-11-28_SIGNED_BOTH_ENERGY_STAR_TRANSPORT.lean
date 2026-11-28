import IntegrationBothEnergyStar
import EditorMainHeightPositive
import Lean

/-!
# Editor — connect the main-height sign to the actual joined A/B/C caller
28 November 2026. SOURCE-MATCHED / PREPARED; no native replay for this file.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES read.
Branch head inspected f2f9ff479b45070774257c061a923bf784b565bf.
Recent peers: b9171026 (sharper C budget), d8fe4185 (conditional relaxed
global energy), db910fac (small crude rows), 59d15706 (A2 leaf),
a3ba3e55 (class-restricted count equivalence).

## Actual caller junction, not another scalar theorem
The previous editor sign proof (8ca68829003007c5efeb604caa6ed37ddac12814,
source blob df8004136c1140907f6f15372cc3b256544e9a70) used the
ORIGINAL family, row positivity and C supplier. The integration
candidate (26a1965f8ef58960b7045fcc32ab65f795a9d22b) uses the
joined B2 energy paths and shortened A/common-map/C, but still
has the original crude height bound in its final star algebra.
Neither candidate alone has both reductions. Do not select a new
C route which silently reinstates original determinant suppliers.

Select the sign-based proof value, replacing exactly its three
proof-only edges by the type-identical joined suppliers:

  Data.exists_family_covolumeSq_le -> Data.integration_both_family
  Data.finrank_rows_ne_zero -> Data.integration_both_rows
  Data.integral_forms_long -> Data.run87_fused_integral_forms_long

Retain Data.editor_mainHeight_nonneg unchanged. This preserves the
same D, n, y, index I, all conjugate bounds, actual fit family,
native near-full-rank guard, and both B2 energy branches. No extra
premises and no new mathematical argument required if the existing
modules compile and these supplier types agree. The direct
star proof now has neither original crude-height premise nor
the original A/B family or C theorem as a direct value edge.

The actual common cancellation, with d>0, d/2<=n<=d,
S=m*remainder, L=logB*budget, H=mainHeight>=0, is
  n S <= -(d-n) H + (3d+n)L + 2delta
      <= d(4L+10 log(1+b^2) budget).
The native rank and scale estimates then give the identical
star statement S<=logB^2*budget. Do not weaken the C rank guard
to half rank: the half-rank inequality is only used AFTER C.
No substitution of a different D, different y or arithmetic
endpoint. No import of New.Main. Exact source New/Main.lean
198ed5bf26aa294898931e0649bc2b88f1389f65 (read only), LongForms.lean
9eff36cf003ac398fbd24361e80e95a03d0b0e05. The earlier alternative
C2NearRankStar (b9171026) strengthens C's error to L, but retains
original forward height and crude star; it is a separate pending
branch, not mixed into this exact-type transport. Likewise
the relaxed-rank C completion is a distinct candidate.

## Actual checks and failed routes
Connector read both peer files and the pinned Main, LongForms,
AdmissibleData, Weights, Magnitudes, ShortAndEnough and
SizeEstimates. Six named peer source anchors present, six
anchor-deletion controls checked; these are source checks only.
Local command -v lean/lake returned no executable. No new native
rh_scan/prune/reduce/auto/frontier, proof-term checks or graph
execution for this module. The code below is executable
Lean candidate with explicit kernel/type/axiom and direct-edge
guards, not evidence that those guards passed.

Fresh accepted A2 native leaf receipt: state branch
compute/rh-compact-a2-leaf-repair-20261128/outputs/theta92/theta92_result.json
blob 492e6c7c2590f849ba59eae6f11517b646d72f44, run 46125697285.
Leaf compile 0 in 7.48 s, graph compile 0 in 72.72 s,
prune 0 in 7.98 s; standard axioms, local old neatness absent,
caller_replacements_checked=false, full_RH_replay=false.
Reuse the peer RUN102 seven-caller transport; no repeat leaf.

Actual prior editor mean job FAILED, not pending anymore:
compute/rh-compact-editor-polar-mean-20261128/status.json
blob fa94144207e95b85160f7c10e531948a96860ced,
run 46128665889, returncode 1. First native diagnostic in
outputs/editor/EditorPolarMean.log blob 4725034581351a3c58b65981df5af068aaff7a59:
line 80:37 introN failed because the eventual goal is a conjunction,
then sorryAx guard rejected the declaration. Preserve the failure;
this mean route is no longer preferred after cbba4f59 and
the later class-restricted selected-budget audit. Do not repair
it ahead of the actual arithmetic suppliers or import its object.
C2 cache-path repair status query returned 404; no result inferred.
Existing original/reduced graph evidence and all unresolved
root obligations retained. No complete proof or global edge
deletion claim. The live spine may select this transport only
after actual native acceptance.

RESUME HERE: in the retained authenticated LongForms workspace,
compile the signed height supplier and the existing joined family/C
modules, then this exact transport as EditorSignedBothEnergyStar;
require EDITOR_SIGNED_BOTH_ENERGY_OK, original full star type
and standard axioms. Use the strict existing compact graph
exporter to compare the original star (separate reference module),
the two input stars and the joined root, with both energy branches,
A/common map, C and sign suppliers present and obsolete direct
edges absent; check transitive paths separately, not merely imports.
Do not rebuild accepted B2/C2/A2 leaves or use rejected objects.
HANDOFF integration / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Lean in
run_cmd do
  let old := ``editor_positive_height_star
  let fresh := `editor_signed_both_energy_star
  let .thmInfo orig ← getConstInfo old | throwError "expected signed star theorem"
  let pairs := #[
    (``Data.exists_family_covolumeSq_le, ``Data.integration_both_family),
    (``Data.finrank_rows_ne_zero, ``Data.integration_both_rows),
    (``Data.integral_forms_long, ``Data.run87_fused_integral_forms_long)]
  let before := orig.value.getUsedConstants
  let typeEdges := orig.type.getUsedConstants
  unless before.contains ``Data.editor_mainHeight_nonneg do
    throwError "EDITOR_SIGNED_BOTH_ENERGY missing original sign supplier"
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "EDITOR_SIGNED_BOTH_ENERGY supplier type/universe mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "EDITOR_SIGNED_BOTH_ENERGY not a distinct proof-only edge: {a}"
  let value := orig.value.replace fun e =>
    match e with
    | .const n us =>
      match pairs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams,
    type := orig.type, value := value })
  let .thmInfo checked ← getConstInfo fresh | throwError "missing checked star"
  unless checked.type == orig.type && checked.levelParams == orig.levelParams do
    throwError "EDITOR_SIGNED_BOTH_ENERGY changed exact statement"
  let expected := before.map fun n =>
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "EDITOR_SIGNED_BOTH_ENERGY unintended direct graph delta"
  unless pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "EDITOR_SIGNED_BOTH_ENERGY stale direct edge"
  unless got.contains ``Data.editor_mainHeight_nonneg &&
      !got.contains ``Data.abs_mainHeight_add_remainder_le &&
      !got.contains old && !got.contains ``integration_both_energy_star do
    throwError "EDITOR_SIGNED_BOTH_ENERGY stale star/crude edge or missing sign"
  let oa ← collectAxioms old
  let na ← collectAxioms fresh
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  unless oa.all (fun n => allowed.contains n) &&
      na.all (fun n => allowed.contains n && oa.contains n) do
    throwError "EDITOR_SIGNED_BOTH_ENERGY nonstandard or added axiom"
  logInfo "EDITOR_SIGNED_BOTH_ENERGY_OK"

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  editor_signed_both_energy_star

#print axioms editor_signed_both_energy_star
