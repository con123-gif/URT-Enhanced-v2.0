#!/usr/bin/env python3
"""RUN58 — prepared A1 strict eight-root continuation, 27 Nov 2026.

Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
87e949a9ea899dd09d297aa30f59df4d1b533fc4 / 261b9e8bf027af37e6abe6920deb544b23352d48.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.

Actual Actions 46023465491 inspected: pick completed success; job
140588824252 (A1/A2 shared transport) still in_progress; state path returned
404. No A1 native result yet. Local lean/lake not present. Do NOT resubmit
the expensive build while it is running. Reuse the exact RUN57 candidate
and the B2/C2 strict collector (actual independent graph receipt at
integration/2026-11-27_B2_C2_GRAPH_AUDIT.md blob 8a1f052516c330d9389b4ffc4c6671a4be77b854).
That receipt is local B2/C2 only, not A1. This file is PREPARED, not native
tested. It does not change any mathematical premise or claim a new bound.

The earlier A1 direct-edge check cannot certify transitive removal.
This continuation exports all four original and four replacement roots
in a single graph, preserving constructors, projections, literals,
recursors, mutual blocks and axiom evidence; separately checks every
new predecessor path and reports every retained old target. A retained
old theorem through another route is not a kernel failure, but explicitly
blocks that deletion. Helper is private: resolve its actual mangled name
from the checked graph rather than inventing a source-level ID. Run
bounded native scan/prune on the four original/replacement pairs in
a separate module so compatibility errors cannot erase the graph.
No import of Main/New.Main. No global deletion or complete RH claim.

RESUME HERE: inspect actual A1 receipt/log from shared job. If it passes,
run this file against the authenticated unchanged LocalStatement workspace:
  python RUN58_A1_GRAPH_AND_PRUNE.py --compact-root /path/grh-compact \
      --receipt-dir /path/shared/outputs --out /path/a1-audit
If the prior job failed, repair that first observed failure instead.
Use --self-test for guard controls (not mathematical verification).
HANDOFF TO integration, acceleration, theta, audit. Star/RH OPEN.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

HERE = Path(__file__).resolve().parent
LANE = HERE.parent
SWARM = HERE.parents[2]
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
ROOTS = [
    "Columns.hasType_markOperator", "Columns.hasType_markOperator_run55",
    "Data.IsMarked.hasType_markOperator", "Data.IsMarked.hasType_markOperator_run57",
    "Data.IsMarked.hasType_prod_markOperator_pow", "Data.IsMarked.hasType_prod_markOperator_pow_run57",
    "Data.exists_indexDvd_Bmu_divisible", "Data.exists_indexDvd_Bmu_divisible_run57"]
NEW = ROOTS[1::2]
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
HELPER = "kernelRun54_local_double_integral"
def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)
def blob(raw):
    return hashlib.sha1(("blob " + str(len(raw)) + chr(0)).encode()+raw).hexdigest()
def write(path, data):
    path.write_text(json.dumps(data, indent=2)+"\n")
def checks(masks):
    require(set(ROOTS) <= masks.keys(), "Missing actual root roster")
    helpers = [n for n in masks if n.split(".")[-1] == HELPER]
    require(len(helpers)==1, "Missing or ambiguous actual private helper")
    helper = helpers[0]
    all_new = sum(1 << (2*i+1) for i in range(4))
    require(all(isinstance(m, int) and 0 < m < 256 for m in masks.values()), "Invalid root mask")
    for i,n in enumerate(ROOTS):
        require(masks[n] & (1 << i), "Root absent from own closure: "+n)
    paths, retained = {}, {}
    for i in range(4):
        later = sum(1 << (2*j+1) for j in range(i,4))
        paths[NEW[i]] = masks[NEW[i]] & later == later
        # Report all new roots, not merely later consumers; absence is not presumed.
        retained[ROOTS[2*i]] = [n for j,n in enumerate(NEW)
                               if masks[ROOTS[2*i]] & (1 << (2*j+1))]
    paths[helper] = masks[helper] & all_new == all_new
    return {"new_supplier_paths": paths, "retained_old_targets": retained,
            "all_new_paths_present": all(paths.values()),
            "all_old_targets_absent_locally": not any(retained.values()),
            "global_dependency_deletion": False, "full_RH_replay": False}
def controls():
    masks = {n: 1 << i for i,n in enumerate(ROOTS)}
    for i,n in enumerate(NEW):
        masks[n] = sum(1 << (2*j+1) for j in range(i,4))
    h = "_private.MarkedTransportRun57.0."+HELPER
    masks[h] = sum(1 << i for i in range(1,8,2))
    a = checks(masks)
    require(a["all_new_paths_present"] and a["all_old_targets_absent_locally"], "positive control")
    a = checks({**masks, ROOTS[0]: masks[ROOTS[0]] | 128})
    require(a["all_new_paths_present"] and not a["all_old_targets_absent_locally"], "retained edge control")
    a = checks({**masks, NEW[0]: masks[NEW[0]] & ~128})
    require(not a["all_new_paths_present"], "missing supplier path control")
    for bad in ({k:v for k,v in masks.items() if k != ROOTS[0]},
                {**masks, h+"."+HELPER: 2}, {**masks, ROOTS[0]: 256}):
        try:
            checks(bad)
        except RuntimeError:
            continue
        raise RuntimeError("invalid input not rejected")
    return 6

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--receipt-dir", type=Path)
    p.add_argument("--out", type=Path)
    p.add_argument("--self-test", action="store_true")
    p.add_argument("--seconds",type=int,default=1800)
    a = p.parse_args()
    if a.self_test:
        print(json.dumps({"guard_controls": controls(), "native_verified":False}))
        return
    require(a.compact_root and a.receipt_dir and a.out, "Require pinned workspace, actual receipt and output")
    root, directory, out = (x.resolve() for x in (a.compact_root,a.receipt_dir,a.out))
    out.mkdir(parents=True,exist_ok=True)
    state = {"compact":PIN,"mathlib":MATHLIB,"roots":ROOTS,
             "full_RH_replay":False,"graph_audited":False,"prune_executed":False}
    def save(): write(out/"a1_graph_result.json",state)
    save()
    sys.path.insert(0,str(SWARM/"integration"))
    import run_compact_b2_native_replay as native
    from audit_active_b2_graph import adapt_exporter_435
    try:
        receipt=json.loads((directory/"a1_transport.json").read_text())
        require(receipt["native_verified"] is True and receipt["steps"]["transport"]["returncode"]==0
                and receipt["leaf_marker"] is True and receipt["transport_markers"]==NEW[1:],
                "RUN57 has no accepted compiler receipt")
        require(receipt["axiom_audit"]["axiom_audit_ok"] is True and
                set(receipt["axiom_audit"]["axioms"])==set(NEW) and
                all(set(v)<=ALLOWED for v in receipt["axiom_audit"]["axioms"].values()),
                "RUN57 axiom roster differs")
        src=(directory/"MarkedTransportRun57.lean").read_bytes()
        require(blob(src)==receipt["generated_blob"],"RUN57 source differs")
        # The log is inspected again; no status-only acceptance.
        require(native.audit(directory/"a1_transport.log",NEW)["axiom_audit_ok"],"RUN57 actual log audit failed")
        require(native.capture(["git","rev-parse","HEAD"],root)==PIN,"Wrong source pin")
        require(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")==MATHLIB,"Wrong Mathlib pin")
        subprocess.run(["git","diff","--exit-code",PIN,"--","src","lakefile.toml"],cwd=root,check=True)
        env=os.environ.copy()
        env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1",
                   CATHEDRAL_RH_GRAPH=str(out/"a1_union.jsonl"))
        require(shutil.which("lean") and shutil.which("lake"),"Pinned tools missing")
        require("4.35.0" in subprocess.check_output(["lake","env","lean","--version"],cwd=root,text=True),"Wrong Lean version")
        # RUN57 did not save an object; compile the exact source once here,
        # then graph/prune import the same checked artifact, not two replays.
        candidate=out/"MarkedTransportRun57.lean"
        candidate.write_bytes(src)
        require(not re.search(rb"^import (?:Main|New\.Main)\b",src,re.M),"Forbidden root import")
        step=native.step(["lake","env","lean","--tstack=400000","-R",out,
                          "-o",out/"MarkedTransportRun57.olean",candidate],
                         root,env,out/"object.log",a.seconds)
        state["object_compile"]=step
        require(step["returncode"]==0 and native.audit(out/"object.log",NEW)["axiom_audit_ok"],
                "Exact candidate object compilation failed")
        state["objects"]=[{"name":f.name,"sha256":hashlib.sha256(f.read_bytes()).hexdigest()}
                          for f in sorted(out.glob("MarkedTransportRun57.olean*"))]
        require(any(x["name"]=="MarkedTransportRun57.olean" for x in state["objects"]),"No checked object")
        setup=subprocess.check_output(["lake","env","python3","-c",
              "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
              cwd=root,env=env,text=True,timeout=300)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"]=str(out)+os.pathsep+env["LEAN_PATH"]
        save()
        graph_file=LANE/"RUN26_COMPACT_GRAPH.py"
        require(blob(graph_file.read_bytes())=="775182e659d05a0b179813cc3063725df59e17bb","Changed union exporter")
        spec=importlib.util.spec_from_file_location("a1_union",graph_file)
        graph=importlib.util.module_from_spec(spec); spec.loader.exec_module(graph)
        graph.ROOTS=ROOTS
        raw=graph.driver()
        require(raw.count("import Main\n")==1,"Changed exporter import")
        driver=adapt_exporter_435(raw.replace("import Main\n","import MarkedTransportRun57\nset_option pp.fullNames true\n",1))
        path=out/"A1Graph.lean"; path.write_text(driver)
        state["graph_source_blob"]=blob(path.read_bytes())
        state["graph_compile"]=native.step(["lean","--tstack=400000","-j","2",path],root,env,out/"graph.log",a.seconds)
        save()
        require(state["graph_compile"]["returncode"]==0 and native.audit(out/"graph.log",ROOTS)["axiom_audit_ok"],
                "A1 graph failed; keep log")
        graph.audit_union(out/"a1_union.jsonl",out,out)
        masks={}
        with (out/"root_membership.jsonl").open() as stream:
            for line in stream:
                row=json.loads(line)
                # Exact identifiers of public roots and private helper; retain
                # structured identifiers in original graph even for numeric segments.
                n=".".join(str(x[1]) for x in row["id"])
                if n in ROOTS or n.split(".")[-1]==HELPER:
                    require(n not in masks,"Ambiguous watched display name")
                    masks[n]=row["root_mask"]
        result=checks(masks)
        write(out/"caller_reachability.json",{"watched":masks,**result})
        state["graph_audited"]=True
        state["new_paths_present"]=result["all_new_paths_present"]
        save()
        require(result["all_new_paths_present"],"A1 expected replacement path missing")
        # Pruning is a separate bounded experiment; graph remains audited if this fails.
        engine=(LANE/"RHProofTermPrune.lean").read_bytes()
        require(blob(engine)=="f6d3e7f6047a7895ecf183be3fb54c203f4fc46a","Changed prune engine")
        text=engine.decode()
        require(text.count("import Lean\n")==1,"Changed prune import")
        scan=out/"A1ScanPrune.lean"
        scan.write_text(text.replace("import Lean\n","import Lean\nimport MarkedTransportRun57\n",1)+
            "\n"+"\n".join("rh_scan "+n+" limit 2000\nrh_prune "+n+" as A1Run58Pruned"+str(i)
            for i,n in enumerate(ROOTS))+"\n")
        state["prune_executed"]=True
        state["prune_result"]=native.step(["lean","--tstack=400000",scan],root,env,out/"scan_prune.log",a.seconds)
        save()
        require(state["prune_result"]["returncode"]==0,"Native scan/prune compatibility failed; graph preserved")
    except Exception as e:
        state["error"]=str(e)
        save()
        raise

if __name__=="__main__":
    main()
