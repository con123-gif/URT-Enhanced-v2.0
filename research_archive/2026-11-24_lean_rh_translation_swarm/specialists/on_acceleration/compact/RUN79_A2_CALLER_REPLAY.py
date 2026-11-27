#!/usr/bin/env python3
"""RUN79 — A2 actual caller native replay driver; 27 November 2026.

SOURCE-MATCHED / PREPARED, NOT Lean-replayed. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin historical only.
Read latest mission, spine, ledger, protocols, RUN77/78, shared registry.
A2 local caller substitution only; preserve all A1/A2/A3 and other gaps.
No Main import, no URT speed claim, no global dependency deletion.

NEW concrete verification blocker identified from actual B2 native receipt:
compute/rh-compact-b2-energy-repair-20261127/status.json
blob c2bedaa5acd2a8d68d42a49a461675d3f3ed417b; run 45998845682, error.
active_b2_energy.log blob bbfb981a34c342107737e35786b6287556132142:
source build exit 0; four pair/helper declarations printed standard axioms,
energy candidate printed propext, choice, Quot.sound; two guards failed
with 'replacement has no inspectable proof value'. This is not by itself a
mathematical failure. The exact assembled source blob
2a748f33ad2fbce589a53ff8750ea0f783c63d80 contains two occurrences of
    let some value := info.value? |
Lean 4.35.0 src/Lean/Declaration.lean blob
43edc78d6a25067039338116c4ea093a9060b1ca explicitly defines
    def value? (info : ConstantInfo) (allowOpaque := false) : Option Expr :=
    ...
    | .thmInfo {value, ..} => if allowOpaque then some value else none
Therefore both guards necessarily reject theorem values on that API.
Use info.value? (allowOpaque := true), NOT deleting the dependency guard.
Actual connector-source JS check: two exact replacements, reversible
byte-for-byte, no original guard remains; API default-negative control
confirmed from exact pinned source. Native corrected guard not executed.
HANDOFF to integration: apply those two replacements to its source
fragments and reuse authenticated B2 cache, not the already-failed proof
audit. The separate skew receipt cbbcf8c04095cf9da0c29370120084cc3f06c14b
has sorryAx and exit 1; this API fix does NOT repair the skew mathematics.
Do not mark B2 passed. A3 job receipt not present at retrieval.

A2 action: replay RUN78 splice on exact pinned source using existing
RUN28 bounded bootstrap. Build original LocalStatement once, inspect
original actual theorem types and direct dependencies, apply reversible
RUN78 patch in the disposable checkout, incrementally rebuild same target,
then compare types, axiom sets and required caller edges. Record separate
type/value roles and one-hop constructor/inductive/recursor metadata.
This is bounded evidence, not full transitive closure. No native engine
execution available locally (lean/lake absent); this driver is prepared.
No A2 replay registered in registry at inspection; only lane-local file
changed per user. Request existing shared runner use this single job rather
than multiple independent cold builds.

RESUME HERE: integration/kernel register and execute
python3 specialists/on_acceleration/compact/RUN79_A2_CALLER_REPLAY.py --out <out>
through the shared bounded compute queue; inspect a2_replay.json and logs.
If actual replay fails, repair first elaboration error. Keep general
p|N block and all prior graphs until actual caller audit succeeds.
"""
import json
import pathlib
import re
import sys

HERE = pathlib.Path(__file__).resolve().parent
SWARM = HERE.parents[2]
sys.path.insert(0, str(SWARM / "specialists/kernel_extractor"))
import RUN28_COMPACT_TARGETED as native

PATCH = HERE / "RUN78_MARKED_CALLER_SPLICE.mjs"
PATCH_BLOB = "9026bf359bc7d88723ccc6e0dcbce32a7a161f30"
MODULE = "New.Columns.LocalStatement"
JET = "8b841d76bb938d8a18fd4341aa832a20b13dd9e0"
LOCAL = "9d5bd0d698b0db2850cbd306d8d400d7e99a3547"
TRANSFER = "Parameters.norm_jetSeries_le"
GENERAL = "Parameters.norm_jet_jetSeries_le_one"
CALLER = "Data.IsGoodDatum.mem_raises"
FRAME = "Parameters.exists_isTightFrame"
SQUARE = "Parameters.norm_jetSeries_le_from_square_frame_run78"
SPECIAL = "Parameters.norm_jetSeries_le_prime_to_level_run78"
ROOT_FRAME = "Parameters.isTightFrame_zeta_pow"
ORIG = [TRANSFER, GENERAL, CALLER]
NEW = ORIG + [SQUARE, SPECIAL]
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}

# Inspect theorem bodies using the explicitly enabled opaque value access.
# Type representation is retained exactly for the two environments.
# Metadata one-hop only, not a full structural reachability claim.
HEADER = """import New.Columns.LocalStatement
import Lean
open Lean
set_option pp.fullNames true
set_option maxHeartbeats 0

private def rh79inspect (n : Name) : Lean.Elab.Command.CommandElabM Unit := do
  let info ← Lean.getConstInfo n
  let some val := info.value? (allowOpaque := true) |
    throwError "RH79 missing theorem body {n}"
  let ty := (Lean.toJson (reprStr info.type)).compress
  logInfo m!"RH79TYPE|{n}|{ty}"
  let levels := (Lean.toJson (reprStr info.levelParams)).compress
  logInfo m!"RH79LEVEL|{n}|{levels}"
  let tdeps := info.type.getUsedConstants
  let vdeps := val.getUsedConstants
  for d in tdeps do
    logInfo m!"RH79EDGE|{n}|type|{d}"
  for d in vdeps do
    logInfo m!"RH79EDGE|{n}|value|{d}"
  for d in vdeps do
    match ← Lean.getConstInfo d with
    | .ctorInfo c =>
      logInfo m!"RH79STRUCT|{d}|constructor_parent|{c.induct}"
    | .inductInfo i =>
      for c in i.ctors do
        logInfo m!"RH79STRUCT|{d}|inductive_constructor|{c}"
      for c in i.all do
        logInfo m!"RH79STRUCT|{d}|inductive_mutual|{c}"
    | .recInfo r =>
      for c in r.all do
        logInfo m!"RH79STRUCT|{d}|recursor_inductive|{c}"
      for rule in r.rules do
        logInfo m!"RH79STRUCT|{d}|recursor_constructor|{rule.ctor}"
        for dep in rule.rhs.getUsedConstants do
          logInfo m!"RH79STRUCT|{d}|recursor_rhs|{dep}"
    | _ => pure ()
  logInfo m!"RH79DONE|{n}"
"""

def probe(path, names):
    path.write_text(HEADER + "\n".join(
        "run_cmd rh79inspect " + "''".replace("'", chr(96)) + n + "\n#print axioms " + n
        for n in names) + "\n")

def parse(log, names):
    text = log.read_text(errors="strict")
    types, levels, done, edges, structural = {}, {}, set(), set(), set()
    for line in text.splitlines():
        for kind in ("TYPE", "LEVEL", "EDGE", "STRUCT", "DONE"):
            mark = "RH79" + kind + "|"
            if mark not in line:
                continue
            data = line.split(mark, 1)[1].split("|", 2)
            if kind in ("TYPE", "LEVEL"):
                n, payload = line.split(mark, 1)[1].split("|", 1)
                (types if kind == "TYPE" else levels)[n] = json.loads(payload)
            elif kind == "DONE":
                done.add(data[0])
            elif kind == "EDGE":
                edges.add(tuple(data))
            else:
                structural.add(tuple(data))
    audit = native.audit(log, names)
    # Never treat an axiom display without the dependency guards as success.
    # Full-name Classical.choice expected; fail closed on unexpected aliases.
    return {"types":types,"levels":levels,"done":sorted(done),
            "edges":sorted(edges),"structural_value_one_hop":sorted(structural),
            **audit,
            "complete": set(types)==set(names)==set(levels)==done
                        and audit["axiom_audit_ok"]}

def values(graph, n):
    return {d for root, role, d in graph["edges"] if root == n and role == "value"}

def compare(a, b):
    native.require(a["complete"] and b["complete"], "incomplete direct graphs")
    for n in ORIG:
        native.require(a["types"][n] == b["types"][n] and
                       a["levels"][n] == b["levels"][n],
                       "original theorem type or universe representation changed: "+n)
        native.require(set(a["axioms"][n])==set(b["axioms"][n]),
                       "original caller axiom set changed: "+n)
    native.require(TRANSFER in values(a,CALLER), "baseline marked edge missing")
    native.require(FRAME in values(a,TRANSFER), "baseline frame edge missing")
    native.require(SPECIAL in values(b,CALLER) and TRANSFER not in values(b,CALLER),
                   "actual marked caller did not replace original edge")
    native.require(SQUARE in values(b,SPECIAL) and ROOT_FRAME in values(b,SPECIAL),
                   "specialized supplier did not consume both new edges")
    native.require(FRAME not in values(b,SQUARE) and FRAME not in values(b,SPECIAL),
                   "large-frame direct dependency leaked")
    native.require(FRAME in values(b,TRANSFER) and TRANSFER in values(b,GENERAL),
                   "unrestricted fallback was dropped")
    return {"original_direct_edges":len(a["edges"]),
            "reduced_direct_edges":len(b["edges"]),
            "removed_direct_edges":sorted(set(map(tuple,a["edges"]))-set(map(tuple,b["edges"]))),
            "added_direct_edges":sorted(set(map(tuple,b["edges"]))-set(map(tuple,a["edges"]))),
            "original_type_representation_matches":True,
            "marked_direct_caller_checked":True,
            "global_dependency_deletion":False, "full_RH_replay":False}

def main():
    native.require(native.git_blob(PATCH.read_bytes()) == PATCH_BLOB,"RUN78 patch changed")
    native.PEERS = {}
    native.TARGETS = [(MODULE,LOCAL,ORIG)]
    step = native.step
    def hook(argv, cwd, env, log, seconds):
        argv = list(argv)
        if log.name != "module_0.log":
            return step(argv,cwd,env,log,seconds)
        out = log.parent
        state = {"scope":"A2 actual caller replacement; direct roles only",
                 "pin":native.PIN,"mathlib":native.MATHLIB,"patch_blob":PATCH_BLOB,
                 "original_source_blobs":[JET,LOCAL],"steps":{},
                 "marked_direct_caller_checked":False,
                 "human_assembly_verified":False,"full_RH_replay":False}
        def save():
            native.dump(out/"a2_replay.json",state)
        def run(label, args, limit):
            result = step(args,cwd,env,out/(label+".log"),limit)
            state["steps"][label]=result
            save()
            native.require(result["returncode"]==0,label+" failed")
        try:
            # Native RUN28 already authenticated the checkout and built the
            # original target. Authenticate jet too before modifying anything.
            jet = cwd/"src/New/Curve/ConjugatesOfJets.lean"
            local = cwd/"src/New/Columns/LocalStatement.lean"
            native.require(native.git_blob(jet.read_bytes())==JET and
                           native.git_blob(local.read_bytes())==LOCAL,"source mismatch")
            baseline = out/"a2_original.lean"
            probe(baseline,ORIG)
            run("a2_original",["lake","env","lean","--tstack=400000",baseline],600)
            a=parse(out/"a2_original.log",ORIG)
            native.dump(out/"a2_original_graph.json",a)
            native.require(a["complete"],"original graph/axioms incomplete")
            run("a2_splice",["node",PATCH,cwd.parent,"--apply"],120)
            state["patched_source_blobs"]=[native.git_blob(jet.read_bytes()),
                                           native.git_blob(local.read_bytes())]
            (out/"A2PatchedConjugatesOfJets.lean").write_bytes(jet.read_bytes())
            (out/"A2PatchedLocalStatement.lean").write_bytes(local.read_bytes())
            run("a2_rebuild",["lake","build","+"+MODULE+":olean"],2700)
            candidate=out/"a2_reduced.lean"
            probe(candidate,NEW)
            run("a2_reduced",["lake","env","lean","--tstack=400000",candidate],600)
            b=parse(out/"a2_reduced.log",NEW)
            native.dump(out/"a2_reduced_graph.json",b)
            state.update(compare(a,b))
            save()
        except Exception as e:
            state["error"]=str(e)
            save()
            # Preserve the failure in RUN28's normal receipt too.
            log.write_text("RUN79 replay failed: "+str(e)+"\n")
            return {"returncode":1,"seconds":0,"log":log.name}
        # RUN28 audits the original name set against its expected log.
        log.write_bytes((out/"a2_original.log").read_bytes())
        return {"returncode":0,"seconds":sum(x["seconds"] for x in state["steps"].values()),
                "log":log.name}
    native.step=hook
    native.main()

if __name__=="__main__":
    main()
