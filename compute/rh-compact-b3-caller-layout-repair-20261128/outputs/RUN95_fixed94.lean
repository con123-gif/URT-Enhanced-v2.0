import RHRun92Callers
import New.RealPlace.BandLimits
import New.Filling.FillingData
import New.Filling.Moments
import Lean

/-!
# RUN94 — complete immediate B3 floor-to-system and moment caller map
28 November 2026. PREPARED / SOURCE-MATCHED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS/SWARM/HANDOFF/EXPANSION, continuity and research state excerpts.
Prior RUN93 a51d37f0733ec8f549f2a517872e324ca61310d7, registration
a12acead2946b2b7c378ad86736ba09546ae39d3. Both status.json and
outputs/run93_caller_receipt.json under
compute/rh-compact-b3-five-caller-replay-20261128 on state branch returned
404 in this run. No inference of PASS or failure from absence.
Accepted RUN91 receipt remains distinct (run 46092592569).
Reviewed peer 0279853292510b1962819fddc0a7837b22374016 (empty fixing set),
73e689b8720d745851bf701c1894eff6f173ed5d (relaxed energy target), and
8aa381a7660145d5157e5070a11d87dc04c14e98 (conditional polar endpoint).
No duplicate commit found for BandLimits/finite_sieveSystem search;
the empty specialization is independent and is NOT copied here.

## Actual caller analysis (pinned paths under grh-compact/src)
- New/RealPlace/BandLimits.lean 20ff4e65c2599fc8b752dbb93673ed65053e2216,
  43–126: hasBandLimits_of_isCutBessel has TWO norm_floorForm_le calls,
  TWO finiteness calls AND one direct formConst_mul_lintegral_le call
  in the energy clause. Replacing only the RUN92 pair would miss that
  last shell path. Keep Schur constant, deg>0, cut, Haar, gauge, and
  original frequency/head and energy bounds.
- New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
  235–294: Filling.IsFillingLevel.exists_finite_sieveSystem has one
  IsStdLevel.enorm_floorForm_le, one finiteness, one zero-floor bound.
  It also calls the GENERIC Level.enorm_floorForm_le (line 284):
  retain it; do not confuse qualified names. Retain massRatio nonzero
  and finite, frequencyGain, compact open subgroup, positivity and
  integral/phase clauses, same level and witness Z. The norm of a
  normalized form is bounded by the normalized majorant only using
  the SAME mass ratio; no averaging over alternative groups.
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
  40–101: Filling.re_trace_besselS_le calls the zero-floor estimate
  separately. Preserve all original projector, centrality, trace and
  group-measure premises.
  105–183: Filling.energy_fixingSet_le calls the finite sieve system
  directly, then S.sieve; the REAL band_limits is a field of the
  supplied S.besselSys v, not a direct call to hasBandLimits_of_isCutBessel.
  Preserve this field, all local energy/count/sieve hypotheses and
  the original sharp bound. No claim that changing the finite theorem
  rewires the real Bessel witness.
- New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278,
  56–124: Data.exists_besselSystem actually constructs the real band
  witness using the chosen spec. Transport this producer separately;
  do not replace the arbitrary field in Moments by a freshly chosen
  incompatible witness. Propagation through the Data/Filling constructor
  remains a subsequent caller audit.

Executed JS source verification against exact pinned blobs: five blob
checks, five declaration checks, twelve caller/retained-call occurrence
checks, 22/22 total. Exact occurrences 2/2/1, 1/1/1/1, 1, 1/1/1, 1.
These are source checks, NOT proof-value or Lean tests. Local lean and
lake are absent. No native rh_scan/prune/reduce/auto/frontier execution.
Use checked earlier objects only after exact provenance and RUN93
receipt acceptance. This is a multi-supplier extension of RUN92's
type-preserving proof-value transport, not a new mathematical assumption.
Simultaneous substitutions preserve unrelated direct constants and
reject indirect/auxiliary-only edges rather than pretending to prune.
No global old-path absence; preserve all original graphs and axiom
evidence. No missing mathematical premise is discharged by this file
alone; native replay and human assembly remain OPEN.

RESUME HERE: inspect the published RUN93 ten-root receipt. If accepted,
compile this exact module with RHRun92Callers and the pinned source
objects for BandLimits, FillingData, Moments; require five exact
RUN94_SYSTEM markers, ten standard-axiom reports and a ten-root
constructor-inclusive graph with exact direct deltas. If a direct edge
fails, inspect the actual auxiliary and transport only its necessary
chain, preserving the original types. Then audit the actual real Bessel
producer's consumer and rank caller; do not reopen the accepted shells.
HANDOFF TO integration / shared compute / audit / B3.
-/

private def run94Transport (pairs : Array (Lean.Name × Lean.Name))
    (oldName newName : Lean.Name) : Lean.Elab.Command.CommandElabM Unit := do
  let old ← Lean.getConstInfo oldName
  let some body := old.value? (allowOpaque := true) |
    Lean.throwError "RUN94 original caller value unavailable"
  let before := body.getUsedConstants
  for (a, b) in pairs do
    let ca ← Lean.getConstInfo a
    let cb ← Lean.getConstInfo b
    unless ca.levelParams == cb.levelParams do
      Lean.throwError m!"RUN94 universe mismatch {a} {b}"
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq ca.type cb.type
    unless same do Lean.throwError m!"RUN94 type mismatch {a} {b}"
    unless before.contains a do
      Lean.throwError m!"RUN94 {oldName}: {a} not direct; inspect actual auxiliaries"
  let target (n : Lean.Name) : Lean.Name :=
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let value := body.replace fun e ↦
    match e with
    | .const n ls =>
      if target n == n then none else some (.const (target n) ls)
    | _ => none
  let after := value.getUsedConstants
  for (a, b) in pairs do
    unless after.contains b do Lean.throwError m!"RUN94 missing {b}"
    if after.contains a then Lean.throwError m!"RUN94 old direct edge {a}"
  if after.contains oldName || after.contains newName then
    Lean.throwError "RUN94 caller shortcut or cycle"
  for n in before do
    unless after.contains (target n) do
      Lean.throwError m!"RUN94 original direct dependency lost: {n}"
  for n in after do
    unless before.any (fun m => target m == n) do
      Lean.throwError m!"RUN94 unexpected dependency: {n}"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := newName
    levelParams := old.levelParams
    type := old.type
    value := value
  })
  Lean.logInfo m!"RUN94_SYSTEM: {newName} exact original type; simultaneous supplier substitution only"

set_option maxHeartbeats 4000000 in
run_cmd do
  run94Transport #[ (``IsCutBessel.norm_floorForm_le, ``IsCutBessel.norm_floorForm_le_via_directChart), (``IsCutBessel.lintegral_formMajorant_ne_top, ``IsCutBessel.lintegral_formMajorant_ne_top_via_directChart), (``IsCutBessel.formConst_mul_lintegral_le, ``IsCutBessel.formConst_mul_lintegral_le_via_directChart)] ``hasBandLimits_of_isCutBessel `hasBandLimits_of_isCutBessel_via_directChart

set_option maxHeartbeats 4000000 in
run_cmd do
  run94Transport #[ (``IntegralPlace.IsStdLevel.enorm_floorForm_le, ``IntegralPlace.IsStdLevel.enorm_floorForm_le_via_directChart), (``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top, ``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top_via_directChart), (``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term, ``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term_via_directChart)] ``Filling.IsFillingLevel.exists_finite_sieveSystem `Filling.IsFillingLevel.exists_finite_sieveSystem_via_directChart

set_option maxHeartbeats 4000000 in
run_cmd do
  run94Transport #[ (``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term, ``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term_via_directChart)] ``Filling.re_trace_besselS_le `Filling.re_trace_besselS_le_via_directChart

set_option maxHeartbeats 4000000 in
run_cmd do
  run94Transport #[ (``Filling.IsFillingLevel.exists_finite_sieveSystem, ``Filling.IsFillingLevel.exists_finite_sieveSystem_via_directChart)] ``Filling.energy_fixingSet_le `Filling.energy_fixingSet_le_via_directChart

set_option maxHeartbeats 4000000 in
run_cmd do
  run94Transport #[ (``hasBandLimits_of_isCutBessel, ``hasBandLimits_of_isCutBessel_via_directChart)] ``Data.exists_besselSystem `Data.exists_besselSystem_via_directChart

#print axioms hasBandLimits_of_isCutBessel
#print axioms hasBandLimits_of_isCutBessel_via_directChart
#print axioms Filling.IsFillingLevel.exists_finite_sieveSystem
#print axioms Filling.IsFillingLevel.exists_finite_sieveSystem_via_directChart
#print axioms Filling.re_trace_besselS_le
#print axioms Filling.re_trace_besselS_le_via_directChart
#print axioms Filling.energy_fixingSet_le
#print axioms Filling.energy_fixingSet_le_via_directChart
#print axioms Data.exists_besselSystem
#print axioms Data.exists_besselSystem_via_directChart
