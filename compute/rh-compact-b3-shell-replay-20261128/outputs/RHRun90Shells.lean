import RHRun85
import New.RealPlace.ComplexShells
import New.Filling.TopFloor
import Lean

/-!
# RUN90 — accept six-root local replay and transport both exact shell consumers
28 November 2026. Local RUN89 replacement REPLAYED; shell transport PREPARED.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger read at 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE and EXPANSION_15_LANES read.
Latest integration 1d6a303dbf3e962d92a202f6ce3b483c837926b6 (both B2 energy
paths to common star) and prime c727f99f21a232b2cff7bb04c91f30779ec7b91c
(endpoint repair) are distinct from this B3 caller transport.

## Actual native receipt, 28 Nov 00:14:55 UTC
Run 46082365501, source 91a1d2ee78b4be708836d6165014411be6c113e1,
state branch compute/rh-compact-b3-direct-term-repair-20261127/status.json
blob c079483572beb08dce245fddcaaf743e689b25d9: exit 0, 1095.63 s.
Read outputs/run87_shared_receipt.json (df962e095821ccd0ba6aa1689d16c53369bfa245)
and outputs/b3/run86_receipt.json (e8e0f2b74b30ae902042f24852d1c673402ed239).
Both all_requested_checks_ok=true. Legacy status tail caller_replacements_checked=false
is the separate B2 bootstrap receipt, NOT evidence for or against the
B3 replacement. The detailed B3 receipt and compiler/graph logs establish
the three original/replacement pairs, not the two shell consumers below.
Source build exit 0, 935.08 s; original probes exit 0, 5.03 s;
replacement compile exit 0, 11.94 s; graph exit 0, 29.88 s.
Compiler blob 3ccd0fc38202acdc92bea98d6035b4177e45358a explicitly prints
RUN85_SELF (RUN89 checked proof value) and RUN85_POSITIONS (all occurrences).
All six root axioms exactly propext, Classical.choice, Quot.sound.
All 13 guards true, six audit exits zero; union 42657 nodes, 952599
edges, zero missing references. Root counts old/new floor 34107/34112,
self 42015/42018, positions 42644/42647; this is an interface reduction,
NOT a reduction in node count. Old floor/self/positions masks absent
from all three replacement roots. Gauge.com mask 63, Parseval mask 60:
both retained. Graph summary blob 838329011cc21e3f324fea1a388e74f9a2faa6b2;
root audits 56ec8c6008ed21f418079fd6f3a45f2c9723f1c4; graph log
6fb8bb714644f20d6718539e96e28bd452d74059. Full graph SHA256
20fb80f889d200591ac82cda70c502411b952a5900df8fc32cc31d30e7c853ba
(69,742,826 bytes, artifact only); original/reduced graph remains preserved.
Use only the generated RHRun85.lean source blob cba0a141fd47c34b792021c679b5451ebde7d3bf
or authenticated checked olean SHA256
902f57571e47bc7c2a78e1de44514f4d7a59122238ca6728472fdf62803f10c3.
Do not use the failed pre-repair module. The stronger parameterized
selfNorm_from_floor was excluded by RUN89 and is still unverified.
No claim of native replay of the concrete majorant suppliers or full B3.

## New actual caller step (not just receipt reporting)
Source: New/RealPlace/ComplexShells.lean blob 351cfdf7fa54238f79b1b950c3532feef1f74f53,
IsCutBessel.formConst_mul_lintegral_le lines 56–101; one position call,
one formMajorant call. Same cut Bessel pair, head gauges, epsilon,
dyadic T_i, support and all explicit exponents. Do not change the
local t>1 versus t=1 split or the shell summability argument.
Source: New/Filling/TopFloor.lean blob 9762970967aef90b3a4e025b7f2891d892c70111,
IntegralPlace.IsStdLevel.lintegral_shells_le lines 275–333; one
Gamma.lintegral_positions_le Gamma' call, one formMajorant call.
The SAME content generator c fixes Gamma'=h.gauge(star c*c);
Gamma is the original depth gauge. Keep the ideal zeta, md factors,
normalization, exponent and original he/hf/head premises.

The new proof expressions replace ONLY the old position theorem constant
by its already replayed exact-type replacement, preserving universe
arguments and every application. Each full original shell type is copied
verbatim into a fresh kernel declaration. Direct dependencies must match
exactly modulo that one constant substitution; fail if elaboration has
hidden the position call in an auxiliary. No direct dependency on the
original shell theorem is allowed. The original formMajorant proof
and both inverse-chart roles (RUN88) are retained; no generalization
from W_0 to W_v. The replacement uses the same measures and data,
with no newly assumed quantitative inequality. This is the minimal
caller connection; no repeated shell derivation and no RH root import.
Source-visible checks executed in JS: two source blob checks, two
lemma range checks, two namespace checks, two position-call occurrence
checks and two majorant-call occurrence checks: 10/10.
No Lean/lake/elan locally; no new shell kernel, graph, rh_scan/prune,
rh_reduce/auto/frontier or axiom PASS. Old-pin engine receipts do not
authorize cross-toolchain claims. No URT performance claim.
Peer integration must continue to treat B3 and governing star as OPEN.

RESUME HERE: in the authenticated RUN89 workspace build
+New.RealPlace.ComplexShells:olean and +New.Filling.TopFloor:olean;
reuse the generated RHRun85 checked module and compile this file with
its directory on LEAN_PATH (e.g. lake env lean --tstack=400000
-Dpp.fullNames=true -o RHRun90Shells.olean COMPACT_RUN90_SHELL_CALLER_TRANSPORT.lean).
Require exit 0, both markers, four standard-axiom reports and four
constructor-inclusive old/new root audits using the existing RUN86
exporter; check new positions reaches both new callers, inspect all
indirect old positions/self/floor paths, and verify both inverse
suppliers and majorant retained. If position not direct, inspect the
specific auxiliary and use a checked topological substitution; do not
fall back to importing the claimed RH theorem. Preserve all receipts
and failed logs. Only after successful replay propagate through actual
GlobalSieve callers. B3/star/RH OPEN.
HANDOFF TO: integration / B3 / audit / shared compute runner.
-/

set_option maxHeartbeats 2000000 in
run_cmd do
  let oldPos ← Lean.getConstInfo ``Gauge.lintegral_positions_le
  let newPos ← Lean.getConstInfo ``Gauge.lintegral_positions_le_via_directChart
  unless oldPos.levelParams == newPos.levelParams do
    Lean.throwError "RUN90 position universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq oldPos.type newPos.type
  unless same do Lean.throwError "RUN90 position type mismatch"
  for (oldName, newName) in #[
    (``IsCutBessel.formConst_mul_lintegral_le,
      `IsCutBessel.formConst_mul_lintegral_le_via_directChart),
    (``IntegralPlace.IsStdLevel.lintegral_shells_le,
      `IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart)] do
    let old ← Lean.getConstInfo oldName
    let some body := old.value? (allowOpaque := true) |
      Lean.throwError "RUN90 original shell value unavailable"
    let before := body.getUsedConstants
    unless before.contains oldPos.name do
      Lean.throwError "RUN90 position not direct; inspect auxiliaries"
    let value := body.replace fun e ↦
      match e with
      | .const n ls => if n == oldPos.name then some (.const newPos.name ls) else none
      | _ => none
    let after := value.getUsedConstants
    unless after.contains newPos.name do
      Lean.throwError "RUN90 new position absent"
    for n in #[oldPos.name, oldName, newName] do
      if after.contains n then
        Lean.throwError "RUN90 forbidden direct dependency"
    for n in before do
      unless n == oldPos.name || after.contains n do
        Lean.throwError "RUN90 unrelated original dependency lost"
    for n in after do
      unless n == newPos.name || before.contains n do
        Lean.throwError "RUN90 unrelated dependency introduced"
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := newName
      levelParams := old.levelParams
      type := old.type
      value := value
    })
    Lean.logInfo m!"RUN90_SHELL: {newName} exact original type; position substitution only"

#print axioms IsCutBessel.formConst_mul_lintegral_le
#print axioms IsCutBessel.formConst_mul_lintegral_le_via_directChart
#print axioms IntegralPlace.IsStdLevel.lintegral_shells_le
#print axioms IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart
