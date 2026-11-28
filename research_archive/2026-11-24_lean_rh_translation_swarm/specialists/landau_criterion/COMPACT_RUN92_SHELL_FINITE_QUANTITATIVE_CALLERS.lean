import RHRun90Shells
import Lean

/-!
# RUN92 — accept both shell replays; next actual finiteness and quantitative callers
28 November 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, continuity, SWARM, HANDOFF, EXPANSION and latest B3 peer
73e689b8720d745851bf701c1894eff6f173ed5d (relaxed energy target, independent).

## Accepted native receipt, not a job-label inference
Run 46092592569, source 7ba17908f95a884d1fdee6ad7e0da587f2c79a53.
State branch compute/rh-compact-b3-shell-replay-20261128/status.json
blob 8cb498e946df5b5a3cecc76853415b8bd511cd89, exit 0.
Detailed outputs/run91_shell_receipt.json blob ced03da74831bbc7ae37622698002e8dcedb03cd:
all_requested_checks_ok=true; original build 732.42s; accepted source
replay 6.73s, checked shell module 3.77s, graph export 32.27s.
Compiler log blob 18b9a108a2de32a760df036d80df0c138642d015;
both exact original-type markers and all four axiom reports:
propext, Classical.choice, Quot.sound only.
14/14 reachability/direct-delta guards true. Four audits exit zero.
Union 73765 declarations, 2088097 edges, zero missing; old/new real
73014/73019 and finite 44954/44959 nodes. This is NOT a node-count reduction.
Old floor/self/positions masks 5; new equivalents mask 10. Old masks
intersect replacement mask 10 at zero: absent transitively in these roots.
Gauge.com, Parseval, majorant and inverse weight all mask 15, retained.
Full stream SHA256 6bed97c0d0ab3a08963f9f3f875015973cc704a82ec5901e1acd0de178f24912
(146317524 bytes, artifact only); union summary blob 2c33a3a5f6a32b7e00d60f905144a2f6f2624e6d.
Retain all old/new graphs and logs. The legacy status tail mentioning
caller_replacements_checked=false is B2 bootstrap output, not the
detailed B3 receipt; do not promote B2 bootstrap or this local scope to RH.
Use checked RHRun90Shells.olean SHA256
ff60aeb9ba8de9a11f291e8f0384182c2b56330ed52e901ede6e8c4035bcfa7b
and RHRun85.olean 902f57571e47bc7c2a78e1de44514f4d7a59122238ca6728472fdf62803f10c3,
or recompile exactly authenticated sources, without repeating accepted graphs.

## Next actual caller connection — PREPARED, UNCOMPILED
Pinned New/RealPlace/ComplexShells.lean blob 351cfdf7fa54238f79b1b950c3532feef1f74f53:
- IsCutBessel.lintegral_formMajorant_ne_top (106-110).
- IsCutBessel.norm_floorForm_le (115-146).
Pinned New/Filling/TopFloor.lean blob 9762970967aef90b3a4e025b7f2891d892c70111:
- IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top (336-340).
- IntegralPlace.IsStdLevel.enorm_floorForm_le (349-382).
- IntegralPlace.IsStdLevel.floorZeroForm_le_main_term (387-415).
Each contains exactly one source-visible shell call. Five source blob,
five declaration and five call-occurrence checks executed in JS: 15/15.
Real and finite finiteness share one elementary argument in ENNReal:
if 0 < c and c I <= B < top, then I != top, since c * top = top.
The real head-existence gauge at K=0 and positive normalization
(formConst, headDensity, Haar ratio) remain. The finite proof assumes
I=top, obtains a gauge from a nonzero majorant, and contradicts the
shell estimate using massRatio_ne_zero_and_ne_top. Keep the same
head/depth witnesses, j bound, Nonempty I where applicable, and hr.
The quantitative consumers need their own shell call; transporting only
finiteness cannot deliver the floor norm or zero-floor bound. Keep
all phase, cutoff, md, ideal index, congruence, mass, head and support
premises including t+12 and t+1+(n+10^9 n^4) in the finite calls.
Do not substitute an arbitrary depth gauge or use the relaxed energy
target to infer a shell estimate. GlobalSieve has no direct source call.

The proof-value transport is exactly type preserving, checks universe
lists and direct constant deltas, fails closed on hidden auxiliaries
(e.g. finite grw +useKAbstract), and never invokes original caller as a
shortcut. Separate run_cmds permit identifying each failing consumer.
No new native Lean execution here; no rh_scan/prune/reduce/auto/frontier
PASS on these roots; old-pin engine cannot establish compact-pin results.
No mathematical premise weakened, B3 root, star or RH closure.

RESUME HERE: compile this file in the retained authenticated RUN91
workspace with RHRun90Shells and RHRun85 on LEAN_PATH; require the
five RUN92_CALLER markers and ten original/replacement axiom reports.
If a direct shell edge fails, inspect that actual auxiliary value and
transport the minimal topologically ordered chain (never silently keep
the old shell). On success use existing RUN91 exporter to audit the ten
roots, verify direct deltas and mask 682 (odd-index replacement roots)
reaches new shell chain with the appropriate real/finite subsets,
old shell/floor/self/positions absence where actually established;
report any indirect old paths and retain gauge/Parseval/majorant/inverse
roles. Only then connect to actual floor/moment downstream callers.
HANDOFF TO B3 / integration / shared compute / audit.
-/

private def run92Transport (oldShellName newShellName oldName newName : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let oldShell ← Lean.getConstInfo oldShellName
  let newShell ← Lean.getConstInfo newShellName
  unless oldShell.levelParams == newShell.levelParams do
    Lean.throwError "RUN92 shell universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq oldShell.type newShell.type
  unless same do Lean.throwError "RUN92 shell type mismatch"
  let old ← Lean.getConstInfo oldName
  let some body := old.value? (allowOpaque := true) |
    Lean.throwError "RUN92 original caller value unavailable"
  let before := body.getUsedConstants
  unless before.contains oldShellName do
    Lean.throwError m!"RUN92 {oldName}: shell not direct; inspect auxiliaries"
  let value := body.replace fun e ↦
    match e with
    | .const n ls => if n == oldShellName then some (.const newShellName ls) else none
    | _ => none
  let after := value.getUsedConstants
  unless after.contains newShellName do Lean.throwError "RUN92 new shell absent"
  for n in #[oldShellName, oldName, newName] do
    if after.contains n then Lean.throwError "RUN92 forbidden direct dependency"
  for n in before do
    unless n == oldShellName || after.contains n do
      Lean.throwError "RUN92 unrelated original dependency lost"
  for n in after do
    unless n == newShellName || before.contains n do
      Lean.throwError "RUN92 unrelated dependency introduced"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := newName
    levelParams := old.levelParams
    type := old.type
    value := value
  })
  Lean.logInfo m!"RUN92_CALLER: {newName} exact original type; shell substitution only"

set_option maxHeartbeats 2000000 in
run_cmd run92Transport
  ``IsCutBessel.formConst_mul_lintegral_le
  ``IsCutBessel.formConst_mul_lintegral_le_via_directChart
  ``IsCutBessel.lintegral_formMajorant_ne_top
  `IsCutBessel.lintegral_formMajorant_ne_top_via_directChart

set_option maxHeartbeats 2000000 in
run_cmd run92Transport
  ``IntegralPlace.IsStdLevel.lintegral_shells_le
  ``IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart
  ``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top
  `IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top_via_directChart

set_option maxHeartbeats 2000000 in
run_cmd run92Transport
  ``IsCutBessel.formConst_mul_lintegral_le
  ``IsCutBessel.formConst_mul_lintegral_le_via_directChart
  ``IsCutBessel.norm_floorForm_le
  `IsCutBessel.norm_floorForm_le_via_directChart

set_option maxHeartbeats 2000000 in
run_cmd run92Transport
  ``IntegralPlace.IsStdLevel.lintegral_shells_le
  ``IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart
  ``IntegralPlace.IsStdLevel.enorm_floorForm_le
  `IntegralPlace.IsStdLevel.enorm_floorForm_le_via_directChart

set_option maxHeartbeats 2000000 in
run_cmd run92Transport
  ``IntegralPlace.IsStdLevel.lintegral_shells_le
  ``IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart
  ``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
  `IntegralPlace.IsStdLevel.floorZeroForm_le_main_term_via_directChart

#print axioms IsCutBessel.lintegral_formMajorant_ne_top
#print axioms IsCutBessel.lintegral_formMajorant_ne_top_via_directChart
#print axioms IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top
#print axioms IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top_via_directChart
#print axioms IsCutBessel.norm_floorForm_le
#print axioms IsCutBessel.norm_floorForm_le_via_directChart
#print axioms IntegralPlace.IsStdLevel.enorm_floorForm_le
#print axioms IntegralPlace.IsStdLevel.enorm_floorForm_le_via_directChart
#print axioms IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
#print axioms IntegralPlace.IsStdLevel.floorZeroForm_le_main_term_via_directChart
