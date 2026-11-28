import AuditExactCompletion
import C2SquaredStarMinimal
import Lean

/-!
RUN95 character boxes — 28 November 2026. PREPARED / source-matched.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger read: 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION and latest peer commits read.

Independent next step while native RUN94 (46108846902, job 140867652611)
is actually in_progress: the new acceleration 575f1cad exact-completion
signed endpoint still calls Data.audit_integral_forms_long_exact, which
uses the OLD exists_isFitFamily and HeightLe.nonneg. Do not force that
alternative to use the near-full-rank RUN91 C statement. Reuse audit's
exact completion and transport only these two proof-only edges to the
preferred C2 family and archimedean product formula. This joins the new
rank-free C interface to the determinant-family reduction, not another
scalar bound or repeat of RUN91. No new rank-free B supplier is claimed.

Stage inputs:
AuditExactCompletion = audit/2026-11-27_C_EXACT_COMPLETION_CALLER_AUDIT.lean
  blob 3246d8ef051ac8d138be5fc3649af1cb8132ea1a.
C2SquaredStarMinimal = specialists/character_boxes/RUN91_COMPACT_C2_SQUARED_STAR_MINIMAL.lean
  blob 1bd5f9339e7a588439173ccb8be396f208cfb120.
Its C2ValueFamilyTransport supplier blob 7e912b212aa0a365106cca2e7a0c30a17eb65ff6
is accepted in run 46055305146, but this rank-free caller and RUN91
are not yet replayed. The actual consumer is acceleration's
RHAcceleration95.exact_completion_endpoint, file
specialists/on_acceleration/compact/RUN95_EXACT_COMPLETION_SIGNED_ENDPOINT.lean,
blob ac239b98078d642b015e9aa5f658267a57a9af0d.
Galois 33d7b4a2 separately queued C1FiniteBudgetMinimal; do not import it
here or make its pending arithmetic proof a prerequisite. If accepted
later, the same exact fit-family edge admits its finite-budget supplier.

Exact math: retain the SAME D, independent y : Fin n -> D.rows,
IndexLe y delta, all conjugate covolumeSq <= exp V, full completion,
one_determinant, nonzero common ratio and fit family. The cost
U = x1^2*b^2 + x^99 + 4*m^2*t*x^999 includes the projection cost.
With d = rowDim, H = mainHeight, L = logB*budget, set
a = V + 2delta + (d-n)U, c = d(2L-H).
The original two signed height estimates and r^2*r^-2=1 give
HeightLe(2a+2c,1), hence 0 <= 2a+2c by product formula. Thus
d(H-2L) <= V+2delta+(d-n)U.
No near-full-rank hn is introduced, and no sign assumption on H or V.
The completion and exact cost inequality are retained, not reproved.
This statement does not itself give the star or the weighted cost
envelope required by the signed endpoint. Existing rounded route
and all original/alternative graphs are preserved.

Actual connector source checks: six unique anchors in audit theorem
(fit selection, exact row height, ratio height, volume nonvanishing,
nonneg, final linarith); confirmed both new supplier names, exact
acceleration consumer and absence of hn in the audit theorem body.
Fit supplier rename and theorem rename round-trip to identical source;
three absent/duplicated/already-replaced controls rejected. Source
checks are not kernel checks. The Lean guard below verifies both
supplier statements, exact proof-only edges, full statement preservation,
exact direct value-dependency delta, standard axioms and retained
signed-height and nonzero suppliers, then inserts ordinary theorem
declaration. No Main import, no claimed RH theorem. No local lean/lake
and GitHub git DNS failed. Native RUN94 job still in_progress on
last fresh query; no new compiler/graph receipt, native rh_scan/prune/
reduce/auto/frontier execution or root obligation discharge in this run.

RESUME HERE: after reading the actual RUN94 compiler and graph receipt,
compile AuditExactCompletion (repair its actual cast diagnostic if any)
and this file as C2ExactCompletionTransport in the SAME authenticated
compact workspace with accepted C2SquaredStarMinimal; require the
RUN95_EXACT_C2 marker, original/new standard axioms, and strict
constructor-inclusive graph for the original audit C and new C.
Check actual absence or retained indirect membership of old fit/nonneg,
old rounded C, exact row-height, nonzero and arithmetic suppliers.
If accepted, replace Data.audit_integral_forms_long_exact at the
actual acceleration exact_completion_endpoint, retaining its local cost
envelope and all integrability premises. Do not duplicate RUN94 or
C1 queue, or treat this prepared module as a passed proof. RH OPEN.
HANDOFF TO acceleration / integration / kernel / audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Lean in
run_cmd do
  let old := ``Data.audit_integral_forms_long_exact
  let fresh := `Data.run95_exact_completion_c2
  let pairs : Array (Name × Name) :=
    #[(``exists_isFitFamily, ``c2_exists_isFitFamily),
      (``HeightLe.nonneg, ``c2_heightLe_nonneg_arch)]
  let .thmInfo orig ← getConstInfo old |
    throwError "RUN95_EXACT_C2 expected original audit theorem"
  let before := orig.value.getUsedConstants
  let typeEdges := orig.type.getUsedConstants
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "RUN95_EXACT_C2 supplier statement mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "RUN95_EXACT_C2 expected distinct proof-only edge: {a}"
  let revised := orig.value.replace fun e =>
    match e with
    | .const n us =>
      match pairs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams,
    type := orig.type, value := revised })
  let .thmInfo checked ← getConstInfo fresh |
    throwError "RUN95_EXACT_C2 missing inserted proof"
  let expected := before.map fun n =>
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let got := checked.value.getUsedConstants
  unless checked.type == orig.type && checked.levelParams == orig.levelParams &&
      expected.all (fun n => got.contains n) &&
      got.all (fun n => expected.contains n) do
    throwError "RUN95_EXACT_C2 unintended statement/dependency delta"
  unless pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "RUN95_EXACT_C2 stale direct supplier"
  for required in #[``Data.audit_heightLe_volume_rows_exact,
      ``Data.heightLe_volume_ratio_sq, ``Data.volume_iota_eq_prod_liftVolume,
      ``HeightLe.pow, ``HeightLe.mul, ``HeightLe.mono] do
    unless before.contains required && got.contains required do
      throwError "RUN95_EXACT_C2 lost signed-height supplier: {required}"
  for forbidden in #[old, ``Data.integral_forms_long,
      ``Data.run90_squared_witness_integral_forms_long, ``sorryAx] do
    if got.contains forbidden then
      throwError "RUN95_EXACT_C2 unwanted direct dependency: {forbidden}"
  for n in #[old, fresh] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "RUN95_EXACT_C2 nonstandard axiom: {n}"
  logInfo "RUN95_EXACT_C2: exact completion statement, both proof-only substitutions, unchanged signed suppliers"

#print axioms Data.audit_integral_forms_long_exact
#print axioms Data.run95_exact_completion_c2
