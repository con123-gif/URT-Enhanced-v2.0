import JointABCStarRun88
import B3ExactSharpInterface
import Lean

/-!
RUN89 — join the exact B3/B4 sharp path into the already common-map A/B/C
star, instead of choosing between two incompatible partial transports.
27 November 2026. SOURCE-MATCHED / PREPARED, not kernel replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.

New discrepancy: integration 8582421092a4a2e672f784bed4beb45580cff46b
uses the sharp Fits supplier but transports from ORIGINAL spread/enough/
family (retains original short_forms). RUN88 instead keeps shortened A1/A2
and common-map rank but retains the original sharp Fits supplier. Neither
subsumes the other. Reuse the original sharp statement proved by the
editor, not the relaxed energy or separately reselected maps. Replace
its exact direct occurrence in the already prepared RUN87 spread, then
propagate through RUN87 row positivity, RUN63 enough (both edges), RUN63
family and RUN88 star (both edges). Keep the existing shortened A
supplier and fused C supplier. This is a single common-family proof path:
same D, c, column coordinates, chosen Poincare map, ramifying operator,
rank, y, index I, conjugate Gram bound, fit family and scale guards.
No new arithmetic assumption, no relaxation of the original sharp bound.
Exact same type (including universe parameters) for each target; the
substituted supplier types must be definitionally equal. Each changed
constant is required in the actual proof value; reject if it occurs in
the theorem type rather than silently changing that type. The complete
direct value edge set must be precisely the intended substitution.
All other type/value dependencies retained, no transitive deletion claim.

Pinned source blobs: FillingTheorem 801448ae9b895babd0d69dc4f7967d86eb006e76;
ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a;
LongForms 9eff36cf003ac398fbd24361e80e95a03d0b0e05.
Exact fetched peer blobs: RUN88 3b1778e1a282bc6af1481506c4a6bec497ee7989;
theta RUN87 ba1101caf13444d28a19de3682c83e1c38a92255;
kernel RUN63 5d10d2c18931bb26a575140c62182e832474d6c8;
editor exact 7906ca4e381e73efe8f6fe6adc48539060e6a222;
integration d53001066c90a5f173707372abf2e03ca16db5ab.
Executed connector preflight: four actual original declarations from three
pinned blobs, five peer artifacts, 26 source anchors, 26/26 individually
removed-anchor negative controls rejected. These are textual checks,
not elaborated dependency evidence. Local lean/lake/elan unavailable.

Actual shared C1 run 46055305146 status ERROR (fe5d4503f1bc8eb7752f9b86a6fdf35f452c872c).
C1 budget split exit 1, sorryAx in both fit-family replacements; the
separate RUN83 packed payment and three original caller probes exit 0.
Do not import the failed C1 variant. In the SAME run the separate C2
measure/family/twist/fit transport compile.log blob 138029544ef0a2929c824b658745803c02fbe0a0
reports four complete-statement transports and standard axioms. Its
12-root graph summary b281ea4b5a96ccd9a10d0353deee520d1b483bc2 reports
193451 nodes, 7523207 edges, zero missing, 1685025 repeated root-node
visits in the independent traversals. Union counts are not time speedups.
Graph execution f912cd99dcde04474734714006bbb2d87f6e055c exit 0,
269.13 s, all 12 standard axiom reports; reachability receipt
5150c752f79e41df980fbb85920bf315b3edce4e all guards pass.
Retained C1 cache wrapper 2146cd28915a80aa467d64de6ecd0f659e71f389:
source build exit 0 (9557.24 s), archive native_c1_oleans.tar.zst
792898966 bytes, SHA256 63bbe26668b47f81149ef5f5e06033168489076b68eb22509fa40bcc518a9603,
artifact 15234434421. Source build log f9e15185163767cc8cf2c8f6ec35abd2f40961c4
confirms New.Curve.ConjugatesOfJets and FitTwistsExist built, but no
New.Columns.LocalStatement or ShortAndEnough build marker. Do not assume
this cache includes those objects. Archive bytes NOT downloaded/verified
in this run. Original A1/A2 receipt remains ERROR; retry status and cache
manifest both 404 at inspection. No duplicate job or protected edits.

All A/B/C/D/E/V root obligations remain OPEN. C2 accepted partial replay
is not star closure. No new native scan/prune/reduce/auto/frontier executed.
RESUME HERE: after the existing RUN88 and editor exact native modules
have accepted receipts, stage RUN88 as JointABCStarRun88 and compile this
file as JointABCSharpRun89 in their authenticated shared compact workspace.
Require exit 0 and five RUN89_JOINT_SHARP markers, standard axioms,
then the existing strict constructor-inclusive exporter on the five
source/target pairs. Require reachable new sharp, short_forms_run62,
ramifyingOp_finrank_comap_and_short_run84 and fused C suppliers;
report any surviving old paths rather than assuming global deletion.
On rejection repair the first actual diagnostic, not another cold build.
HANDOFF TO integration, kernel, theta, editor and audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

open Lean in
private def run89Transport (old fresh : Name) (pairs : Array (Name × Name)) :
    Elab.Command.CommandElabM Unit := do
  let .thmInfo original ← getConstInfo old | throwError "RUN89 expected theorem {old}"
  let before := original.value.getUsedConstants
  let typeEdges := original.type.getUsedConstants
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "RUN89 supplier type/universe mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "RUN89 expected distinct proof-only direct edge: {old} -> {a}"
  let value := original.value.replace fun e =>
    match e with
    | .const n us =>
      match pairs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := original.levelParams,
    type := original.type, value := value })
  let .thmInfo checked ← getConstInfo fresh | throwError "RUN89 no checked theorem"
  unless checked.type == original.type && checked.levelParams == original.levelParams do
    throwError "RUN89 changed original theorem statement"
  let expected := (before.filter (fun n => !pairs.any (fun p => p.1 == n))) ++ pairs.map Prod.snd
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "RUN89 unintended direct edge delta: {fresh}"
  unless !got.contains old && pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "RUN89 retained original direct supplier: {fresh}"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "RUN89 nonstandard axiom: {fresh}"
  logInfo m!"RUN89_JOINT_SHARP|{fresh}"

open Lean in
run_cmd do
  run89Transport ``Data.ramifiedColumns_fill_rows_run87 `Data.run89_sharp_spread
    #[( ``Filling.Fits.exists_translate_finrank_comap_le,
      ``Filling.Fits.exists_translate_finrank_comap_le_editor_exact)]
  run89Transport ``Data.finrank_rows_ne_zero_run87 `Data.run89_sharp_rows_ne_zero
    #[( ``Data.ramifiedColumns_fill_rows_run87, `Data.run89_sharp_spread)]
  run89Transport ``Data.enough_forms_run63 `Data.run89_sharp_enough
    #[( ``Data.ramifiedColumns_fill_rows_run87, `Data.run89_sharp_spread),
      (``Data.finrank_rows_ne_zero_run87, `Data.run89_sharp_rows_ne_zero)]
  run89Transport ``Data.exists_family_covolumeSq_le_run63 `Data.run89_sharp_family
    #[( ``Data.enough_forms_run63, `Data.run89_sharp_enough)]
  run89Transport ``run88_joint_star_inequality `run89_joint_sharp_star
    #[( ``Data.exists_family_covolumeSq_le_run63, `Data.run89_sharp_family),
      (``Data.finrank_rows_ne_zero_run87, `Data.run89_sharp_rows_ne_zero)]
  for (n, required) in #[
    (`Data.run89_sharp_spread, #[``Data.ramifyingOp_finrank_comap_and_short_run84,
      ``Data.filling_fits_run87, ``Data.columnCoords_run87]),
    (`Data.run89_sharp_enough, #[``Data.columnCoords_run87]),
    (`Data.run89_sharp_family, #[``Data.short_forms_run62]),
    (`run89_joint_sharp_star, #[``Data.run87_fused_integral_forms_long])] do
    let info ← getConstInfo n
    let some v := info.value? (allowOpaque := true) | throwError "RUN89 missing proof"
    let deps := info.type.getUsedConstants ++ v.getUsedConstants
    unless required.all (fun x => deps.contains x) do
      throwError "RUN89 lost common-map/A/C supplier at {n}"

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run89_joint_sharp_star

#print axioms Data.run89_sharp_spread
#print axioms Data.run89_sharp_rows_ne_zero
#print axioms Data.run89_sharp_enough
#print axioms Data.run89_sharp_family
#print axioms run89_joint_sharp_star
