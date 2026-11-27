import JointABRun63
import C2FusedToStar
import Lean

/-!
RUN88 — 27 November 2026. Actual star has a second A2 path, independent
of the family supplier: D.finrank_rows_ne_zero.pos. Replacing the family
alone leaves this old direct reference. Fuse both A/B and C prepared
proofs, also replacing the exact rank positivity supplier. PREPARED,
NOT kernel replayed. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission/spine/ledger read at 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin remains separate. Actual New/Main.lean blob
198ed5bf26aa294898931e0649bc2b88f1389f65.
The single original star body contains each of
D.exists_family_covolumeSq_le.elim, D.finrank_rows_ne_zero.pos,
integral_forms_long i big I short exactly once. Exact same D, n, y,
index, all-conjugate covolume bound, C's fit family, rank positivity
and HasLogBound; no new premises or reselected witnesses. The central
identity H cancels unchanged. Source checks on actual connector files:
3 unique anchors, 3/3 removed-anchor negative controls rejected, exact
reverse roundtrip of all three textual substitutions. This is NOT
evidence of elaborated dependency removal.

Reuse kernel RUN63 joint A/B generator blob
5d10d2c18931bb26a575140c62182e832474d6c8, theta RUN87 common-map
tail ba1101caf13444d28a19de3682c83e1c38a92255, character boxes
RUN87 C fusion 535c2f6a161a3eb569ddc0250707d55059fd706e.
Theta RUN90 4e92d1a8 shortens residue characteristic helper separately;
do not duplicate that work. C2 stage uses the accepted local junction
but its actual family replay is pending. No original Main or RH import;
all imported candidates are pre-RH suppliers. The original and reduced
graphs and all open obligations stay intact. This joins two exact
proof-term substitutions in the already prepared C star; do NOT
concatenate competing source modules or duplicate cold builds.

Latest actual A1/A2 status: ERROR, run 46023465491, blob
07a2b14930c38095e6771ae9ed1a10a3cf1bf678. RUN61 retry status still 404.
Shared C1 run 46055305146 job 140698522135 in_progress at inspection.
Neither is a receipt for the new star. No native engines executed here,
no measured acceleration, no global dependency deletion or RH claim.

RESUME HERE: after authenticated original workspace and actual RUN63 /
C2FusedToStar receipts accept, stage their checked modules with the same
pinned LEAN_PATH and run lake env lean --tstack=400000 RUN88_JOINT_ABC_STAR.lean.
Require exit 0, exactly one RUN88_JOINT_STAR_CHECKED, standard axioms,
then use the existing strict constructor-inclusive exporter on
run87_fused_star_inequality and run88_joint_star_inequality, retaining
paths to all three replacement suppliers and any surviving old leaves.
No new cold build or full RH theorem import. HANDOFF TO integration,
kernel, theta, character boxes and audit. All A/B/C/D/E/V remain OPEN.
-/

set_option debug.skipKernelTC false
set_option pp.fullNames true

open Lean in
run_cmd do
  let sourceName := ``run87_fused_star_inequality
  let targetName := `run88_joint_star_inequality
  let pairs := #[
    (``Data.exists_family_covolumeSq_le, ``Data.exists_family_covolumeSq_le_run63),
    (``Data.finrank_rows_ne_zero, ``Data.finrank_rows_ne_zero_run87)]
  let source ← getConstInfo sourceName
  let some value := source.value? (allowOpaque := true) |
    throwError "RUN88 missing checked C-star proof body"
  for (oldName, newName) in pairs do
    let old ← getConstInfo oldName
    let new ← getConstInfo newName
    let same ← Elab.Command.liftTermElabM do
      Meta.isDefEq old.type new.type
    unless old.levelParams == new.levelParams && same do
      throwError "RUN88 changed supplier statement/universes: {oldName}"
    unless value.getUsedConstants.contains oldName do
      throwError "RUN88 missing original direct edge: {oldName}"
  unless value.getUsedConstants.contains ``Data.run87_fused_integral_forms_long do
    throwError "RUN88 missing already fused C supplier"
  let replaced := value.replace fun e ↦
    match e with
    | .const n levels =>
      if n == ``Data.exists_family_covolumeSq_le then
        some (.const ``Data.exists_family_covolumeSq_le_run63 levels)
      else if n == ``Data.finrank_rows_ne_zero then
        some (.const ``Data.finrank_rows_ne_zero_run87 levels)
      else none
    | _ => none
  let deps := replaced.getUsedConstants
  for (oldName, newName) in pairs do
    unless deps.contains newName && !deps.contains oldName do
      throwError "RUN88 exact direct replacement failed: {oldName}"
  unless deps.contains ``Data.run87_fused_integral_forms_long &&
      !deps.contains sourceName && !deps.contains ``Data.integral_forms_long do
    throwError "RUN88 common C witness or alias guard failed"
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := targetName, levelParams := source.levelParams,
    type := source.type, value := replaced })
  let target ← getConstInfo targetName
  let same ← Elab.Command.liftTermElabM do
    Meta.isDefEq source.type target.type
  unless source.levelParams == target.levelParams && same do
    throwError "RUN88 complete star statement changed"
  let axs ← collectAxioms targetName
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "RUN88 nonstandard axiom"
  logInfo "RUN88_JOINT_STAR_CHECKED"

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run88_joint_star_inequality

#print axioms run87_fused_star_inequality
#print axioms run88_joint_star_inequality
