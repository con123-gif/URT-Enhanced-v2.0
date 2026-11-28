#!/usr/bin/env python3
"""Editor native replay: immutable strict polar mean and original-statement bridge.

28 Nov 2026. PREPARED. Compact 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and newest peer commits
8cab66c3 (signed envelope), 575f1cad (exact C), 6b589f86 (relaxed
log exponent). These are complementary and not included in this replay.
Do not claim their arithmetic hypotheses or exact C are proved.

RUN95 actual accepted artifact 15247406689, size 25964617 bytes,
is not an authenticated full compiler/source/mathlib workspace.
Instead reuse the proven RUN93 bootstrap through the verified
compiler and Mathlib cache, build ONLY New.Endgame.OneSidedCriterion,
then compile immutable editor mean and the original-statement bridge.
Do not repeat the endpoint/grid, A/B/C or Main builds. Preserve
both new logs independently and compare old and new graph roots.
No local lean/lake detected; no native verification here.
Executed connector preflight: source blob and import/axiom rosters,
unique bootstrap anchor; original theorem statement matched verbatim
apart from lemma name and formatting. No new native engine execution.

RESUME HERE: read compute/rh-compact-editor-polar-mean-20261128/
outputs/editor_polar_receipt.json and actual compiler/graph logs on
cathedral-research-state. Repair first failing phase, or on acceptance
connect mean to the existing signed cost-envelope caller. Preserve
all source, original/reduced graphs, guards and unresolved obligations.
HANDOFF TO editor / prime / integration / audit. RH OPEN.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
sys.path[:0] = [str(SWARM/"specialists"/"kernel_extractor"),
                str(SWARM/"integration"), str(SWARM/"specialists"/"prime_window")]
import RUN26_COMPACT_GRAPH as graph
from RUN28_COMPACT_TARGETED import audit, step
from audit_active_b2_graph import adapt_exporter_435

BOOT = SWARM/"specialists"/"prime_window"/"COMPACT_RUN93_QUEUE_REPAIR.py"
MEAN = HERE/"2026-11-28_NATIVE_POLAR_MEAN.lean"
BRIDGE = HERE/"2026-11-28_POLAR_MEAN_ORIGINAL_BRIDGE.lean"
BOOT_BLOB = "cd8a2140bd616ef23d2d784a4b1489efc4e63a4c"
MEAN_BLOB = "d6c08ec8cd4c003f4f3c4da6ae9d807e146a7dad"
NATIVE_BLOB = "93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3"
ROOTS = ["IsPolar.exists_window_sub_mul_le",
         "IsPolar.editor_eventually_window_mean",
         "IsPolar.editor_window_from_mean"]
ANCHOR = '''            state["compiler_archive_rehashed_here"] = True
            save()'''
INJECT = '''
            editor_stage(root, env, out)
            return
'''

def preflight():
    graph.require(graph.git_blob(BOOT.read_bytes()) == BOOT_BLOB, "Changed bootstrap")
    graph.require(graph.git_blob(MEAN.read_bytes()) == MEAN_BLOB, "Changed mean")
    for p, imports, n in [(MEAN, ["New.Endgame.OneSidedCriterion", "Lean"], ROOTS[1]),
                           (BRIDGE, ["EditorPolarMean"], ROOTS[2])]:
        s = p.read_text()
        graph.require(re.findall(r"^import ([^\n]+)", s, re.M) == imports, "Wrong imports")
        graph.require(re.findall(r"^#print axioms ([^\n]+)", s, re.M) == [n], "Wrong axiom roster")
        code = re.sub(r"/-.*?-/", "", s, flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        code = re.sub(r'"(?:\\.|[^"\\])*"', '""', code)
        graph.require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved declaration")
    s = BOOT.read_text()
    graph.require(s.count(ANCHOR) == 1, "Bootstrap anchor changed")
    return compile(s.replace(ANCHOR, ANCHOR+INJECT, 1), str(BOOT), "exec")

def editor_stage(root, env, out):
    dest = out/"editor"
    dest.mkdir(exist_ok=True)
    state = dict(compact=graph.PIN, mathlib=graph.MATHLIB, roots=ROOTS,
        mean_blob=MEAN_BLOB, bridge_blob=graph.git_blob(BRIDGE.read_bytes()),
        mean_checked=False, bridge_checked=False, graph_checked=False,
        new_Lean_execution=False, arithmetic_premise_proved=False,
        full_RH_replay=False, all_requested_checks_ok=False)
    # receipt at the documented path (not the bootstrap receipt).
    save = lambda: graph.dump(out/"editor_polar_receipt.json",state)
    save()
    def run(label, argv, seconds, e):
        state[label] = step(argv,root,e,dest/(label+".log"),seconds)
        save()
        graph.require(state[label]["returncode"] == 0,label+" failed")
    try:
        graph.require(graph.git_blob((root/"src/New/Endgame/OneSidedCriterion.lean").read_bytes()) == NATIVE_BLOB,
                      "Changed native source")
        run("polar_source_build",["lake","build","+New.Endgame.OneSidedCriterion:olean"],5400,env)
        env = dict(env)
        env["LEAN_PATH"] = str(dest)+os.pathsep+subprocess.check_output(
            ["lake","env","printenv","LEAN_PATH"],cwd=root,env=env,text=True).strip()
        for p, module, n, marker, flag in [
            (MEAN,"EditorPolarMean",ROOTS[1],"EDITOR_POLAR_MEAN_DIRECT_GUARDS_OK","mean_checked"),
            (BRIDGE,"EditorPolarBridge",ROOTS[2],"EDITOR_POLAR_BRIDGE_GUARDS_OK","bridge_checked")]:
            src = dest/(module+".lean"); src.write_bytes(p.read_bytes())
            obj = src.with_suffix(".olean")
            state["new_Lean_execution"] = True; save()
            run(module,["lean","--tstack=400000","-Dpp.fullNames=true",
                "-Ddebug.skipKernelTC=false","--root="+str(dest),"-o",obj,src],2700,env)
            log = dest/(module+".log")
            state[module+"_axioms"] = audit(log,[n]); save()
            graph.require(state[module+"_axioms"]["axiom_audit_ok"] and
                          marker in log.read_text() and obj.is_file(),module+" guard failure")
            state[flag] = True
            state[module+"_sha256"] = hashlib.sha256(obj.read_bytes()).hexdigest(); save()
        graph.ROOTS = ROOTS
        driver = graph.driver()
        graph.require(driver.count("import Main\n")==1,"Unexpected exporter import")
        driver = adapt_exporter_435(driver.replace("import Main\n","import EditorPolarBridge\n",1))
        gp = dest/"EditorPolarGraph.lean"; gp.write_text(driver)
        stream = dest/"three_roots.jsonl"
        env["CATHEDRAL_RH_GRAPH"] = str(stream)
        state["graph_source_blob"] = graph.git_blob(driver.encode()); save()
        run("graph",["lean","--tstack=400000","-Dpp.fullNames=true","-j","2",gp],2700,env)
        state["graph_axioms"] = audit(dest/"graph.log",ROOTS); save()
        graph.require(state["graph_axioms"]["axiom_audit_ok"],"Graph axiom audit failure")
        graph.audit_union(stream,dest,dest)
        name = lambda p: ".".join(x[1] for x in p) if all(x[0]=="s" for x in p) else None
        moment = "IsPolar.eventually_moment_le"
        banned = ["New.grh","star_inequality","riemannHypothesis"]
        watch = set(ROOTS+[moment]+banned)
        masks = {}
        for line in (dest/"root_membership.jsonl").open():
            row=json.loads(line); n=name(row["id"])
            if n in watch: masks[n]=row["root_mask"]
        guards = {"old_absent_from_mean_and_bridge":masks.get(ROOTS[0],0)==1,
                  "mean_present_in_bridge":bool(masks.get(ROOTS[1],0)&4),
                  "native_moment_present_in_all":masks.get(moment,0)==7}
        guards.update({n+":absent":not bool(masks.get(n,0)&6) for n in banned})
        state.update(root_masks=masks,reachability_guards=guards,
                     graph_summary=json.loads((dest/"union_summary.json").read_text()))
        with stream.open("rb") as f: state["graph_sha256"]=hashlib.file_digest(f,"sha256").hexdigest()
        save()
        graph.require(state["graph_summary"]["missing"]==0 and all(guards.values()),"Graph guards failed")
        state["graph_checked"]=True; state["all_requested_checks_ok"]=True; save()
    except Exception as exc:
        state["failure"]=str(exc); save(); raise

if __name__ == "__main__":
    code=preflight()
    if "--preflight" not in sys.argv:
        exec(code,{"__file__":str(BOOT),"__name__":"__main__","editor_stage":editor_stage})
