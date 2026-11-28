import New.Endgame.LongForms
import C2SingleWitnessCombined
import C2ValueFamilyTransport
import Lean

/-!
RUN90 — 28 November 2026. SOURCE-MATCHED / PREPARED, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, continuity, swarm, handoff, expansion read. Peers through
a686fc0d reviewed: kernel eb147fce (A1 artifact intake), integration
1d6a303d (both-energy star), Galois 75f278eb (late C1 budget), acceleration
7ab99c38 (analytic endpoint). Do not duplicate these transports.

A correction to the preferred presentation of C: the global square root
used by RUN86/87 and the current spine is unnecessary for this caller.
The native proof already squares the FIRST HeightLe, and the accepted
archimedean product-formula theorem does not require taking a root.
Combine those existing facts directly, without importing the RUN86 or
RUN87 caller, or adding a new generic square-root theorem.

Exact hypotheses: the original Data.integral_forms_long type, same D,
independent y, n, index I, all-conjugate bound V, one fit family theta;
for r_i=z(theta_i)/z(1) all terms nonzero, let a=V+2delta+db,
c=d(2L-H), L=logB*budget. Native heights give HeightLe a r and
HeightLe (2c) (r^(-1)^2). With their global nonzero witnesses U,W,
use U^2 W, not a square root of W. HeightLe.pow and HeightLe.mul give
HeightLe (2a+2c) (r^2*r^(-1)^2)=HeightLe (2a+2c) 1 after exact
pointwise cancellation; c2_heightLe_nonneg_arch yields 0<=2a+2c.
Division by 2 gives the same signed budget a+c>=0 and b<=L gives
d(H-3L)<=V+2delta. No assumption on the signs of a,c, no change
to the original family and no independent choice of local witnesses.
This restores the native squared argument, NOT a novel product formula.
The actual improvement over RUN87 is the shorter direct supplier path:
the root-extraction helper and its auxiliary norm lemma are not needed
at this C junction. Whether they are absent TRANSITIVELY is unverified.

Source LongForms.lean blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05;
Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518 (pow, mul, mono,
nonneg); C2_SINGLE_WITNESS_COMBINED.lean 4be058901f7072efd82b3711281fae7b913f1712
(archimedean nonneg); C2_VALUE_FAMILY_TRANSPORT.lean
7e912b212aa0a365106cca2e7a0c30a17eb65ff6 (fit-family supplier).
RUN86 e81bcf8064bf50effbbccf7f87b565e068bf2304; RUN87
535c2f6a161a3eb569ddc0250707d55059fd706e retained, not overwritten.
Use exact original elaborated body, simultaneous two-constant
replacement with universe and full type equality guards, normal
kernel insertion, and direct supplier/absence checks. No Main import.
The accepted C2ValueFamilyTransport object has receipt in run 46055305146,
artifact 15234434421 (unexpired at this run). Actual jobs API confirms
three completed jobs; aggregate C1 budget split is still rejected,
not inferred from workflow labels. No new compilation locally:
command -v lean/lake empty; GitHub DNS unavailable; 30GB scratch.
The earlier RUN89 restore path remains pending. No new native scan,
prune, reduce, auto, graph, axiom or root closure claim.

Actual connector JS tests: read three exact blobs above, extracted the
unique native C declaration; reversible rename and two supplier
substitutions round-trip exactly; verified native pow and nonneg
and the archimedean theorem signature. Initial negative control used
a suffix matching both original and replacement (false rejection
test); corrected to full caller boundary and confirmed already-edited
input rejected. Static source checks only. In particular the original
uses .pow 2; do not present this as a new arithmetic lemma.

RESUME HERE: after RUN89 authenticates its shared LongForms and
C2ValueFamilyTransport environment, stage this file as C2SquaredWitness;
compile and compare its root to Data.integral_forms_long and
Data.run87_fused_integral_forms_long using the same constructor-inclusive
graph. Inspect absence of the two square-root helpers rather than
infer it from direct edges. If accepted, integration may choose this
C supplier at the actual both-energy star, with Galois's late-budget
fit supplier substituted separately only after its own validation.
Retain all other paths and premises. No additional cold build.
HANDOFF TO integration/kernel/audit; C2/star/RH remain OPEN.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Lean in
run_cmd do
  let oldName := ``Data.integral_forms_long
  let newName := `Data.run90_squared_witness_integral_forms_long
  let pairs : List (Name × Name) :=
    [(``exists_isFitFamily, ``c2_exists_isFitFamily),
     (``HeightLe.nonneg, ``c2_heightLe_nonneg_arch)]
  let old ← Lean.getConstInfo oldName
  let some value := old.value? (allowOpaque := true) |
    Lean.throwError "RUN90 missing native C proof body"
  for (a,b) in pairs do
    let orig ← Lean.getConstInfo a
    let repl ← Lean.getConstInfo b
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq orig.type repl.type
    unless orig.levelParams == repl.levelParams && same do
      Lean.throwError "RUN90 complete supplier statement changed: {a}"
    unless value.getUsedConstants.contains a do
      Lean.throwError "RUN90 missing original direct supplier: {a}"
  let revised := value.replace fun e ↦
    match e with
    | .const n us =>
      match pairs.find? (fun p ↦ p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  let deps := revised.getUsedConstants
  for (a,b) in pairs do
    unless deps.contains b do
      Lean.throwError "RUN90 replacement supplier missing: {b}"
    if deps.contains a then
      Lean.throwError "RUN90 old direct supplier retained: {a}"
  for required in [``HeightLe.pow, ``HeightLe.mul, ``HeightLe.mono,
      ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq,
      ``Data.volume_iota_eq_prod_liftVolume] do
    unless deps.contains required do
      Lean.throwError "RUN90 required direct supplier missing: {required}"
  for forbidden in [oldName, ``c2_heightLe_of_sq,
      ``c2_norm_map_le_exp_half, ``c2_heightLe_single_witness_budget] do
    if deps.contains forbidden then
      Lean.throwError "RUN90 unwanted direct supplier: {forbidden}"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := newName
    levelParams := old.levelParams
    type := old.type
    value := revised
  })
  Lean.logInfo "RUN90_SQUARED_WITNESS: exact native C statement; signed squared cancellation; direct fit and archimedean suppliers"

#print axioms Data.run90_squared_witness_integral_forms_long
