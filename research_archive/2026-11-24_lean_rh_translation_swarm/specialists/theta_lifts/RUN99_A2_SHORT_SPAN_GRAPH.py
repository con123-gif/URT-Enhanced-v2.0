#!/usr/bin/env python3
"""RUN99 — separate the actual short-span graph acceptance from A2 freeness.
28 Nov 2026. SOURCE-MATCHED / PREPARED, not a native receipt.
Credit Alpoge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679, Lean 4.35.0.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES.
Latest peer accepted scopes in spine: B3 six-root 46082365501, C2
value-family 46055305146; neither discharges A2. Leave them unchanged.

RUN98 repair state branch status.json, outputs/theta92/leaf.log,
theta92_result.json and run97.json all returned 404 at this read.
No inference about whether the job ran or passed. Existing registration
4506328b131a337d6d6ca097a315aa5c9e75e158 remains; no duplicate queue.
RUN97 gates short_span on leaf_graph_accepted. This is a scheduling
dependency, NOT a mathematical dependency: RUN93 uses the ORIGINAL
classAut_columnLevel_eq_bot, not the candidate RUN98 freeness.
The retained cache contains the actual ChainValuation object (RUN96).
Therefore RUN93 local verification can proceed even if RUN98 fails.
Do not confuse a successful short graph with freeness closure.

New exact source audit executed in connector JS: compared the entire
native span statement and proof against RUN93, normalized only
whitespace, with the single substitution
  (D.ramifyingOp_finrank_comap_and_short univ ⊥).2 _ φ h
    -> D.ramifyingOp_short_run93 univ _ φ h .
Both unique anchors and exact forward/reverse comparison passed.
Native source blob 19e853dfa8c645bfcdf3b3e21183f9b432620ef7;
RUN93 blob 72aef826d8ed4ba777d272b43c470d726ae77ae8.
The same S, T, D, 4^|s| and all local integral, conjugate norm,
freeness, scale and dimension assumptions remain. Original proof
consumes only the second conjunct of the joint lemma. The replacement
preserves every other token modulo whitespace. This is an exact
source-level interface audit, not a kernel check.

New executable gate below: compile RUN93 as an external reusable
object only if needed; retain complete four-root constructor-inclusive
graph (original span, replacement span, original joint, new short).
Differentiate direct value-edge deletion (RUN93 native guards) from
transitive rank absence (membership masks). Report any retained rank
path rather than suppressing it. In particular freeness is explicitly
required in BOTH span roots. This makes it impossible to report the
local short split as eliminating the original neatness dependence.
Reuse existing pinned exporter, independent verifier and bounded
scan/prune; no Main import, no new theorem premise, no cold build.
No new native execution or graph result claimed. No URT speed claim.
All A1-A3/B/C/D/E/V obligations and previous evidence retained.

RESUME HERE: first inspect actual RUN98 outputs. In the same restored
authenticated workspace, independently run this gate after obtaining
the RUN93 local object (or let this script compile it once):
  python3 RUN99_A2_SHORT_SPAN_GRAPH.py --compact-root /path/grh/grh-compact --intake /path/intake.json --out /fresh/short99
If RUN98 fails, preserve its log and still permit RUN93 verification.
Only use accepted freeness + short span together at RUN95. Do not
select RUN95 as a root closure. HANDOFF kernel/integration/audit.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
KERNEL = SWARM / "specialists/kernel_extractor"
sys.path.insert(0, str(KERNEL))
sys.path.insert(0, str(SWARM / "integration"))
import RUN92_A2_CACHE_LEAF_GRAPH as leaf
import RUN26_COMPACT_GRAPH as graph
import run_compact_b2_native_replay as native
from audit_active_b2_graph import adapt_exporter_435

ROOTS = ["Data.span_short_ramifiedColumns",
         "Data.span_short_ramifiedColumns_run93",
         "Data.ramifyingOp_finrank_comap_and_short",
         "Data.ramifyingOp_short_run93"]
RANK = "Data.finrank_ker_one_sub_centralGen_le"
FREE = "Data.classAut_columnLevel_eq_bot"
SHORT = "IsShort.sub_translate"
PINS = {
    HERE / "RUN93_A2_SHORT_SPAN_SPLIT.lean": "72aef826d8ed4ba777d272b43c470d726ae77ae8",
    HERE / "RUN92_A2_CACHE_LEAF_GRAPH.py": "768c917293b75dcedb0bc7b4616fe416ad18e5c8",
    KERNEL / "RUN26_COMPACT_GRAPH.py": "775182e659d05a0b179813cc3063725df59e17bb",
    KERNEL / "RHProofTermPrune.lean": "f6d3e7f6047a7895ecf183be3fb54c203f4fc46a",
    SWARM / "integration/audit_active_b2_graph.py": "ccb8c306cdffc72464b0f01e70577b1811b6ffe0",
}
def require(ok, why):
    if not ok:
        raise RuntimeError(why)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path, required=True)
    p.add_argument("--intake", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--seconds", type=int, default=1800)
    a = p.parse_args()
    root, out = a.compact_root.resolve(), a.out.resolve()
    require(root.name == "grh-compact" and root.parent not in out.parents
            and out != root.parent and not out.exists(), "fresh external output required")
    out.mkdir(parents=True)
    state = {"scope":"A2 short-span local proof and graph only", "roots":ROOTS,
             "native_verified":False, "graph_audited":False,
             "prune_executed":False, "freeness_replacement_verified":False,
             "caller_replacements_checked":False, "full_RH_replay":False}
    def save():
        native.dump(out / "run99.json", state)
    save()
    try:
        for path, h in PINS.items():
            require(native.git_blob(path.read_bytes()) == h, "changed input "+str(path))
        require(native.capture(["git","rev-parse","HEAD"],root)==native.PIN,
                "wrong compact pin")
        require(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")
                ==native.MATHLIB, "wrong Mathlib pin")
        subprocess.run(["git","diff","--exit-code",native.PIN,"--","src","lakefile.toml"],
                       cwd=root,check=True)
        leaf.check_intake(root,json.loads(a.intake.read_text()))
        require(native.git_blob((root/"src/New/Columns/ChainValuation.lean").read_bytes())
                =="19e853dfa8c645bfcdf3b3e21183f9b432620ef7","wrong source blob")
        require(leaf.digest(root/".lake/build/lib/lean/New/Columns/ChainValuation.olean")
                =="8bdd40a17014b265d8751623eadeca347bff5f42ccaaef42a0e42ab42b0720d2",
                "wrong original short-span object")
        require(shutil.which("lake"),"native lake unavailable")
        env=os.environ.copy()
        env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
        require("4.35.0" in subprocess.check_output(["lake","env","lean","--version"],
                cwd=root,env=env,text=True,timeout=60),"wrong Lean version")
        source=out/"ThetaShortRun93.lean"
        shutil.copyfile(HERE/"RUN93_A2_SHORT_SPAN_SPLIT.lean",source)
        obj=out/"ThetaShortRun93.olean"
        state["compile"]=native.step(["lake","env","lean","--tstack=400000",
              "-R",out,"-o",obj,source],root,env,out/"short_span.log",a.seconds)
        log=(out/"short_span.log").read_text(errors="replace")
        state["axioms"]=native.audit(out/"short_span.log",ROOTS)
        state["native_verified"]=(state["compile"]["returncode"]==0 and obj.is_file()
            and log.count("THETA93_SHORT_SPAN_GUARDS_OK")==1
            and not re.search(r"\\berror(?:\\([^)]*\\))?:|sorryAx",log)
            and state["axioms"]["axiom_audit_ok"])
        save()
        require(state["native_verified"],"RUN93 local proof failed")
        state["object_sha256"]=leaf.digest(obj)
        setup=subprocess.check_output(["lake","env","python3","-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root,env=env,text=True,timeout=300)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"]=str(out)+os.pathsep+env["LEAN_PATH"]
        env["CATHEDRAL_RH_GRAPH"]=str(out/"short99_union.jsonl")
        graph.ROOTS=ROOTS
        s=graph.driver()
        require(s.count("import Main\n")==1,"changed exporter import")
        gfile=out/"Short99Graph.lean"
        gfile.write_text(adapt_exporter_435(s.replace("import Main\n",
            "import ThetaShortRun93\nset_option pp.fullNames true\n",1)))
        state["graph_compile"]=native.step(["lean","--tstack=400000","-j","2",gfile],
                          root,env,out/"graph.log",a.seconds)
        save()
        require(state["graph_compile"]["returncode"]==0 and
                native.audit(out/"graph.log",ROOTS)["axiom_audit_ok"],"graph failed")
        graph.audit_union(out/"short99_union.jsonl",out,out)
        summary=json.loads((out/"union_summary.json").read_text())
        require(summary["missing"]==0,"missing graph node")
        masks={}
        watched=set(ROOTS+[RANK,FREE,SHORT])
        for line in (out/"root_membership.jsonl").open():
            row=json.loads(line)
            if any(x[0]!="s" for x in row["id"]):
                continue
            n=".".join(x[1] for x in row["id"])
            if n in watched:
                require(n not in masks,"ambiguous name")
                masks[n]=row["root_mask"]
        state["graph_audited"]=True
        state["watched_masks"]=masks
        state["union_nodes"]=summary["nodes"]
        state["union_edges"]=summary["edges"]
        state["rank_transitively_absent_from_new_span"]=not bool(masks.get(RANK,0)&2)
        state["old_joint_transitively_absent_from_new_span"]=not bool(masks.get(ROOTS[2],0)&2)
        state["original_freeness_retained_in_both_spans"]=(masks.get(FREE,0)&3)==3
        state["new_short_transitively_reachable"]=bool(masks.get(ROOTS[3],0)&2)
        save()
        require(all(masks.get(n,0)&(1<<i) for i,n in enumerate(ROOTS)),"missing root")
        require(masks.get(ROOTS[2],0)&1 and masks.get(RANK,0)&4
                and masks.get(SHORT,0)&8 and state["new_short_transitively_reachable"]
                and state["original_freeness_retained_in_both_spans"],
                "advertised old/new supplier reachability not confirmed")
        # Keep rank masks regardless of outcome; do not claim global deletion.
        engine=(KERNEL/"RHProofTermPrune.lean").read_text()
        require(engine.count("import Lean\n")==1,"changed prune import")
        probe=out/"Short99ScanPrune.lean"
        probe.write_text(engine.replace("import Lean\n","import Lean\nimport ThetaShortRun93\n",1)
            +"\n"+"\n".join("rh_scan "+n+" limit 2000\nrh_prune "+n+" as Short99Pruned"+str(i)
                         for i,n in enumerate(ROOTS))+"\n")
        state["prune_executed"]=True
        state["prune_result"]=native.step(["lean","--tstack=400000",probe],
                         root,env,out/"scan_prune.log",a.seconds)
        save()
        require(state["prune_result"]["returncode"]==0,"bounded scan/prune failed")
    except Exception as e:
        state["error"]=str(e)
        save()
        raise

if __name__=="__main__":
    main()
