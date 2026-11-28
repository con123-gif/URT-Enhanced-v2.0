import RHRun90Shells
import IntegrationBothEnergyStar
import Lean

/-!
# Integration — finite-shell branch through BOTH actual B4 callers
28 November 2026. SOURCE-MATCHED / PREPARED; no new native replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, current spine
28 November and live ledger read; protocol/AGENTS/handoff and newest
acceleration, Galois, theta, Landau and kernel peers read.

Actual new connection: the accepted B3 direct-chart position supplier is
already transported into the two shells by Landau RUN90 (prepared).
But the FINITE shell is consumed in THREE different standard-level
lemmas, and there are TWO independent routes to the Fits rank result:
1. shell -> finite majorant integrability, phase floor bound, zero floor
   bound -> exists_finite_sieveSystem -> fixing energy -> positive type -> Fits.
2. shell -> zero floor bound -> re_trace_besselS_le -> Fits.
Replacing only fixing energy (or only the finite-system supplier) leaves
the old shell reachable through the direct trace route. The separate
complex-shell / band-limits route is deliberately retained here. This is
a connection of an existing checked local replacement to actual callers,
not a new quantitative B3 estimate or a global elimination.

Exact source (grh-compact/src):
 New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
   namespace IntegralPlace.IsStdLevel, lines 336-340, 349-374, 387-398.
 New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
   Filling.IsFillingLevel.exists_finite_sieveSystem, lines 235,253,263,286.
 New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
   re_trace_besselS_le lines 40-51; energy_fixingSet_le 105-143;
   sum_le_of_positive_type 226-234; Fits 301-333.
 Peer shell 0813311a1a745edc1e4ddc6a788df25df0b13f9c; BOTH energy 805f2821c617e76346c123f20a8430c7091a7c6b;
 common A/B/C star 26a1965f8ef58960b7045fcc32ab65f795a9d22b.
 The latter retains original common map, short forms, C supplier and both
 B2 count/energy routes. Do not restart from original star or import Main.

Exact premises: same standard level, same Z and g, same gauge/content,
same j,t,K, local normalization, majorant, floor, head, ideal zeta,
massRatio and exponents. Preserve all original theorem types, type
dependencies, universe parameters and all applications; no new premise
or inequality introduced. Same D, P, independent rows, q, covolume,
ramification, and signed heights as the previous common star. Final
inequality remains m*remainder <= logB^2*budget.

Source-level graph tests executed in connector JS on actual pinned
contents: 11 unique caller anchors, 22 deleted/duplicated controls,
18 single-edge omissions in the explicit graph (each restores an old
finite shell path from new star). Graph contains unchanged A, C, map,
B2 and complement branches. These are source checks, not Lean graph
evidence. No actual graph deletion claimed.

Native receipt re-read: state branch compute/rh-compact-b3-direct-term-repair-20261127/
outputs/b3/run86_receipt.json blob e8e0f2b74b30ae902042f24852d1c673402ed239,
all_requested_checks_ok=true; graph exit 0 in 29.88s; all six
root axiom lists standard. full_RH_replay=false. This verifies the
local B3 replacement only. Landau shell module, editor BOTH-energy
and integration star remain PREPARED. No lean/lake locally; no new
rh_scan/prune/reduce/auto/frontier execution, no PASS for this file.
Old pin engine checks not carried over. No URT speed claim.

RESUME HERE: after authenticating and compiling RHRun90Shells and
IntegrationBothEnergyStar in the retained compact environment, compile
THIS file as IntegrationFiniteShellStar with normal kernel checking,
require 13 FINITE_SHELL_STAR markers and all axiom reports. Audit 13
old/new pairs via strict constructor-inclusive union graph; require
new finite shell, new B2 supplier and common A/C/map reachable from
the actual new star, and check for ANY residual old finite-shell
paths (including hidden auxiliaries). If a direct edge is not present,
inspect the specific auxiliary rather than removing its guard.
Retain original/reduced graphs, all obligations and real-shell path;
do not repeat cold source build. No complete B3, star or RH closure.
HANDOFF TO shared compute / Landau / kernel / editor / audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Lean in
private def finiteShellTransport (old fresh : Name)
    (pairs : Array (Name × Name)) : Elab.Command.CommandElabM Unit := do
  let .thmInfo orig ← getConstInfo old | throwError "FINITE_SHELL_STAR expected theorem {old}"
  let before := orig.value.getUsedConstants
  let typeEdges := orig.type.getUsedConstants
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "FINITE_SHELL_STAR type/universe mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "FINITE_SHELL_STAR expected proof-only edge: {old} -> {a}"
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
  let .thmInfo checked ← getConstInfo fresh | throwError "FINITE_SHELL_STAR missing proof"
  unless checked.type == orig.type && checked.levelParams == orig.levelParams do
    throwError "FINITE_SHELL_STAR changed statement"
  let expected := before.map fun n =>
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "FINITE_SHELL_STAR unintended direct graph delta: {fresh}"
  unless !got.contains old && pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "FINITE_SHELL_STAR stale supplier: {fresh}"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "FINITE_SHELL_STAR nonstandard axiom: {fresh}"
  logInfo m!"FINITE_SHELL_STAR|{fresh}"

open Lean in
run_cmd do
  let shell := (``IntegralPlace.IsStdLevel.lintegral_shells_le,
    ``IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart)
  finiteShellTransport ``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top
    `IntegralPlace.IsStdLevel.integral_finite_via_shell #[shell]
  finiteShellTransport ``IntegralPlace.IsStdLevel.enorm_floorForm_le
    `IntegralPlace.IsStdLevel.floor_bound_via_shell #[shell]
  finiteShellTransport ``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
    `IntegralPlace.IsStdLevel.zero_bound_via_shell #[shell]
  finiteShellTransport ``Filling.IsFillingLevel.exists_finite_sieveSystem
    `Filling.IsFillingLevel.finite_system_via_shell
    #[(``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top,
       `IntegralPlace.IsStdLevel.integral_finite_via_shell),
      (``IntegralPlace.IsStdLevel.enorm_floorForm_le,
       `IntegralPlace.IsStdLevel.floor_bound_via_shell),
      (``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term,
       `IntegralPlace.IsStdLevel.zero_bound_via_shell)]
  finiteShellTransport ``Filling.re_trace_besselS_le `Filling.trace_via_shell
    #[(``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term,
       `IntegralPlace.IsStdLevel.zero_bound_via_shell)]
  finiteShellTransport ``Filling.energy_fixingSet_le_b2_joined `Filling.fixing_energy_via_shell
    #[(``Filling.IsFillingLevel.exists_finite_sieveSystem,
       `Filling.IsFillingLevel.finite_system_via_shell)]
  finiteShellTransport ``Filling.sum_le_of_positive_type_b2_joined `Filling.positive_type_via_shell
    #[(``Filling.energy_fixingSet_le_b2_joined, `Filling.fixing_energy_via_shell)]
  finiteShellTransport ``Filling.Fits.exists_translate_finrank_comap_le_b2_joined
    `Filling.Fits.rank_via_shell
    #[(``Filling.re_trace_besselS_le, `Filling.trace_via_shell),
      (``Filling.sum_le_of_positive_type_b2_joined, `Filling.positive_type_via_shell)]
  finiteShellTransport ``Data.integration_both_spread `Data.finite_shell_spread
    #[(``Filling.Fits.exists_translate_finrank_comap_le_b2_joined, `Filling.Fits.rank_via_shell)]
  finiteShellTransport ``Data.integration_both_rows `Data.finite_shell_rows
    #[(``Data.integration_both_spread, `Data.finite_shell_spread)]
  finiteShellTransport ``Data.integration_both_enough `Data.finite_shell_enough
    #[(``Data.integration_both_spread, `Data.finite_shell_spread),
      (``Data.integration_both_rows, `Data.finite_shell_rows)]
  finiteShellTransport ``Data.integration_both_family `Data.finite_shell_family
    #[(``Data.integration_both_enough, `Data.finite_shell_enough)]
  finiteShellTransport ``integration_both_energy_star `integration_finite_shell_star
    #[(``Data.integration_both_family, `Data.finite_shell_family),
      (``Data.integration_both_rows, `Data.finite_shell_rows)]
  for (n, required) in #[
    (`Filling.fixing_energy_via_shell, #[``Filling.b2_fused_energy_le_of_linkEnergy_le]),
    (`Filling.Fits.rank_via_shell, #[``Filling.sum_norm_amplitudeSum_le_b2_joined]),
    (`Data.finite_shell_spread, #[``Data.ramifyingOp_finrank_comap_and_short_run84,
      ``Data.filling_fits_run87, ``Data.columnCoords_run87]),
    (`Data.finite_shell_family, #[``Data.short_forms_run62]),
    (`integration_finite_shell_star, #[``Data.run87_fused_integral_forms_long])] do
    let info ← getConstInfo n
    let some v := info.value? (allowOpaque := true) | throwError "missing proof"
    let deps := info.type.getUsedConstants ++ v.getUsedConstants
    unless required.all (fun x => deps.contains x) do
      throwError "FINITE_SHELL_STAR unrelated supplier lost: {n}"

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  integration_finite_shell_star

#print axioms IntegralPlace.IsStdLevel.integral_finite_via_shell
#print axioms IntegralPlace.IsStdLevel.floor_bound_via_shell
#print axioms IntegralPlace.IsStdLevel.zero_bound_via_shell
#print axioms Filling.IsFillingLevel.finite_system_via_shell
#print axioms Filling.trace_via_shell
#print axioms Filling.fixing_energy_via_shell
#print axioms Filling.positive_type_via_shell
#print axioms Filling.Fits.rank_via_shell
#print axioms Data.finite_shell_spread
#print axioms Data.finite_shell_rows
#print axioms Data.finite_shell_enough
#print axioms Data.finite_shell_family
#print axioms integration_finite_shell_star
