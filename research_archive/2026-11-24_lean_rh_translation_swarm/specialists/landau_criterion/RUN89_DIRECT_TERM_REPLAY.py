#!/usr/bin/env python3
"""RUN89: repair actual B3 timeout via exact original proof-value substitution.
27 Nov 2026. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.

Actual CI 46080383664: state branch compute/rh-compact-b3-direct-chart-replay-20261127/status.json
blob 18ef8ef8524c02a232a37517e42720b24cf9e8e9, UTC 23:22:33;
run87_shared_receipt.json blob 05adc6d52140914122ccaca0f1ebf96c93c233f0.
Pinned source build exit 0 (915.22s), three original axiom probes exit 0
(4.82s), standard axioms. Replacement exit 1 (28.27s): deterministic whnf
heartbeat timeout (200000) at line 506 inside the Parseval grw and at
declaration line 457. Unknown conditional selfNorm and self-referential
axiom reports downstream disqualify the replay. Direct chart/floor bridge
printed standard axioms, not a successful whole replacement module.
No graph reached. Log markers alone do not imply success.

Avoid re-elaborating the long tactic script: retain the old selfNorm full
type, replace just the old floor constant in its checked value, preserve
universe arguments and ask the kernel to check a fresh declaration.
Stop if old floor is not direct (inspect auxiliaries then). Positions
transport uses the unchanged RUN85 second command. Gauge.com, both
inverse charts, Parseval, all shell and other premises retained.
This does NOT prove the stronger parameterized from_floor theorem;
that obligation remains unverified in the archived RUN84/85. Original
files, failed logs and existing graphs untouched. Same six graph roots
and 13 guards; conditional-helper reachability guard replaced by absence
of original selfNorm in new value; direct supplier guard now expects new
floor alone. No Main import or global dependency deletion.

JS source checks executed on authenticated original: 6 unique anchors,
4 postconditions. No local Lean available, no new native PASS.
RESUME HERE: run this repaired shared replay, inspect actual
run87_shared_receipt.json and b3/run86_receipt.json and logs. Only after
acceptance transport to the two real/finite shell callers. B3/star OPEN.
HANDOFF TO integration / B3 / audit.
"""
import json
from pathlib import Path
import sys
import tempfile

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parents[1] / "integration"))
import RUN86_DIRECT_CHART_REPLAY as replay
import RUN87_SHARED_B3_REPLAY as shared
import run_compact_b2_native_replay as native

ORIGINAL = "05820cda95cec8af0e7eb905dd22bcac8d75fbc6"
DIRECT = r'''set_option maxHeartbeats 2000000 in
run_cmd do
  let oldFloor ← Lean.getConstInfo ``Gauge.lintegral_floorWeight_le
  let newFloor ← Lean.getConstInfo ``Gauge.lintegral_floorWeight_le_directChart_bridge
  let oldSelf ← Lean.getConstInfo ``Gauge.lintegral_selfNorm_le
  unless oldFloor.levelParams == newFloor.levelParams do
    Lean.throwError "RUN89 floor universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq oldFloor.type newFloor.type
  unless same do Lean.throwError "RUN89 floor type mismatch"
  let some body := oldSelf.value? (allowOpaque := true) |
    Lean.throwError "RUN89 original selfNorm proof unavailable"
  unless body.getUsedConstants.contains oldFloor.name do
    Lean.throwError "RUN89 old floor not direct; inspect auxiliaries"
  let value := body.replace fun e ↦
    match e with
    | .const n ls => if n == oldFloor.name then some (.const newFloor.name ls) else none
    | _ => none
  let deps := value.getUsedConstants
  unless deps.contains newFloor.name do
    Lean.throwError "RUN89 replacement absent"
  for n in #[oldFloor.name, oldSelf.name] do
    if deps.contains n then Lean.throwError "RUN89 forbidden direct selfNorm dependency"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `Gauge.lintegral_selfNorm_le_via_directChart
    levelParams := oldSelf.levelParams
    type := oldSelf.type
    value := value
  })
  Lean.logInfo "RUN85_SELF: RUN89 original checked selfNorm value, direct floor replacement"

'''
A, B, C, E, F, G = ["lemma Gauge.lintegral_selfNorm_le_from_floor [","#check IsValuationPair.hermite","#print axioms Gauge.lintegral_selfNorm_le_from_floor\n","#print axioms Gauge.lintegral_selfNorm_le_from_floor_bridge\n","-- Reuse exact checked declaration types and proof bodies, not tactic re-elaboration.\n","run_cmd do\n  let oldSelf ← Lean.getConstInfo ``Gauge.lintegral_selfNorm_le\n  let newSelf"]

def generate(raw):
    for token in (A, B, C, E, F, G):
        native.require(raw.count(token) == 1, "Changed RUN85 anchor: " + token)
    s = raw[:raw.index(A)] + raw[raw.index(B):]
    s = s.replace(C, "", 1).replace(E, "", 1)
    s = s[:s.index(F)] + DIRECT + s[s.index(G):]
    native.require(s.count('Lean.logInfo "RUN85_SELF:') == 1 and
                   s.count('Lean.logInfo "RUN85_POSITIONS:') == 1 and
                   A not in s and
                   s.count("lemma Gauge.lintegral_floorWeight_le_directChart (") == 1,
                   "RUN89 generated proof guards")
    return s

base_guards = replay.guards
def guards(mask, direct):
    g = base_guards(mask, direct)
    r = replay.ROOTS
    del g["conditional_self_reaches_new_self_and_positions"]
    g["new_self_not_directly_old_self"] = r[2] not in direct.get(r[3], set())
    g["new_self_direct_supplier"] = r[1] in direct.get(r[3], set())
    return g

def self_test():
    raw = replay.SOURCE.read_bytes()
    native.require(native.git_blob(raw) == ORIGINAL, "Changed immutable proof")
    generated = generate(raw.decode())
    r = replay.ROOTS
    m = {r[0]: 20, r[2]: 16, replay.CHART: 42, replay.CHART_SUPPLIER: 42,
         r[1]: 40, r[3]: 32, replay.COM: 42, replay.PARSEVAL: 40}
    d = {r[3]: {r[1]}, r[5]: {r[3]}}
    assert len(guards(m, d)) == 13 and all(guards(m, d).values())
    for target in (r[0], r[2]):
        bad = {k: set(v) for k, v in d.items()}
        bad[r[3]].add(target)
        assert not all(guards(m, bad).values())
    bad = {k: set(v) for k, v in d.items()}
    bad[r[3]].clear()
    assert not all(guards(m, bad).values())
    print(json.dumps({"source_rewrite": True, "synthetic_graph_controls": 4,
                      "generated_blob": native.git_blob(generated.encode()),
                      "native_Lean_execution": False}))

def inner():
    self_test()
    source = generate(replay.SOURCE.read_bytes().decode())
    out = Path(sys.argv[sys.argv.index("--out") + 1]).resolve()
    out.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="rh-run89-") as tmp:
        p = Path(tmp) / "RHRun89Input.lean"
        p.write_text(source)
        replay.SOURCE = p
        replay.SOURCE_BLOB = native.git_blob(p.read_bytes())
        replay.HELPERS = [n for n in replay.HELPERS if n not in
                          (replay.FROM, "Gauge.lintegral_selfNorm_le_from_floor_bridge")]
        replay.guards = guards
        native.dump(out / "run89_patch_receipt.json", {
            "original_blob": ORIGINAL, "generated_blob": replay.SOURCE_BLOB,
            "failed_run": 46080383664, "conditional_helper_remains_unverified": True,
            "patch_is_not_a_native_pass": True})
        replay.main()

if __name__ == "__main__":
    if "--self-test" in sys.argv:
        self_test()
    elif "--prepare-only" in sys.argv or "--compact-root" in sys.argv:
        inner()
    else:
        shared.RUNNER = Path(__file__).resolve()
        shared.RUNNER_BLOB = native.git_blob(shared.RUNNER.read_bytes())
        shared.main()
