import RHRun94System
import B2BothEnergyPaths
import Lean

/-!
# RUN96 — join the finite B3 floor and trace suppliers to BOTH B2 energy paths
28 November 2026. PREPARED / SOURCE-MATCHED, NOT native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484,
AGENTS, SWARM, HANDOFF, EXPANSION and continuity excerpts; latest lane commit
6fa2913caaf7cdaf88e8bdbb6dc310fc97a62b6f (RUN95). The three receipt paths
status.json, outputs/run93_caller_receipt.json and outputs/run94/run94_receipt.json
under compute/rh-compact-b3-caller-layout-repair-20261128 on state branch
all returned 404 at this run; compute run 46114460776 pending in Actions list.
No new native verification claimed, no duplicate queue entry.

Pinned actual source New/Filling/Moments.lean blob
ec2cb964ede0d5eeae41a077dc6dbfface9c0444:
* energy_fixingSet_le needs BOTH energy_le_of_linkEnergy_le and the chosen
  finite sieve (hG.exists_finite_sieveSystem Sg D). It also consumes
  (S.besselSys v).band_limits. The latter is a field of SAME S, not a theorem
  call to hasBandLimits_of_isCutBessel. Keep it.
* sum_le_of_positive_type calls energy_fixingSet_le in its induction.
* Fits.exists_translate_finrank_comap_le consumes BOTH sum_le_of_positive_type
  and sum_norm_amplitudeSum_le (twice), AND independently re_trace_besselS_le
  in the small-central-projection estimate. Omitting the trace would leave
  the original zero-floor path even with the finite sieve replaced.

Reuse editor B2BothEnergyPaths, source
specialists/proof_editor/2026-11-27_B2_B4_BOTH_ENERGY_PATHS.lean,
blob 805f2821c617e76346c123f20a8430c7091a7c6b (prepared).
Reuse RUN94 finite sieve and trace producers, blob
36a24847dffcbd3fc5bec568582342171efb2e5e (prepared, RUN95 layout repair).
Do NOT select RUN94 energy_fixingSet_le_via_directChart directly at the
editor positive-type caller: it still consumes the original B2 link-energy
theorem. Transport the finite sieve into the editor's already joined fixing
bound, then the positive-type result, then BOTH the positive-type and trace
edges into the editor Fits. The joined complement path stays unchanged.
No sharpening of the nonempty masks is assumed (peer depth-discounted
criterion 1a08fa08 is a separate candidate). Native sharp estimates,
positive-type/central projection hypotheses, representation, c>0, rank,
normalization, exact universe parameters, and the same admissible S remain.

Real Bessel producer path remains: New/Filling/FillingData.lean
0ef8b0dfe13173b16bd0a8820a4924f10124e278, Data.filling is a
noncomputable DEFINITION, choosing the witness from Data.exists_besselSystem.
The theorem-only transport must not replace that dependent data by
another record. Proof irrelevance permits equality of the choice proof
arguments for identical existential statements, but this does not remove
the original definition's graph edge. Do not claim B3 global absence.
Integration peer 2026-11-28_BOTH_ENERGY_COMMON_ABC_STAR.lean blob
26a1965f8ef58960b7045fcc32ab65f795a9d22b already transports its editor
Fits into the common A/B/C family; no duplicate spread/star transport here.
Supply precisely this replacement Fits to that chain after native receipt.

Actual JS connector checks: 15/15 pinned source/declaration caller checks,
9/9 explicit source-subgraph routing/negative-control checks. Both omission
controls restore an old path (finite sieve or zero-floor trace), while the
new subgraph retains fused B2, complement, and real field. Not a full graph,
not a Lean test. No new native rh_scan/prune/reduce/auto/frontier execution.
Preserve original and replacement graphs and all open mathematical suppliers.

RESUME HERE: after RUN95's actual RUN94 receipt AND the editor B2BothEnergyPaths
native receipt, compile this file as RHRun96B2B3 in their common authenticated
compact workspace; require all three RUN96_JOIN markers, six standard-axiom
reports and nine-root (original/editor/joint) constructor-inclusive audit
of fixing energy, positive type and Fits. Verify fused link, joined complement,
new finite sieve and trace reachable, record every indirect old path.
Do not rerun accepted modules or import Main. On acceptance hand the joint
Fits to integration's existing common-map star transport; real data producer
and quantitative/human B3 assembly remain open. HANDOFF integration/editor/audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true
open Lean

private def run96Join (old fresh : Name) (pairs : Array (Name × Name))
    (retained : Array Name) : Elab.Command.CommandElabM Unit := do
  let .thmInfo orig ← getConstInfo old | throwError "RUN96 expected theorem"
  let before := orig.value.getUsedConstants
  let typeEdges := orig.type.getUsedConstants
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "RUN96 supplier type/universe mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "RUN96 missing distinct proof-only edge: {old} -> {a}"
  unless retained.all (fun n => before.contains n) do
    throwError "RUN96 missing retained direct supplier: {old}"
  let target (n : Name) : Name :=
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let value := orig.value.replace fun e =>
    match e with
    | .const n us =>
      if target n == n then none else some (.const (target n) us)
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams, type := orig.type, value := value })
  let .thmInfo checked ← getConstInfo fresh | throwError "RUN96 missing theorem"
  unless checked.type == orig.type && checked.levelParams == orig.levelParams do
    throwError "RUN96 changed statement"
  let expected := before.map target
  let actual := checked.value.getUsedConstants
  unless expected.all (fun n => actual.contains n) && actual.all (fun n => expected.contains n) do
    throwError "RUN96 direct graph delta mismatch"
  unless !actual.contains old && retained.all (fun n => actual.contains n) &&
      pairs.all (fun p => !actual.contains p.1 && actual.contains p.2) do
    throwError "RUN96 stale or missing supplier"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "RUN96 nonstandard axiom"
  logInfo m!"RUN96_JOIN|{fresh}"

run_cmd do
  run96Join ``Filling.energy_fixingSet_le_b2_joined `Filling.energy_fixingSet_le_b2_b3_joined
    #[(``Filling.IsFillingLevel.exists_finite_sieveSystem, ``Filling.IsFillingLevel.exists_finite_sieveSystem_via_directChart)]
    #[``Filling.b2_fused_energy_le_of_linkEnergy_le]
  run96Join ``Filling.sum_le_of_positive_type_b2_joined `Filling.sum_le_of_positive_type_b2_b3_joined
    #[(``Filling.energy_fixingSet_le_b2_joined, ``Filling.energy_fixingSet_le_b2_b3_joined)]
    #[]
  run96Join ``Filling.Fits.exists_translate_finrank_comap_le_b2_joined `Filling.Fits.exists_translate_finrank_comap_le_b2_b3_joined
    #[(``Filling.sum_le_of_positive_type_b2_joined, ``Filling.sum_le_of_positive_type_b2_b3_joined),
      (``Filling.re_trace_besselS_le, ``Filling.re_trace_besselS_le_via_directChart)]
    #[``Filling.sum_norm_amplitudeSum_le_b2_joined]

#print axioms Filling.energy_fixingSet_le_b2_joined
#print axioms Filling.energy_fixingSet_le_b2_b3_joined
#print axioms Filling.sum_le_of_positive_type_b2_joined
#print axioms Filling.sum_le_of_positive_type_b2_b3_joined
#print axioms Filling.Fits.exists_translate_finrank_comap_le_b2_joined
#print axioms Filling.Fits.exists_translate_finrank_comap_le_b2_b3_joined
