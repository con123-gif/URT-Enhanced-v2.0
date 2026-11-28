#!/usr/bin/env python3
"""RUN95: replay exact RUN94 and audit original conditional vs new conditional graph.

28 Nov 2026. Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpoge, Sernau,
Anthropic collaborators and Claude. No physics or live editorial files edited.

Source audit: DataExist blob 634c6a1f88791a3bb770326785b70411e8289b41 imports
OneSidedCriterion and IndexTypes, not Main. Native exists_data is a lemma,
quantified eventually in x AFTER fixing P and epsilon. New/Main lines 149-167
(blob 198ed5bf26aa294898931e0649bc2b88f1389f65) change only logX1 and scale;
the cancellation must use the adjusted record, not the initial witness.
Further safe human premise narrowing (not yet a Lean replacement): for each
fixed P, epsilon, eventually on quartic x it suffices to prove star only on
D with D.x=x, log(log D.b)=epsilon*log x, towerDeg D.s/log D.b<=#D.thick,
and 10^6 log x <= log D.x1 <= (10^6 log x)^2.
Indeed exists_data supplies the first three constraints before adjustment;
the window supplies the last, and adjustment preserves the first three.
No restriction to a predetermined second scale is justified. This is weaker
than universal StarGrid, but remains an unproved arithmetic estimate.
Do not silently identify it with an existential witness lacking the polar
inequality. Do not change RUN94 before its first actual replay.

Prior run 46092027436 result artifact 15242835027 is 1,836,881 bytes, not
a retained complete compiler/Mathlib/source workspace. Reuse its exact
successful bootstrap in one process, append new stage BEFORE temp cleanup.
Do not rebuild A/B/C, import Main or call star_inequality. Keep separate
RUN95 receipt even if new module or graph fails. Compare old conditional
root and four new roots, not a full upstream Main dependency graph.
No native execution here; source/anchor/roster checked via GitHub reads.
No rh_reduce/auto result claimed; central arithmetic frontier remains open.

RESUME HERE: read compute/rh-compact-prime-star-grid-20261128/outputs/
run95_star_grid_receipt.json plus compiler and graph receipts on
cathedral-research-state. Repair first actual failure; if accepted, audit
the above narrowed premise as a replacement theorem and separately check
the exact native remainder definition via rfl without importing Main.
HANDOFF TO kernel/integration/editor. No RH closure.
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
sys.path[:0] = [str(SWARM/"specialists"/"kernel_extractor"), str(SWARM/"integration")]
import RUN26_COMPACT_GRAPH as graph
from RUN28_COMPACT_TARGETED import audit, step
from audit_active_b2_graph import adapt_exporter_435

OLD = HERE/"COMPACT_RUN93_QUEUE_REPAIR.py"
NEW = HERE/"COMPACT_RUN94_NATIVE_WINDOW_STAR_GRID.lean"
OLD_BLOB = "cd8a2140bd616ef23d2d784a4b1489efc4e63a4c"
NEW_BLOB = "bb5b6bb13884b9d161481e38da357d5fee9a10c8"
DATA_BLOB = "634c6a1f88791a3bb770326785b70411e8289b41"
ROOTS = ["RHPrimeWindow91.zeta_line_from_class_inputs",
         "RHPrimeWindow94.eventually_primeError_on_set",
         "RHPrimeWindow94.endpoint_from_star_grid",
         "RHPrimeWindow94.principal_grid_from_star",
         "RHPrimeWindow94.zeta_line_from_star"]
ANCHOR = '''            state["all_requested_checks_ok"] = all(state.get(k) is True for k in
                ["analytic_checked", "adapter_checked", "bridge_checked"])'''
INJECT = '''            if all(state.get(k) is True for k in
                   ["analytic_checked", "adapter_checked", "bridge_checked"]):
                run95_stage(root, env2, out, modules)
'''
def preflight():
    graph.require(graph.git_blob(OLD.read_bytes()) == OLD_BLOB, "Changed RUN93")
    graph.require(graph.git_blob(NEW.read_bytes()) == NEW_BLOB, "Changed RUN94")
    code = NEW.read_text()
    graph.require(re.findall(r"^import ([^\n]+)", code, re.M) ==
                  ["Run91PrincipalBridge", "New.Data.DataExist", "Lean"], "Wrong imports")
    graph.require(re.findall(r"^#print axioms ([^\n]+)", code, re.M) == ROOTS[1:],
                  "Wrong root roster")
    graph.require(OLD.read_text().count(ANCHOR)==1, "Changed injection anchor")
    body = OLD.read_text().replace(ANCHOR, INJECT+ANCHOR, 1)
    return compile(body, str(OLD), "exec")

def run95_stage(root, env, out, modules):
    state={"compact":graph.PIN,"mathlib":graph.MATHLIB,"new_source_blob":NEW_BLOB,
           "roots":ROOTS,"new_module_checked":False,"graph_checked":False,
           "arithmetic_premise_proved":False,"full_RH_replay":False,
           "original_definition_native_bridge_checked":False,"all_requested_checks_ok":False}
    receipt=out/"run95_star_grid_receipt.json"
    save=lambda: graph.dump(receipt,state)
    save()
    def execute(label, argv, seconds, e=env):
        state[label]=step(argv,root,e,out/(label+".log"),seconds)
        save()
        graph.require(state[label]["returncode"]==0,label+" failed")
    try:
        graph.require(graph.git_blob((root/"src/New/Data/DataExist.lean").read_bytes())==DATA_BLOB,
                      "Changed DataExist")
        execute("data_exist_build",["lake","build","+New.Data.DataExist:olean"],5400)
        # Refresh Lake's search path after building the additional module.
        env=dict(env)
        env["LEAN_PATH"]=str(modules)+os.pathsep+subprocess.check_output(
            ["lake","env","printenv","LEAN_PATH"],cwd=root,env=env,text=True).strip()
        src=modules/"Run94StarGrid.lean";src.write_bytes(NEW.read_bytes())
        obj=src.with_suffix(".olean")
        execute("run94_compile",["lean","--tstack=400000","-Dpp.fullNames=true",
            "-Ddebug.skipKernelTC=false","--root="+str(modules),"-o",obj,src],2700,env)
        state["module_axioms"]=audit(out/"run94_compile.log",ROOTS[1:])
        graph.require(state["module_axioms"]["axiom_audit_ok"] and obj.is_file() and
            "RUN94_STAR_GRID_GUARDS_OK" in (out/"run94_compile.log").read_text(),
            "RUN94 guards/axioms failed")
        state["new_module_checked"]=True
        state["new_module_sha256"]=hashlib.sha256(obj.read_bytes()).hexdigest();save()
        graph.ROOTS=ROOTS
        driver=graph.driver()
        graph.require(driver.count("import Main\n")==1,"Unexpected exporter import")
        driver=adapt_exporter_435(driver.replace("import Main\n","import Run94StarGrid\n",1))
        gp=out/"Run95StarGraph.lean";gp.write_text(driver)
        stream=out/"prime_star_graph.jsonl";env["CATHEDRAL_RH_GRAPH"]=str(stream)
        state["graph_source_blob"]=graph.git_blob(driver.encode());save()
        execute("run95_graph",["lean","--tstack=400000","-Dpp.fullNames=true","-j","2",gp],2700,env)
        state["graph_axioms"]=audit(out/"run95_graph.log",ROOTS);save()
        graph.require(state["graph_axioms"]["axiom_audit_ok"],"Graph axiom audit failed")
        graph.audit_union(stream,out,out)
        name=lambda parts:".".join(x[1] for x in parts) if all(x[0]=="s" for x in parts) else None
        required=["exists_data","IsPolar.exists_window_sub_mul_le","Data.run90Remainder_eq",
                  "RHPrimeWindow94.StarGrid","RHPrimeWindow94.ClassStarGrid",
                  "RHPrimeWindow88.zeta_line_from_endpoint_grid"]
        banned=["New.grh","star_inequality","riemannHypothesis",
                "RHPrimeWindow90.TailGrid","RHPrimeWindow90.GoodGrid",
                "RHPrimeWindow91.ClassGridInputs"]
        masks={}
        for line in (out/"root_membership.jsonl").open():
            row=json.loads(line); n=name(row["id"])
            if n in required+banned: masks[n]=row["root_mask"]
        # Root 0 is old conditional, root 4 is new conditional.
        guards={n+":new_present":bool(masks.get(n,0)&16) for n in required}
        guards.update({n+":new_absent":not bool(masks.get(n,0)&16) for n in banned})
        guards.update({n+":old_present":bool(masks.get(n,0)&1) for n in banned[3:]})
        state.update(root_masks=masks,reachability_guards=guards,
                     graph_summary=json.loads((out/"union_summary.json").read_text()))
        with stream.open("rb") as f:state["graph_sha256"]=hashlib.file_digest(f,"sha256").hexdigest()
        save()
        graph.require(state["graph_summary"]["missing"]==0 and all(guards.values()),
                      "Graph incomplete or guard failed")
        state["graph_checked"]=True;state["all_requested_checks_ok"]=True;save()
    except Exception as exc:
        state["failure"]=str(exc);save();raise

if __name__=="__main__":
    # Preserve the exact RUN93 bootstrap, including old negative control.
    # Inject only after the three previously accepted stages are checked.
    code=preflight()
    ns={"__file__":str(OLD),"__name__":"__main__","run95_stage":run95_stage}
    exec(code,ns)
