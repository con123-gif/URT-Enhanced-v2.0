import JointABCStarRun88
import B2BothEnergyPaths
import Lean

/-!
# Integration — both B2 branches through the common A/B/C family
28 November 2026. SOURCE-MATCHED candidate / PREPARED, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger read at 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.

Prior integration 85824210 preserves original A short forms. Acceleration
RUN89 (71c5751e) preserves the shortened A/common-map and C replacements,
but selects the earlier editor exact Fits supplier, not the new BOTH-energy
replacement. Editor be3872a8 has since joined both fixing-set and complement
energy branches to the accepted B2 count/link fusion; its final enough_forms
is based on original column coordinates and short-form interfaces. Simply
choosing that enough_forms loses the already prepared common-map transport.

The new integration selects the editor's exact-statement joined Fits theorem
at the RUN87 common-map spread caller, then propagates through its row
positivity, RUN63 enough_forms and common family, and RUN88 C star.
No need to compile RUN89's parallel sharp-interface module for this variant.
Exactly the same D, c, coordinates, projected maps, ramifying operator,
n, y, index I, volume bounds and fit family as RUN88. Same native sharp
fixing-set and complement estimates; no relaxed error premise substituted.
Both B2 paths feed one spread result. The rank, integral-index and
reciprocal-height proof bodies are otherwise unchanged, so H cancels:
  m*remainder <= logB^2*budget.
This is an actual caller transport, NOT an independent proof of B3's
quantitative estimates or a completed human proof.

Pinned original sources (grh-compact/src):
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
  energy_fixingSet_le, energy_compl_besselS_le: both call energy_le_of_linkEnergy_le.
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76
  Data.ramifiedColumns_fill_rows, Data.finrank_rows_ne_zero.
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
  Data.enough_forms uses spread AND positivity.
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
  Data.exists_family_covolumeSq_le uses short_forms and enough_forms.
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
  star uses family, positivity and integral_forms_long. Do not import this file.
Peer source blobs:
  RUN88 joint 3b1778e1a282bc6af1481506c4a6bec497ee7989
  RUN89 sharp 2b63642d821721c24f40e7acafc273ac9047600e
  Editor BOTH 805f2821c617e76346c123f20a8430c7091a7c6b
  C2 fused star 535c2f6a161a3eb569ddc0250707d55059fd706e
  C1 late budget f740d8573ec78961509f55ea27b59615b7923a50 (separate pending)
  Prime selected-window endpoint 680760eab01bc7dcde5757a8e9ce6a261a0704b2.

Source-visible graph, caller -> supplier:
star -> family, rows, C; family -> enough, A; enough -> spread, rows;
rows -> spread; spread -> Fits, map; Fits -> positive, complement;
positive -> energy_fixingSet; complement -> energy_compl;
both energy declarations -> crude link-energy.
Candidate replaces the 13 listed edges by their joined counterparts,
retaining A, map, C and every other actual dependency. The first seven
edges belong to this file and the last six to the editor module.
This is only a source subgraph; the complete old and new constructor-
inclusive kernel graphs remain required.

Actual connector JS: 21 peer anchors present, pinned original blobs and
the original source caller excerpts retrieved. On the explicit subgraph,
baseline reaches crude; joined reaches new crude, A, map, C and not old
crude; all 13 single-omission controls restore a path to old crude.
These controls test integration routing, NOT Lean validity or absence in
the full graph. No synthetic arithmetic or URT runtime claim.
Local command -v lean/lake/elan returned empty. No new native engine run.

Fresh actual native evidence (state branch):
C2 value_family_pipeline_results.json 413058eacfda8683f5fb28c68148fd45d1bf1770,
run 46055305146: separate C2ValueFamilyTransport exit 0 (8.53s), four
exact supplier declarations and standard axioms, olean SHA256
df09a2527a08d97db0c9ee168e5585ed30491c6bbe853ef5c4d60df0e788f2c2.
The receipt's graph reports 12 roots, 193451 nodes, 7523207 edges,
zero missing, all supplier guards true; full_RH_replay=false and
human_assembly_verified=false. C1 budget split in same run is NOT accepted.
B3 direct-chart status 18ef8ef8524c02a232a37517e42720b24cf9e8e9
(run 46080383664) ERROR; caller_replacements_checked=false.
A1 repair status 9838f1d1c9d36c9906c2736d5d8d4f08fe98042f
(run 46075703055) ERROR. Prime endpoint cbae0e78caa2f178dfc040f45dcaddcf134f3ad7
(run 46081903735) ERROR; preserve independent failures and repair lanes.
No native PASS for this file. All root obligations OPEN.

RESUME HERE: in the shared authenticated compact workspace, after
accepted JointABCStarRun88 and editor B2BothEnergyPaths (the latter
staged from 2026-11-27_B2_B4_BOTH_ENERGY_PATHS.lean), compile THIS file
as IntegrationBothEnergyStar; require five INTEGRATION_BOTH_ENERGY
markers and all standard axiom reports. Audit its five old/new pairs
plus the editor's existing eight roots using the strict constructor-
inclusive union exporter, preserving original and reduced graphs and
all remaining premises. If the first supplier is not a direct edge,
trace its actual immediate caller; do not remove the guard. Do not
repeat the cold build or the earlier exact-sharp variant. After actual
receipt, use the existing RUN82 selected-window adapter (probe below);
no additional TailGrid premise is necessary on that native route.
The C1 late-budget variant is a separate candidate, not an import here,
so its replay failure cannot block this integration. No Main import.
HANDOFF TO editor / kernel / acceleration / C2 / audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Lean in
private def integrateBothEnergy (old fresh : Name) (pairs : Array (Name × Name)) :
    Elab.Command.CommandElabM Unit := do
  let .thmInfo orig ← getConstInfo old | throwError "expected original theorem {old}"
  let before := orig.value.getUsedConstants
  let typeEdges := orig.type.getUsedConstants
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "INTEGRATION_BOTH_ENERGY supplier type/universe mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "INTEGRATION_BOTH_ENERGY expected distinct proof-only edge: {old} -> {a}"
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
  let .thmInfo checked ← getConstInfo fresh | throwError "missing checked value"
  unless checked.type == orig.type && checked.levelParams == orig.levelParams do
    throwError "INTEGRATION_BOTH_ENERGY changed complete statement: {fresh}"
  let expected := before.map fun n =>
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "INTEGRATION_BOTH_ENERGY unintended direct graph delta: {fresh}"
  unless !got.contains old && pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "INTEGRATION_BOTH_ENERGY stale direct supplier: {fresh}"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "INTEGRATION_BOTH_ENERGY nonstandard axiom: {fresh}"
  logInfo m!"INTEGRATION_BOTH_ENERGY|{fresh}"

open Lean in
run_cmd do
  integrateBothEnergy ``Data.ramifiedColumns_fill_rows_run87 `Data.integration_both_spread
    #[(``Filling.Fits.exists_translate_finrank_comap_le,
       ``Filling.Fits.exists_translate_finrank_comap_le_b2_joined)]
  integrateBothEnergy ``Data.finrank_rows_ne_zero_run87 `Data.integration_both_rows
    #[(``Data.ramifiedColumns_fill_rows_run87, `Data.integration_both_spread)]
  integrateBothEnergy ``Data.enough_forms_run63 `Data.integration_both_enough
    #[(``Data.ramifiedColumns_fill_rows_run87, `Data.integration_both_spread),
      (``Data.finrank_rows_ne_zero_run87, `Data.integration_both_rows)]
  integrateBothEnergy ``Data.exists_family_covolumeSq_le_run63 `Data.integration_both_family
    #[(``Data.enough_forms_run63, `Data.integration_both_enough)]
  integrateBothEnergy ``run88_joint_star_inequality `integration_both_energy_star
    #[(``Data.exists_family_covolumeSq_le_run63, `Data.integration_both_family),
      (``Data.finrank_rows_ne_zero_run87, `Data.integration_both_rows)]
  for (n, required) in #[
    (`Data.integration_both_spread, #[``Data.ramifyingOp_finrank_comap_and_short_run84,
      ``Data.filling_fits_run87, ``Data.columnCoords_run87]),
    (`Data.integration_both_enough, #[``Data.columnCoords_run87]),
    (`Data.integration_both_family, #[``Data.short_forms_run62]),
    (`integration_both_energy_star, #[``Data.run87_fused_integral_forms_long])] do
    let info ← getConstInfo n
    let some v := info.value? (allowOpaque := true) | throwError "missing proof"
    let deps := info.type.getUsedConstants ++ v.getUsedConstants
    unless required.all (fun x => deps.contains x) do
      throwError "INTEGRATION_BOTH_ENERGY lost common-map/A/C supplier: {n}"

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  integration_both_energy_star

#print axioms Data.integration_both_spread
#print axioms Data.integration_both_rows
#print axioms Data.integration_both_enough
#print axioms Data.integration_both_family
#print axioms integration_both_energy_star

/- Only after both independent native receipts, separate endpoint probe:
import IntegrationBothEnergyStar
import Run82FixedModulus
example : RiemannZetaZerosOnLine :=
  zeta_line_run82 (fun P _ _ _ D _ _ _ => @integration_both_energy_star P D)
This uses the actual modified D' via RUN82, never just the initial D.
Do not treat this unexecuted probe as an independent RH proof.
-/
